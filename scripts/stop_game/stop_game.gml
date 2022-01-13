// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function stop_game() {
	instance_destroy(obj_text_plusnumber)
	instance_destroy(obj_choose_color)
	instance_destroy(obj_new_card)
	instance_destroy(obj_stop)
	global.player_turn = -1 //whose turn is it?
	global.player_turn_clockwise = true
	global.game_started = false
	ds_list_clear(obj_my_player.my_cards)
	with(obj_other_player) my_cards = 0
	obj_pile.pile_last_card = -1
	obj_pile.pile_must_draw = 0
	obj_my_player.i_played = false
	obj_my_player.card_glow = []
}