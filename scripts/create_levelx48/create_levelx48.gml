// 45-planar
function create_level48(){
	obj_game.win_num = 44;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	graph_add_node(graph, 960, 490, 0);
	for (var i = 0; i < 8; i++) {
		graph_add_node(graph, 960 + lengthdir_x(100, 22.5+45*i), 490 +lengthdir_y(100, 22.5+45*i), i+1);	
		
	}
	for (var i = 8; i < 16; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 22.5+45*i), 490 +lengthdir_y(200, 22.5+45*i), i+1);	
		
	}
	for (var i = 16; i < 26; i++) {
		graph_add_node(graph, 960 + lengthdir_x(250, 18+36*(i-6)), 490 +lengthdir_y(250, 18+36*(i-6)), i+1);	
		
	}
	for (var i = 26; i < 32; i++) {
		graph_add_node(graph, 960 + lengthdir_x(360, 60*(i-2)), 490 +lengthdir_y(360, 60*(i-2)), i+1);	
		
	}
	for (var i = 32; i < 38; i++) {
		if (i != 33) {
			graph_add_node(graph, 960 + lengthdir_x(360, 60*(i-2))+lengthdir_x(180, 120+60*(i-2)), 490 +lengthdir_y(360, 60*(i-2))+lengthdir_y(180, 120+60*(i-2)), i+1);		
		}
	}
	for (var i = 38; i < 44; i++) {
		graph_add_node(graph, 960 + lengthdir_x(450, 60*(i-2)), 490 +lengthdir_y(450, 60*(i-2)), i+1);	
		
	}
	
	
	

	for (var i = 0; i < 8; i++) {
		if (i != 1 && i != 2 && i != 5 && i != 6) {
			graph_add_edge(graph, 0, i+1);
		}
		if (i != 3 && i != 7) {
			graph_add_edge(graph, i+1, ((i+1) mod 8)+1);
		}
		graph_add_edge(graph, i+9, i+1);
		graph_add_edge(graph, i+9, i+18 + (i div 4));
		graph_add_edge(graph, i+9, i+17 + (i div 4));
	}
	graph_add_edge(graph, 17, 26);
	graph_add_edge(graph, 21, 22);
	for (var i = 0; i < 6; i++) {
		graph_add_edge(graph, i+39, ((i+1) mod 6)+39);	
		graph_add_edge(graph, i+39, i+27);
		if (i != 1) {
			graph_add_edge(graph, i+33, i+27);
			graph_add_edge(graph, i+33, ((i+1) mod 6)+27);
		}
	}
	graph_add_edge(graph, 17, 33);
	graph_add_edge(graph, 18, 28);
	//graph_add_edge(graph, 19, 34);
	graph_add_edge(graph, 20, 29);
	graph_add_edge(graph, 21, 35);
	graph_add_edge(graph, 22, 36);
	graph_add_edge(graph, 23, 31);
	graph_add_edge(graph, 24, 37);
	graph_add_edge(graph, 25, 32);
	graph_add_edge(graph, 26, 38);


	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}