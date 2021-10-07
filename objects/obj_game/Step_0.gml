// animation curve position calculations for edge case, endpoints are the same
if (act_line[| 0] == act_line[| ds_list_size(act_line) - 1]) {
	if (line_curve_pos_buffer < 1) {
		line_curve_pos_buffer += line_curve_speed;
	}
}
else {
	if (line_curve_pos_buffer > 0) {
		line_curve_pos_buffer -= line_curve_speed;	
	}
}

// reset button
if (keyboard_check_pressed(ord("R"))) {
	if (!global.cleared) {
		room_restart();
	}
	//global.selected = undefined;
	//global.mouse_activated = false;
	//ds_list_clear(act_line);
	//graph_act_clear(graph);
	//obj_vertex.activated = 0;
	//obj_vertex.v_prev_deselect = undefined;
	//act_edge_count = 0;
}

if (win_con == "hamiltonian") {
	if ((ds_list_size(act_line)-1 == win_num) && (act_line[| 0] == act_line[| ds_list_size(act_line) - 1])) {
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
