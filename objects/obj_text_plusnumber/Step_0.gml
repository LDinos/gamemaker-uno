/// @description
if alpha < 1 {
	alpha+=0.05
	image_alpha = lerp(image_alpha, 1, alpha)
	image_xscale = lerp(image_xscale, image_xscale_final, alpha)
	image_yscale = image_xscale
}
