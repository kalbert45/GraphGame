/// @description Insert description here
// You can write your code in this editor
if (room == room_level) {
	if (best_time[0] < current_hr) {
		global.cleared_levels[obj_menu.current_level-1][1] = best_time;
	}

	else if (best_time[1] < current_min) {
			global.cleared_levels[obj_menu.current_level-1][1] = best_time;	
	}
	else if (best_time[2] < current_sec) {
			global.cleared_levels[obj_menu.current_level-1][1] = best_time;	
	}
}