/// @description
draw_set_halign(fa_left)
draw_set_valign(fa_top)

var c = c_white
if (global.player_turn == player_id) c = c_red


draw_self()
draw_text_color(x, y+sprite_height, global.player_names[| player_id],c,c,c,c,1)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_plussomething)
//don't draw the number if the game is over and we have 0 cards. eg: pregame on first setup where everybody has 0 cards
if global.game_started or my_cards > 0 {
	draw_text_transformed(x+sprite_width/2, y+sprite_height/2, my_cards,0.5,0.5,0)
}
draw_set_font(fnt_default)
