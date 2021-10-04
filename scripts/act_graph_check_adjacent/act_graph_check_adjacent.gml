// checks if a vertex is adjacent to the selected vertex
// takes graph and vertex (object) as arguments
function act_graph_check_adjacent(graph, v){
	var act_adj_map = graph[? "act_adj"];
	
	if (is_undefined(global.selected)) {
		return -1;
	}
	else {
		var label1 = v.label;
		var label2 = global.selected.label;
		
		var act_adj_list1 = act_adj_map[? label1];
		var act_adj_list2 = act_adj_map[? label2];
		return (!is_undefined(act_adj_list1) && ds_list_find_index(act_adj_list1, label2) >= 0 ||
				!is_undefined(act_adj_list2) && ds_list_find_index(act_adj_list2, label1) >= 0);
	}
}