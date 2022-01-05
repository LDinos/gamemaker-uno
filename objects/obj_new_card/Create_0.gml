/// @description
audio_play_sound(snd_card_throw,false,0)
num_cards_until_death = 5
num_cards_currently = 0
image_speed = 0
card_scale_default = 0.4
card_scale_end = 0.3
image_xscale = card_scale_default
image_yscale = image_xscale
angle_end = irandom_range(-15,15)
xx = x
yy = y
x2 = obj_pile.x - sprite_width/2 - irandom_range(-10,10)
y2 = obj_pile.y - sprite_width/2 - irandom_range(-10,10)
alpha = 0
alpha_inc = 0.05

card_throw = animcurve_get_channel(anim_card_throw, "card_throw")