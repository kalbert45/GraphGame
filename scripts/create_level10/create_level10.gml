// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level10(){
	obj_game.win_num = 63;
	obj_game.win_con = "euler";
	obj_game.max_degree = 6;
	
	var graph = graph_create();

	for (var i = 0; i < 9; i++) {
		graph_add_node(graph, 960 + lengthdir_x(400, 10+i*40), 490 - lengthdir_y(400, 10+i*40), i);	
	}
	for (var i = 9; i < 18; i++) {
		graph_add_node(graph, 960 + lengthdir_x(250, 10+i*40), 490 - lengthdir_y(250, 10+i*40), i);	
	}
	for (var i = 18; i < 27; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 30+i*40), 490 - lengthdir_y(150, 30+i*40), i);	
	}

	for (var i = 0; i < 9; i++) {
		graph_add_edge(graph, i, (i+1) mod 9);
		graph_add_edge(graph, i, ((i+8) mod 9) + 9);
		graph_add_edge(graph, i, ((i+8) mod 9) + 18);
	}
	for (var i = 9; i < 18; i++) {
		graph_add_edge(graph, i, ((i+2) mod 9) + 9);
		graph_add_edge(graph, i, ((i+8) mod 9) + 18);
	}
	for (var i = 18; i < 27; i++) {
		graph_add_edge(graph, i, ((i+2) mod 9) + 18);
		graph_add_edge(graph, i, ((i+4) mod 9) + 18);
	}
	
	return graph;
}