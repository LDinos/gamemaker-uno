/// @description
if position_meeting(mouse_x,mouse_y,id) {
	on_focus = true
	if (global.is_phone) {
		keyboard_string = text
		if (keyboard_virtual_status() == false) {
			keyboard_virtual_show(kbv_type_ascii, kbv_returnkey_done, kbv_autocapitalize_words, false)
		}
	}
	alarm[0] = 1
}
else {
	if !position_meeting(mouse_x, mouse_y, obj_ip_box) keyboard_virtual_hide()
	on_focus = false
	alarm[0] = -1
	blink = ""
}