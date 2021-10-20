// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level18(){
	obj_game.win_num = 12;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	graph_add_node(graph, 660, 190, 0);
	graph_add_node(graph, 1260, 190, 1);
	graph_add_node(graph, 1260, 790, 2);
	graph_add_node(graph, 660, 790, 3);
	graph_add_node(graph, 960, 240, 4);
	graph_add_node(graph, 710, 490, 5);
	graph_add_node(graph, 960, 740, 6);
	graph_add_node(graph, 1210, 490, 7);
	graph_add_node(graph, 860, 390, 8);
	graph_add_node(graph, 860, 590, 9);
	graph_add_node(graph, 1060, 390, 10);
	graph_add_node(graph, 1060, 590, 11);

	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 0, 3);
	graph_add_edge(graph, 0, 4);
	graph_add_edge(graph, 0, 5);
	graph_add_edge(graph, 1, 4);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 1, 7);
	graph_add_edge(graph, 2, 7);
	graph_add_edge(graph, 2, 6);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 3, 5);
	graph_add_edge(graph, 3, 6);
	graph_add_edge(graph, 4, 8);
	graph_add_edge(graph, 4, 10);
	graph_add_edge(graph, 5, 8);
	graph_add_edge(graph, 5, 9);
	graph_add_edge(graph, 6, 9);
	graph_add_edge(graph, 6, 11);
	graph_add_edge(graph, 7, 10);
	graph_add_edge(graph, 7, 11);
	graph_add_edge(graph, 8, 9);
	graph_add_edge(graph, 8, 10);
	graph_add_edge(graph, 9, 11);
	graph_add_edge(graph, 10, 11);
	
	
	return graph;
}