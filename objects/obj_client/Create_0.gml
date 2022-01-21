/// @description
#macro NET_GIVE_NAME 0
#macro NET_GET_UPDATE_PLAYERS 1
#macro NET_START_GAME 2
#macro NET_GET_INITIAL_CARDS 3
#macro NET_PLAY_CARD 4
#macro NET_RECEIVE_PLAYED_CARD 5
#macro NET_DRAW_CARDS 6
#macro NET_RECEIVE_DRAW_CARDS 7
#macro SERVER_EXIT 8
#macro NET_WRONG_VER 9
#macro NET_ALREADY_STARTED 10
#macro NET_BLACKLISTED 11
#macro NET_DISCONNECT_CHANGE_TURN 12
#macro NET_RULE_UPDATE 13
#macro NET_GET_RULES 14
#macro NET_GET_INTRODUCTION 15
#macro NET_SEND_MESSAGE 16
#macro NET_GET_MESSAGE 17
#macro NET_STOP_GAME 18
#macro MAX_CARDS 30

network_set_config(network_config_connect_timeout,4000)
client_socket = network_create_socket(network_socket_tcp);
server = network_connect(client_socket , network_resolve(global.ip), 6969);
buffer = buffer_create(1,buffer_grow,1)

if (server < 0)
    {
		show_message_async("Server not found")
		network_destroy(client_socket)
		room_goto(rm_menu)
    }
	
//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\\

function receive_packet(s_buffer) {
	var type = buffer_read(s_buffer,buffer_u8)
	switch(type) {
		case NET_GET_INTRODUCTION:
			give_introduction()
			break;
		case NET_GET_RULES:
			update_rules(s_buffer)
			break;
		case NET_GET_UPDATE_PLAYERS:
			update_players(s_buffer)
			break;
		case NET_GET_INITIAL_CARDS:
			get_initial_cards(s_buffer)
			break;
		case NET_RECEIVE_PLAYED_CARD:
			get_played_card(s_buffer)
			break;
		case NET_RECEIVE_DRAW_CARDS:
			get_drawn_cards(s_buffer)
			break;
		case NET_DISCONNECT_CHANGE_TURN:
			disconnection_update(s_buffer)
			break;
		case NET_GET_MESSAGE:
			retrieve_message(s_buffer)
			break;
		case NET_STOP_GAME:
			stop_game()
			if (global.my_player_id == 0) instance_create_depth(obj_deck.x,obj_deck.y + obj_deck.sprite_height, -1, obj_start)
			break;
		case SERVER_EXIT:
		case NET_WRONG_VER:
		case NET_ALREADY_STARTED:
		case NET_BLACKLISTED:
			var msg = buffer_read(s_buffer, buffer_string)
			show_message_async(msg)
			room_goto(rm_menu)
			break;
	}
}

//\/\/\/\/\/\/\/\/\/\/\/\/\/\\

function give_introduction() { 
	buffer_seek(buffer,buffer_seek_start,0)
	buffer_write(buffer,buffer_u8,NET_GIVE_NAME)
	buffer_write(buffer,buffer_string,global.my_name)
	buffer_write(buffer,buffer_string,global.version)
	network_send_packet(client_socket,buffer,buffer_tell(buffer))
}

function disconnection_update(s_buffer) {
	global.player_turn = buffer_read(s_buffer,buffer_u8)
	obj_my_player.i_played = true
	obj_pile.pile_must_draw = 0
	instance_destroy(obj_text_plusnumber)
	if (global.my_player_id == global.player_turn) {
		audio_play_sound(snd_my_turn, 0, false)
		obj_my_player.i_played = false
	} else {
		instance_destroy(obj_choose_color)
	}
}

function send_played_card(card) {
	var gameover = ds_list_empty(obj_my_player.my_cards)
	buffer_seek(buffer,buffer_seek_start,0)
	buffer_write(buffer,buffer_u8,NET_PLAY_CARD)
	buffer_write(buffer,buffer_u8,card)
	buffer_write(buffer,buffer_bool, gameover) //is it gameover (=last card?)
	network_send_packet(client_socket,buffer,buffer_tell(buffer))	
}

function update_players(s_buffer) {
	instance_destroy(obj_start)
	var num_players = buffer_read(s_buffer,buffer_u8)
	var whoami = buffer_read(s_buffer,buffer_u8)
	var card_n = []
	global.my_player_id = whoami
	instance_destroy(obj_other_player)
	ds_list_clear(global.player_names)
	for(var i = 0; i < num_players; i++) {
		var p = buffer_read(s_buffer,buffer_string)
		card_n[i] = buffer_read(s_buffer,buffer_u8)
		ds_list_add(global.player_names, p)
	}
	var add_player_index = whoami
	var k = 1;
	for(var i = 0; i < num_players; i++) {
		if (add_player_index != whoami) {
			var player = instance_create_depth(k*room_width/(num_players), 16,-1, obj_other_player)
			player.player_id = add_player_index
			player.my_cards = card_n[add_player_index]
			player.x -= player.sprite_width/2
			player.row_index = k
			player.num_players = num_players
			k++
		}
		add_player_index++
		if (add_player_index == num_players) add_player_index = 0
	}
	if (global.game_started && instance_number(obj_other_player) == 0) {
		stop_game()
	}
	if (whoami == 0 && !global.game_started) instance_create_depth(obj_deck.x,obj_deck.y + obj_deck.sprite_height, -1, obj_start)
}

