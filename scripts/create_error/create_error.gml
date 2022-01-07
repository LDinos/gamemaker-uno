// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_error(_x, _y, text){
	instance_destroy(obj_ingame_error)
	var e = instance_create_depth(_x,_y,-99,obj_ingame_error)
	e.text = text
	audio_play_sound(snd_error, 0, false)
}