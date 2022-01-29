/// @description
draw_sprite_ext(spr_white_pixel,0,0,0,room_width,room_height,0,c_black,0.4)
var c = c_black
draw_rectangle_color(x-2,y-2,x+rectangle_full_length+2,y+rectangle_full_length+2,c,c,c,c,false)
var c = c_blue
draw_rectangle_color(x,y,x+rectangle_full_length/2,y+rectangle_full_length/2,c,c,c,c,false)
c = c_green
draw_rectangle_color(x+rectangle_full_length/2,y,x+rectangle_full_length,y+rectangle_full_length/2,c,c,c,c,false)
c = c_red
draw_rectangle_color(x,y+rectangle_full_length/2,x+rectangle_full_length/2,y+rectangle_full_length,c,c,c,c,false)
c = c_yellow
draw_rectangle_color(x+rectangle_full_length/2,y+rectangle_full_length/2,x+rectangle_full_length,y+rectangle_full_length,c,c,c,c,false)
draw_sprite(spr_cancel,0,x,y+rectangle_full_length)
