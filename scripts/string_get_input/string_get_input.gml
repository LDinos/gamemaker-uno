function is_letter() {
	return keyboard_lastkey >= 65 && keyboard_lastkey <= 90
}

function is_number() {
	return keyboard_lastkey >= 48 && keyboard_lastkey <= 57
}

function is_dot() {
	return keyboard_lastkey == 190
}

function is_space() {
	return keyboard_lastkey == vk_space
}

function string_get_input(text = "", allow_letters, allow_numbers, allow_space, allow_dots, max_length){
	var can_type = true
	if (!allow_letters) can_type = !is_letter()
	if (!allow_numbers && can_type) can_type = !is_number()
	if (!allow_dots && can_type) can_type = !is_dot()
	if (!allow_space && can_type) can_type = !is_space()
	if !is_dot() && !is_number() && !is_letter() && !is_space() can_type = false
	if keyboard_check_pressed(vk_anykey) && can_type {
		if (string_length(text) < max_length) text += keyboard_lastchar
		backspace_lag = 30
	}
	else if keyboard_check(vk_anykey) && can_type {
		if (string_length(text) < max_length) && (backspace_lag == 0) {
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
	return text
}