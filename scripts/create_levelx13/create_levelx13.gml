// 
function create_level13(){
	obj_game.win_num = 10;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	
	for (var i = 0; i < 5; i++) {
		graph_add_node(graph, 960 + 250, 290 +(i*100), i);		
	}
	for (var i = 5; i < 10; i++) {
		graph_add_node(graph, 960 - 250, 290 +((i-5)*100), i);		
	}

	
	
	

	for (var i = 0; i < 5; i++) {
		graph_add_edge(graph, i, ((i + 1) mod 5)+5);
		graph_add_edge(graph, i, ((i + 2) mod 5)+5);
		graph_add_edge(graph, i, ((i + 3) mod 5)+5);
		graph_add_edge(graph, i, ((i + 4) mod 5)+5);
	}



	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}