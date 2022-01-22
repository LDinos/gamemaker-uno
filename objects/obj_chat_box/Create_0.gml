/// @description
#macro LOG_CHAT 0
#macro LOG_ALERT 1
#macro MAX_LINES 20
#macro MAX_CHARS_PER_LINE 35
box_length = 256
box_height = 256
type_box_height = 24
on_focus = false
alpha_on_focus = 1
alpha_on_defocus = 0.5
box_color = c_gray
type_box_color = c_dkgray
text = ""
blink = ""
text_max_length = 100
backspace_lag = 0
log = []
message_cooldown_baseval = 25
message_cooldown = 0

surf_chat_text = surface_create(box_length, box_height)
surf_type_text = surface_create(box_length, type_box_height)

function add_line(text, type) {
	audio_play_sound(snd_alarm,0,false)
	var c = type == LOG_ALERT ? c_yellow : c_white
	var strct = {
		log_text : text,
		log_color : c,
		log_height : string_height(text)
	}
	array_push(log, strct)
	if (array_length(log) > MAX_LINES) array_delete(log,0,1)
}

function draw_type_text(a) {
	surface_set_target(surf_type_text)
		draw_set_alpha(a)
		var c = type_box_color
		var h = string_height(text) == 0 ? type_box_height : string_height(text)
		draw_rectangle_color(0, 0, box_length, h, c,c,c,c, false)
		draw_set_font(fnt_default)
		draw_set_halign(fa_right)
		draw_set_valign(fa_top)
		draw_text(box_length-8,0,text+blink)
		draw_set_alpha(1)
	surface_reset_target()
	draw_surface(surf_type_text, x, y+box_height)
}

function draw_chat_text(a) {
	surface_set_target(surf_chat_text)
		draw_set_alpha(a)
		var c = box_color
		draw_rectangle_color(0, 0, box_length, box_height, c,c,c,c, false)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		var yy = box_height;
		for(var i = array_length(log)-1; i>=0; i--) {
			var log_strct = log[i]
			var log_c = log_strct.log_color
			var log_t = log_strct.log_text
			var log_h = log_strct.log_height*(1 + (string_length(log_t) div MAX_CHARS_PER_LINE))
			var w = box_length
			yy -= log_h
			draw_text_ext_colour(2,yy,log_t, 16, w, log_c, log_c, log_c, log_c, a)
		}
		draw_set_alpha(1)
	surface_reset_target()
	draw_surface(surf_chat_text, x, y)
}