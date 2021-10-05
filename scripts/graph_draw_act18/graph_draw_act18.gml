// draws activated edges for the graph
// takes the graph (ds_map) and animation curve structure for the lines as arguments
function graph_draw_actxxxxxxxx(act_line, line_curve_struct){
	var size = ds_list_size(act_line);
	show_debug_message(size);
	// if empty, do nothing
	if (ds_list_empty(act_line) || size == 1) {
		return;	
	}
	// loop through each element in activated line
	for (var i = 0; i < size-1; i++) {
		// first two vertices are exception if line is long enough
		if (i == 0 && size > 2) {
			var vert_j = act_line[| i];
			var vert_k = act_line[| i+1];
		}
		var curve_pos_index = 0;
		var vert_k = 0;
		var vert_j = 0;
		vert_k = act_line[| i];
		vert_j = act_line[| i+1];
		if (is_array(vert_k)) {
			curve_pos_index = vert_k[1];	
			var vert_k = vert_k[0];
		}
		if (is_array(vert_j)) {
			curve_pos_index = vert_j[1];
			var vert_j = vert_j[0];
		}
			
		var diff_x = vert_j.x - vert_k.x;
		var diff_y = vert_j.y - vert_k.y;
				
		if (global.cleared) {
			draw_set_color(c_lime);	
			var line_x = vert_j.x;
			var line_y = vert_j.y;
		}
		else {
			var curveChannel = animcurve_get_channel(line_curve_struct, "EaseIn");
				
			var val = animcurve_channel_evaluate(curveChannel, vert_j.line_curve_pos[curve_pos_index]);
				
			var line_x = vert_k.x + (diff_x * val);
			var line_y = vert_k.y + (diff_y * val);
				
			draw_set_color(c_orange);
		}
		draw_line_width(vert_k.x, vert_k.y, line_x, line_y, 7);
		
	}
	
	// draw lingering line on deselect
	if (!is_undefined(global.selected) && !is_undefined(global.selected.v_prev_deselect)) {
		var vert_k = global.selected;
		var vert_j = global.selected.v_prev_deselect;
		
		var diff_x = vert_j.x - vert_k.x;
		var diff_y = vert_j.y - vert_k.y;
		
		var curveChannel = animcurve_get_channel(line_curve_struct, "EaseBack");
		var val = animcurve_channel_evaluate(curveChannel, vert_j.line_curve_pos[vert_j.activated]);
		
		var line_x = vert_k.x + (diff_x * val);
		var line_y = vert_k.y + (diff_y * val);
	
		draw_set_color(c_orange);
		draw_line_width(vert_k.x, vert_k.y, line_x, line_y, 7);
	}
}