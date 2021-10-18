// coxeter graph
function create_level45(){
	obj_game.win_num = 27;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	for (var i = 0; i < 7; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, (360/7)*i), 490 +lengthdir_y(150, (360/7)*i), i);	
	}
	for (var i = 7; i < 21; i++) {
		if (i != 11) {
			graph_add_node(graph, 960 + lengthdir_x(300, (360/14)*(i - 7)), 490 +lengthdir_y(300, (360/14)*(i - 7)), i);	
		}
	}
	for (var i = 21; i < 28; i++) {
		
		graph_add_node(graph, 960 + lengthdir_x(400, (360/7)*i), 490 +lengthdir_y(400, (360/7)*i), i);	
		
	}

	
	for (var i = 0; i < 7; i++) {
		graph_add_edge(graph, i, (i + 3) mod 7);
		graph_add_edge(graph, 2*i+8,2*((i+2) mod 7)+8 );
		graph_add_edge(graph, i+21,((i+1) mod 7)+21 );
		if (i != 2) {
			graph_add_edge(graph, i, 2*i+7);
			graph_add_edge(graph, 2*i+7,((2*i + 13) mod 14)+7 );
			graph_add_edge(graph, 2*i+7,i+21 );
		}
	}	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}