/// initialize global variables
global.selected = undefined; // selected vertex
global.v_prev_deselect = undefined; // previous deselected vertex for drawing waning line
global.mouse_activated = false; // checks whether mouse is held down after clicking on vertex
global.cleared = false; // checks whether level was cleared

graph_destroy(graph); // reset graph upon each room start


clear_audio_played = false; // ugly way to make clear audio play once

// number of vertices / edges (dependent on win condition) needed to win
win_num = 0;

// possible win conditions: euler, hamiltonian
win_con = undefined;

// max vertex degree; only important for euler levels
max_degree = 0;

/// variables for keeping track of activated points on graph
act_line = ds_list_create(); // points on activated line

act_edge_count = 0; // number of activated edges

if (global.level == 1) { // create level 1
	graph = create_level1();
}
else if (global.level == 2) { // create level 2
	graph = create_level2();
}
else if (global.level == 3) { // create level 3
	graph = create_level3();
}
else if (global.level == 4) { // create level 4
	graph = create_level4();
}
else if (global.level == 5) { // create level 5
	graph = create_level5();
}
else if (global.level == 6) { // create level 6
	graph = create_level6();
}
else if (global.level == 7) { // create level 7
	graph = create_level7();
}
else if (global.level == 8) { // create level 8
	graph = create_level8();
}
else if (global.level == 9) { // create level 9
	graph = create_level9();
}
else if (global.level == 10) { // create level 10
	graph = create_level10();
}
else {
	graph = ds_map_create();	
}
//else if (room == room_level4) { // create level 2
//	graph = create_level4();
//}
