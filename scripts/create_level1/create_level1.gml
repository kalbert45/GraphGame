// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level1(){
	obj_game.win_num = 3;
	obj_game.win_con = "euler";
	obj_game.max_degree = 2;
	
	var graph = graph_create();

	graph_add_node(graph, 822, 570, 0);
	graph_add_node(graph, 1098, 570, 1);
	graph_add_node(graph, 960, 330, 2);

	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 0, 2);
	
	return graph;
}