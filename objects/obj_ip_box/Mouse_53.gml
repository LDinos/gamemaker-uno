/// @description
if position_meeting(mouse_x,mouse_y,id) {
	if (global.is_phone) {
		keyboard_string = global.ip
		if keyboard_virtual_status() == false {
			keyboard_virtual_show(kbv_type_url, kbv_returnkey_done, kbv_autocapitalize_words, false)
		}
	}
	on_focus = true
	alarm[0] = 1
}
else {
	if !position_meeting(mouse_x, mouse_y, obj_name_box) keyboard_virtual_hide()
	on_focus = false
	alarm[0] = -1
	blink = ""
}