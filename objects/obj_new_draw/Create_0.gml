/// @description
audio_play_sound(snd_card_throw,false,0)
image_speed = 0
card_scale_default = obj_deck.card_scale
card_scale_end = obj_deck.card_scale*0.75
image_xscale = card_scale_default
image_yscale = image_xscale



alpha = 0
alpha_inc = 0.05

card_throw = animcurve_get_channel(anim_card_throw, "card_throw")