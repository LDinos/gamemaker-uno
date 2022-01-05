/// @description
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_plussomething)
var txt = string(obj_pile.pile_must_draw)
var c = c_black
draw_text_transformed_color(x-4,y,"+"+txt, image_xscale, image_yscale, 0, c,c,c,c,image_alpha)
draw_text_transformed_color(x+4,y,"+"+txt, image_xscale, image_yscale, 0, c,c,c,c,image_alpha)
draw_text_transformed_color(x,y+4,"+"+txt, image_xscale, image_yscale, 0, c,c,c,c,image_alpha)
draw_text_transformed_color(x,y-4,"+"+txt, image_xscale, image_yscale, 0, c,c,c,c,image_alpha)
c = c_white
draw_text_transformed_color(x,y,"+"+txt, image_xscale, image_yscale, 0, c,c,c,c,image_alpha)
draw_set_font(fnt_default)