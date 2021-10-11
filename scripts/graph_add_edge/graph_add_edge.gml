// adds edge to graph
// takes graph (ds_map) and two vertex labels as arguments
function graph_add_edge(graph, a, b) {
	var adj_map = ds_map_find_value(graph, "adj");
	if (!ds_map_exists(adj_map, a)) {
		var adj_list = ds_list_create();
		ds_list_add(adj_list, b);
		ds_map_add_list(adj_map, a, adj_list);
	}
	else {
		var adj_list = ds_map_find_value(adj_map, a);
		ds_list_add(adj_list, b);
		ds_map_replace_list(adj_map, a, adj_list);
	}
//	if (!ds_map_exists(adj_map, b)) {
//		var adj_list = ds_list_create();
//		ds_list_add(adj_list, a);
//		ds_map_add_list(adj_map, b, adj_list);
//	}
//	else {
//		var adj_list = ds_map_find_value(adj_map, b);
//		ds_list_add(adj_list, a);
//		ds_map_replace_list(adj_map, b, adj_list);
//	}
	ds_map_replace_map(graph, "adj", adj_map);
}