// hatzel graph
function create_level38(){
	obj_game.win_num = 21;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();


	for (var i = 0; i < 15; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 90+120*(i div 5)) + lengthdir_x(100, 90+120*(i div 5)+36+(72*i)), 490 +lengthdir_y(200, 90+120*(i div 5))+lengthdir_y(100, 90+120*(i div 5)+36+(72*i)), i);	
	}
	for (var i = 15; i < 18; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 90+120*i) + lengthdir_x(100, 90+120*i+36)+lengthdir_x(100, 90+120*i), 490 +lengthdir_y(200, 90+120*i)+lengthdir_y(100, 90+120*i+36)+lengthdir_y(100, 90+120*i), i);	
	}
	for (var i = 18; i < 21; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 90+120*i) + lengthdir_x(100, 90+120*i+324)+lengthdir_x(100, 90+120*i), 490 +lengthdir_y(200, 90+120*i)+lengthdir_y(100, 90+120*i+324)+lengthdir_y(100, 90+120*i), i);	
	}

	
	
	
	for (var i = 0; i < 5; i++) {
		graph_add_edge(graph, i, ((i+2) mod 5));
		graph_add_edge(graph, i+5, ((i+2) mod 5)+5);
		graph_add_edge(graph, i+10, ((i+2) mod 5)+10);
	}	
	for (var i = 0; i < 3; i++) {
		graph_add_edge(graph, 5*i+1, 5*((i+1) mod 3)+3);	
		graph_add_edge(graph, 5*i, i+15);
		graph_add_edge(graph, 5*i+4, i+18);
		graph_add_edge(graph, i+15, i+18);
		graph_add_edge(graph, i+15, ((i+1) mod 3) + 18);
	}


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}