// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level38(){
	obj_game.win_num = 23;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	graph_add_node(graph, 960 + 150, 490, 0);
	graph_add_node(graph, 960 + 330, 490, 1);
	graph_add_node(graph, 960 + 210, 490 - 75, 2);
	graph_add_node(graph, 960 + 210, 490 + 75, 3);
	graph_add_node(graph, 960 + 270, 490 - 75, 4);
	graph_add_node(graph, 960 + 270, 490 + 75, 5);
	graph_add_node(graph, 960 + 130, 490 - 100, 6);
	graph_add_node(graph, 960 + 130, 490 + 100, 7);
	graph_add_node(graph, 960 + 350, 490 - 100, 8);
	graph_add_node(graph, 960 + 350, 490 + 100, 9);
	
	graph_add_node(graph, 960 - 150, 490, 10);
	graph_add_node(graph, 960 - 330, 490, 11);
	graph_add_node(graph, 960 - 210, 490 - 75, 12);
	graph_add_node(graph, 960 - 210, 490 + 75, 13);
	graph_add_node(graph, 960 - 270, 490 - 75, 14);
	graph_add_node(graph, 960 - 270, 490 + 75, 15);
	graph_add_node(graph, 960 - 130, 490 - 100, 16);
	graph_add_node(graph, 960 - 130, 490 + 100, 17);
	graph_add_node(graph, 960 - 350, 490 - 100, 18);
	graph_add_node(graph, 960 - 350, 490 + 100, 19);
	
	graph_add_node(graph, 960, 490 - 200, 20);
	graph_add_node(graph, 960 + 50, 490 + 250, 21);
	graph_add_node(graph, 960 - 50, 490 + 250, 22);

	
	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 4, 5);
	graph_add_edge(graph, 0, 6);
	graph_add_edge(graph, 0, 7);
	graph_add_edge(graph, 2, 6);
	graph_add_edge(graph, 3, 7);
	graph_add_edge(graph, 2, 4);
	graph_add_edge(graph, 3, 5);
	graph_add_edge(graph, 4, 8);
	graph_add_edge(graph, 5, 9);
	graph_add_edge(graph, 1, 8);
	graph_add_edge(graph, 1, 9);
	
	graph_add_edge(graph, 10, 11);
	graph_add_edge(graph, 12, 13);
	graph_add_edge(graph, 14, 15);
	graph_add_edge(graph, 10, 16);
	graph_add_edge(graph, 10, 17);
	graph_add_edge(graph, 12, 16);
	graph_add_edge(graph, 13, 17);
	graph_add_edge(graph, 12, 14);
	graph_add_edge(graph, 13, 15);
	graph_add_edge(graph, 14, 18);
	graph_add_edge(graph, 15, 19);
	graph_add_edge(graph, 11, 18);
	graph_add_edge(graph, 11, 19);

	graph_add_edge(graph, 6, 20);
	graph_add_edge(graph, 16, 20);
	graph_add_edge(graph, 7, 22);
	graph_add_edge(graph, 17, 21);
	graph_add_edge(graph, 21, 22);
	graph_add_edge(graph, 21, 9);
	graph_add_edge(graph, 22, 19);
	//graph_add_edge(graph, 0, 2);
	
	return graph;
}