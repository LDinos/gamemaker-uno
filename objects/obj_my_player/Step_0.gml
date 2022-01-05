/// @description
var s = ds_list_size(my_cards)
var hand_full_size = card_width*(s>0) + (s-1)*card_offset
var yoffset = card_offset*(hover_index >= 0)

x = (room_width/2) - (hand_full_size/2)

if (mouse_y >= y - yoffset) && (mouse_y <= y + card_height)
&& (mouse_x >= x) 
&& (mouse_x <= x + hand_full_size) && global.on_focus {
	hover_index = (mouse_x - x) div card_offset
	hover_index = clamp(hover_index, 0, s-1)
}
else hover_index = -1

if mouse_check_button_pressed(mb_left) && global.game_started && !i_played {
	if (global.player_turn == global.my_player_id) && (hover_index != -1) && (global.speedrun_stop == 0) {
		var card = my_cards[| hover_index]
		var mycard_color = get_card_color(card)
		var mycard_number = get_card_number(card)
		var pile_color = get_card_color(obj_pile.pile_last_card)
		var pile_number = get_card_number(obj_pile.pile_last_card)
		var can_play = false;
		if (mycard_color == pile_color) || (mycard_color == BLACK) || (mycard_number == pile_number) || (obj_pile.pile_last_card == -1) {
			if (obj_pile.pile_must_draw != 0) { //if we have to draw cards because of plus two or plus 4
				if (mycard_number == pile_number) || (card == PLUSFOUR) { //if +4 or plus two on plus two
					can_play = true
				}
			}
			else can_play = true 
		}
		if (can_play) {
			if (mycard_color != BLACK) play_card(hover_index)
			else {
				var c = instance_create_depth(x,y,depth-1,obj_choose_color)
				c.card_pos = hover_index
			}
		}
	}
	
}