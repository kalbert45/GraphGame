/// @description Insert description here
// You can write your code in this editor
transition_place_sequence(sq_fadein);

file_delete("savedata.save");
if (file_exists("savedata.save")) {
	var _buffer = buffer_load("savedata.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _loadData = json_parse(_string);
	
	global.cleared_levels = _loadData.cleared_levels;
	obj_menu.submenu[0][1] = _loadData.settings[0];
	obj_menu.submenu[1][1] = _loadData.settings[1];
	obj_camera.current_window = _loadData.settings[2];
	
	audio_group_set_gain(ag_SFX, (obj_menu.submenu[1][1] * 0.2), 0);				
	audio_group_set_gain(ag_BGM, (obj_menu.submenu[0][1] * 0.5), 0);
	
	
	show_debug_message("Game loaded: " + _string);
}

