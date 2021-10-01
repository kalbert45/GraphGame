// clears graph
function graph_act_clear(graph){
	var act_adj_map = ds_map_create();
	ds_map_replace_map(graph, "act_adj", act_adj_map);
}