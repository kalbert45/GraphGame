// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_level25(){
	obj_game.win_num = 59;
	obj_game.win_con = "hamiltonian";
	
	var graph = graph_create();

	for (var i = 0; i < 3; i++) {
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i), 540+ lengthdir_y(200, 30+120*i), i);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(50, 90 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(50, 90 + 120*i), i+3);
		if (!i==0) {
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(50, -30 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(50, -30 + 120*i), i+6);
		}
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(100, 90 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(100, 90 + 120*i), i+9);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(100, -30 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(100, -30 + 120*i), i+12);
		
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(150, 90 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(150, 90 + 120*i), i+15);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(150, -30 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(150, -30 + 120*i), i+18);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(250, 90 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(250, 90 + 120*i), i+21);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(250, -30 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(250, -30 + 120*i), i+24);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(300, 90 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(300, 90 + 120*i), i+27);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(300, -30 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(300, -30 + 120*i), i+30);
		
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(100, 90 + 120*i)+lengthdir_x(50, 150 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(100, 90 + 120*i)+lengthdir_y(50, 150 + 120*i), i+33);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(100, -30 + 120*i)+lengthdir_x(50, -90+120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(100, -30 + 120*i)+lengthdir_y(50, -90+120*i), i+36);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(100, 90 + 120*i)+lengthdir_x(150, 150 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(100, 90 + 120*i)+lengthdir_y(150, 150 + 120*i), i+39);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(100, -30 + 120*i)+lengthdir_x(150, -90+120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(100, -30 + 120*i)+lengthdir_y(150, -90+120*i), i+42);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(100, 90 + 120*i)+lengthdir_x(200, 150 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(100, 90 + 120*i)+lengthdir_y(200, 150 + 120*i), i+45);
		
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(300, 90 + 120*i)+lengthdir_x(50, 210 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(300, 90 + 120*i)+lengthdir_y(50, 210 + 120*i), i+48);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(300, -30 + 120*i)+lengthdir_x(50, -150+120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(300, -30 + 120*i)+lengthdir_y(50, -150+120*i), i+51);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(300, 90 + 120*i)+lengthdir_x(150, 210 + 120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(300, 90 + 120*i)+lengthdir_y(150, 210 + 120*i), i+54);
		graph_add_node(graph, 960+ lengthdir_x(200, 30 + 120*i)+lengthdir_x(300, -30 + 120*i)+lengthdir_x(150, -150+120*i) , 540+ lengthdir_y(200, 30+120*i)+lengthdir_y(300, -30 + 120*i)+lengthdir_y(150, -150+120*i), i+57);

	}


	for (var i = 0; i<3; i++) {
		graph_add_edge(graph, i, (i+1) mod 3);
		graph_add_edge(graph, i, i+3);
		if (!(i==0)) {
		graph_add_edge(graph, i, i+6);
		}
		graph_add_edge(graph, i+3, i+9);
		if(!(i==0)){
		graph_add_edge(graph, i+6, i+12);
		}
		graph_add_edge(graph, i+9, i+15);
		graph_add_edge(graph, i+12, i+18);
		graph_add_edge(graph, i+15, i+21);
		graph_add_edge(graph, i+18, i+24);
		graph_add_edge(graph, i+21, i+27);
		graph_add_edge(graph, i+24, i+30);
		
		graph_add_edge(graph, i+9, i+33);
		graph_add_edge(graph, i+12, i+36);
		graph_add_edge(graph, i+33, i+39);
		graph_add_edge(graph, i+36, i+42);
		
		graph_add_edge(graph, i+39, i+45);
		
		//if (!i==1) {
		//}
		graph_add_edge(graph, i+27, i+48);
		graph_add_edge(graph, i+30, i+51);
		graph_add_edge(graph, i+48, i+54);
		graph_add_edge(graph, i+51, i+57);
		
		graph_add_edge(graph, i+54, i+45);
		
		
		graph_add_edge(graph, i+33, i+48);
		graph_add_edge(graph, i+36, i+51);
		
		graph_add_edge(graph, i+15, i+54);
		graph_add_edge(graph, i+18, i+57);
		
		graph_add_edge(graph, i+21, i+39);
		graph_add_edge(graph, i+24, i+42);
		
		if (!(i==2)) {
		graph_add_edge(graph, i+3, ((i+1) mod 3) + 6);
		}
		graph_add_edge(graph, i+9, ((i+1) mod 3) + 12);
		graph_add_edge(graph, i+27, ((i+1) mod 3) + 30);
		graph_add_edge(graph, i+27, i + 30);
	}
//	graph_add_edge(graph, 0, 4);

	graph_add_edge(graph, 42, 47);
	graph_add_edge(graph, 44, 46);
	
	graph_add_edge(graph, 57, 47);
	graph_add_edge(graph, 59, 46);
	
	graph_add_edge(graph, 43, 45);
	graph_add_edge(graph, 58, 45);
	
	return graph;
}