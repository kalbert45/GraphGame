// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level7(){
	obj_game.win_num = 24;
	obj_game.win_con = "euler";
	obj_game.max_degree = 6;
	
	var graph = graph_create();

	graph_add_node(graph, 1260, 366, 0);
	graph_add_node(graph, 1260, 614, 1);
	graph_add_node(graph, 660, 366, 2);
	graph_add_node(graph, 660, 614, 3);
	graph_add_node(graph, 1084, 190, 4);
	graph_add_node(graph, 1084, 790, 5);
	graph_add_node(graph, 836, 190, 6);
	graph_add_node(graph, 836, 790, 7);

	graph_add_edge(graph, 2, 6);
	graph_add_edge(graph, 3, 6);
	graph_add_edge(graph, 4, 6);
	graph_add_edge(graph, 0, 6);
	graph_add_edge(graph, 1, 6);
	graph_add_edge(graph, 5, 6);

	graph_add_edge(graph, 3, 7);
	graph_add_edge(graph, 2, 7);
	graph_add_edge(graph, 4, 7);
	graph_add_edge(graph, 0, 7);
	graph_add_edge(graph, 1, 7);
	graph_add_edge(graph, 5, 7);
	
	graph_add_edge(graph, 1, 5);
	graph_add_edge(graph, 0, 5);
	graph_add_edge(graph, 2, 5);
	graph_add_edge(graph, 3, 5);
	graph_add_edge(graph, 0, 4);
	graph_add_edge(graph, 1, 4);
	
	graph_add_edge(graph, 2, 4);
	graph_add_edge(graph, 3, 4);
	graph_add_edge(graph, 1, 3);
	graph_add_edge(graph, 0, 3);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 0, 2);
	
	return graph;
}