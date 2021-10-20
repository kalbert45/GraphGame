// robertson
function create_level8(){
	obj_game.win_num = 11;
	obj_game.win_con = "euler";
	obj_game.max_degree = 6;
	
	var graph = graph_create();

	
	for (var i = 0; i < 5; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 52.5*i-15+360), 490 +lengthdir_y(200, 52.5*i-15+360), i);		
	}
	graph_add_node(graph, 960 - 100, 490 + 200, 5);
	graph_add_node(graph, 960 + 100, 490 + 200, 6);

	
	
	

	for (var i = 0; i < 5; i++) {
		graph_add_edge(graph, i, 5);
		graph_add_edge(graph, i, 6);
	}
	graph_add_edge(graph, 5, 6);


	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}