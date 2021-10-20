// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level52(){
	obj_game.win_num = 32;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 32; i++) {
		graph_add_node(graph, 960 + lengthdir_x(400, (360/32)*i), 490 +lengthdir_y(400, (360/32)*i), i);	
	}

	graph_add_edge(graph, 0,2);
	graph_add_edge(graph, 0,7);
	graph_add_edge(graph, 0,14);
	graph_add_edge(graph, 0,23);
	
	graph_add_edge(graph, 1,6);
	graph_add_edge(graph, 1,13);
	graph_add_edge(graph, 1,22);
	
	graph_add_edge(graph, 2,5);
	graph_add_edge(graph, 2,12);
	graph_add_edge(graph, 2,21);

	graph_add_edge(graph, 3,4);
	graph_add_edge(graph, 3,11);
	graph_add_edge(graph, 3,20);
	graph_add_edge(graph, 3,31);
	
	graph_add_edge(graph, 4,30);
	graph_add_edge(graph, 4,19);
	graph_add_edge(graph, 4,10);
	
	graph_add_edge(graph, 5,29);
	graph_add_edge(graph, 5,18);
	graph_add_edge(graph, 5,9);
	
	graph_add_edge(graph, 6,28);
	graph_add_edge(graph, 6,17);
	graph_add_edge(graph, 6,8);
	
	graph_add_edge(graph, 7,27);
	graph_add_edge(graph, 7,16);
	
	graph_add_edge(graph, 8,26);
	graph_add_edge(graph, 8,15);
	
	graph_add_edge(graph, 9,25);
	graph_add_edge(graph, 9,14);
	
	graph_add_edge(graph, 10,24);
	graph_add_edge(graph, 10,13);
	
	graph_add_edge(graph, 11,23);
	graph_add_edge(graph, 11,12);
	
	graph_add_edge(graph, 12,22);
	
	graph_add_edge(graph, 13,21);
	
	graph_add_edge(graph, 14,20);
	
	graph_add_edge(graph, 15,19);
	
	graph_add_edge(graph, 16,18);
	graph_add_edge(graph, 16,31);
	
	graph_add_edge(graph, 17,30);
	
	graph_add_edge(graph, 18,29);
	
	graph_add_edge(graph, 19,28);
	
	graph_add_edge(graph, 20,27);
	
	graph_add_edge(graph, 21,26);
	
	graph_add_edge(graph, 22,25);
	
	graph_add_edge(graph, 23,24);
	
	return graph;
}