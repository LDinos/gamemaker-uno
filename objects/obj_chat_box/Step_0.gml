/// @description
if (message_cooldown > 0) message_cooldown--
if mouse_check_button_pressed(mb_left) {
	var mouse_on_me = (mouse_x >= x && mouse_x <= x + box_length) 
					&& (mouse_y >= y && mouse_y <= y + box_height + type_box_height)
	if (mouse_on_me) {
		on_focus = true;
		blink = "|"
		alarm[0] = 30
	}
	else {on_focus = false; blink = ""; alarm[0] = -1}
}

if (backspace_lag > 0) backspace_lag--
if (on_focus) {
	var text_max_length = 99
	if (string_width(text) >= box_length - 8) text_max_length = 0
	text = string_get_input(text, true, true, true, true, text_max_length)
	if keyboard_check_pressed(vk_enter) {
		if (message_cooldown == 0) {
			message_cooldown = message_cooldown_baseval
			obj_client.send_message(global.my_name + ": " + text)
			text = ""
		}
	}
}