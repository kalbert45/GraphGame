// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level27(){
	obj_game.win_num = 26;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 4; i++) {
		graph_add_node(graph, 960, 540 + 75*i, i);	
	}
	for (var i = 0; i < 7; i++) {
		graph_add_node(graph, 960+ lengthdir_x(75, 9 + 27*i), 540+ lengthdir_y(75, 9+27*i), i+4);
		graph_add_node(graph, 960+ lengthdir_x(150, 9 + 27*i), 540+ lengthdir_y(150, 9+27*i), i+11);
		graph_add_node(graph, 960+ lengthdir_x(225, 9 + 27*i), 540+ lengthdir_y(225, 9+27*i), i+18);
	}
	graph_add_node(graph, 960, 190, 25);

	
	graph_add_edge(graph, 1,2);
	graph_add_edge(graph, 2,3);
	for (var i = 0; i<7; i++) {
		if (!(i == 6)) {
			graph_add_edge(graph, i+4, i+5);
			graph_add_edge(graph, i+11, i+12);
			graph_add_edge(graph, i+18, i+19);
		}
		
		graph_add_edge(graph, i+4, i+11);
		graph_add_edge(graph, i+11, i+18);		
	}
	graph_add_edge(graph, 0,4);
	graph_add_edge(graph, 0,6);
	graph_add_edge(graph, 0,8);
	graph_add_edge(graph, 0,10);

	graph_add_edge(graph, 1,4);
	graph_add_edge(graph, 1,10);
	
	graph_add_edge(graph, 2,11);
	graph_add_edge(graph, 2,17);
	
	graph_add_edge(graph, 3,18);
	graph_add_edge(graph, 3,24);
	
	graph_add_edge(graph, 25,19);
	graph_add_edge(graph, 25,21);
	graph_add_edge(graph, 25,23);
	//graph_add_edge(graph, 25,24);
	
	return graph;
}