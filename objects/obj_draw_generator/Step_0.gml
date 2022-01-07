/// @description Insert description here
// You can write your code in this editor

var interval = deal_time/initial_cards
timer += 1

if interval * cards_dealt < timer { //technically this should be a while loop, but that's only relevant if initial_cards > deal_time so i think we're probably safe
	create_card_draw(target)	
	cards_dealt += 1
}

if timer > deal_time or cards_dealt >= initial_cards {
	//we're done generating, destroy the instance
	instance_destroy()	
}