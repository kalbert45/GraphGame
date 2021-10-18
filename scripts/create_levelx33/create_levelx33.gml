// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level33(){
	obj_game.win_num = 60;
	obj_game.win_con = "euler";
	obj_game.max_degree = 4;
	
	var graph = graph_create();


	for (var i = 0; i < 5; i++) {
		graph_add_node(graph, 960 + lengthdir_x(75, 54+72*i), 490 +lengthdir_y(75, 54+72*i), i);	
	}
	for (var i = 5; i < 10; i++) {
		graph_add_node(graph, 960 + lengthdir_x(125, 18+72*i), 490 +lengthdir_y(125, 18+72*i), i);	
	}
	for (var i = 10; i < 20; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 36*i), 490 +lengthdir_y(200, 36*i), i);	
	}
	for (var i = 20; i < 25; i++) {
		graph_add_node(graph, 960 + lengthdir_x(275, 54+72*i), 490 +lengthdir_y(275, 54+72*i), i);	
	}
	for (var i = 25; i < 30; i++) {
		graph_add_node(graph, 960 + lengthdir_x(400, 18+72*i), 490 +lengthdir_y(400, 18+72*i), i);	
	}
	
	for (var i = 0; i < 5; i++) {
		graph_add_edge(graph, i, (i+1) mod 5);
		graph_add_edge(graph, i, i+5);
		graph_add_edge(graph, i, ((i+1) mod 5)+5);
		graph_add_edge(graph, i+10, (i div 2) + 5);
		graph_add_edge(graph, i+15, ((i+5) div 2) + 5);
		graph_add_edge(graph, i+10, i+11);
		graph_add_edge(graph, i+15, ((i+16) mod 10)+10);
		graph_add_edge(graph, i+11, (i div 2) + 20);
		graph_add_edge(graph, ((i+16) mod 10) + 10, ((i+5) div 2) + 20);
		graph_add_edge(graph, i+25, ((i+1) mod 5) + 25);
		graph_add_edge(graph, i+20, i+25);
		graph_add_edge(graph, i+20, ((i+1) mod 5)+25);
	}
	//graph_add_edge(graph, 17, 6);

	
	return graph;
}