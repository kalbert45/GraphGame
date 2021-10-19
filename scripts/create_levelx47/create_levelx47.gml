// wiener-araya
function create_level47(){
	obj_game.win_num = 41;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	for (var i = 0; i < 4; i++) {
		if (i != 0) {
			graph_add_node(graph, 960 + lengthdir_x(100, 45+90*i), 490 +lengthdir_y(100, 45+90*i), i);	
		}
	}
	graph_add_node(graph, 960, 490 - 100, 4);
	graph_add_node(graph, 960, 490 + 100, 5);
	graph_add_node(graph, 960-50, 490 - 200, 6);
	graph_add_node(graph, 960+50, 490 - 200, 7);
	graph_add_node(graph, 960-50, 490 + 200, 8);
	graph_add_node(graph, 960+50, 490 + 200, 9);
	graph_add_node(graph, 960, 490 - 250, 10);
	graph_add_node(graph, 960, 490 + 250, 11);
	for (var i = 12; i < 16; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, 90*i), 490 +lengthdir_y(300, 90*i), i);	
	}
	for (var i = 16; i < 20; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, 90*i)+lengthdir_x(250, 90+90*i), 490 +lengthdir_y(300, 90*i)+lengthdir_y(250, 90+90*i), i);	
	}
	for (var i = 20; i < 24; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, 90*i)+lengthdir_x(250, 270+90*i), 490 +lengthdir_y(300, 90*i)+lengthdir_y(250, 270+90*i), i);	
	}
	graph_add_node(graph, 960+150, 490 - 75, 24);
	graph_add_node(graph, 960+150, 490 + 75, 25);
	graph_add_node(graph, 960-150, 490 - 75, 26);
	graph_add_node(graph, 960-150, 490 + 75, 27);	
	graph_add_node(graph, 960+250, 490, 28);
	graph_add_node(graph, 960-250, 490, 29);
	for (var i = 30; i < 34; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, 90*(i-2))+lengthdir_x(250, 90+90*(i-2))+lengthdir_x(100, 225+90*(i-2)), 490 +lengthdir_y(300, 90*(i-2))+lengthdir_y(250, 90+90*(i-2))+lengthdir_y(100, 225+90*(i-2)), i);
	}
	for (var i = 34; i < 38; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, 90*(i-2))+lengthdir_x(250, 270+90*(i-2))+lengthdir_x(100, 135+90*(i-2)), 490 +lengthdir_y(300, 90*(i-2))+lengthdir_y(250, 270+90*(i-2))+lengthdir_y(100, 135+90*(i-2)), i);	
	}
	for (var i = 38; i < 42; i++) {
		graph_add_node(graph, 960 + lengthdir_x(500, 45+90*(i-2)), 490 +lengthdir_y(500, 45+90*(i-2)), i);	
	}
	
	
	

	for (var i = 0; i < 4; i++) {
		graph_add_edge(graph, i+12, i+16);
		graph_add_edge(graph, i+12, i+20);
		graph_add_edge(graph, i+16, i+30);
		graph_add_edge(graph, i+20, i+34);
		graph_add_edge(graph, i+16, i+38);
		graph_add_edge(graph, ((i+1) mod 4)+20, i+38);
		graph_add_edge(graph, i+38, ((i+1) mod 4)+38);
		graph_add_edge(graph, i+30, ((i+1) mod 4)+34);
	}
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 1, 4);
	graph_add_edge(graph, 4, 5);
	graph_add_edge(graph, 4, 7);
	graph_add_edge(graph, 7, 10);
	graph_add_edge(graph, 10, 6);
	graph_add_edge(graph, 1, 6);
	graph_add_edge(graph, 2, 8);
	graph_add_edge(graph, 5, 8);
	graph_add_edge(graph, 8, 11);
	graph_add_edge(graph, 11, 9);
	graph_add_edge(graph, 3, 9);
	graph_add_edge(graph, 3, 5);
	graph_add_edge(graph, 13, 10);
	graph_add_edge(graph, 15, 11);
	
	graph_add_edge(graph, 1, 26);
	graph_add_edge(graph, 2, 27);
	graph_add_edge(graph, 3, 25);
	graph_add_edge(graph, 24, 28);
	graph_add_edge(graph, 25, 28);
	graph_add_edge(graph, 26, 29);
	graph_add_edge(graph, 27, 29);
	
	graph_add_edge(graph, 30, 24);
	graph_add_edge(graph, 12, 28);
	graph_add_edge(graph, 14, 29);
	graph_add_edge(graph, 35, 7);
	
	graph_add_edge(graph, 6, 31);
	graph_add_edge(graph, 26, 36);
	graph_add_edge(graph, 32, 27);
	graph_add_edge(graph, 37, 8);
	graph_add_edge(graph, 33, 9);
	graph_add_edge(graph, 34, 25);
	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}