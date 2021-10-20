// 
function create_level46(){
	obj_game.win_num = 30;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	
	for (var i = 0; i < 30; i++) {
		graph_add_node(graph, 960 + lengthdir_x(350, 60*(i div 5))+lengthdir_x(100, 36+(72*i)+60*(i div 5)), 490 +lengthdir_y(350, 60*(i div 5))+lengthdir_y(100, 36+(72*i)+60*(i div 5)), i);		
	}

	
	
	

	for (var i = 0; i < 5; i++) {
		graph_add_edge(graph, i, ((i+2) mod 5));
		graph_add_edge(graph, i+5, ((i+2) mod 5)+5);
		graph_add_edge(graph, i+10, ((i+2) mod 5)+10);
		graph_add_edge(graph, i+15, ((i+2) mod 5)+15);
		graph_add_edge(graph, i+20, ((i+2) mod 5)+20);
		graph_add_edge(graph, i+25, ((i+2) mod 5)+25);
		
		graph_add_edge(graph, i, ((i+1) mod 5));
		graph_add_edge(graph, i+5, ((i+1) mod 5)+5);
		graph_add_edge(graph, i+10, ((i+1) mod 5)+10);
		graph_add_edge(graph, i+15, ((i+1) mod 5)+15);
		graph_add_edge(graph, i+20, ((i+1) mod 5)+20);
		graph_add_edge(graph, i+25, ((i+1) mod 5)+25);
	}
	for (var i = 0; i < 6; i++) {
		//graph_add_edge(graph, 5*i, 5*((i+1) mod 6)+4);
		graph_add_edge(graph, (5*i)+1, 5*((i+2) mod 6)+3);
	}
	for (var i = 0; i < 3; i++) {
		graph_add_edge(graph, (5*i)+2, 5*((i+3) mod 6)+2);
	}


	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}