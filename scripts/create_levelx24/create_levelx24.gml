// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level24(){
	obj_game.win_num = 17;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 16; i++) {
		graph_add_node(graph, 960+ lengthdir_x(300, 11.25 + 22.5*i), 490+ lengthdir_y(300, 11.25+22.5*i), i);	
	}
	graph_add_node(graph, 960, 490, 16);

	
	for (var i=0; i < 16; i++) {
		if (i == 3) {
			continue;	
		}
		graph_add_edge(graph, i, (i+1) mod 16);	
	}
	graph_add_edge(graph, 0, 4);
	graph_add_edge(graph, 1, 16);
	graph_add_edge(graph, 2, 13);
	graph_add_edge(graph, 3, 7);
	graph_add_edge(graph, 5, 10);
	graph_add_edge(graph, 6, 16);
	graph_add_edge(graph, 8, 12);
	graph_add_edge(graph, 9, 14);
	graph_add_edge(graph, 11,15);

	
	return graph;
}