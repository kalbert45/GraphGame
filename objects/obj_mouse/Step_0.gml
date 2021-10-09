/// @description Insert description here
// You can write your code in this editor
/// change global variable upon mouse release
if (mouse_check_button_released(mb_left)) {
	global.mouse_activated = false;	
}

var inst;
inst = instance_position(mouse_x, mouse_y, obj_vertex);

if (inst != noone)
{
	with (inst)	{
		
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

	
			// on click functions
			if (global.cleared) {
				image_index = 2;
				global.selected = undefined;
				global.mouse_activated = false;
			}
			else {
				// right click deactivates vertex and edge if endpoint
				// selects adjacent activated vertex, if it exists
				if (mouse_check_button_pressed(mb_right)) {
					// check if solo point
					if (ds_list_size(obj_game.act_line) == 1 && obj_game.act_line[| 0] == id) {
						id.activated--; // deactivate
						ds_list_delete(obj_game.act_line, 0); // active line -> empty
						global.selected = undefined; // deselect
						global.v_prev_select = undefined;
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
						global.v_prev_select = undefined;
				
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
						global.v_prev_select = undefined;
				
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
						if (ds_list_size(obj_game.act_line) == obj_game.win_num && graph_check_adjacent(obj_game.graph, id)) {
							if (global.selected == obj_game.act_line[| ds_list_size(obj_game.act_line)-1])	{
								graph_add_act_edge(obj_game.graph, global.selected.label, label);
								ds_list_add(obj_game.act_line, id);
								ds_list_add(id.inbound_v, global.selected.label);
								global.v_prev_select = global.selected;
							}
						}
						global.selected = id;
						global.mouse_activated = true;
					}
					else if (obj_game.act_line[| ds_list_size(obj_game.act_line)-1] == id) {
						if (ds_list_size(obj_game.act_line) == obj_game.win_num && graph_check_adjacent(obj_game.graph, id)) {
							if (global.selected == obj_game.act_line[| 0])	{
								graph_add_act_edge(obj_game.graph, label, global.selected.label);
								ds_list_insert(obj_game.act_line, 0, id);
								ds_list_add(global.selected.inbound_v, label);
								global.v_prev_select = global.selected;
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
						global.v_prev_select = global.selected;
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
					if (obj_game.act_line[| 0] == id && graph_check_adjacent(obj_game.graph, id)) {
						if (ds_list_size(obj_game.act_line) == obj_game.win_num) {
							if (global.selected == obj_game.act_line[| ds_list_size(obj_game.act_line)-1])	{
								graph_add_act_edge(obj_game.graph, global.selected.label, label);
								ds_list_add(obj_game.act_line, id);
								ds_list_add(id.inbound_v, global.selected.label);
								global.v_prev_select = global.selected;
							}
						}
					}
					else if (obj_game.act_line[| ds_list_size(obj_game.act_line)-1] == id && graph_check_adjacent(obj_game.graph, id)) {
						if (ds_list_size(obj_game.act_line) == obj_game.win_num) {
							if (global.selected == obj_game.act_line[| 0])	{
								graph_add_act_edge(obj_game.graph, label, global.selected.label);
								ds_list_insert(obj_game.act_line, 0, id);
								ds_list_add(global.selected.inbound_v, label);
								global.v_prev_select = global.selected;
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
						global.v_prev_select = global.selected;
						global.selected = id;
					}
				}
			}
		}


		// euler win con
		else if (obj_game.win_con == "euler") {
			// handle animation curve values 
	
			// on click functions
			if (global.cleared) {
				image_index = 2;
				global.selected = undefined;
				global.mouse_activated = false;
			}
			else {
				// right click deactivates vertex and edge if endpoint
				// selects adjacent activated vertex, if it exists
				if (mouse_check_button_pressed(mb_right)) {
					// check if solo point
					if (ds_list_size(obj_game.act_line) == 1 && obj_game.act_line[| 0] == id) {
						id.activated--; // deactivate
						ds_list_delete(obj_game.act_line, 0); // active line -> empty
						global.selected = undefined; // deselect
						global.v_prev_select = undefined;
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
						global.v_prev_select = undefined;
				
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
						global.v_prev_select = undefined;
				
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
						global.v_prev_select = global.selected;
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
						global.v_prev_select = global.selected;
						global.selected = id;
					}
				}
			}	
		}	
	}
}