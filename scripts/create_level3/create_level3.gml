// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level3(){
	obj_game.win_num = 11;
	obj_game.win_con = "euler";
	obj_game.max_degree = 4;
	
	var graph = graph_create();

	graph_add_node(graph, 960, 640, 0);
	graph_add_node(graph, 1260, 590, 1);
	graph_add_node(graph, 660, 590, 2);
	graph_add_node(graph, 860, 340, 3);
	graph_add_node(graph, 1060, 340, 4);
	graph_add_node(graph, 960, 890, 5);

	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 0, 2);
	graph_add_edge(graph, 0, 3);
	graph_add_edge(graph, 0, 4);
	graph_add_edge(graph, 1, 3);
	graph_add_edge(graph, 1, 4);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 2, 4);
	graph_add_edge(graph, 3, 4);
	graph_add_edge(graph, 1, 5);
	graph_add_edge(graph, 2, 5);
	
	
	return graph;
}