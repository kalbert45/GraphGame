// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level25(){
	obj_game.win_num = 59;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 3; i++) {
		graph_add_node(graph, 960+ lengthdir_x(100, 30 + 120*i), 490+ lengthdir_y(100, 30+120*i), i);
		graph_add_node(graph, 960+ lengthdir_x(100, 30 + 120*i)+lengthdir_x(50, 90 + 120*i) , 490+ lengthdir_y(100, 30+120*i)+lengthdir_y(50, 90 + 120*i), i+3);
		graph_add_node(graph, 960+ lengthdir_x(100, 30 + 120*i)+lengthdir_x(50, -30 + 120*i) , 490+ lengthdir_y(100, 30+120*i)+lengthdir_y(50, -30 + 120*i), i+6);
		graph_add_node(graph, 960+ lengthdir_x(100, 30 + 120*i)+lengthdir_x(100, 90 + 120*i) , 490+ lengthdir_y(100, 30+120*i)+lengthdir_y(100, 90 + 120*i), i+9);
		graph_add_node(graph, 960+ lengthdir_x(100, 30 + 120*i)+lengthdir_x(100, -30 + 120*i) , 490+ lengthdir_y(100, 30+120*i)+lengthdir_y(100, -30 + 120*i), i+12);
	}

//	graph_add_edge(graph, 0, 4);


	
	return graph;
}