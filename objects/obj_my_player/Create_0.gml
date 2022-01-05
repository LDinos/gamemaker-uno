global.my_player_id = -1
hover_index = -1;
i_played = false;
card_offset = 32;
card_scale = 0.4
image_xscale = card_scale
image_yscale = card_scale
card_height = sprite_get_height(spr_cards) * card_scale
card_width = sprite_get_width(spr_cards) * card_scale
my_cards = ds_list_create()
card_glow = []

y = room_height - sprite_get_height(spr_cards)*card_scale

function add_card(card) {
	ds_list_add(my_cards,card)
	ds_list_sort(my_cards, true)
	card_glow = array_create(ds_list_size(my_cards), 0)
}

function deplete_card(pos) {
	ds_list_delete(my_cards,pos)
	ds_list_sort(my_cards, true)
	card_glow = array_create(ds_list_size(my_cards), 0)
}

function play_card(pos) {
	var card = my_cards[| pos]
	obj_pile.pile_last_card = card
	deplete_card(pos)
	obj_client.send_played_card(card)
	i_played = true
}