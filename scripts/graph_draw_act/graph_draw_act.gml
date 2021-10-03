// draws edges for the graph
// takes the graph (ds_map) as the sole argument
function graph_draw_act(graph, line_curve_struct){
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
	
			// get instances corresponding to labels k->j
			var vert_k = graph[? k];
			var vert_j = graph[? j];
			
			var diff_x = vert_j.x - vert_k.x;
			var diff_y = vert_j.y - vert_k.y;
				
			if (global.cleared) {
				draw_set_color(c_aqua);	
				var line_x = vert_j.x;
				var line_y = vert_j.y;
			}
			else {
				var curveChannel = animcurve_get_channel(line_curve_struct, "EaseIn");
				var val = animcurve_channel_evaluate(curveChannel, vert_j.line_curve_pos);
			
				draw_set_color(c_orange);
					
				var line_x = vert_k.x + (diff_x * val);
				var line_y = vert_k.y + (diff_y * val);
			}
			draw_line_width(vert_k.x, vert_k.y, line_x, line_y, 7);
		}
	}
	
	// draw lingering line on deselect
	
	if (!is_undefined(global.selected) && !is_undefined(global.selected.v_prev_deselect)) {
		var vert_k = global.selected;
		var vert_j = global.selected.v_prev_deselect;
		
		var diff_x = vert_j.x - vert_k.x;
		var diff_y = vert_j.y - vert_k.y;
		
		var curveChannel = animcurve_get_channel(line_curve_struct, "EaseBack");
		var val = animcurve_channel_evaluate(curveChannel, vert_j.line_curve_pos);
			
		show_debug_message(val);
			
		draw_set_color(c_orange);
		
		var line_x = vert_k.x + (diff_x * val);
		var line_y = vert_k.y + (diff_y * val);
	
		draw_line_width(vert_k.x, vert_k.y, line_x, line_y, 7);
	}
}