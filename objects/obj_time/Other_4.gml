/// @description Insert description here
// You can write your code in this editor
if (room == room_level) {
	start_time = current_time - (global.cleared_levels[obj_menu.current_level-1][2][0] * 60 * 60 * 1000) - (global.cleared_levels[obj_menu.current_level-1][2][1] * 60 * 1000) - (global.cleared_levels[obj_menu.current_level-1][2][2] * 1000);
	
	best_time = global.cleared_levels[obj_menu.current_level-1][1];
}
