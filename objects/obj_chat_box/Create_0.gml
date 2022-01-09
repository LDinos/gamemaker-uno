/// @description
#macro LOG_CHAT 0
#macro LOG_ALERT 1
box_length = 256
box_height = 256
type_box_height = 24
on_focus = false
alpha_on_focus = 1
alpha_on_defocus = 0.2
box_color = c_gray
type_box_color = c_dkgray
text = ""
blink = ""
backspace_lag = 0
log = []
message_cooldown_baseval = 25
message_cooldown = 0

function add_line(text, type) {
	audio_play_sound(snd_alarm,0,false)
	var c = type == LOG_ALERT ? c_yellow : c_white
	var strct = {
		log_text : text,
		log_color : c,
		log_height : string_height(text)
	}
	var str = ""
	for(var i = 0; i < string_length(text); i++) {
		if string_width( str + string_char_at(text, i+1)) >= box_length {
			str += "\n"
		}
		str += string_char_at(text, i+1)
	}
	strct.log_text = str
	strct.log_height = string_height(str)
	array_push(log, strct)
}