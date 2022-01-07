//initialises the object that handles spawning the drawn cards
function start_card_draw(quantity, player_id){
	var generator = instance_create_depth(obj_deck.x, obj_deck.y, -1, obj_draw_generator)
	generator.initial_cards = quantity
	generator.target = player_id
}