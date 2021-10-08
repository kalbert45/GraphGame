// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level22(){
	obj_game.win_num = 24;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 8; i++) {
		graph_add_node(graph, 960+ lengthdir_x(75, 22.5 + 45*i), 490+ lengthdir_y(75, 22.5+45*i), i);	
	}
	for (var i = 8; i < 12; i++) {
		graph_add_node(graph, 960+ lengthdir_x(150, 45 + 90*i), 490+ lengthdir_y(150, 45+90*i), i);	
	}
	for (var i = 12; i < 16; i++) {
		graph_add_node(graph, 960+ lengthdir_x(250, 45 + 90*i), 490+ lengthdir_y(250, 45+90*i), i);	
	}	
	for (var i = 16; i < 24; i++) {
		graph_add_node(graph, 960+ lengthdir_x(350, 22.5 + 45*i), 490+ lengthdir_y(350, 22.5+45*i), i);	
	}	
	
	for (var i=0; i < 8; i++) {
		graph_add_edge(graph, i, (i+1) mod 8);	
	}
	graph_add_edge(graph, 0, 8);
	graph_add_edge(graph, 1, 8);
	graph_add_edge(graph, 2, 9);
	graph_add_edge(graph, 3, 9);
	graph_add_edge(graph, 4, 10);
	graph_add_edge(graph, 5, 10);
	graph_add_edge(graph, 6, 11);
	graph_add_edge(graph, 7, 11);

	for (var i=8; i<12; i++) {
		graph_add_edge(graph, i, i+4);	
	}
	graph_add_edge(graph, 12, 16);
	graph_add_edge(graph, 12, 17);
	graph_add_edge(graph, 13, 18);
	graph_add_edge(graph, 13, 19);
	graph_add_edge(graph, 14, 20);
	graph_add_edge(graph, 14, 21);
	graph_add_edge(graph, 15, 22);
	graph_add_edge(graph, 15, 23);	
	
	for (var i=16; i<24; i++) {
		graph_add_edge(graph, i, ((i+1) mod 8) + 16);
	}
	
	
	return graph;
}