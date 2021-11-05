/// @description Insert description here
// You can write your code in this editor
transition_place_sequence(sq_fadein);

num_cleared_levels = 0;

//file_delete("savedata.save");
if (file_exists("savedata.sav")) {
	var _buffer = buffer_load("savedata.sav");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _loadData = json_parse(_string);
	
	global.cleared_levels = _loadData.cleared_levels;
//obj_menu.submenu[0][1] = _loadData.settings[0];
//	obj_menu.submenu[1][1] = _loadData.settings[1];
//	obj_camera.current_window = _loadData.settings[2];
	
//	audio_group_set_gain(ag_SFX, (obj_menu.submenu[1][1] * 0.2), 0);				
//	audio_group_set_gain(ag_BGM, (obj_menu.submenu[0][1] * 0.5), 0);
	
	
	show_debug_message("Game loaded: " + _string);
}

if (file_exists("localsavedata.save")) {
	var _buffer = buffer_load("localsavedata.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _loadData = json_parse(_string);
	
	//global.cleared_levels = _loadData.cleared_levels;
	obj_menu.submenu[0][1] = _loadData.settings[0];
	obj_menu.submenu[1][1] = _loadData.settings[1];
	obj_camera.current_window = _loadData.settings[2];
	
	audio_group_set_gain(ag_SFX, (obj_menu.submenu[1][1] * 0.2), 0);				
	audio_group_set_gain(ag_BGM, (obj_menu.submenu[0][1] * 0.5), 0);
	
	
	show_debug_message("Local loaded: " + _string);
}

// count number of cleared levels
for (var i = 0; i < obj_menu.num_levels; i++) {
	//if (i != 0) {
	//	global.cleared_levels[i][0] = true;	
	//}
	//else {
	//	global.cleared_levels[i][0] = false;	
	//}
	if (global.cleared_levels[i][0]) {
		num_cleared_levels++;	
	}
}