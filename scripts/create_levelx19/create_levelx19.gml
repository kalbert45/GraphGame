// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level19(){
	obj_game.win_num = 20;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 5; i++) {
		graph_add_node(graph, 960 + lengthdir_x(75, 54 +i*72), 490 + lengthdir_y(75, 54+i*72), i);
	}
	for (var i = 5; i < 10; i++) {
		graph_add_node(graph, 960 + lengthdir_x(150, 54 +i*72), 490 + lengthdir_y(150, 54+i*72), i);
	}
	for (var i = 10; i < 15; i++) {
		graph_add_node(graph, 960 + lengthdir_x(200, 90 +i*72), 490 + lengthdir_y(200, 90+i*72), i);
	}
	for (var i = 15; i < 20; i++) {
		graph_add_node(graph, 960 + lengthdir_x(350, 90 +i*72), 490 + lengthdir_y(350, 90+i*72), i);
	}

	for (var i = 0; i < 5; i++) {
		graph_add_edge(graph, i, (i+1) mod 5);	
		graph_add_edge(graph, i, i+5);
		graph_add_edge(graph, i+5, i+10);	
		graph_add_edge(graph, i+5, ((i+9) mod 5)+10);
		graph_add_edge(graph, i+10, i+15);	
		graph_add_edge(graph, i+15, ((i+1) mod 5)+15);
	}


	return graph;
}