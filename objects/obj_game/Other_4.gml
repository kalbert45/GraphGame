/// initialize global variables
global.selected = undefined; // selected vertex
global.v_prev_deselect = undefined; // previous deselected vertex for drawing waning line
global.v_prev_select = undefined; // previous selected vertex for drawing waxing line
global.mouse_activated = false; // checks whether mouse is held down after clicking on vertex
global.cleared = false; // checks whether level was cleared

graph_destroy(graph);

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

// create level
if (room == room_end) {
	graph = create_end();
}
else if (room == room_level) {
	switch (global.level) {
		case 1:
			graph = create_level1(); break;
		case 2:
			graph = create_level2(); break;
		case 3:
			graph = create_level3(); break;
		case 4:
			graph = create_level4(); break;
		case 5:
			graph = create_level5(); break;
		case 6:
			graph = create_level6(); break;
		case 7:
			graph = create_level7(); break;
		case 8:
			graph = create_level8(); break;
		case 9:
			graph = create_level9(); break;
		case 10:
			graph = create_level10(); break;
		case 11:
			graph = create_level11(); break;
		case 12:
			graph = create_level12(); break;
		case 13:
			graph = create_level13(); break;
		case 14:
			graph = create_level14(); break;
		case 15:
			graph = create_level15(); break;
		case 16:
			graph = create_level16(); break;
		case 17:
			graph = create_level17(); break;
		case 18:
			graph = create_level18(); break;
		case 19:
			graph = create_level19(); break;
		case 20:
			graph = create_level20(); break;
		case 21:
			graph = create_level21(); break;
		case 22:
			graph = create_level22(); break;
		case 23:
			graph = create_level23(); break;
		case 24:
			graph = create_level24(); break;
		case 25:
			graph = create_level25(); break;
		case 26:
			graph = create_level26(); break;
		case 27:
			graph = create_level27(); break;
		case 28:
			graph = create_level28(); break;
		case 29:
			graph = create_level29(); break;
		case 30:
			graph = create_level30(); break;
		case 31:
			graph = create_level31(); break;
		case 32:
			graph = create_level32(); break;
		case 33:
			graph = create_level33(); break;
		case 34:
			graph = create_level34(); break;
		case 35:
			graph = create_level35(); break;
		case 36:
			graph = create_level36(); break;
		case 37:
			graph = create_level37(); break;
		case 38:
			graph = create_level38(); break;
		case 39:
			graph = create_level39(); break;
		case 40:
			graph = create_level40(); break;
		case 41:
			graph = create_level41(); break;
		case 42:
			graph = create_level42(); break;
		case 43:
			graph = create_level43(); break;
		case 44:
			graph = create_level44(); break;
		case 45:
			graph = create_level45(); break;
		case 46:
			graph = create_level46(); break;
		case 47:
			graph = create_level47(); break;
		case 48:
			graph = create_level48(); break;
		case 49:
			graph = create_level49(); break;
		case 50:
			graph = create_level50(); break;
		case 51:
			graph = create_level51(); break;
		case 52:
			graph = create_level52(); break;
		case 53:
			graph = create_level53(); break;
		case 54:
			graph = create_level54(); break;
		case 55:
			graph = create_level55(); break;
		case 56:
			graph = create_level56(); break;
		case 57:
			graph = create_level57(); break;
		case 58:
			graph = create_level58(); break;
		case 59:
			graph = create_level59(); break;
		case 60:
			graph = create_level60(); break;
		default:
			graph = ds_map_create();
	}
}

//else if (room == room_level4) { // create level 2
//	graph = create_level4();
//}
