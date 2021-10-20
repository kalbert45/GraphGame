// 
function create_level26(){
	obj_game.win_num = 14;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	
	for (var i = 0; i < 7; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, (360/7)*i), 490 +lengthdir_y(300, (360/7)*i), i);		
	}
	for (var i = 7; i < 14; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, (360/7)*i), 490 +lengthdir_y(150, (360/7)*i), i);		
	}	
	
	
	

	for (var i = 0; i < 7; i++) {
		if (i != 0) {
			graph_add_edge(graph, i, ((i+1) mod 7) );
			graph_add_edge(graph, i+7, ((i+1) mod 7)+7 );
		}
		graph_add_edge(graph, i, i+7 );

	}
	graph_add_edge(graph, 0, 8 );
	graph_add_edge(graph, 1, 7 );


	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}