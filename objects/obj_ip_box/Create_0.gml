on_focus = false
name_max_length = 30
backspace_lag = 0
blink = ""
ini_open("settings.ini")
global.ip = ini_read_string("Settings", "IP", "ldinos.ddns.net")
ini_close()
box_length = 256
box_height = 32
x = (room_width/2) - (box_length/2)

function is_letter() {
	return keyboard_lastkey >= 65 && keyboard_lastkey <= 90
}

function is_number() {
	return keyboard_lastkey >= 48 && keyboard_lastkey <= 57
}

function is_dot() {
	return keyboard_lastkey == 190
}