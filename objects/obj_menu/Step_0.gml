/// @description check selection
if (room == room_start) {
	submenu[1][1] = clamp(submenu[1][1], 0, 1);
	submenu[0][1] = clamp(submenu[0][1], 0, 1);
	
	if (select == 0) { // level select
		transition_start(room_levelselect, sq_fadeout, sq_fadein);
	}
	else if (select == 1) { // options submenu
		if (camera_curve_pos < 1) {
			camera_curve_pos += camera_curve_speed;
		}
		else {
			menu_control = true;	
		}
		var curveChannel = animcurve_get_channel(curveStruct, "EaseIn");
		var val = animcurve_channel_evaluate(curveChannel, camera_curve_pos);
		obj_camera.cameraX = val * obj_camera.cameraXTo;
		camera_set_view_pos(view_camera[0], obj_camera.cameraX, obj_camera.cameraY);
	}
	else if (select == 2) { // end game
		game_end();
	}
	else if (select == -1) { // go back to menu
		if (camera_curve_pos > 0) {
			camera_curve_pos -= camera_curve_speed;
		}
		else {
			menu_control = true;
		}
		var curveChannel = animcurve_get_channel(curveStruct, "EaseBack");
		var val = animcurve_channel_evaluate(curveChannel, camera_curve_pos);
		obj_camera.cameraX = val * obj_camera.cameraXTo;
		camera_set_view_pos(view_camera[0], obj_camera.cameraX, obj_camera.cameraY);
	}
}
else if (room == room_levelselect) {
	if (select >= 1) {
		transition_start(select+1, sq_fadeout, sq_fadein);	
	}
}

else {

}