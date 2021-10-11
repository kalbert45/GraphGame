// checks if a vertex is adjacent to the selected vertex
// takes graph and vertex (object) as arguments
function graph_check_adjacent(graph, v){
	var adj_map = graph[? "adj"];
	var label = v.label;
	var adj_list = adj_map[? label];
	if (is_undefined(global.selected)) {
		return -1;
	}
	else {
		var adj_list_other = adj_map[? global.selected.label];
		return ((!is_undefined(adj_list) && ds_list_find_index(adj_list, global.selected.label) >= 0) || (!is_undefined(adj_list_other) && ds_list_find_index(adj_list_other, label) >= 0));
	}
}