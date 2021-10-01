// adds vertex to graph
// takes graph (ds_map), x, y, label as parameters
function graph_add_node(graph, x, y, label){
	var inst = instance_create_depth(x, y, -1, obj_vertex);
	inst.label = label;
	ds_map_add(graph, label, inst);
}