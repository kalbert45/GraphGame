// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level30(){
	obj_game.win_num = 32;
	obj_game.win_con = "euler";
	obj_game.max_degree = 4;
	
	var graph = graph_create();


	for (var i = 0; i < 8; i++) {
		graph_add_node(graph, 960 + lengthdir_x(350, 22.5+45*i), 490 +lengthdir_y(350, 22.5+45*i), i);	
		if (i == 0 || i == 7) {
			graph_add_node(graph, 960 + lengthdir_x(350, 22.5+45*i) - 250, 490 +lengthdir_y(350, 22.5+45*i), i+8);
		}
		else if (i == 1 || i == 2) {
			graph_add_node(graph, 960 + lengthdir_x(350, 22.5+45*i), 490 +lengthdir_y(350, 22.5+45*i) + 250, i+8);
		}
		else if (i == 3 || i == 4) {
			graph_add_node(graph, 960 + lengthdir_x(350, 22.5+45*i)+250, 490 +lengthdir_y(350, 22.5+45*i), i+8);
		}
		else if (i == 5 || i == 6) {
			graph_add_node(graph, 960 + lengthdir_x(350, 22.5+45*i), 490 +lengthdir_y(350, 22.5+45*i) - 250, i+8);
		}
	}

	for (var i = 0; i < 8; i++) {
		graph_add_edge(graph, i, (i+1) mod 8);
		graph_add_edge(graph, i, i+8);
		if (i % 2 == 0) {
			graph_add_edge(graph, i, ((i+6) mod 8) + 8);	
		}
		else {
			graph_add_edge(graph, i, ((i+2) mod 8) + 8);	
		}
		//graph_add_edge(graph, i+8, ((i + 1) mod 8) + 8);
	}
	graph_add_edge(graph, 8,15);
	graph_add_edge(graph, 9,10);
	graph_add_edge(graph, 11,12);
	graph_add_edge(graph, 13,14);
	
	graph_add_edge(graph, 8,13);
	graph_add_edge(graph, 9,12);
	graph_add_edge(graph, 15,10);
	graph_add_edge(graph, 11,14);

	
	return graph;
}