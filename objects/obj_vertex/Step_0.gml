// Init local variables and calculations
var range = 16; // Distance (in pixels) mouse must be from center of object before scaling begins
var min_scale = 1; // Minimum scale
var max_scale = 1.3; // Maximum scale
var mouse_hover = point_distance(x, y, mouse_x, mouse_y) <= range; // Check if mouse is hovering
if (global.selected == id) { // stay big if selected
	var goal_scale = max_scale; // Calculate goal scale
}
else {
	var goal_scale = (min_scale * !mouse_hover) + (max_scale * mouse_hover); // Calculate goal scale
}
var scale_spd = 0.1; // Speed of scaling

// Apply index and scale
if (id.activated) { // choose appropriate sprite
	image_index = 1;
}
else {
	image_index = mouse_hover;
}
image_xscale = lerp(image_xscale, goal_scale, scale_spd);
image_yscale = lerp(image_yscale, goal_scale, scale_spd);
if (id.activated && line_curve_pos < 1) {
	line_curve_pos += obj_game.line_curve_speed;
}
else if (!id.activated && line_curve_pos > 0) {
	line_curve_pos -= obj_game.line_curve_speed;
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
	if (mouse_check_button(mb_right)) {
		// check if solo point
		if (ds_list_size(obj_game.act_line) == 1 && obj_game.act_line[| 0] == id) {
			id.activated = false; // deactivate
			ds_list_delete(obj_game.act_line, 0); // active line -> empty
			global.selected = undefined; // deselect
		}
		// check if front endpoint
		else if (obj_game.act_line[| 0] == id) {
			id.activated = false;
			ds_list_delete(obj_game.act_line, 0); // delete endpoint
			var v_next = ds_list_find_value(obj_game.act_line, 0); // replacement endpoint
			graph_rm_act_edge(obj_game.graph, label, v_next.label);
			obj_game.act_edge_count--;
			global.selected = v_next;
		}
		// check if back endpoint
		else if (obj_game.act_line[| ds_list_size(obj_game.act_line)-1] == id) {
			id.activated = false;
			ds_list_delete(obj_game.act_line, ds_list_size(obj_game.act_line)-1); // delete endpoint
			var v_prev = ds_list_find_value(obj_game.act_line, ds_list_size(obj_game.act_line)-1); // replacement endpoint
			graph_rm_act_edge(obj_game.graph, label, v_prev.label);
			obj_game.act_edge_count--;
			global.selected = v_prev;
		}
	}
	// left click activates vertex and mouse, selects vertex
	// if connected, add activated edge
	if (mouse_check_button_pressed(mb_left)) {
		// select vertex if none are selected
		if (ds_list_empty(obj_game.act_line)) {
			id.activated = true;
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
		if (!id.activated && graph_check_adjacent(obj_game.graph, id)) {
			graph_add_act_edge(obj_game.graph, global.selected.label, label);
			obj_game.act_edge_count++;
			if (global.selected == obj_game.act_line[| 0]) {
				ds_list_insert(obj_game.act_line, 0, id);
			}
			else {
				ds_list_add(obj_game.act_line, id);
			}
			id.activated = true;
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
		if (!id.activated && graph_check_adjacent(obj_game.graph, id)) {
			graph_add_act_edge(obj_game.graph, global.selected.label, label);
			obj_game.act_edge_count++;
			if (global.selected == obj_game.act_line[| 0]) {
				ds_list_insert(obj_game.act_line, 0, id);
			}
			else {
				ds_list_add(obj_game.act_line, id);
			}
			id.activated = true;
			global.selected = id;
		}
	}
}
