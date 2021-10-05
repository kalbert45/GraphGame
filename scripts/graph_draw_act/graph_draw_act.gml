// draws activated edges for the graph
// takes the graph (ds_map) and animation curve structure for the lines as arguments
function graph_draw_act(graph, line_curve_struct){
	// if empty, do nothing
	if (ds_map_empty(graph)) {
		return;	
	}
	// get activated adjacency map from graph data structure
	var act_adj_map = graph[? "act_adj"];
	// loop through each list in the adjacency map, draw all except waxing line
	for (var k = ds_map_find_first(act_adj_map); !is_undefined(k); k = ds_map_find_next(act_adj_map, k)) {
		if (!is_undefined(global.selected) && !is_undefined(global.selected.vert_prev) && k == global.selected.vert_prev.label) {
			continue;	
		}
		
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
			
			//var diff_x = vert_j.x - vert_k.x;
			//var diff_y = vert_j.y - vert_k.y;
				
			if (global.cleared) {
				draw_set_color(c_lime);	
				//var line_x = vert_j.x;
				//var line_y = vert_j.y;
			}
			else {
				//var curveChannel = animcurve_get_channel(line_curve_struct, "EaseIn");
				
				//var val = animcurve_channel_evaluate(curveChannel, vert_j.line_curve_pos);
				
				//var line_x = vert_k.x + (diff_x * val);
				//var line_y = vert_k.y + (diff_y * val);
				
				draw_set_color(c_orange);
			}
			draw_line_width(vert_k.x, vert_k.y, vert_j.x, vert_j.y, 7);
		}
	}
	// draw waxing line on activation
	if (!is_undefined(global.selected)) {
		if (!is_undefined(global.selected.vert_prev)) {
			var vert_k = global.selected.vert_prev;
			var vert_j = global.selected;
		
			var diff_x = vert_j.x - vert_k.x;
			var diff_y = vert_j.y - vert_k.y;
		
			var curveChannel = animcurve_get_channel(line_curve_struct, "EaseIn");
			var val = animcurve_channel_evaluate(curveChannel, vert_j.line_curve_pos);
		
			var line_x = vert_k.x + (diff_x * val);
			var line_y = vert_k.y + (diff_y * val);
	
			draw_set_color(c_orange);
			draw_line_width(vert_k.x, vert_k.y, line_x, line_y, 7);
		}
		// draw waning line on deselect
		if (!is_undefined(global.selected.v_prev_deselect)) {
			if (global.selected == obj_game.act_line[| 0]) {
				var vert_k = global.selected;
				var vert_j = global.selected.v_prev_deselect;
			}
			else {
				var vert_j = global.selected;
				var vert_k = global.selected.v_prev_deselect;
			}
		
			var diff_x = vert_j.x - vert_k.x;
			var diff_y = vert_j.y - vert_k.y;
		
			var curveChannel = animcurve_get_channel(line_curve_struct, "EaseBack");
			var val = animcurve_channel_evaluate(curveChannel, vert_j.line_curve_pos);
		
			var line_x = vert_k.x + (diff_x * val);
			var line_y = vert_k.y + (diff_y * val);
	
			draw_set_color(c_orange);
			draw_line_width(vert_k.x, vert_k.y, line_x, line_y, 7);
		}
	}
}