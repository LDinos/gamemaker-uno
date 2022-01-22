/// @description
var s = ds_list_size(my_cards)
var hand_full_size = card_width*(s>0) + (s-1)*card_offset
var yoffset = card_offset*(hover_index >= 0)
if window_has_focus() {
	card_offset = (room_width/1280)*32
	card_scale = (room_width/1280)*0.4
	image_xscale = card_scale
	image_yscale = card_scale
	card_height = sprite_get_height(spr_cards) * card_scale
	card_width = sprite_get_width(spr_cards) * card_scale
}

x = (room_width/2) - (hand_full_size/2)
y = room_height - sprite_height

if (!global.is_phone)
{
	hover_card(yoffset, hand_full_size, s)
}

if mouse_check_button_pressed(mb_left) && global.game_started {
	if (!global.is_phone) click_on_card()
	else {
		hover_card(yoffset, hand_full_size, s)
	}
}