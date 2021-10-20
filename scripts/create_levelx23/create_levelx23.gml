// robertson
function create_level23(){
	obj_game.win_num = 12;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 6;
	
	var graph = graph_create();

	
	for (var i = 0; i < 6; i++) {
		graph_add_node(graph, 960 + lengthdir_x(100, 60*i), 490 +lengthdir_y(100, 60*i), i);		
	}
	for (var i = 6; i < 9; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 90+120*i), 490 +lengthdir_y(200, 90+120*i), i);		
	}
	for (var i = 9; i < 12; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, 90+120*i), 490 +lengthdir_y(300, 90+120*i), i);		
	}
	

	
	
	

	for (var i = 0; i < 6; i++) {
		graph_add_edge(graph, i, ((i+1) mod 6));
		graph_add_edge(graph, (i div 2)+6, ((i+1) mod 6));
	}
	for (var i = 0; i < 3; i++) {
		graph_add_edge(graph, i+6, i+9);
		graph_add_edge(graph, i+9, ((i+1) mod 3)+9);
	}


	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}