/// @description
var a = on_focus ? alpha_on_focus : alpha_on_defocus
draw_set_alpha(a)
var c = box_color
draw_rectangle_color(x, y, x+box_length, y+box_height, c,c,c,c, false)
var c = type_box_color
var h = string_height(text) == 0 ? type_box_height : string_height(text)
draw_rectangle_color(x, y+box_height, x+box_length, y+box_height+h, c,c,c,c, false)
draw_set_font(fnt_default)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_text(x,y+box_height,text+blink)
//draw_text_ext(x,y+box_height,text + " " +blink,0,box_length)
var yy = y;
for(var i = 0; i < array_length(log); i++) {
	var log_strct = log[i]
	var log_c = log_strct.log_color
	var log_t = log_strct.log_text
	var log_h = log_strct.log_height
	if (yy+log_h >= y+box_height) { array_delete(log,0,1); break;}
	draw_text_colour(x,yy,log_t, log_c, log_c, log_c, log_c, a)
	yy += log_h
}
draw_set_alpha(1)