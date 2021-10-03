/// @description check selection
if (room == room_start) {
	if (select == 0) { // level select
		room_goto(room_levelselect);
	}
	else if (select == 1) { // options submenu
		if (curvePosition < 1) {
			curvePosition += curveSpeed;
		}
		else {
			menu_control = true;	
		}
		var curveChannel = animcurve_get_channel(curveStruct, "EaseIn");
		var val = animcurve_channel_evaluate(curveChannel, curvePosition);
		obj_camera.cameraX = val * obj_camera.cameraXTo;
		camera_set_view_pos(view_camera[0], obj_camera.cameraX, obj_camera.cameraY);
	}
	else if (select == 2) { // end game
		game_end();
	}
	else if (select == -1) { // go back to menu
		if (curvePosition > 0) {
			curvePosition -= curveSpeed;
		}
		else {
			menu_control = true;	
		}
		var curveChannel = animcurve_get_channel(curveStruct, "EaseBack");
		var val = animcurve_channel_evaluate(curveChannel, curvePosition);
		obj_camera.cameraX = val * obj_camera.cameraXTo;
		camera_set_view_pos(view_camera[0], obj_camera.cameraX, obj_camera.cameraY);
	}
}