// 
function create_level37(){
	obj_game.win_num = 20;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	
	for (var i = 0; i < 10; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 36*i), 490 +lengthdir_y(150, 36*i), i);		
	}
	for (var i = 10; i < 20; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, 36*i), 490 +lengthdir_y(300, 36*i), i);		
	}

	
	
	

	for (var i = 0; i < 10; i++) {
		if (i % 2 == 0) {
			graph_add_edge(graph, i, ((i+3) mod 10));	
			graph_add_edge(graph, i, ((i+9) mod 10)+10);	
		}
		else {
			graph_add_edge(graph, i, ((i+7) mod 10));	
			graph_add_edge(graph, i, ((i+1) mod 10)+10);	
		}
		graph_add_edge(graph, i, i+10);	
		graph_add_edge(graph, i+10, ((i+1) mod 10)+10);	
	}



	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}