// initializes graph as ds_map with two other ds_maps as values
// the sub ds_maps contain adjacency maps for the base graph and for active edges
function graph_create(){
	var graph = ds_map_create();
	var adj_map = ds_map_create();
	var act_adj_map = ds_map_create();
	ds_map_add_map(graph, "adj", adj_map);
	ds_map_add_map(graph, "act_adj", act_adj_map);
	return graph;
}