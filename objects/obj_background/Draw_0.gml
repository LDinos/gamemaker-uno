/// @description
var card = obj_pile.pile_last_card
if (card != -1) {
	var color_index = get_card_color(card)
	draw_sprite(spr_background, color_index, x, y)
}
