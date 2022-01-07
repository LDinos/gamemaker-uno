// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function next_turn(){
	if (global.player_turn_clockwise) global.player_turn++
	else global.player_turn--
	
	if (global.player_turn == get_num_players()) global.player_turn = 0
	else if (global.player_turn < 0) global.player_turn = get_num_players()-1
	
	if (global.player_turn == global.my_player_id) {
		audio_play_sound(snd_my_turn, 0, false)
		obj_my_player.i_played = false
	}
	global.speedrun_stop = 30 //Delay play permission for 30 frames so people cant speedrun it
}