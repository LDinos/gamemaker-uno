/// @description
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if (!global.game_started) {
	var c = c_black
	draw_set_alpha(0.6)
	draw_rectangle_color(room_width/2 - 76, 
	room_height/2 - 16,
	room_width/2 + 76,
	room_height/2 + 16,
	c,c,c,c,false)
	draw_set_alpha(1)
	draw_text(room_width/2, room_height/2, "Game not started yet.")
}