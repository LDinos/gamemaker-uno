/// @description
randomize()
global.on_focus = true
global.player_names = ds_list_create()
global.player_turn = -1 //whose turn is it?
global.player_turn_clockwise = true
global.game_started = false
global.speedrun_stop = 0

global.rules = {
	draw_until_play : false,
	allow_stacks : true,
	fourstack_on_two : true
}
