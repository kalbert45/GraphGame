// robertson
function create_level32(){
	obj_game.win_num = 19;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 6;
	
	var graph = graph_create();

	
	for (var i = 0; i < 15; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, 18+24*i), 490 +lengthdir_y(300, 18+24*i), i);		
	}
	for (var i = 15; i < 20; i++) {
		if (i != 15) {
			graph_add_node(graph, 960 + lengthdir_x(100, 18+72*i), 490 +lengthdir_y(100, 18+72*i), i);		
		}
	}	
	

	
	
	

	for (var i = 0; i < 5; i++) {
		if (i != 0) {
			graph_add_edge(graph, 3*i, i+15);
			
		}
		if (i != 4 && i != 0) {
			graph_add_edge(graph, i+15, ((i+1) mod 5)+15);
		}

		graph_add_edge(graph, 3*i+1, (3*i+11) mod 15);
		graph_add_edge(graph, 3*i+2, (3*i+7) mod 15);
	}
	for (var i = 0; i < 15; i++) {
		graph_add_edge(graph, i, (i+1) mod 15);	
	}


	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}