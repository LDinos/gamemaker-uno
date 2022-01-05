// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function next_turn(){
	var num_players = instance_number(obj_other_player)+1
	if (global.player_turn_clockwise) global.player_turn++
	else global.player_turn--
	if (global.player_turn == num_players) global.player_turn = 0
	else if (global.player_turn < 0) global.player_turn = num_players-1
	if (global.player_turn == global.my_player_id) {audio_play_sound(snd_my_turn, 0, false); obj_my_player.i_played = false}
	global.speedrun_stop = 30
}