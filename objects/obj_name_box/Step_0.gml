/// @description
if (backspace_lag > 0) backspace_lag--
if (on_focus) {
	text = string_get_input(text, true, true, false, false, true, name_max_length)
	show_debug_message(keyboard_lastkey)
}




