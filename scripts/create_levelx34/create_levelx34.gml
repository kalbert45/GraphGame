// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level34(){
	obj_game.win_num = 60;
	obj_game.win_con = "euler";
	obj_game.max_degree = 4;
	
	var graph = graph_create();


	for (var i = 0; i < 10; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 36*i), 490 +lengthdir_y(200, 36*i), i);	
	}
	for (var i = 0; i < 10; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 36*i)+lengthdir_x(50, 18+(72*((i) div 2))), 490 +lengthdir_y(200, 36*i)+lengthdir_y(50, 18+(72*((i) div 2))), i+10);	
		graph_add_node(graph, 960 + lengthdir_x(200, 36*i)+lengthdir_x(100, 18+(72*((i) div 2))), 490 +lengthdir_y(200, 36*i)+lengthdir_y(100, 18+(72*((i) div 2))), i+20);	
		graph_add_node(graph, 960 + lengthdir_x(200, 36*i)+lengthdir_x(150, 18+(72*((i) div 2))), 490 +lengthdir_y(200, 36*i)+lengthdir_y(150, 18+(72*((i) div 2))), i+30);	
		graph_add_node(graph, 960 + lengthdir_x(200, 36*i)+lengthdir_x(200, 18+(72*((i) div 2))), 490 +lengthdir_y(200, 36*i)+lengthdir_y(200, 18+(72*((i) div 2))), i+40);	
		graph_add_node(graph, 960 + lengthdir_x(200, 36*i)+lengthdir_x(250, 18+(72*((i) div 2))), 490 +lengthdir_y(200, 36*i)+lengthdir_y(250, 18+(72*((i) div 2))), i+50);	
	}
	for (var i = 60; i < 65; i++) {
		graph_add_node(graph, 960 + lengthdir_x(240, 18+72*i), 490 +lengthdir_y(240, 18+72*i), i);	
	}
	for (var i = 65; i < 70; i++) {
		graph_add_node(graph, 960 + lengthdir_x(390, 18+72*i), 490 +lengthdir_y(390, 18+72*i), i);	
	}	

	for (var i = 0; i < 10; i++) {
		if (i % 2 == 0) {
			graph_add_edge(graph, i, (i+7) mod 10);	
			graph_add_edge(graph, i, ((i+1) mod 10)+10);
			graph_add_edge(graph, i+10, ((i+1) mod 10)+20);
			graph_add_edge(graph, i+30, ((i+1) mod 10)+40);
			graph_add_edge(graph, i+40, ((i+1) mod 10)+50);
		}
		else {
			graph_add_edge(graph, i, (i+3) mod 10);	
			graph_add_edge(graph, i, ((i+9) mod 10)+10);	
			graph_add_edge(graph, i+10, ((i+9) mod 10)+20);
			graph_add_edge(graph, i+30, ((i+9) mod 10)+40);
			graph_add_edge(graph, i+40, ((i+9) mod 10)+50);
			graph_add_edge(graph, i+50, ((i+1) mod 10)+50);
		}
		graph_add_edge(graph, i, i+10);	
		graph_add_edge(graph, i+10, i+20);
		graph_add_edge(graph, i+20, i+30);
		graph_add_edge(graph, i+30, i+40);
		graph_add_edge(graph, i+40, i+50);	
		graph_add_edge(graph, i, (i div 2)+60);
		graph_add_edge(graph, i+20, (i div 2)+60);
		graph_add_edge(graph, i+30, (i div 2)+65);
		graph_add_edge(graph, i+50, (i div 2)+65);
	}
	//graph_add_edge(graph, 17, 6);

	
	return graph;
}