// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function can_play_card(card){
	var can_play = false;
	var mycard_color = get_card_color(card)
	var mycard_number = get_card_number(card)
	var pile_color = get_card_color(obj_pile.pile_last_card)
	var pile_number = get_card_number(obj_pile.pile_last_card)
	if (mycard_color == pile_color) || (mycard_color == BLACK) || (mycard_number == pile_number) || (obj_pile.pile_last_card == -1) {
		if (obj_pile.pile_must_draw != 0) { //if we have to draw cards because of plus two or plus 4
			if (global.rules.allow_stacks) {
				if (mycard_number == pile_number) || (card == PLUSFOUR && global.rules.fourstack_on_two) { //if +4 or plus two on plus two
					can_play = true
				}
			}
		}
		else can_play = true 
	}
	return can_play
}