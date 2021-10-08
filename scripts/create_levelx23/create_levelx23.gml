// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level23(){
	obj_game.win_num = 18;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 6; i++) {
		graph_add_node(graph, 960+ lengthdir_x(100, 30 + 60*i), 490+ lengthdir_y(100, 30+60*i), i);	
	}
	for (var i = 6; i < 12; i++) {
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 60*i), 490+ lengthdir_y(200, 30+60*i), i);	
	}
	for (var i = 12; i < 18; i++) {
		graph_add_node(graph, 960+ lengthdir_x(300, 30 + 60*i), 490+ lengthdir_y(300, 30+60*i), i);	
	}

	
	for (var i=0; i < 3; i++) {
		graph_add_edge(graph, i, (i+3) mod 6);	
	}
	for (var i=0; i < 6; i++) {
		graph_add_edge(graph, i, ((i+1) mod 6)+6);	
		graph_add_edge(graph, i, ((i+5) mod 6)+6);	
		graph_add_edge(graph, i+6, i+12);
		graph_add_edge(graph, i+12, ((i+1) mod 6) + 12);
	}

	
	return graph;
}