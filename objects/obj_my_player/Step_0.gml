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
		if (can_play_card(card)) {
			if (mycard_color != BLACK) play_card(hover_index)
			else {
				var c = instance_create_depth(x,y,depth-1,obj_choose_color)
				c.card_pos = hover_index
			}
		}
	}
	
}