/// @description
if !surface_exists(surf_chat_text) surf_chat_text = surface_create(box_length, box_height)
if !surface_exists(surf_type_text) surf_type_text = surface_create(box_length, type_box_height)
surface_resize(surf_chat_text, box_length, box_height)
surface_resize(surf_type_text, box_length, type_box_height)
var a = on_focus ? alpha_on_focus : alpha_on_defocus

draw_type_text(a)
draw_chat_text(a)

