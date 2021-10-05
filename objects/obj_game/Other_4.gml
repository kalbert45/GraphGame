/// initialize global variables
global.selected = undefined; // selected vertex
global.mouse_activated = false; // checks whether mouse is held down after clicking on vertex
global.cleared = false; // checks whether level was cleared

clear_audio_played = false; // ugly way to make clear audio play once

// number of vertices / edges (dependent on win condition) needed to win
win_num = 0;

// possible win conditions: euler, hamiltonian
win_con = undefined;

// max vertex degree; only important for euler levels
//max_degree = 0;

/// variables for keeping track of activated points on graph
act_line = ds_list_create(); // points on activated line

act_edge_count = 0; // number of activated edges

if (room == room_level1) { // create level 1
	graph = create_level1();
}
if (room == room_level2) { // create level 2
	graph = create_level2();
}
