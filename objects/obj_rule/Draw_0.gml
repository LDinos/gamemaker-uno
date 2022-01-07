/// @description
draw_set_font(fnt_default)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
var c = c_black
draw_rectangle_color(x,y,x+box_length,y+box_height,c,c,c,c,false)
c = c_lime
if (variable_struct_get(global.rules, rule)) draw_rectangle_color(x,y,x+box_length,y+box_height,c,c,c,c,false)
draw_text(x+8+box_length, y+box_height/2, description)