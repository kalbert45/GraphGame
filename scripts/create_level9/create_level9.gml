// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level9(){
	obj_game.win_num = 6;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 3; i++) {
		graph_add_node(graph, 960 + lengthdir_x(75, 30 +i*120), 490 + lengthdir_y(75, 30+i*120), i);
	}
	for (var i = 3; i < 6; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, 90 +i*120), 490 + lengthdir_y(300, 90+i*120), i);
	}

	for (var i = 0; i < 3; i++) {
		graph_add_edge(graph, i, (i+1) mod 3);	
	}
	for (var i = 3; i < 6; i++) {
		graph_add_edge(graph, i, ((i+1) mod 3)+3);	
	}
	graph_add_edge(graph, 0, 3);
	graph_add_edge(graph, 0, 5);
	graph_add_edge(graph, 1, 3);
	graph_add_edge(graph, 1, 4);
	graph_add_edge(graph, 2, 4);
	graph_add_edge(graph, 2, 5);

	return graph;
}