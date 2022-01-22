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

function is_symbol() {
	return (keyboard_lastkey >= K_COLON && keyboard_lastkey <= K_QUOTE)
}

function string_get_input(text = "", allow_letters, allow_numbers, allow_space, allow_dots, allow_symbols, max_length){
	if (global.is_phone) {
		if keyboard_check_pressed(vk_enter) {
			keyboard_virtual_hide();
			return text
		}
		if (string_length(keyboard_string) < max_length) || (keyboard_lastkey == vk_backspace) return keyboard_string
		else {
			if (keyboard_string != text) keyboard_string = text
			return text
		}
	}
	else {
		var can_type = true
		var char = keyboard_lastchar
		if (!allow_letters) can_type = !is_letter()
		if (!allow_numbers && can_type) can_type = !is_number()
		if (!allow_dots && can_type) can_type = !is_dot()
		if (!allow_space && can_type) can_type = !is_space()
		if (!allow_symbols && can_type) can_type = !is_symbol()
		if !is_dot() && !is_number() && !is_letter() && !is_space() && !is_symbol() can_type = false
	
		if keyboard_check_pressed(vk_anykey) && can_type {
			if (string_length(text) < max_length) text += char
			backspace_lag = 30
		}
		else if keyboard_check(vk_anykey) && can_type {
			if (string_length(text) < max_length) && (backspace_lag == 0) {
				text += char
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
}