// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level49(){
	obj_game.win_num = 33;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	for (var i = 0; i < 17; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, (360/17)*i), 490 +lengthdir_y(200, (360/17)*i), i);	
	}
	for (var i = 17; i < 34; i++) {
		if (i != 17) {
			graph_add_node(graph, 960 + lengthdir_x(300, (360/17)*i), 490 +lengthdir_y(300, (360/17)*i), i);
		}
	}

	
	for (var i = 0; i < 17; i++) {
		graph_add_edge(graph, i, (i+2) mod 17);
		if (i != 0 && i != 16) {
			graph_add_edge(graph, i+17, ((i+1) mod 17)+17);
		}
		if (i != 0) {
			graph_add_edge(graph, i, i+17);	
		}
	}	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}