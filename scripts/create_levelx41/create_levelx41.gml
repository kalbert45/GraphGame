// hatzel graph
function create_level41(){
	obj_game.win_num = 56;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	graph_add_node(graph, 960, 490, 0);
	for (var i = 0; i < 4; i++) {
		graph_add_node(graph, 960 + lengthdir_x(50, 90*i), 490 +lengthdir_y(50, 90*i), i+1);	
	}
	for (var i = 4; i < 8; i++) {
		graph_add_node(graph, 960 + lengthdir_x(50, 90*i)+ lengthdir_x(50, 45+90*i), 490 +lengthdir_y(50, 90*i)+lengthdir_y(50, 45+90*i), i+1);	
	}
	for (var i = 8; i < 12; i++) {
		graph_add_node(graph, 960 + lengthdir_x(50, 90*i)+ lengthdir_x(50, 315+90*i), 490 +lengthdir_y(50, 90*i)+lengthdir_y(50, 315+90*i), i+1);	
	}	
	for (var i = 12; i < 16; i++) {
		graph_add_node(graph, 960 + 2*lengthdir_x(50, 90*i)+ lengthdir_x(50, 45+90*i), 490 +2*lengthdir_y(50, 90*i)+lengthdir_y(50, 45+90*i), i+1);	
	}	
	for (var i = 16; i < 20; i++) {
		graph_add_node(graph, 960 + 3*lengthdir_x(50, 90*i)+ lengthdir_x(50, 45+90*i), 490 +3*lengthdir_y(50, 90*i)+lengthdir_y(50, 45+90*i), i+1);	
	}		
	for (var i = 20; i < 24; i++) {
		graph_add_node(graph, 960 + 2*lengthdir_x(50, 90*i)+ lengthdir_x(50, 315+90*i), 490 +2*lengthdir_y(50, 90*i)+lengthdir_y(50, 315+90*i), i+1);	
	}	
	for (var i = 24; i < 28; i++) {
		graph_add_node(graph, 960 + 3*lengthdir_x(50, 90*i)+ lengthdir_x(50, 315+90*i), 490 +3*lengthdir_y(50, 90*i)+lengthdir_y(50, 315+90*i), i+1);	
	}	
	for (var i = 28; i < 32; i++) {
		graph_add_node(graph, 960 + lengthdir_x(225, 90*i), 490 +lengthdir_y(225, 90*i), i+1);	
	}	
	for (var i = 32; i < 36; i++) {
		if (i != 33) {
			graph_add_node(graph, 960 + lengthdir_x(275, 90*i), 490 +lengthdir_y(275, 90*i), i+1);	
		}
	}	
	for (var i = 36; i < 40; i++) {
		graph_add_node(graph, 960 + 3*lengthdir_x(50, 90*i)+ lengthdir_x(50, 45+90*i)+lengthdir_x(50, 90+90*i), 490 +3*lengthdir_y(50, 90*i)+lengthdir_y(50, 45+90*i)+lengthdir_y(50, 90+90*i), i+1);	
	}	
	for (var i = 40; i < 44; i++) {
		graph_add_node(graph, 960 + 3*lengthdir_x(50, 90*i)+ lengthdir_x(50, 315+90*i)+lengthdir_x(50, 270+90*i), 490 +3*lengthdir_y(50, 90*i)+lengthdir_y(50, 315+90*i)+lengthdir_y(50, 270+90*i), i+1);	
	}	
	for (var i = 44; i < 48; i++) {
		graph_add_node(graph, 960 + lengthdir_x(275, 90*i)+lengthdir_x(85, 90+90*i), 490 +lengthdir_y(275, 90*i)+lengthdir_y(85, 90+90*i), i+1);	
	}	
	for (var i = 48; i < 52; i++) {
		graph_add_node(graph, 960 + lengthdir_x(275, 90*i)+lengthdir_x(85, 270+90*i), 490 +lengthdir_y(275, 90*i)+lengthdir_y(85, 270+90*i), i+1);	
	}	
	for (var i = 52; i < 56; i++) {
		graph_add_node(graph, 960 + lengthdir_x(500, 45+90*i), 490 +lengthdir_y(500, 45+90*i), i+1);	
	}
	
	
	
	for (var i = 0; i < 4; i++) {
		graph_add_edge(graph, 0, i+1);
		graph_add_edge(graph, i+1, i+5);
		graph_add_edge(graph, i+1, i+9);
		graph_add_edge(graph, i+5, ((i+1) mod 4)+9);
		graph_add_edge(graph, i+5, i+13);
		graph_add_edge(graph, i+13, i+17);
		graph_add_edge(graph, i+9, i+21);
		graph_add_edge(graph, i+21, i+25);
		graph_add_edge(graph, i+13, i+21);
		graph_add_edge(graph, i+17, i+29);
		graph_add_edge(graph, i+25, i+29);
		graph_add_edge(graph, i+17, i+37);
		graph_add_edge(graph, i+25, i+41);


		graph_add_edge(graph, i+37, i+45);
		graph_add_edge(graph, i+41, i+49);
		graph_add_edge(graph, i+37, ((i+1) mod 4)+41);
		graph_add_edge(graph, i+45, i+53);
		graph_add_edge(graph, ((i+1) mod 4)+49, i+53);
		graph_add_edge(graph, i+53, ((i+1) mod 4)+53);
		if (i != 1) {
			graph_add_edge(graph, i+29, i+33);
			graph_add_edge(graph, i+33, i+45);
			graph_add_edge(graph, i+33, i+49);
		}
	}	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}