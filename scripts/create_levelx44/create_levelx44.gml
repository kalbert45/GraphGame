// double star snark
function create_level44(){
	obj_game.win_num = 30;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	for (var i = 0; i < 5; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 54+72*i), 490 +lengthdir_y(150, 54+72*i), i);	
	}
	for (var i = 5; i < 10; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 54+72*i)+lengthdir_x(75, 90+54+72*i), 490 +lengthdir_y(150, 54+72*i)+lengthdir_y(75, 90+54+72*i), i);	
	}
	for (var i = 10; i < 15; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 54+72*i)+lengthdir_x(75, -90+54+72*i), 490 +lengthdir_y(150, 54+72*i)+lengthdir_y(75, -90+54+72*i), i);	
	}
	for (var i = 15; i < 20; i++) {
		if (i != 15) {
			graph_add_node(graph, 960 + lengthdir_x(350, 54+72*i), 490 +lengthdir_y(350, 54+72*i), i);	
		}
	}
	for (var i = 20; i < 25; i++) {
		graph_add_node(graph, 960 + lengthdir_x(350, 54+72*i)+lengthdir_x(75, 90+54+72*i), 490 +lengthdir_y(350, 54+72*i)+lengthdir_y(75, 90+54+72*i), i);	
	}
	for (var i = 25; i < 30; i++) {
		graph_add_node(graph, 960 + lengthdir_x(350, 54+72*i)+lengthdir_x(75, -90+54+72*i), 490 +lengthdir_y(350, 54+72*i)+lengthdir_y(75, -90+54+72*i), i);	
	}


	
	for (var i = 0; i < 5; i++) {
		graph_add_edge(graph, i, i+5);
		graph_add_edge(graph, i, i+10);

		graph_add_edge(graph, i+5, ((i+2) mod 5) + 10);
		graph_add_edge(graph, i+5, ((i+3) mod 5) + 10);
		graph_add_edge(graph, i+20, ((i+1) mod 5) + 25);
		graph_add_edge(graph, i+20, ((i+4) mod 5) + 25);
		if (i != 0) {
			graph_add_edge(graph, i, i+15);
			graph_add_edge(graph, i+15, i+20);
			graph_add_edge(graph, i+15, i+25);
		}
	}	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}