/// @description
if (global.game_started) && (global.on_focus) && (global.speedrun_stop == 0) && !obj_my_player.i_played {
	if (global.player_turn == global.my_player_id) {
		var can_draw = true
		if (global.rules.draw_until_play) {
			for(var i = 0; i < ds_list_size(obj_my_player.my_cards); i++) {
				var card = obj_my_player.my_cards[| i]
				if can_play_card(card) {can_draw = false; break;}
			}
		}
		if (can_draw) {
			obj_my_player.i_played = true
			obj_client.send_draw_cards()
		}
		else create_error(room_width/2, room_height/2, "You can't draw if you have cards to play")
	}
}
