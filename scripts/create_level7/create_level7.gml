// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level7(){
	obj_game.win_num = 11;
	obj_game.win_con = "euler";
	obj_game.max_degree = 4;
	
	var graph = graph_create();

	graph_add_node(graph, 960, 540, 0);
	graph_add_node(graph, 1260, 490, 1);
	graph_add_node(graph, 660, 490, 2);
	graph_add_node(graph, 860, 240, 3);
	graph_add_node(graph, 1060, 240, 4);
	graph_add_node(graph, 960, 790, 5);

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