/// @description
x = 16
y = room_height - 16
image_xscale = clamp(room_width/1280, 0.2, 1)
image_yscale = image_xscale

if (global.game_started) && (global.player_turn == global.my_player_id) {
	image_alpha = 1
}
else image_alpha = 0