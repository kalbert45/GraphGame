// coxeter graph
function create_level58(){
	obj_game.win_num = 49;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	for (var i = 0; i < 5; i++) {
		if (i != 0) {
			graph_add_node(graph, 960 + lengthdir_x(350, 18+72*i), 490 +lengthdir_y(350, 18+72*i), i);	
		}
	}
	for (var i = 5; i < 50; i++) {
		graph_add_node(graph, 960 + lengthdir_x(350, 18+72*((i-5) div 9))+lengthdir_x(100, 18+72*((i-5) div 9)+160+(-40)*(i-5)), 490 +lengthdir_y(350, 18+72*((i-5) div 9))+lengthdir_y(100, 18+72*((i-5) div 9)+160+(-40)*(i-5)), i);	
	}


	
	for (var i = 0; i < 5; i++) {
		if (i != 0) {
			graph_add_edge(graph, i, 9*i+5+1);	
			graph_add_edge(graph, i, 9*i+5+4);	
			graph_add_edge(graph, i, 9*i+5+7);	
		}
		for (var j = 0; j < 8; j++) {
			graph_add_edge(graph, 9*i+5+j, 9*i+5+j+1);	
		}
		graph_add_edge(graph, 9*i+5, 9*i+5+5);	
		graph_add_edge(graph, 9*i+5+8, 9*i+5+3);	
		graph_add_edge(graph, 9*((i+1) mod 5)+5, 9*i+5+8);	
		graph_add_edge(graph, 9*i+5+2, 9*((i + 2) mod 5)+5+6);
	}	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}