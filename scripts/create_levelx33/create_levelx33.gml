// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level33(){
	obj_game.win_num = 40;
	obj_game.win_con = "euler";
	obj_game.max_degree = 4;
	
	var graph = graph_create();


	for (var i = 0; i < 4; i++) {
		graph_add_node(graph, 960 + lengthdir_x(100, 45+90*i), 490 +lengthdir_y(100, 45+90*i), i);	
		graph_add_node(graph, 960 + lengthdir_x(200, 45+90*i), 490 +lengthdir_y(200, 45+90*i), i+4);	
		graph_add_node(graph, 960 + lengthdir_x(300, 45+90*i), 490 +lengthdir_y(300, 45+90*i), i+8);	
		graph_add_node(graph, 960 + lengthdir_x(400, 45+90*i), 490 +lengthdir_y(400, 45+90*i), i+12);	
		graph_add_node(graph, 960 + lengthdir_x(500, 45+90*i), 490 +lengthdir_y(500, 45+90*i), i+16);	
	}
	
	for (var i = 0; i < 4; i++) {
		graph_add_edge(graph, i, ((i+1) mod 4));
		graph_add_edge(graph, i+4, ((i+1) mod 4)+4);
		graph_add_edge(graph, i+8, ((i+1) mod 4)+8);
		graph_add_edge(graph, i+12, ((i+1) mod 4)+12);
		graph_add_edge(graph, i+16, ((i+1) mod 4)+16);
	}
	graph_add_edge(graph, 3, 4);
	graph_add_edge(graph, 3, 6);
	graph_add_edge(graph, 7, 8);
	graph_add_edge(graph, 7, 10);
	graph_add_edge(graph, 11, 12);
	graph_add_edge(graph, 11, 14);
	graph_add_edge(graph, 15, 16);
	graph_add_edge(graph, 15, 18);
	graph_add_edge(graph, 19, 0);
	graph_add_edge(graph, 19, 2);
	
	graph_add_edge(graph, 1, 8);
	graph_add_edge(graph, 1, 10);
	graph_add_edge(graph, 5, 12);
	graph_add_edge(graph, 5, 14);
	graph_add_edge(graph, 9, 16);
	graph_add_edge(graph, 9, 18);
	graph_add_edge(graph, 13, 0);
	graph_add_edge(graph, 13, 2);
	graph_add_edge(graph, 17, 4);
	graph_add_edge(graph, 17, 6);

	
	return graph;
}