function send_draw_cards() {
	buffer_seek(buffer,buffer_seek_start,0)
	buffer_write(buffer,buffer_u8,NET_DRAW_CARDS)
	network_send_packet(client_socket,buffer,buffer_tell(buffer))
}

function send_updated_rules() {
	buffer_seek(buffer,buffer_seek_start,0)
	buffer_write(buffer,buffer_u8,NET_RULE_UPDATE)
	buffer_write(buffer,buffer_bool,global.rules.draw_until_play)
	buffer_write(buffer,buffer_bool,global.rules.allow_stacks)
	buffer_write(buffer,buffer_bool,global.rules.fourstack_on_two)
	network_send_packet(client_socket,buffer,buffer_tell(buffer))
}

function update_rules(s_buffer) {
	global.rules.draw_until_play = buffer_read(s_buffer,buffer_bool)
	global.rules.allow_stacks = buffer_read(s_buffer,buffer_bool)
	global.rules.fourstack_on_two = buffer_read(s_buffer,buffer_bool)
}

function get_initial_cards(s_buffer) {
	stop_game()
	if (global.my_player_id == 0) instance_create_depth(obj_rules_box.x, obj_rules_box.y, -1, obj_stop)
	audio_play_sound(snd_start,0,false)
	global.game_started = true
	global.player_turn = buffer_read(s_buffer,buffer_u8)
	if (global.player_turn == global.my_player_id) {audio_play_sound(snd_my_turn, 0, false);}
	for(var i = 0; i < 7; i++) {
		var card = buffer_read(s_buffer,buffer_u8)
		obj_my_player.add_card(card)
	}
	with(obj_other_player) my_cards = 7
	var pile_card = buffer_read(s_buffer,buffer_u8)
	obj_pile.pile_last_card = pile_card
	create_card_throw(pile_card, true)
}

function get_played_card(s_buffer) {
	var card = buffer_read(s_buffer,buffer_u8)
	var gameover = buffer_read(s_buffer,buffer_bool)
	instance_destroy(obj_text_plusnumber)
	create_card_throw(card)
	obj_pile.pile_last_card = card
	with(obj_other_player) if (global.player_turn == player_id) my_cards--
	if (!gameover) {
		var how_much = 1
		if (get_card_number(card) == SKIP) {how_much = 2; create_skip()}
		else if (get_card_number(card) == PLUSTWO) {obj_pile.pile_must_draw += 2; create_plustext()}
		else if (get_card_number(card) == PLUSFOURCOLOR) {obj_pile.pile_must_draw += 4;  create_plustext()}
		else if (get_card_number(card) == INVERT) {
			global.player_turn_clockwise = !global.player_turn_clockwise; 
			audio_play_sound(snd_invert,0,false)
			if (instance_number(obj_other_player) == 1) {how_much = 2; create_skip()}
		}
		repeat(how_much) next_turn()
	}
	else {
		audio_play_sound(snd_gameover, 0, false)
		global.game_started = false
		instance_destroy(obj_start)
		if (global.my_player_id == 0) instance_create_depth(obj_deck.x,obj_deck.y + obj_deck.sprite_height, -1, obj_start)
	}
}

function get_drawn_cards(s_buffer) {
	var iend = obj_pile.pile_must_draw
	instance_destroy(obj_text_plusnumber)
	if (iend == 0) iend = 1
	if (global.player_turn == global.my_player_id) {
		var new_cards = ds_list_create()
		for(var i = 0; i < iend; i++) {
			var card = buffer_read(s_buffer, buffer_u8)
			if (iend == 1) && (global.rules.draw_until_play) {
				if !can_play_card(card) {with(obj_deck) alarm[0] = 50}
				else obj_my_player.i_played = false
			}
			obj_my_player.add_card(card)
			ds_list_add(new_cards, card)
		}
		//set glow
		for(var i = 0; i < ds_list_size(obj_my_player.my_cards); i++) {
			for(var j = 0; j < ds_list_size(new_cards); j++) {
				if (new_cards[| j] == obj_my_player.my_cards[| i]) {
					obj_my_player.card_glow[i] = 10
					ds_list_delete(new_cards, j)
					break;
				}
			}
			if ds_list_empty(new_cards) break;
		}
		ds_list_destroy(new_cards)
	} else with(obj_other_player) {
		if (global.player_turn == player_id) {
			my_cards += iend
			start_card_draw(iend, id)
		}
	}
	obj_pile.pile_must_draw = 0
	audio_play_sound(snd_pass,0, false)
	if (!global.rules.draw_until_play || iend > 1) next_turn()
}

function send_message(text) {
	buffer_seek(buffer,buffer_seek_start,0)
	buffer_write(buffer,buffer_u8,NET_SEND_MESSAGE)
	buffer_write(buffer,buffer_string,text)
	network_send_packet(client_socket,buffer,buffer_tell(buffer))
}

function retrieve_message(s_buffer) {
	var type = buffer_read(s_buffer,buffer_bool)
	var text = buffer_read(s_buffer,buffer_string)
	obj_chat_box.add_line(text, type)
}