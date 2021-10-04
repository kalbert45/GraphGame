/// change global variable upon mouse release
if (mouse_check_button_released(mb_left)) {
	global.mouse_activated = false;	
}

// reset button
if (keyboard_check_pressed(ord("R"))) {
	global.selected = undefined;
	global.mouse_activated = false;
	ds_list_clear(act_line);
	graph_act_clear(graph);
	obj_vertex.activated = 0;
	obj_vertex.v_prev_deselect = undefined;
	act_edge_count = 0;
}

if (win_con == "hamiltonian") {
	if (ds_list_size(act_line) == win_num) {
		global.cleared = true;	
	}
}

else if (win_con == "euler") {
	if (act_edge_count == win_num) {
		global.cleared = true;	
	}
}

if (global.cleared == true) {
	if (!clear_audio_played) {
		clear_audio_played = true;
		audio_play_sound(clearSFX, 0, false);
	}
}
