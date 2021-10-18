// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level36(){
	obj_game.win_num = 19;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	for (var i = 0; i < 5; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 18+72*i), 490 +lengthdir_y(150, 18+72*i), i);	
	}
	for (var i = 5; i < 10; i++) {
		if (i != 7) {
			graph_add_node(graph, 960 +2*lengthdir_x(150, 18) +lengthdir_x(150, 18+72*i), 490 +lengthdir_y(150, 18+72*i), i);	
		}
	}
	for (var i = 10; i < 15; i++) {
		if (i != 10) {
			graph_add_node(graph, 960 -2*lengthdir_x(150, 18) + lengthdir_x(150, 18+72*i), 490 +lengthdir_y(150, 18+72*i), i);	
		}
	}
	graph_add_node(graph, 460, 240, 15);
	graph_add_node(graph, 460, 740, 16);
	graph_add_node(graph, 1460, 240, 17);
	graph_add_node(graph, 1460, 740, 18);
	graph_add_node(graph, 960 +lengthdir_x(150, 18), 740, 19);
	graph_add_node(graph, 960 -lengthdir_x(150, 18), 740, 20);
	
	for (var i = 0; i < 5; i++) {
		graph_add_edge(graph, i, (i+2) mod 5);
		if ((i != 0) && (i != 2)) {
			graph_add_edge(graph, i+5, ((i+2) mod 5)+5);
		}
		if ((i != 0) && (i != 3)) {
			graph_add_edge(graph, i+10, ((i+2) mod 5)+10);
		}
	}	
	graph_add_edge(graph, 5, 0);
	graph_add_edge(graph, 9, 0);
	graph_add_edge(graph, 12, 2);
	graph_add_edge(graph, 13, 2);

	graph_add_edge(graph, 5, 17);
	graph_add_edge(graph, 9, 18);
	graph_add_edge(graph, 8, 19);
	graph_add_edge(graph, 4, 19);
	
	graph_add_edge(graph, 3, 20);
	graph_add_edge(graph, 14, 20);
	graph_add_edge(graph, 13, 16);
	graph_add_edge(graph, 12, 15);
	
	graph_add_edge(graph, 15, 16);
	graph_add_edge(graph, 16, 20);
	graph_add_edge(graph, 20, 19);
	graph_add_edge(graph, 19, 18);
	graph_add_edge(graph, 17, 18);

	//graph_add_edge(graph, 0, 2);
	
	return graph;
}