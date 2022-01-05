// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_card_throw(card, first_throw = false){
	var x_start = first_throw ? obj_pile.x : obj_my_player.x
	var y_start = first_throw ? obj_pile.y : obj_my_player.y
	var _x = x_start
	var _y = y_start
	with(obj_other_player) if (global.player_turn == player_id) {
		_x = x;
		_y = y; 
		break;
		}
	with(obj_new_card) num_cards_currently++
	var card_throw = instance_create_depth(_x,_y,-1,obj_new_card)
	card_throw.image_index = card
}