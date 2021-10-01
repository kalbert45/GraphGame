// adds edge to activated adjacency map
// takes graph (ds_map) and two vertex labels as arguments
function graph_add_act_edge(graph, a, b) {
	var act_adj_map = ds_map_find_value(graph, "act_adj");
	if (!ds_map_exists(act_adj_map, a)) {
		var act_adj_list = ds_list_create();
		ds_list_add(act_adj_list, b);
		ds_map_add_list(act_adj_map, a, act_adj_list);
	}
	else {
		var act_adj_list = ds_map_find_value(act_adj_map, a);
		ds_list_add(act_adj_list, b);
		ds_map_replace_list(act_adj_map, a, act_adj_list);
	}
	if (!ds_map_exists(act_adj_map, b)) {
		var act_adj_list = ds_list_create();
		ds_list_add(act_adj_list, a);
		ds_map_add_list(act_adj_map, b, act_adj_list);
	}
	else {
		var act_adj_list = ds_map_find_value(act_adj_map, b);
		ds_list_add(act_adj_list, a);
		ds_map_replace_list(act_adj_map, b, act_adj_list);
	}
	ds_map_replace_map(graph, "act_adj", act_adj_map);
}