// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level11(){
	obj_game.win_num = 8;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 4; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 45 +i*90), 490 + lengthdir_y(150, 45+i*90), i);
	}
	for (var i = 4; i < 8; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, 45 +i*90), 490 + lengthdir_y(300, 45+i*90), i);
	}

	for (var i = 0; i < 4; i++) {
		graph_add_edge(graph, i, (i+1) mod 4);	
	}
	for (var i = 4; i < 8; i++) {
		graph_add_edge(graph, i, ((i+1) mod 4)+4);	
	}
	graph_add_edge(graph, 0, 4);
	graph_add_edge(graph, 1, 5);
	graph_add_edge(graph, 2, 6);
	graph_add_edge(graph, 3, 7);

	return graph;
}