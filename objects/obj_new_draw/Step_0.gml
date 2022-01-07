/// @description

//destroy the card once it's reached the hand
if (x == x2 and y == y2) instance_destroy()
if (alpha < 1) {
	alpha += alpha_inc
	var alpha_value = animcurve_channel_evaluate(card_throw, alpha)
	image_xscale = lerp(card_scale_default, card_scale_end, alpha_value)
	image_yscale = image_xscale
	x = lerp(xx, x2, alpha_value)
	y = lerp(yy, y2, alpha_value)
}