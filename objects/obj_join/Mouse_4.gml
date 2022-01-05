/// @description
global.my_name = obj_name_box.text
ini_open("settings.ini")
	ini_write_string("Settings","Name", global.my_name)
	ini_write_string("Settings","IP", global.ip)
ini_close()
room_goto(rm_gameplay)