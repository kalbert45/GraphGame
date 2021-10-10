// destroy graph
// takes graph (ds_map object) as parameter
function graph_destroy(graph){
	if (is_undefined(graph)) {
		return;	
	}

	ds_map_destroy(graph);
}