// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level26(){
	obj_game.win_num = 24;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 4; i++) {
		graph_add_node(graph, 960+ lengthdir_x(75, 45 + 90*i), 490+ lengthdir_y(75, 45+90*i), i);	
	}
	for (var i = 4; i < 8; i++) {
		graph_add_node(graph, 960+ lengthdir_x(150, 45 + 90*i), 490+ lengthdir_y(150, 45+90*i), i);	
	}
	for (var i = 8; i < 12; i++) {
		graph_add_node(graph, 960+ lengthdir_x(275, 45 + 90*i), 490+ lengthdir_y(275, 45+90*i), i);	
	}
	for (var i = 12; i < 16; i++) {
		graph_add_node(graph, 960+ lengthdir_x(225, 15 + 90*i), 490+ lengthdir_y(225, 15+90*i), i);	
	}
	for (var i = 16; i < 20; i++) {
		graph_add_node(graph, 960+ lengthdir_x(225, 75 + 90*i), 490+ lengthdir_y(225, 75+90*i), i);	
	}
	for (var i = 20; i < 24; i++) {
		graph_add_node(graph, 960+ lengthdir_x(375, 45 + 90*i), 490+ lengthdir_y(375, 45+90*i), i);	
	}
	

	for (var i = 0; i<4; i++) {
		graph_add_edge(graph, i, (i+1) mod 4);
		graph_add_edge(graph, i, i+4);
		graph_add_edge(graph, i+4, i+12);
		graph_add_edge(graph, i+4, i+16);
		graph_add_edge(graph, i+8, i+12);
		//graph_add_edge(graph, i+8, i+16);
		graph_add_edge(graph, ((i + 1) mod 4)+12, i+16);
		graph_add_edge(graph, i+8, i+20);
		graph_add_edge(graph, i+20, ((i+1) mod 4)+20);
	}
	//graph_add_edge(graph, 11,15);

	
	return graph;
}