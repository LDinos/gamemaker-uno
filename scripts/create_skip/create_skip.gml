// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_skip(){
	var turn_index = global.player_turn
	if global.player_turn_clockwise turn_index++
	else turn_index--
	if turn_index == (instance_number(obj_other_player) + instance_number(obj_other_player)) turn_index = 0
	else if turn_index < 0 turn_index = instance_number(obj_other_player) + instance_number(obj_other_player) - 1
	
	var xx = room_width / 2
	var yy = obj_my_player.y + 16
	if (turn_index != global.my_player_id) {
		with(obj_other_player) if (turn_index == player_id) {
			xx = x + sprite_width/2
			yy = y + sprite_height/2
			break;
		}
	}
	instance_create_depth(xx,yy,-99,obj_skipped)
}