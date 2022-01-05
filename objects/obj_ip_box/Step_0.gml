if (backspace_lag > 0) backspace_lag--
if (on_focus) {
	if keyboard_check_pressed(vk_anykey) && (is_letter() || is_dot() || is_number()){
		if (string_length(global.ip) < name_max_length) global.ip += keyboard_lastchar
		backspace_lag = 30
	}
	else if keyboard_check(vk_anykey) && (is_letter() || is_dot() || is_number()) {
		if (string_length(global.ip) < name_max_length) && (backspace_lag == 0) {
			global.ip += keyboard_lastchar
			backspace_lag = 2
		}
	}
	else if keyboard_check_pressed(vk_backspace) {
		global.ip = string_delete(global.ip,string_length(global.ip),1)
		backspace_lag = 30
	}
	else if keyboard_check(vk_backspace) {
		if (backspace_lag == 0) {
			global.ip = string_delete(global.ip,string_length(global.ip),1)
			backspace_lag = 2
		}
	}
	else backspace_lag = 0
}