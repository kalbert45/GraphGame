// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level22(){
	obj_game.win_num = 12;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	for (var i = 0; i < 5; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 18+72*i), 490 +lengthdir_y(150, 18+72*i), i);	
	}
	for (var i = 5; i < 10; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, 18+72*i), 490 +lengthdir_y(300, 18+72*i), i);	
	}
	graph_add_node(graph, 960 + lengthdir_x(300, 18+72*3)+100, 490 +lengthdir_y(300, 18+72*3), 10);	
	graph_add_node(graph, 960 + lengthdir_x(300, 18+72*4)-100, 490 +lengthdir_y(300, 18+72*4), 11);	
	
	for (var i = 0; i < 5; i++) {
		graph_add_edge(graph, i, ((i+2) mod 5));
		graph_add_edge(graph, i, i+5);
		if (i != 3) {
			graph_add_edge(graph, i+5, ((i+1) mod 5)+5);
		}
	}	
	graph_add_edge(graph, 5, 10);
	graph_add_edge(graph, 7, 11);
	graph_add_edge(graph, 8, 10);
	graph_add_edge(graph, 9, 11);


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}