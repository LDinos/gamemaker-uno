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
