// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level1(){
	obj_game.win_num = 5;
	obj_game.win_con = "euler";
	obj_game.max_degree = 2;
	
	var graph = graph_create();

	for (var i = 0; i < 5; i++) {
		graph_add_node(graph, 960+lengthdir_x(150, 18+72*i), 490+lengthdir_y(150, 18+72*i), i);	
	}
	
	for (var i = 0; i < 5; i++) {
		graph_add_edge(graph, i, (i+2) mod 5);
	}

	
	
	return graph;
}