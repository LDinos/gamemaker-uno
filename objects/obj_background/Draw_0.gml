/// @description
var card = obj_pile.pile_last_card
if (card != -1) {
	var color_index = get_card_color(card)
	draw_sprite_ext(spr_background, color_index, x, y, image_xscale, image_yscale, 0, c_white, 0.8)
}
