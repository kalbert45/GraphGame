// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level7(){
	obj_game.win_num = 20;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);
	graph_add_node(graph, 960, 490, 0);


	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 3, 4);
	graph_add_edge(graph, 4, 5);
	graph_add_edge(graph, 5, 6);
	graph_add_edge(graph, 3, 6);
	
	return graph;
}