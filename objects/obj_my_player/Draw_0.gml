var card_size = ds_list_size(my_cards)
var c = c_white
if (global.my_player_id == global.player_turn) c = c_red

for(var i = 0; i < card_size; i++) {
	var yy = y
	var card = my_cards[| i]
	var glow = card_glow[i]
	if (hover_index == i) yy = y - card_offset
	if (card >= 0) draw_sprite_ext(spr_cards, card, x + i * card_offset, yy, card_scale, card_scale, 0, c_white, 1)
	draw_sprite_ext(spr_white_pixel, 0, x + i * card_offset, yy, sprite_width, sprite_height, 0, c_white, abs(sin(glow)*0.6))
	if glow > 0 card_glow[i] -= 0.1
}
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_text_color(x,y-64,global.my_name, c, c, c, c, 1)