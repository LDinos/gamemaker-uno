/// @description
if window_has_focus() {
	image_xscale = (room_width/1280)*0.3
	image_yscale = image_xscale
}
if (num_players != 0) x = row_index*room_width/(num_players)
y = 16