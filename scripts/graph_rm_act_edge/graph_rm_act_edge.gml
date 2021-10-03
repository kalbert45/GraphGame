// removes edge from activated adjacency map in graph
// takes graph (ds_map) and two vertex labels as arguments
function graph_rm_act_edge(graph, a, b){
	var act_adj_map = ds_map_find_value(graph, "act_adj");
	if (ds_map_exists(act_adj_map, a)) {
		var act_adj_list = ds_map_find_value(act_adj_map, a);
		var b_pos = ds_list_find_index(act_adj_list, b)
		ds_list_delete(act_adj_list, b_pos);
		ds_map_replace_list(act_adj_map, a, act_adj_list);
	}
	if (ds_map_exists(act_adj_map, b)) {
		var act_adj_list = ds_map_find_value(act_adj_map, b);
		var a_pos = ds_list_find_index(act_adj_list, a);
		ds_list_delete(act_adj_list, a_pos);
		ds_map_replace_list(act_adj_map, b, act_adj_list);
	}
	ds_map_replace_map(graph, "act_adj", act_adj_map);
}