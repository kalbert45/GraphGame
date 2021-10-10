// Draws menu item
// returns animation curve position cuz it has to
function draw_level_item_blue(xx, yy, txt, button, curveStruct, curve_pos, curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd){
	var txt_scale = 1;
	var goal_scale = (min_scale * !mouse_hover) + (max_scale * mouse_hover); // Calculate goal scale
	
	if (mouse_hover && obj_menu.menu_control) {
		//if (curve_pos == curve_speed) { // hacky way to play sound once
		//	audio_play_sound(menu_hover, 0, false);
		//}
		
		if (curve_pos < 1) {
			curve_pos += curve_speed;
		}
		var curveChannel = animcurve_get_channel(curveStruct, "Line");
		var val = animcurve_channel_evaluate(curveChannel, curve_pos);
			
		draw_set_color($FFEEAA);
			
		shader_set(FontShader);
		shader_set_uniform_f(uni_shade, -0.5*menu_shade * val);
			
		var txt_scale = lerp(1, goal_scale, scale_spd);
		//draw_text(xx, yy, txt);
		draw_text_transformed(xx,yy,txt, txt_scale, txt_scale, 0);
			
		shader_reset();
		}
	else {
		
		if (curve_pos > 0) {
			curve_pos -= curve_speed;
		}
		var curveChannel = animcurve_get_channel(curveStruct, "Line");
		var val = animcurve_channel_evaluate(curveChannel, curve_pos);
			
		draw_set_color($FFEEAA);
			
		shader_set(FontShader);
		shader_set_uniform_f(uni_shade, -0.5*menu_shade * val);
			
		txt_scale = lerp(txt_scale, goal_scale, scale_spd);
		draw_text_transformed(xx,yy,txt, txt_scale, txt_scale, 0);
		//draw_text(xx, yy, txt);
		shader_reset();
	}
	return curve_pos;
}