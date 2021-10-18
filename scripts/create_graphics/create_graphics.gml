// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_graphics(){
	obj_game.win_num = 7;
	obj_game.win_con = "euler";
	obj_game.max_degree = 4;
	
	var graph = graph_create();

	graph_add_node(graph, 610, 640, 0);
	graph_add_node(graph, 800, 570, 1);
	graph_add_node(graph, 860, 590, 2);
	graph_add_node(graph, 980, 610, 3);
	graph_add_node(graph, 1160, 530, 4);
	graph_add_node(graph, 1180, 640, 5);
	graph_add_node(graph, 1020, 670, 6);

	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 3, 4);
	graph_add_edge(graph, 4, 5);
	graph_add_edge(graph, 5, 6);
	graph_add_edge(graph, 3, 6);
	
	return graph;

	
	return graph;
}