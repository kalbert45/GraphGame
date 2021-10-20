// robertson
function create_level31(){
	obj_game.win_num = 19;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 4;
	
	var graph = graph_create();

	
	for (var i = 0; i < 4; i++) {
		graph_add_node(graph, 960 + lengthdir_x(50, 15+90*i), 490 +lengthdir_y(50, 15+90*i), i);		
	}
	for (var i = 4; i < 16; i++) {
		graph_add_node(graph, 960 + lengthdir_x(125, 15+30*(i-4)), 490 +lengthdir_y(125, 15+30*(i-4)), i);		
	}
	for (var i = 16; i < 19; i++) {
		graph_add_node(graph, 960 + lengthdir_x(400, 90+120*(i-1)), 490 +lengthdir_y(400, 90+120*(i-1)), i);		
	}
	
	
	

	for (var i = 0; i < 12; i++) {
		graph_add_edge(graph, i+4, ((i+1) mod 12)+4);
		graph_add_edge(graph, i+4, ((-i + 13) mod 4));
		graph_add_edge(graph, (i div 4)+16, ((3*i + (4*(i div 4))+4) mod 12)+4);
	}
	graph_add_edge(graph, 0, 2);
	graph_add_edge(graph, 1, 3);

	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}