/// @description
var on_button = (mouse_x >= x) && (mouse_x <= x+box_length) && (mouse_y >= y) && (mouse_y <= y+box_height)
if (!global.game_started && global.my_player_id == 0 && on_button) {
	var val = variable_struct_get(global.rules, rule)
	variable_struct_set(global.rules, rule, !val)
	obj_client.send_updated_rules()
}