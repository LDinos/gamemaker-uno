/// @description
if (backspace_lag > 0) backspace_lag--
if (on_focus) {
	if keyboard_check_pressed(vk_anykey) && is_letter() {
		if (string_length(text) < name_max_length) text += keyboard_lastchar
		backspace_lag = 30
	}
	else if keyboard_check(vk_anykey) && is_letter() {
		if (string_length(text) < name_max_length) && (backspace_lag == 0) {
			text += keyboard_lastchar
			backspace_lag = 2
		}
	}
	else if keyboard_check_pressed(vk_backspace) {
		text = string_delete(text,string_length(text),1)
		backspace_lag = 30
	}
	else if keyboard_check(vk_backspace) {
		if (backspace_lag == 0) {
			text = string_delete(text,string_length(text),1)
			backspace_lag = 2
		}
	}
	else backspace_lag = 0
}




