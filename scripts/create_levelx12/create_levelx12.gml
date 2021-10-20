// 
function create_level12(){
	obj_game.win_num = 9;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	
	for (var i = 0; i < 6; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, 60*i), 490 +lengthdir_y(300, 60*i), i);		
	}
	for (var i = 6; i < 9; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 90+120*i), 490 +lengthdir_y(150, 90+120*i), i);		
	}	
	
	
	

	for (var i = 0; i < 6; i++) {
		graph_add_edge(graph, i, ((i+1) mod 6) );
		graph_add_edge(graph, (i div 2) + 6, ((i+1) mod 6));
		graph_add_edge(graph, (i div 2) + 6, ((i+4) mod 6));
	}



	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}