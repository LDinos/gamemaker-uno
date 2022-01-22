/// @description
if global.player_turn_clockwise image_xscale = 1
else image_xscale = -1
if window_has_focus() {
	x = room_width/2
	y = room_height/3.5
}