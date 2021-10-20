// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level50(){
	obj_game.win_num = 31;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	for (var i = 0; i < 4; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, (360/4)*i), 490 +lengthdir_y(200, (360/4)*i), i);	
	}
	for (var i = 4; i < 8; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 90*i)+lengthdir_x(94, 135+90*i), 490 +lengthdir_y(200, 90*i)+lengthdir_y(94, 135+90*i), i);	
	}
	for (var i = 8; i < 12; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 90*i)+lengthdir_x(94, 225+90*i), 490 +lengthdir_y(200, 90*i)+lengthdir_y(94, 225+90*i), i);	
	}
	for (var i = 12; i < 16; i++) {
		graph_add_node(graph, 960 + lengthdir_x(400, 45+90*i), 490 +lengthdir_y(400, 45+90*i), i);	
	}
	for (var i = 16; i < 20; i++) {
		if (i != 16) {
			graph_add_node(graph, 960 + lengthdir_x(200, 90*i) + (lengthdir_x(400, 45+90*i) - lengthdir_x(200, 90*i))/3, 490 +lengthdir_y(200, 90*i) + (lengthdir_y(400, 45+90*i) - lengthdir_y(200, 90*i))/3, i);	
		}
	}
	for (var i = 20; i < 24; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 90*i) + 2*(lengthdir_x(400, 45+90*i) - lengthdir_x(200, 90*i))/3, 490 +lengthdir_y(200, 90*i) + 2*(lengthdir_y(400, 45+90*i) - lengthdir_y(200, 90*i))/3, i);	
	}
	for (var i = 24; i < 28; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 90*i) + (lengthdir_x(400, 315+90*i) - lengthdir_x(200, 90*i))/3, 490 +lengthdir_y(200, 90*i) + (lengthdir_y(400, 315+90*i) - lengthdir_y(200, 90*i))/3, i);	
	}
	for (var i = 28; i < 32; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 90*i) + 2*(lengthdir_x(400, 315+90*i) - lengthdir_x(200, 90*i))/3, 490 +lengthdir_y(200, 90*i) + 2*(lengthdir_y(400, 315+90*i) - lengthdir_y(200, 90*i))/3, i);	
	}
	

	graph_add_edge(graph, 1, 3);
	for (var i = 0; i < 4; i++) {
		graph_add_edge(graph, i, i+4);
		graph_add_edge(graph, i, i+8);
		graph_add_edge(graph, i+4, ((i+1) mod 4) + 8);
		graph_add_edge(graph, i+12, ((i+1) mod 4) + 12);
		graph_add_edge(graph, i, i+24);
		graph_add_edge(graph, i+24, i+28);
		graph_add_edge(graph, i+12, ((i+1) mod 4)+28);
		graph_add_edge(graph, i+12, i+20);
		graph_add_edge(graph, i+4, ((i+1) mod 4)+28);
		graph_add_edge(graph, ((i+1) mod 4)+8, i+20);
		if (i != 0) {
			graph_add_edge(graph, i, i+16);	
			graph_add_edge(graph, i+16, i+20);
			graph_add_edge(graph, i+16, ((i+1) mod 4)+24);
		}
	}	


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}