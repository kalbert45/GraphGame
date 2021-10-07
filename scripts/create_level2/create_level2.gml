// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level2(){
	obj_game.win_num = 7;
	obj_game.win_con = "euler";
	obj_game.max_degree = 4;
	
	var graph = graph_create();

	graph_add_node(graph, 360, 570, 0);
	graph_add_node(graph, 640, 450, 1);
	graph_add_node(graph, 760, 490, 2);
	graph_add_node(graph, 1000, 530, 3);
	graph_add_node(graph, 1360, 370, 4);
	graph_add_node(graph, 1400, 570, 5);
	graph_add_node(graph, 1080, 650, 6);

	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 3, 4);
	graph_add_edge(graph, 4, 5);
	graph_add_edge(graph, 5, 6);
	graph_add_edge(graph, 3, 6);
	
	return graph;
}