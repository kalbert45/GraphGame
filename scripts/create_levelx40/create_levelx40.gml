// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level40(){
	obj_game.win_num = 47;
	obj_game.win_con = "hamiltonian";
	//obj_game.max_degree = 2;
	
	var graph = graph_create();

	for (var i = 0; i < 8; i++) {
		graph_add_node(graph, 960 + lengthdir_x(75, (360/8)*i), 490 +lengthdir_y(75, (360/8)*i), i);	
	}
	for (var i = 8; i < 24; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, (360/16)*(i - 8)), 490 +lengthdir_y(150, (360/16)*(i - 8)), i);	
	}
	for (var i = 24; i < 28; i++) {
		if (i != 24) {
			graph_add_node(graph, 960 + lengthdir_x(300, (360/4)*i), 490 +lengthdir_y(300, (360/4)*i), i);	
		}
	}
	for (var i = 28; i < 32; i++) {
		graph_add_node(graph, 960 + lengthdir_x(500, 45+(360/4)*i), 490 +lengthdir_y(500, 45+(360/4)*i), i);	
	}
	for (var i = 32; i < 36; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, (360/4)*i) + (lengthdir_x(500, 45+(360/4)*i) - lengthdir_x(300, (360/4)*i))/3, 490 +lengthdir_y(300, (360/4)*i) + (lengthdir_y(500, 45+(360/4)*i) - lengthdir_y(300, (360/4)*i))/3, i);	
	}
	for (var i = 36; i < 40; i++) {
		graph_add_node(graph, 960 + lengthdir_x(300, (360/4)*i) + (lengthdir_x(500, 315+(360/4)*i) - lengthdir_x(300, (360/4)*i))/3, 490 +lengthdir_y(300, (360/4)*i) + (lengthdir_y(500, 315+(360/4)*i) - lengthdir_y(300, (360/4)*i))/3, i);	
	}
	for (var i = 40; i < 48; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, (360/16)+(360/8)*i) + (lengthdir_x(500, 45+(360/4)*((i-40) div 2)) - lengthdir_x(150, (360/16)+(360/8)*i))/3, 490 +lengthdir_y(150, (360/16)+(360/8)*i) + (lengthdir_y(500, 45+(360/4)*((i-40) div 2)) - lengthdir_y(150, (360/16)+(360/8)*i))/3, i);	
	}



	for (var i = 0; i < 8; i++) {
		graph_add_edge(graph, i, (i+1) mod 8);
		graph_add_edge(graph, i, 2*i + 8);
		graph_add_edge(graph, 2*i+9, i+40);
	}	
	for (var i = 0; i < 16; i++) {
		graph_add_edge(graph, i+8, ((i+1) mod 16)+8);
	}
	for (var i = 0; i < 4; i++) {
		if (i != 0) {
			graph_add_edge(graph, 4*i+8, i+24);
			graph_add_edge(graph, i+24, i+32);
			graph_add_edge(graph, i+24, i+36);
		}
		graph_add_edge(graph, i+28, ((i+1) mod 4)+28);
		
		graph_add_edge(graph, i+28, i+32);
		graph_add_edge(graph, i+28, ((i+1) mod 4)+36);
		graph_add_edge(graph, 2*i+40, 2*i+41);
		graph_add_edge(graph, i+32, 2*i+40);
		graph_add_edge(graph, ((i+1) mod 4)+36, 2*i+41);
	}


	//graph_add_edge(graph, 0, 2);
	
	return graph;
}