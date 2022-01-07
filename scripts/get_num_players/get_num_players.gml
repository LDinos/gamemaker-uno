// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_num_players(){
	return instance_number(obj_my_player) + instance_number(obj_other_player)
}