// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level3(){
	obj_game.win_num = 10;
	obj_game.win_con = "euler";
	obj_game.max_degree = 4;
	
	var graph = graph_create();

	graph_add_node(graph, 710, 240, 0);
	graph_add_node(graph, 710, 740, 1);
	graph_add_node(graph, 1210, 240, 2);
	graph_add_node(graph, 1210, 740, 3);
	graph_add_node(graph, 1416, 490, 4);
	graph_add_node(graph, 494, 490, 5);

	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 0, 3);
	graph_add_edge(graph, 0, 2);
	graph_add_edge(graph, 1, 3);
	graph_add_edge(graph, 2, 4);
	graph_add_edge(graph, 3, 4);
	graph_add_edge(graph, 0, 5);
	graph_add_edge(graph, 1, 5);
	
	
	return graph;
}