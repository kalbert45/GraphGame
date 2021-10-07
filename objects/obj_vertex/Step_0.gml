// Init local variables and calculations
var range = 18; // Distance (in pixels) mouse must be from center of object before scaling begins
mouse_hover = point_distance(x, y, mouse_x, mouse_y) <= range; // Check if mouse is hovering
var v_prev = undefined; // previous vertex

// vertices behave differently based on win condition
if (obj_game.win_con == "hamiltonian") {
	// check if vertex should be activated
	//if (ds_list_find_index(obj_game.act_line, id) >= 0) {
	//	id.activated = 1;	
	//}
	//else {
	//	id.activated = 0;	
//	}
	
	// handle animation curve values
	if (id.activated && line_curve_pos[0] < 1) {
		id.line_curve_pos[0] += obj_game.line_curve_speed;
	}
	else if (!id.activated && line_curve_pos[0] > 0) {
		id.line_curve_pos[0] -= obj_game.line_curve_speed;
	}
	
	// on click functions
	if (global.cleared) {
		image_index = 2;
		global.selected = undefined;
		global.mouse_activated = false;
	}
	else if (mouse_hover) {
		// right click deactivates vertex and edge if endpoint
		// selects adjacent activated vertex, if it exists
		if (mouse_check_button_pressed(mb_right)) {
			// check if solo point
			if (ds_list_size(obj_game.act_line) == 1 && obj_game.act_line[| 0] == id) {
				id.activated--; // deactivate
				ds_list_delete(obj_game.act_line, 0); // active line -> empty
				global.selected = undefined; // deselect
			}
			// check if front endpoint
			else if (obj_game.act_line[| 0] == id) {
				id.activated--;
				ds_list_delete(obj_game.act_line, 0); // delete endpoint
			
				var v_prev = ds_list_find_value(obj_game.act_line, 0); // replacement endpoint
				graph_rm_act_edge(obj_game.graph, label, v_prev.label);
				obj_game.act_edge_count--;
				global.selected = v_prev;
				global.v_prev_deselect = id;
				
				var index = ds_list_find_index(v_prev.inbound_v, label);
				ds_list_delete(v_prev.inbound_v, index);
			}
			// check if back endpoint
			else if (obj_game.act_line[| ds_list_size(obj_game.act_line)-1] == id) {
				id.activated--;
				ds_list_delete(obj_game.act_line, ds_list_size(obj_game.act_line)-1); // delete endpoint
			
			
				var v_prev = ds_list_find_value(obj_game.act_line, ds_list_size(obj_game.act_line)-1); // replacement endpoint
				graph_rm_act_edge(obj_game.graph, label, v_prev.label);
				obj_game.act_edge_count--;
				global.selected = v_prev;
				global.v_prev_deselect = id;
				
				var index = ds_list_find_index(id.inbound_v, v_prev.label);
				ds_list_delete(id.inbound_v, index);
			}
		}
		// left click activates vertex and mouse, selects vertex
		// if connected, add activated edge
		if (mouse_check_button_pressed(mb_left)) {
			// select vertex if none are selected
			if (ds_list_empty(obj_game.act_line)) {
				play_graph_sfx();
				id.activated++;
				global.selected = id;
				global.mouse_activated = true;
				ds_list_add(obj_game.act_line, id);
			}
			// check if cleared, otherwise select endpoint
			else if (obj_game.act_line[| 0] == id) {
				if (ds_list_size(obj_game.act_line) == obj_game.win_num) {
					if (global.selected == obj_game.act_line[| ds_list_size(obj_game.act_line)-1])	{
						graph_add_act_edge(obj_game.graph, global.selected.label, label);
						ds_list_add(obj_game.act_line, id);
						ds_list_add(id.inbound_v, global.selected.label);
					}
				}
				global.selected = id;
				global.mouse_activated = true;
			}
			else if (obj_game.act_line[| ds_list_size(obj_game.act_line)-1] == id) {
				if (ds_list_size(obj_game.act_line) == obj_game.win_num) {
					if (global.selected == obj_game.act_line[| 0])	{
						graph_add_act_edge(obj_game.graph, label, global.selected.label);
						ds_list_insert(obj_game.act_line, 0, id);
						ds_list_add(global.selected.inbound_v, label);
					}
				}
				global.selected = id;
				global.mouse_activated = true;
			}
			
			// only activate unactivated vertices and edges adjacent to selected vertex
			if (!id.activated && graph_check_adjacent(obj_game.graph, id)) {
				id.activated++;
				global.v_prev_deselect = undefined;
				if (global.selected == obj_game.act_line[| 0]) {
					graph_add_act_edge(obj_game.graph, label, global.selected.label);
					ds_list_insert(obj_game.act_line, 0, id);
					ds_list_add(global.selected.inbound_v, label);
				}
				else {
					graph_add_act_edge(obj_game.graph, global.selected.label, label);
					ds_list_add(obj_game.act_line, id);
					ds_list_add(id.inbound_v, global.selected.label);
				}				
				play_graph_sfx();
				global.selected = id;
				global.mouse_activated = true;
			}
			// enable repetitive selection
			else if (global.selected == id) {
				global.mouse_activated = true;
			}
		}
		// left hold activates and selects vertex, adds activated edge
		// only if its adjacent to selected
		if (mouse_check_button(mb_left)) {
			// check if cleared
			if (obj_game.act_line[| 0] == id) {
				if (ds_list_size(obj_game.act_line) == obj_game.win_num) {
					if (global.selected == obj_game.act_line[| ds_list_size(obj_game.act_line)-1])	{
						graph_add_act_edge(obj_game.graph, global.selected.label, label);
						ds_list_add(obj_game.act_line, id);
						ds_list_add(id.inbound_v, global.selected.label);
					}
				}
			}
			else if (obj_game.act_line[| ds_list_size(obj_game.act_line)-1] == id) {
				if (ds_list_size(obj_game.act_line) == obj_game.win_num) {
					if (global.selected == obj_game.act_line[| 0])	{
						graph_add_act_edge(obj_game.graph, label, global.selected.label);
						ds_list_insert(obj_game.act_line, 0, id);
						ds_list_add(global.selected.inbound_v, label);
					}
				}
			}
			
			if (!id.activated && graph_check_adjacent(obj_game.graph, id)) {
				id.activated++;
				global.v_prev_deselect = undefined;
				obj_game.act_edge_count++;
				if (global.selected == obj_game.act_line[| 0]) {
					graph_add_act_edge(obj_game.graph, label, global.selected.label);
					ds_list_insert(obj_game.act_line, 0, id);
					ds_list_add(global.selected.inbound_v, label);
				}
				else {
					graph_add_act_edge(obj_game.graph, global.selected.label, label);
					ds_list_add(obj_game.act_line, id);
					ds_list_add(id.inbound_v, global.selected.label);
				}	
				
				play_graph_sfx();
				global.selected = id;
			}
		}
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
	
	// on click functions
	if (global.cleared) {
		image_index = 2;
		global.selected = undefined;
		global.mouse_activated = false;
	}
	else if (mouse_hover) {
		// right click deactivates vertex and edge if endpoint
		// selects adjacent activated vertex, if it exists
		if (mouse_check_button_pressed(mb_right)) {
			// check if solo point
			if (ds_list_size(obj_game.act_line) == 1 && obj_game.act_line[| 0] == id) {
				id.activated--; // deactivate
				ds_list_delete(obj_game.act_line, 0); // active line -> empty
				global.selected = undefined; // deselect
			}
			// check if front endpoint
			else if (obj_game.act_line[| 0] == id) {
				id.activated--;
				ds_list_delete(obj_game.act_line, 0); // delete endpoint
			
				var v_prev = ds_list_find_value(obj_game.act_line, 0); // replacement endpoint
				graph_rm_act_edge(obj_game.graph, label, v_prev.label);
				obj_game.act_edge_count--;
				global.selected = v_prev;
				global.v_prev_deselect = id;
				
				var index = ds_list_find_index(v_prev.inbound_v, label);
				ds_list_delete(v_prev.inbound_v, index);
			}
			// check if back endpoint
			else if (obj_game.act_line[| ds_list_size(obj_game.act_line)-1] == id) {
				id.activated--;
				ds_list_delete(obj_game.act_line, ds_list_size(obj_game.act_line)-1); // delete endpoint
			
			
				var v_prev = ds_list_find_value(obj_game.act_line, ds_list_size(obj_game.act_line)-1); // replacement endpoint
				graph_rm_act_edge(obj_game.graph, label, v_prev.label);
				obj_game.act_edge_count--;
				global.selected = v_prev;
				global.v_prev_deselect = id;
				
				var index = ds_list_find_index(id.inbound_v, v_prev.label);
				ds_list_delete(id.inbound_v, index);
			}
		}
		// left click activates vertex and mouse, selects vertex
		// if connected, add activated edge
		if (mouse_check_button_pressed(mb_left)) {
			// select vertex if none are selected
			if (ds_list_empty(obj_game.act_line)) {
				play_graph_sfx();
				id.activated++;
				global.selected = id;
				global.mouse_activated = true;
				ds_list_add(obj_game.act_line, id);
			}
			// select vertex if it is an endpoint
			else if (obj_game.act_line[| 0] == id || obj_game.act_line[| ds_list_size(obj_game.act_line)-1] == id) {
				global.selected = id;
				global.mouse_activated = true;
			}
			// only activate unactivated vertices and edges adjacent to selected vertex
			if (graph_check_adjacent(obj_game.graph, id) && !act_graph_check_adjacent(obj_game.graph, id)) {
				id.activated++;
				global.v_prev_deselect = undefined;
				obj_game.act_edge_count++;
				if (global.selected == obj_game.act_line[| 0]) {
					graph_add_act_edge(obj_game.graph, label, global.selected.label);
					ds_list_insert(obj_game.act_line, 0, id);
					ds_list_add(global.selected.inbound_v, label);
				}
				else {
					graph_add_act_edge(obj_game.graph, global.selected.label, label);
					ds_list_add(obj_game.act_line, id);
					ds_list_add(id.inbound_v, global.selected.label);
				}				
				play_graph_sfx();
				global.selected = id;
				global.mouse_activated = true;
			}
			// enable repetitive selection
			else if (global.selected == id) {
				global.mouse_activated = true;
			}
		}
		// left hold activates and selects vertex, adds activated edge
		// only if its adjacent to selected
		if (mouse_check_button(mb_left)) {
			if (graph_check_adjacent(obj_game.graph, id) && !act_graph_check_adjacent(obj_game.graph, id)) {
				id.activated++;
				global.v_prev_deselect = undefined;
				obj_game.act_edge_count++;
				if (global.selected == obj_game.act_line[| 0]) {
					graph_add_act_edge(obj_game.graph, label, global.selected.label);
					ds_list_insert(obj_game.act_line, 0, id);
					ds_list_add(global.selected.inbound_v, label);
				}
				else {
					graph_add_act_edge(obj_game.graph, global.selected.label, label);
					ds_list_add(obj_game.act_line, id);
					ds_list_add(id.inbound_v, global.selected.label);
				}	
				
				play_graph_sfx();
				global.selected = id;
			}
		}
	}	
}
