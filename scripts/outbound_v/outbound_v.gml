// returns number of outbound vertices
function outbound_v(v){
	var act_adj_map = ds_map_find_value(obj_game.graph, "act_adj");
	var outbound_list = ds_map_find_value(act_adj_map, v);
	if (is_undefined(outbound_list)) {
		return 0;	
	}
	return outbound_list;
}