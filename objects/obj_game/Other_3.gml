/// @description Insert description here
// You can write your code in this editor
graph_destroy(graph);

var _saveData = {
	cleared_levels : global.cleared_levels,	
	settings : [obj_menu.submenu[0][1], obj_menu.submenu[1][1], obj_camera.current_window],
}

var _string = json_stringify(_saveData);
var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "savedata.save");
buffer_delete(_buffer);

show_debug_message("Game saved: " + _string);