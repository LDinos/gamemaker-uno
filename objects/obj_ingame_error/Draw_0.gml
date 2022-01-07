/// @description
draw_set_font(fnt_default)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var c = c_black
draw_text_color(x-1,y,text,c,c,c,c,1)
draw_text_color(x+1,y,text,c,c,c,c,1)
draw_text_color(x,y-1,text,c,c,c,c,1)
draw_text_color(x,y+1,text,c,c,c,c,1)
var c = c_red
draw_text_color(x,y,text,c,c,c,c,1)