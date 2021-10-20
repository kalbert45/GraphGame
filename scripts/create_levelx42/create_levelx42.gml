// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level42(){
	obj_game.win_num = 48;
	obj_game.win_con = "euler";
	obj_game.max_degree = 4;
	
	var graph = graph_create();

	graph_add_node(graph, 660, 190, 0);
	graph_add_node(graph, 1260, 190, 1);
	graph_add_node(graph, 1260, 790, 2);
	graph_add_node(graph, 660, 790, 3);
	
	graph_add_node(graph, 856, 240, 4);
	graph_add_node(graph, 1064, 240, 5);
	graph_add_node(graph, 856, 740, 6);
	graph_add_node(graph, 1064, 740, 7);
	graph_add_node(graph, 710, 386, 8);
	graph_add_node(graph, 710, 594, 9);
	graph_add_node(graph, 1210, 386, 10);
	graph_add_node(graph, 1210, 594, 11);
	
	graph_add_node(graph, 898, 340, 12);
	graph_add_node(graph, 1022, 340, 13);
	graph_add_node(graph, 898, 640, 14);
	graph_add_node(graph, 1022, 640, 15);
	graph_add_node(graph, 810, 428, 16);
	graph_add_node(graph, 810, 552, 17);
	graph_add_node(graph, 1110, 428, 18);
	graph_add_node(graph, 1110, 552, 19);
	
	graph_add_node(graph, 900, 430, 20);
	graph_add_node(graph, 900, 550, 21);
	graph_add_node(graph, 1020, 430, 22);
	graph_add_node(graph, 1020, 550, 23);



	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 0, 4);
	graph_add_edge(graph, 0, 8);
	graph_add_edge(graph, 0, 3);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 1, 5);
	graph_add_edge(graph, 1, 10);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 2, 7);
	graph_add_edge(graph, 2, 11);
	graph_add_edge(graph, 3, 6);
	graph_add_edge(graph, 3, 9);
	graph_add_edge(graph, 4, 8);
	graph_add_edge(graph, 4, 12);
	graph_add_edge(graph, 4, 5);
	graph_add_edge(graph, 5, 13);
	graph_add_edge(graph, 5, 10);
	graph_add_edge(graph, 6, 14);
	graph_add_edge(graph, 6, 7);
	graph_add_edge(graph, 6, 9);
	graph_add_edge(graph, 7, 15);
	graph_add_edge(graph, 7, 11);
	graph_add_edge(graph, 8, 9);
	graph_add_edge(graph, 8, 16);
	graph_add_edge(graph, 9, 17);
	graph_add_edge(graph, 10, 11);
	graph_add_edge(graph, 10, 18);
	graph_add_edge(graph, 11, 19);
	graph_add_edge(graph, 12, 13);
	graph_add_edge(graph, 12, 16);
	graph_add_edge(graph, 12, 20);
	graph_add_edge(graph, 13, 18);
	graph_add_edge(graph, 13, 22);
	graph_add_edge(graph, 14, 17);
	graph_add_edge(graph, 14, 15);
	graph_add_edge(graph, 14, 21);
	graph_add_edge(graph, 15, 19);
	graph_add_edge(graph, 15, 23);
	graph_add_edge(graph, 16, 17);
	graph_add_edge(graph, 16, 20);
	graph_add_edge(graph, 17, 21);
	graph_add_edge(graph, 18, 19);
	graph_add_edge(graph, 18, 22);
	graph_add_edge(graph, 19, 23);
	graph_add_edge(graph, 20, 21);
	graph_add_edge(graph, 20, 22);
	graph_add_edge(graph, 21, 23);
	graph_add_edge(graph, 22, 23);

	
	return graph;
}