// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level15(){
	obj_game.win_num = 12;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 6; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, i*60), 490 + lengthdir_y(300, i*60), i);
	}
	for (var i = 6; i < 12; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, i*60), 490 + lengthdir_y(150, i*60), i);
	}

	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 3, 4);
	graph_add_edge(graph, 4, 5);
	graph_add_edge(graph, 5, 0);
	
	graph_add_edge(graph, 6, 7);
	graph_add_edge(graph, 7, 8);
	graph_add_edge(graph, 8, 9);
	graph_add_edge(graph, 9, 10);
	graph_add_edge(graph, 10, 11);
	graph_add_edge(graph, 11, 6);		
	
	graph_add_edge(graph, 0, 7);
	graph_add_edge(graph, 1, 6);
	graph_add_edge(graph, 2, 9);
	graph_add_edge(graph, 3, 8);
	graph_add_edge(graph, 4, 11);
	graph_add_edge(graph, 5, 10);	

	return graph;
}