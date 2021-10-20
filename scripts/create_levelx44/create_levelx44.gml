// H3 hanoi graph
function create_level44(){
	obj_game.win_num = 27;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	
	for (var i = 0; i < 18; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 90+120*(i div 6))+lengthdir_x(75, 30+(60*i)+90+120*(i div 6)), 490 +lengthdir_y(200, 90+120*(i div 6))+lengthdir_y(75, 30+(60*i)+90+120*(i div 6)), i);		
	}
	for (var i = 18; i < 27; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 90+120*((i-18) div 3))+lengthdir_x(130, (120*i)+90+120*((i-18) div 3)), 490 +lengthdir_y(200, 90+120*((i-18) div 3))+lengthdir_y(130, (120*i)+90+120*((i-18) div 3)), i);		
	}	

	
	
	

	for (var i = 0; i < 6; i++) {
		graph_add_edge(graph, i, ((i+1) mod 6));
		graph_add_edge(graph, i+6, ((i+1) mod 6)+6);
		graph_add_edge(graph, i+12, ((i+1) mod 6)+12);
		
		graph_add_edge(graph, i, (((i+1) mod 6) div 2)+18);
		graph_add_edge(graph, i+6, (((i+1) mod 6) div 2)+21);
		graph_add_edge(graph, i+12, (((i+1) mod 6) div 2)+24);
	}
	graph_add_edge(graph, 19, 23);
	graph_add_edge(graph, 20, 25);
	graph_add_edge(graph, 22, 26);

	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}