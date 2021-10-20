// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level15(){
	obj_game.win_num = 24;
	obj_game.win_con = "euler";
	obj_game.max_degree = 4;
	
	var graph = graph_create();


	for (var i = 0; i < 8; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 22.5+45*i), 490 +lengthdir_y(150, 22.5+45*i), i);	

	}
	for (var i = 8; i <12; i++) {
		graph_add_node(graph, 960 + lengthdir_x(350, 45+90*i), 490 +lengthdir_y(350, 45+90*i), i);	
	}

	for (var i = 0; i < 8; i++) {
		if (i < 4) {
			graph_add_edge(graph, i, (i+4) mod 8);
		}
		graph_add_edge(graph, i, (i div 2) + 8);
		if (i % 2 == 0) {
			graph_add_edge(graph, i, (i+5) mod 8);
		}
		else {
			graph_add_edge(graph, i, (i+1) mod 8);
		}
	}
	for (var i = 8; i < 12; i++) {
		graph_add_edge(graph, i, ((i+1) mod 4) +8);	
	}

	
	return graph;
}