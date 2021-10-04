// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level2(){
	obj_game.win_num = 9;
	obj_game.win_con = "euler"
	
	var graph = graph_create();

	graph_add_node(graph, 752, 610, 0);
	graph_add_node(graph, 960, 610, 1);
	graph_add_node(graph, 1168, 610, 2);
	graph_add_node(graph, 856, 430, 3);
	graph_add_node(graph, 1064, 430, 4);
	graph_add_node(graph, 960, 250, 5);

	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 0, 3);
	graph_add_edge(graph, 1, 3);
	graph_add_edge(graph, 1, 4);
	graph_add_edge(graph, 2, 4);
	graph_add_edge(graph, 3, 4);
	graph_add_edge(graph, 3, 5);
	graph_add_edge(graph, 4, 5);
	
	
	return graph
}