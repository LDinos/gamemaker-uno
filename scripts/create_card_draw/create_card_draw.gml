//spawns a drawn card
function create_card_draw(player_id){
	var _x = obj_deck.x
	var _y = obj_deck.y

	var card_throw = instance_create_depth(_x,_y,-1,obj_new_draw)
	
	card_throw.xx = obj_deck.x
	card_throw.yy = obj_deck.y
	
	card_throw.x2 = player_id.x
	card_throw.y2 = player_id.y
}