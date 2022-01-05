/// @description
on_focus = false
name_max_length = 16
backspace_lag = 0
blink = ""
ini_open("settings.ini")
text = ini_read_string("Settings", "Name", "Name")
ini_close()
box_length = 256
box_height = 32
x = (room_width/2) - (box_length/2)

function is_letter() {
	return keyboard_lastkey >= 65 && keyboard_lastkey <= 90
}