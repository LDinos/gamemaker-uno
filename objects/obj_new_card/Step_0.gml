/// @description
depth = num_cards_currently
if (num_cards_currently == num_cards_until_death) instance_destroy()
if (alpha < 1) {
	alpha+= alpha_inc
	var alpha_value = animcurve_channel_evaluate(card_throw, alpha)
	image_xscale = lerp(card_scale_default, card_scale_end, alpha_value)
	image_yscale = image_xscale
	x = lerp(xx, x2, alpha_value)
	y = lerp(yy, y2, alpha_value)
	image_angle = lerp(0, angle_end, alpha_value)
}