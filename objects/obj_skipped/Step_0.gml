/// @description
if image_xscale < 1 {
	image_xscale += 0.05
	image_yscale = image_xscale
} else {
	image_alpha -= 0.05
	if (image_alpha == 0) instance_destroy()
}