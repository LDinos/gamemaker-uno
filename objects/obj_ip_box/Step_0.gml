if (backspace_lag > 0) backspace_lag--
if (on_focus) {
	global.ip = string_get_input(global.ip, true, true, false, true, true, name_max_length)
}