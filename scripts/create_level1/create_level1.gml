// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level1(){
	obj_game.win_num = 14;
	obj_game.win_con = "hamiltonian"
	
	var graph = graph_create();

	graph_add_node(graph, 400, 100, 0);
	graph_add_node(graph, 1000, 100, 1);
	graph_add_node(graph, 1000, 700, 2);
	graph_add_node(graph, 400, 700, 3);
	graph_add_node(graph, 600, 650, 4);
	graph_add_node(graph, 900, 600, 5);
	graph_add_node(graph, 450, 500, 6);
	graph_add_node(graph, 500, 200, 7);
	graph_add_node(graph, 800, 150, 8);
	graph_add_node(graph, 950, 300, 9);
	graph_add_node(graph, 750, 450, 10);
	graph_add_node(graph, 650, 450, 11);
	graph_add_node(graph, 650, 350, 12);
	graph_add_node(graph, 750, 350, 13);

	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 3, 0);
	graph_add_edge(graph, 0, 7);
	graph_add_edge(graph, 7, 12);
	graph_add_edge(graph, 10, 12);
	graph_add_edge(graph, 5, 10);
	graph_add_edge(graph, 5, 2);
	graph_add_edge(graph, 3, 6);
	graph_add_edge(graph, 3, 4);
	graph_add_edge(graph, 4, 11);
	graph_add_edge(graph, 6, 11);
	graph_add_edge(graph, 7, 6);
	graph_add_edge(graph, 10, 11);
	graph_add_edge(graph, 11, 12);
	graph_add_edge(graph, 4, 5);
	graph_add_edge(graph, 1, 8);
	graph_add_edge(graph, 1, 9);
	graph_add_edge(graph, 7, 8);
	graph_add_edge(graph, 5, 9);
	graph_add_edge(graph, 8, 13);
	graph_add_edge(graph, 9, 13);
	graph_add_edge(graph, 13, 12);
	graph_add_edge(graph, 10, 13);
	
	return graph
}