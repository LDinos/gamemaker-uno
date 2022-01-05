/// @description
if position_meeting(mouse_x,mouse_y,id) {
	on_focus = true
	alarm[0] = 1
}
else {
	on_focus = false
	alarm[0] = -1
	blink = ""
}