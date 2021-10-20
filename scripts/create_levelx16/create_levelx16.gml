// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level16(){
	obj_game.win_num = 12;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 3; i++) {
		graph_add_node(graph, 960 + lengthdir_x(75, 30 +i*120), 490 + lengthdir_y(75, 30+i*120), i);
	}
	for (var i = 3; i < 6; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 30 +i*120), 490 + lengthdir_y(150, 30+i*120), i);
	}
	for (var i = 6; i < 9; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 90 +i*120), 490 + lengthdir_y(150, 90+i*120), i);
	}
	for (var i = 9; i < 12; i++) {
		graph_add_node(graph, 960 + lengthdir_x(350, 90 +i*120), 490 + lengthdir_y(350, 90+i*120), i);
	}

	for (var i = 0; i < 3; i++) {
		graph_add_edge(graph, i, (i+1) mod 3);	
		graph_add_edge(graph, i, i+3);
		graph_add_edge(graph, i+3, i+6);	
		graph_add_edge(graph, i+3, ((i+5) mod 3)+6);
		graph_add_edge(graph, i+6, i+9);	
		graph_add_edge(graph, i+9, ((i+1) mod 3)+9);
	}


	return graph;
}