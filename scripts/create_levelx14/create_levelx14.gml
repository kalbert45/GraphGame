// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level14(){
	obj_game.win_num = 11;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	graph_add_node(graph, 960, 490, 0);
	for (var i = 0; i < 5; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 54+(360/5)*i), 490 +lengthdir_y(200, 54+(360/5)*i), i+1);	
	}
	for (var i = 5; i < 10; i++) {
		graph_add_node(graph, 960 + lengthdir_x(350, 18+(360/5)*i), 490 +lengthdir_y(350, 18+(360/5)*i), i+1);	
	}

	for (var i = 0; i<5; i++) {
		graph_add_edge(graph, 0, i+6);
		graph_add_edge(graph, i+1, ((i+2) mod 5) + 1);	
		graph_add_edge(graph, i+1, i+6);
		graph_add_edge(graph, i+1, ((i + 1) mod 5)+6);
	}
	//graph_add_edge(graph, 0,2);

	
	return graph;
}