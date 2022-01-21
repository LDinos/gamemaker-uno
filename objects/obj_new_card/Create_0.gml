/// @description
audio_play_sound(snd_card_throw,false,0)
num_cards_until_death = 5
num_cards_currently = 0
image_speed = 0
card_scale_default = obj_deck.card_scale
card_scale_end = obj_deck.card_scale*0.75
image_xscale = card_scale_default
image_yscale = image_xscale
angle_end = irandom_range(-15,15)
xx = x
yy = y
xrand = irandom_range(-10,10)
yrand = irandom_range(-10,10)
x2 = obj_pile.x - sprite_width/2 - xrand
y2 = obj_pile.y - sprite_width/2 - yrand
alpha = 0
alpha_inc = 0.05

card_throw = animcurve_get_channel(anim_card_throw, "card_throw")