// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level5(){
	obj_game.win_num = 4;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	graph_add_node(graph, 960, 170, 0);
	graph_add_node(graph, 960, 490, 1);
	graph_add_node(graph, 1237, 650, 2);
	graph_add_node(graph, 683, 650, 3);


	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 2, 1);
	graph_add_edge(graph, 3, 1);
	graph_add_edge(graph, 0, 2);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 0, 3);
	
	return graph;
}