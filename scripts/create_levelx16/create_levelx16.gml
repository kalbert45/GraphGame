// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level16(){
	obj_game.win_num = 12;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 12; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, i*30), 490 + lengthdir_y(300, i*30), i);
	}

	for (var i = 0; i < 12; i++) {
		graph_add_edge(graph, i, (i+1) mod 12);	
	}
	graph_add_edge(graph, 0, 5);
	graph_add_edge(graph, 1, 8);
	graph_add_edge(graph, 2, 11);
	graph_add_edge(graph, 3, 6);
	graph_add_edge(graph, 7, 10);
	graph_add_edge(graph, 9, 4);

	return graph;
}