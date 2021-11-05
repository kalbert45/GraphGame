// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_end(){
	obj_game.win_num = 34;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	// 960->
	for (var i = 0; i < 8; i++) {
		graph_add_node(graph, 960-(420/7)*i, 490+350-(280/7)*i, i);
	}
	for (i = 8; i < 17; i++) {
		graph_add_node(graph, 960-250+lengthdir_x(250, 42+(i-8)*21), 490-115+lengthdir_y(250, 42+(i-8)*21), i);	
	}
	
	for (i = 17; i < 24; i++) {
		graph_add_node(graph, 960+(420/7)*(i-16), 490+350-(280/7)*(i-16), i);
	}
	for (i = 24; i < 33; i++) {
		graph_add_node(graph, 960+250+lengthdir_x(250, 180-(42+(i-24)*21)), 490-115+lengthdir_y(250, 180-(42+(i-24)*21)), i);	
	}
	graph_add_node(graph, 960, 490 - 225, 33);
	
	
	
	
	for (i = 0; i < 7; i++) {
		graph_add_edge(graph, i , i+1);
	}
	for (i = 8; i < 16; i++) {
		graph_add_edge(graph, i , i+1);
	}
	for (i = 17; i < 23; i++) {
		graph_add_edge(graph, i , i+1);
	}
	for (i = 24; i < 32; i++) {
		graph_add_edge(graph, i , i+1);
	}
	graph_add_edge(graph, 7 , 16);
	graph_add_edge(graph, 8 , 33);
	graph_add_edge(graph, 0 , 17);
	graph_add_edge(graph, 23 , 32);
	graph_add_edge(graph, 24 , 33);
	//graph_add_edge(graph, 1 , 2);
	
	return graph;
}