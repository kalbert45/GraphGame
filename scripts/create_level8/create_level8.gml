// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level8(){
	obj_game.win_num = 28;
	obj_game.win_con = "euler";
	obj_game.max_degree = 4;
	
	var graph = graph_create();

	graph_add_node(graph, 660, 190, 0);
	graph_add_node(graph, 860, 190, 1);
	graph_add_node(graph, 1060, 190, 2);
	graph_add_node(graph, 1260, 190, 3);
	graph_add_node(graph, 660, 390, 4);
	graph_add_node(graph, 860, 390, 5);
	graph_add_node(graph, 1060, 390, 6);
	graph_add_node(graph, 1260, 390, 7);
	graph_add_node(graph, 660, 590, 8);
	graph_add_node(graph, 860, 590, 9);
	graph_add_node(graph, 1060, 590, 10);
	graph_add_node(graph, 1260, 590, 11);
	graph_add_node(graph, 660, 790, 12);
	graph_add_node(graph, 860, 790, 13);
	graph_add_node(graph, 1060, 790, 14);
	graph_add_node(graph, 1260, 790, 15);

	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 0, 4);
	graph_add_edge(graph, 1, 4);
	graph_add_edge(graph, 1, 5);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 2, 6);
	graph_add_edge(graph, 2, 7);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 3, 7);
	graph_add_edge(graph, 4, 5);
	graph_add_edge(graph, 4, 8);
	graph_add_edge(graph, 5, 6);
	graph_add_edge(graph, 5, 9);
	graph_add_edge(graph, 6, 7);
	graph_add_edge(graph, 6, 10);
	graph_add_edge(graph, 7, 11);
	graph_add_edge(graph, 8, 9);
	graph_add_edge(graph, 8, 12);
	graph_add_edge(graph, 8, 13);
	graph_add_edge(graph, 9, 13);
	graph_add_edge(graph, 9, 10);
	graph_add_edge(graph, 10, 11);
	graph_add_edge(graph, 10, 14);
	graph_add_edge(graph, 11, 14);
	graph_add_edge(graph, 11, 15);
	graph_add_edge(graph, 12, 13);
	graph_add_edge(graph, 13, 14);
	graph_add_edge(graph, 14, 15);

	
	return graph;
}