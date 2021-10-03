// draws base edges for the graph
// takes the graph (ds_map) as the sole argument
function graph_draw(graph){
	// if empty, do nothing
	if (ds_map_empty(graph)) {
		return;	
	}
	
	// get adjacency map from graph data structure
	var adj_map = graph[? "adj"];
	// loop through each list in the adjacency map
	for (var k = ds_map_find_first(adj_map); !is_undefined(k); k = ds_map_find_next(adj_map, k)) {
		var adj_list = adj_map[? k];
		var list_len = ds_list_size(adj_list);
		// draw each edge adjacent to given vertex k
		// loop through each element in list
		for (var i = 0; i < list_len; i++) {
			var j = 0;
			j = adj_list[| i];
			
			// get instances corresponding to labels
			var vert_k = graph[? k];
			var vert_j = graph[? j];
			draw_set_color(c_dkgrey);
			draw_line_width(vert_k.x, vert_k.y, vert_j.x, vert_j.y, 5);
		}
	}
}