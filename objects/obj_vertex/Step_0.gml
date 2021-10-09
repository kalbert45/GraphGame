// Init local variables and calculations
shader_curve_pos[0] = clamp(shader_curve_pos[0], 0, 1);
shader_curve_pos[1] = clamp(shader_curve_pos[1], 0, 1);
// vertices behave differently based on win condition
if (obj_game.win_con == "hamiltonian") {
	
	
	// handle animation curve values
	if (id.activated && line_curve_pos[0] < 1) {
		id.line_curve_pos[0] += obj_game.line_curve_speed;
	}
	else if (!id.activated && line_curve_pos[0] > 0) {
		id.line_curve_pos[0] -= obj_game.line_curve_speed;
	}
	
}


// euler win con
else if (obj_game.win_con == "euler") {
	// handle animation curve values 
	var size = max(ds_list_size(id.inbound_v), ds_list_size(outbound_v(label)));
	for (var i = 0; i < array_length(line_curve_pos);i++) {
		if (i < size && line_curve_pos[i] < 1) {
			id.line_curve_pos[i] += obj_game.line_curve_speed;
		}
		else if (!(i < size) && line_curve_pos[i] > 0) {
			id.line_curve_pos[i] -= obj_game.line_curve_speed;
		}
	}
}
