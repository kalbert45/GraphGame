// draws activated edges for the graph
// takes the graph (ds_map) and animation curve structure for the lines as arguments
function graph_draw_act(graph, line_curve_struct){
	var star_color = $D5F6FF;
	// if empty, do nothing
	if (ds_map_empty(graph)) {
		return;	
	}
	// get activated adjacency map from graph data structure
	var act_adj_map = graph[? "act_adj"];
	// loop through each list in the adjacency map
	for (var k = ds_map_find_first(act_adj_map); !is_undefined(k); k = ds_map_find_next(act_adj_map, k)) {
		var act_adj_list = act_adj_map[? k];
		var list_len = ds_list_size(act_adj_list);
		// draw each edge adjacent to given vertex k
		// loop through each element in list
		for (var i = 0; i < list_len; i++) {
			var j = 0;
			j = act_adj_list[| i];
	
			var vert_k = graph[? k];
			var vert_j = graph[? j];
			// get instances corresponding to labels k->j
			// if cleared, draw all lime
			if (global.cleared) {
				draw_set_color(c_white);	
				draw_line_width(vert_k.x, vert_k.y, vert_j.x, vert_j.y, 4);
			}
			// if k is at front, draw from j to k
			else if (obj_game.act_line[| 0].label == k) {
				var diff_x = vert_k.x - vert_j.x;
				var diff_y = vert_k.y - vert_j.y;
				
				var curveChannel = animcurve_get_channel(line_curve_struct, "Line");
				
				
				var val = animcurve_channel_evaluate(curveChannel, vert_k.line_curve_pos[i]);
				
				
				var line_x = vert_j.x + (diff_x * val);
				var line_y = vert_j.y + (diff_y * val);
				
				draw_set_color(star_color);
			
				draw_line_width(vert_j.x, vert_j.y, line_x, line_y, 3);
	
			}
			// if k is at back, draw k to j
			else if (obj_game.act_line[| ds_list_size(obj_game.act_line)-1].label == j){
				var diff_x = vert_j.x - vert_k.x;
				var diff_y = vert_j.y - vert_k.y;
				
				var curveChannel = animcurve_get_channel(line_curve_struct, "Line");
				
				var index = ds_list_find_index(vert_j.inbound_v, k);
				if (index == -1) {
					show_debug_message("index is -1");
					continue;
				}
				else if (index < array_length(vert_j.line_curve_pos)) {
					var val = animcurve_channel_evaluate(curveChannel, vert_j.line_curve_pos[index]);
				}
				else {
					show_debug_message("error. index: " + string(index));
					var val = 1;	
				}
				
				var line_x = vert_k.x + (diff_x * val);
				var line_y = vert_k.y + (diff_y * val);
				
				draw_set_color(star_color);

			
				draw_line_width(vert_k.x, vert_k.y, line_x, line_y, 3);

			}
			// otherwise, just draw line
			else {
				draw_set_color(star_color);
			
		
				
				draw_line_width(vert_k.x, vert_k.y, vert_j.x, vert_j.y, 3);
		
			}
		}
	}
	
	// draw lingering line on deselect
	if (!is_undefined(global.selected) && !is_undefined(global.v_prev_deselect)) {
		var vert_k = global.selected;
		var vert_j = global.v_prev_deselect;
		
		var diff_x = vert_j.x - vert_k.x;
		var diff_y = vert_j.y - vert_k.y;
		
		var curveChannel = animcurve_get_channel(line_curve_struct, "Line");
		if (vert_j.activated < array_length(vert_j.line_curve_pos)) {
			var val = animcurve_channel_evaluate(curveChannel, vert_j.line_curve_pos[vert_j.activated]);
		}
		else {
			var val = 1;	
		}
		
		var line_x = vert_k.x + (diff_x * val);
		var line_y = vert_k.y + (diff_y * val);
	
		draw_set_color(star_color);

		draw_line_width(vert_k.x, vert_k.y, line_x, line_y, 3);

	}
}