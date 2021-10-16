/// @description Insert description here
// You can write your code in this editor
if (room == room_levelselect && global.level > num_levels/2) {
	
	select = -2;	
	camera_curve_pos[0] = 1;
	
}
else {
	select = -1;	// selected menu option, -1 means nothing selected
	camera_curve_pos[0] = 0;
}		

menu_control = true; // player control of menu
current_level = global.level;

camera_curve_pos[1] = 0;
next_alpha_curve_pos = 0;
clear_timer_curve_pos = 0;

pause_time = false;