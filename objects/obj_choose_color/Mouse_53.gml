/// @description
if (mouse_x >= x && mouse_x <= x + rectangle_full_length)
&& (mouse_y >= y && mouse_y <= y + rectangle_full_length) {
	var xx = mouse_x - x
	var yy = mouse_y - y
	var color = (xx div (rectangle_full_length/2)) + 2*(yy div (rectangle_full_length/2)) //0 - 3
	var card = obj_my_player.my_cards[| card_pos]
	var newcard = PLUSFOURCOLOR + color*15
	if (card == WILDCARD) newcard = WILDCARDCOLOR + color*15
	obj_my_player.my_cards[| card_pos] = newcard
	obj_my_player.play_card(card_pos)
	instance_destroy()
}