/// @description Insert description here
// You can write your code in this editor
if (room = room_level) {
	var time_diff = current_time - start_time;
	current_hr = time_diff div (60*60*1000);
	current_min = (time_diff % (60*60*1000)) div (60*1000);
	current_sec = ((time_diff % (60*60*1000)) % (60*1000)) div 1000;
	
	if (obj_menu.pause_time) {
		start_time += delta_time/1000; // keeps timer paused
	}
	
	if (!global.cleared) {
		global.cleared_levels[obj_menu.current_level-1][2] = [current_hr,current_min, current_sec];
	}
	else {
		if (!obj_menu.pause_time) {
			start_time += delta_time/1000; // pause time but not double
		}
		global.cleared_levels[obj_menu.current_level-1][1] = [current_hr,current_min, current_sec];
		global.cleared_levels[obj_menu.current_level-1][2] = [0,0,0];
	}
	
}