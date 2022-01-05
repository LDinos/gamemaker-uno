/// @description
if (global.game_started) && (global.on_focus) && (global.speedrun_stop == 0) && !obj_my_player.i_played {
	if (global.player_turn == global.my_player_id) {
		obj_my_player.i_played = true
		obj_client.send_draw_cards()
	}
}
