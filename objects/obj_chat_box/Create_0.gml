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
	
	
	//text wrapping fixes
	var x_prog = 0
	var print_prog = 1
	
	while print_prog <= string_count {
		
		var print_word_prog = print_prog
		//iterate until the next space char
		while print_word_prog <= string_length(text) and string_char_at(text, print_word_prog) != " " {
			print_word_prog += 1	
		}
		
		//get the slice from the current character to the end of the word
		var word_drawing_next = string_copy(text, print_prog, print_word_prog - print_prog)
		
		//if the word will expand past the x width but the word isnt so massive that it will expand over the x width even on a newline
		if x_prog + string_width(word_drawing_next) > box_length and string_width(word_drawing_next) < box_length {
			//reset to the start of the next line
			x_prog = 0
			str += "\n"
		}
		
		
		
		
		var char_drawing_next = string_char_at(text, print_prog)
		
		//if the next character will go out of bounds
		if x_prog + string_width(char_drawing_next) > box_length {
			//reset to the start of the next line
			x_prog = 0
			str += "\n"
		}
		
		//if we are going to draw a space at the start of a newline
		if x_prog = 0 and char_drawing_next = " " {
			//uhhh, dont do that cuz it looks ugly
			char_drawing_next = ""
		}
		
		str += char_drawing_next
		x_prog += string_width(char_drawing_next) //offset the x coordinate by the width of the character drawn
		
		print_prog += 1
	}
	
	/* old code
	for(var i = 0; i < string_length(text); i++) {
		if string_width( str + string_char_at(text, i+1)) >= box_length {
			str += "\n"
		}
		str += string_char_at(text, i+1)
	}
	*/
	
	
	
	
	
	strct.log_text = str
	strct.log_height = string_height(str)
	array_push(log, strct)
}