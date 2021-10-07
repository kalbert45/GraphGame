// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level14(){
	obj_game.win_num = 7;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 5; i++) {
		graph_add_node(graph, 960 + lengthdir_x(250, 18 + i*72), 490 + lengthdir_y(250, 18 + i*72), i);

	}

	graph_add_node(graph, 960 + lengthdir_x(50, 18), 490 + lengthdir_y(50, 18), 5);
	graph_add_node(graph, 960 + lengthdir_x(50, 18 + 144), 490 + lengthdir_y(50, 18+144), 6);

	graph_add_edge(graph, 0, 1);
	graph_add_edge(graph, 1, 2);
	graph_add_edge(graph, 2, 3);
	graph_add_edge(graph, 3, 4);
	graph_add_edge(graph, 4, 0);
	graph_add_edge(graph, 0, 5);
	graph_add_edge(graph, 2, 6);
	graph_add_edge(graph, 1, 5);
	graph_add_edge(graph, 1, 6);
	graph_add_edge(graph, 4, 5);
	graph_add_edge(graph, 3, 6);	

	return graph;
}