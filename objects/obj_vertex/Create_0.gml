//initialize activate variable and label
label = -1; // vertex label
activated = 0; // number of times the vertex has been activated, also serves as boolean
line_curve_pos[obj_game.max_degree / 2] = 0; // for drawing activated edges
glow_curve_pos = 0.5; // for creating glow effect
inbound_v = ds_list_create();
shader_curve_pos[1] = 0;


if (obj_game.win_con == "hamiltonian") {
	sprite_index = spr_vertex_ham;	
	end_sprite = spr_vertex_hams;
}
else {
	sprite_index = spr_vertex;	
	end_sprite = spr_vertex_blue;
}

