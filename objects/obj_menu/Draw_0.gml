/// @description draw menu

// variables for lerp
var min_scale = 1; // Minimum scale
var max_scale = 1.3; // Maximum scale
var scale_spd = 0.1; // Speed of scaling

if (room == room_start) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);

	// line spacing
	var gap = 120
	
	// draw title
	draw_set_font(TitleFont);
	//draw_set_color(c_black);
	//draw_text(title_x - 5, title_y + 5, title);
	draw_set_color(c_yellow);
	shader_set(FontShader);
	shader_set_uniform_f(uni_shade, - 0.8);
	
	draw_text(title_x, title_y, title);
			
	shader_reset();
	//draw_sprite(spr_vertex, 0, title_x, title_y);
	
	
	//draw 'Options'
	draw_set_font(OptionsFont);
	draw_set_color(c_white);
	draw_text(submenu_x, submenu_y - 2*gap, "Options");
	
	draw_set_font(MenuFont);

	// draw menu
	for (var i = 0; i < menu_items; i++) {
		var txt = menu[i];
		var xx = menu_x;
		var yy = menu_y - gap + i*gap;
		button_menu[i].y = yy - string_height(txt)/2;
		button_menu[i].wl = xx - string_width(txt)/2;
		button_menu[i].wr = xx + string_width(txt)/2;
		button_menu[i].h = string_height(txt);
	
		var mouse_hover = mouse_y > button_menu[i].y && mouse_y < button_menu[i].y + 
									button_menu[i].h && mouse_x < button_menu[i].wr && mouse_x > button_menu[i].wl;
			
		// draw menu item
		menu_shade_curve_pos[i] = draw_menu_item(xx, yy, txt, button_menu[i], curveStruct, menu_shade_curve_pos[i], menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);
	
		if (mouse_hover && menu_control) {
			if (mouse_check_button_pressed(mb_left)) { // click to select
					play_menu_select_sfx();
					select = i;
					menu_control = false;
				}
		}
	}

	// make back button
	var txt = "BACK";
	var xx = room_width - 100;
	var yy = 100;
	back_button.y = yy - string_height(txt)/2;
	back_button.wl = xx - string_width(txt)/2;
	back_button.wr = xx + string_width(txt)/2;
	back_button.h = string_height(txt);
	
	var mouse_hover = mouse_y > back_button.y && mouse_y < back_button.y + 
								back_button.h && mouse_x < back_button.wr && mouse_x > back_button.wl;
	

	back_shade_curve_pos = draw_menu_item(xx, yy, txt, back_button, curveStruct, back_shade_curve_pos, menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);

	if (mouse_hover && menu_control && !global.midTransition) {
		if (mouse_check_button_pressed(mb_left)) { // click to select
				play_menu_select_sfx();
				select = -3;
				menu_control = false;
		}
	}
	// draw credits
	var txt = "Game by";
	var xx = submenu_x + 1920;
	var yy = submenu_y;
	draw_set_color(c_white);
	draw_text(xx, yy, txt);
	
	draw_set_font(OptionsFont);
	var txt = "Albert Kim";
	var xx = submenu_x + 1920;
	var yy = submenu_y +120;
	draw_set_color($FFEEAA);
	draw_text(xx, yy, txt);
	
	draw_set_font(MenuFont);
	var txt = "With thanks to";
	var xx = submenu_x + 1920;
	var yy = submenu_y +240;
	draw_set_color(c_white);
	draw_text(xx, yy, txt);
	
	draw_set_font(CreditsFont);
	var txt = "Vadim Chaimovich & musopen.org - Nocturne in E flat major, op.9 no.2";
	var xx = submenu_x + 1920;
	var yy = submenu_y +290;
	draw_set_color(c_white);
	draw_text(xx, yy, txt);
	
	var txt = "Philatype - Merge font";
	var xx = submenu_x + 1920;
	var yy = submenu_y +340;
	draw_set_color(c_white);
	draw_text(xx, yy, txt);
	
	var txt = "Graphic Pear - Virtuous Slab font";
	var xx = submenu_x + 1920;
	var yy = submenu_y +390;
	draw_set_color(c_white);
	draw_text(xx, yy, txt);
	
	var txt = "99Sounds & Rudi Fiasco - Upright Piano plugin";
	var xx = submenu_x + 1920;
	var yy = submenu_y +440;
	draw_set_color(c_white);
	draw_text(xx, yy, txt);
	
	var txt = "Alan ViSTa - BellsEbuth plugin";
	var xx = submenu_x + 1920;
	var yy = submenu_y +490;
	draw_set_color(c_white);
	draw_text(xx, yy, txt);
	
	var txt = "Johan Aakerlund - Comfortaa font";
	var xx = submenu_x + 1920;
	var yy = submenu_y +540;
	draw_set_color(c_white);
	draw_text(xx, yy, txt);
	
	
	draw_set_font(MenuFont);
	

	// draw options submenu
	for (var j = 0; j < submenu_items; j++) {
		
		var sub_txt = submenu[j][0];
		
		
		if (j == 5) { // credits button on bottom right
			var sub_xx = (2*room_width / 3) - 100;
			var sub_yy = room_height - 100;
			
			options_button_menu[j].y = sub_yy - string_height(sub_txt)/2;
			options_button_menu[j].wl = sub_xx - string_width(sub_txt)/2;
			options_button_menu[j].wr = sub_xx + string_width(sub_txt)/2;
			options_button_menu[j].h = string_height(sub_txt);
	
			var sub_mouse_hover = mouse_y > options_button_menu[j].y && mouse_y < options_button_menu[j].y + 
										options_button_menu[j].h && mouse_x < options_button_menu[j].wr && mouse_x > options_button_menu[j].wl;
	
			// draw submenu item
			submenu_shade_curve_pos[j] = draw_menu_item(sub_xx, sub_yy, sub_txt, options_button_menu[j], curveStruct, submenu_shade_curve_pos[j], menu_shade_curve_speed, uni_shade, menu_shade, sub_mouse_hover, min_scale, max_scale, scale_spd);
			if (sub_mouse_hover && menu_control) {
				if (mouse_check_button_pressed(mb_left)) {
					play_menu_select_sfx();
					select = -2;
					menu_control = false;
				}
			}
		}		
		else if (j == 4) { // back button on top right
			var sub_xx = (2*room_width / 3) - 100;
			var sub_yy = 100;
			
			options_button_menu[j].y = sub_yy - string_height(sub_txt)/2;
			options_button_menu[j].wl = sub_xx - string_width(sub_txt)/2;
			options_button_menu[j].wr = sub_xx + string_width(sub_txt)/2;
			options_button_menu[j].h = string_height(sub_txt);
	
			var sub_mouse_hover = mouse_y > options_button_menu[j].y && mouse_y < options_button_menu[j].y + 
										options_button_menu[j].h && mouse_x < options_button_menu[j].wr && mouse_x > options_button_menu[j].wl;
	
			// draw submenu item
			submenu_shade_curve_pos[j] = draw_menu_item(sub_xx, sub_yy, sub_txt, options_button_menu[j], curveStruct, submenu_shade_curve_pos[j], menu_shade_curve_speed, uni_shade, menu_shade, sub_mouse_hover, min_scale, max_scale, scale_spd);
			if (sub_mouse_hover && menu_control) {
				if (mouse_check_button_pressed(mb_left)) {
					play_menu_select_sfx();
					select = -1;
					menu_control = false;
				}
			}
		}
		else if (j == 3) { // reset progress centered
			var sub_xx = submenu_x;
			var sub_yy = submenu_y + (j+1)*gap;
			
			options_button_menu[j].y = sub_yy - string_height(sub_txt)/2;
			options_button_menu[j].wl = sub_xx - string_width(sub_txt)/2;
			options_button_menu[j].wr = sub_xx + string_width(sub_txt)/2;
			options_button_menu[j].h = string_height(sub_txt);
	
			var sub_mouse_hover = mouse_y > options_button_menu[j].y && mouse_y < options_button_menu[j].y + 
										options_button_menu[j].h && mouse_x < options_button_menu[j].wr && mouse_x > options_button_menu[j].wl;
	
			// draw submenu item
			submenu_shade_curve_pos[j] = draw_menu_item(sub_xx, sub_yy, sub_txt, options_button_menu[j], curveStruct, submenu_shade_curve_pos[j], menu_shade_curve_speed, uni_shade, menu_shade, sub_mouse_hover, min_scale, max_scale, scale_spd);
			if (sub_mouse_hover && menu_control) {
				if (mouse_check_button_pressed(mb_left)) {
					play_menu_select_sfx();
					select = -1;
					menu_control = false;
				}
			}
		}
		else if (j == 2){ // resolution
			// draw words "window size:"
			var sub_xx = submenu_x - string_width(sub_txt)/2;
			var sub_yy = submenu_y + j*gap;
			draw_set_color(c_white);
			draw_text(sub_xx, sub_yy, sub_txt);
			
			// create resolution changing option
			sub_txt = string(obj_camera.window_sizes[obj_camera.current_window][0]) + " x " + string(obj_camera.window_sizes[obj_camera.current_window][1]);
			sub_xx = submenu_x + string_width(sub_txt)/2 + 20;
			
			options_button_menu[j].y = sub_yy - string_height(sub_txt)/2;
			options_button_menu[j].wl = sub_xx - string_width(sub_txt)/2;
			options_button_menu[j].wr = sub_xx + string_width(sub_txt)/2;
			options_button_menu[j].h = string_height(sub_txt);
	
			var sub_mouse_hover = mouse_y > options_button_menu[j].y && mouse_y < options_button_menu[j].y + 
										options_button_menu[j].h && mouse_x < options_button_menu[j].wr && mouse_x > options_button_menu[j].wl;
	
			// draw submenu item
			submenu_shade_curve_pos[j] = draw_menu_item(sub_xx, sub_yy, sub_txt, options_button_menu[j], curveStruct, submenu_shade_curve_pos[j], menu_shade_curve_speed, uni_shade, menu_shade, sub_mouse_hover, min_scale, max_scale, scale_spd);
			if (sub_mouse_hover && menu_control) {
				if (mouse_check_button_pressed(mb_left)) {
					play_menu_select_sfx();
					with (obj_camera) {
						current_window = ((current_window - 1) + (max_window + 1)) mod (max_window + 1);
						
						displayWidth = window_sizes[current_window][0];
						displayHeight = window_sizes[current_window][1];

						window_set_size(displayWidth, displayHeight);
						surface_resize(application_surface, displayWidth, displayHeight);
					}
				}
			}
		}
		else { // bgm and sfx
			var sub_xx = submenu_x - string_width(sub_txt)/2;
			var sub_yy = submenu_y + j*gap;
			// draw slider bar
			draw_set_color(c_dkgrey);
			draw_rectangle(sub_xx + string_width(sub_txt)/2 + 10, sub_yy + string_height(sub_txt)/2 - 5, 
							sub_xx + string_width(sub_txt)/2 + 210, sub_yy - string_height(sub_txt)/2 + 5,false);
			draw_set_color(c_white);
			show_debug_message(j);
			draw_rectangle(sub_xx + string_width(sub_txt)/2 + 10, sub_yy + string_height(sub_txt)/2 - 5, 
							sub_xx + string_width(sub_txt)/2 + 10 + (submenu[j][1] * 200), sub_yy - string_height(sub_txt)/2 + 5,false);
			draw_set_color(c_white);
			draw_text(sub_xx, sub_yy, sub_txt);
			
			options_button_menu[j].y = sub_yy - string_height(sub_txt)/2;
			options_button_menu[j].wl = sub_xx + string_width(sub_txt)/2;
			options_button_menu[j].wr = sub_xx + string_width(sub_txt)/2 + 220;
			options_button_menu[j].h = string_height(sub_txt);
	
			var sub_mouse_hover = mouse_y > options_button_menu[j].y && mouse_y < options_button_menu[j].y + 
											options_button_menu[j].h && mouse_x < options_button_menu[j].wr && mouse_x > options_button_menu[j].wl;
	
			// draw submenu item
			if (sub_mouse_hover && menu_control) {
				if (mouse_check_button(mb_left)) {
					submenu[j][1] = (mouse_x - options_button_menu[j].wl - 10) / 200;
					if (j == 1) {
						audio_group_set_gain(ag_SFX, (submenu[j][1] * 0.2), 0);	
					}
					else {
						audio_group_set_gain(ag_BGM, (submenu[j][1] * 0.5), 0);
					}
				}
				if (mouse_check_button_released(mb_left)) {
					play_menu_select_sfx();	
				}
			}			
		}
	}
}

// draw level select menu
else if (room == room_levelselect) { 
	var gap = 80;
	
	// make back button
	var txt = "BACK";
	var xx = 100;
	var yy = 100;
	back_button.y = yy - string_height(txt)/2;
	back_button.wl = xx - string_width(txt)/2;
	back_button.wr = xx + string_width(txt)/2;
	back_button.h = string_height(txt);
	
	var mouse_hover = mouse_y > back_button.y && mouse_y < back_button.y + 
								back_button.h && mouse_x < back_button.wr && mouse_x > back_button.wl;
	

	back_shade_curve_pos = draw_menu_item(xx, yy, txt, back_button, curveStruct, back_shade_curve_pos, menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);

	if (mouse_hover && menu_control && !global.midTransition) {
		if (mouse_check_button_pressed(mb_left)) { // click to select
				play_menu_select_sfx();
				menu_control = false;
				transition_start(room_start, sq_fadeout, sq_fadein);
		}
	}
	
	// make levels buttons
	for (var i = 0; i < num_levels; i++) {
		var j = i div 10;
		
		var txt = string(i+1);
		var xx = menu_x - 360 + (i mod 10)*gap;
		var yy = menu_y - 360 + j*gap;
		level_buttons[i].y = yy - gap/4;
		level_buttons[i].wl = xx - gap/4;
		level_buttons[i].wr = xx + gap/4;
		level_buttons[i].h = gap/2;
	
		var mouse_hover = mouse_y > level_buttons[i].y && mouse_y < level_buttons[i].y + 
									level_buttons[i].h && mouse_x < level_buttons[i].wr && mouse_x > level_buttons[i].wl;
		draw_set_font(LevelFont);
		level_shade_curve_pos[i] = draw_level_item(xx, yy, txt, level_buttons[i], curveStruct, level_shade_curve_pos[i], menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);
		draw_set_font(MenuFont);
		if (mouse_hover && menu_control && !global.midTransition && mouse_check_button_pressed(mb_left)) {
			play_graph_sfx();
			select = i+1;
		}
	
		//temporary code
		//draw_set_color($FFEEAA);
		//draw_sprite_ext(spr_vertex_blue, 0, xx, yy, 1.5, 1.5, 0, image_blend, 0.8);
		//draw_text(xx, yy, txt);

	}
}
else {
	// make menu button; currently back button
	var txt = "MENU\nLevel: " + string(current_level);
	var xx = 100;
	var yy = 100;
	back_button.y = yy - string_height(txt)/2;
	back_button.wl = xx - string_width(txt)/2;
	back_button.wr = xx + string_width(txt)/2;
	back_button.h = string_height(txt);
	
	var mouse_hover = mouse_y > back_button.y && mouse_y < back_button.y + 
								back_button.h && mouse_x < back_button.wr && mouse_x > back_button.wl;
	
	back_shade_curve_pos = draw_menu_item(xx, yy, txt, back_button, curveStruct, back_shade_curve_pos, menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);
	
	if (mouse_hover && menu_control && !global.midTransition) {
		if (mouse_check_button_pressed(mb_left)) { // click to select
				play_menu_select_sfx();
				menu_control = false;
				global.level = 0;
				transition_start(room_start, sq_fadeout, sq_fadein);
		}
	}
	
	if (global.cleared) {
			// make next level button
		var txt = "Next level";
		var xx = room_width - 100;
		var yy = room_height - 100;
		next_button.y = yy - string_height(txt)/2;
		next_button.wl = xx - string_width(txt)/2;
		next_button.wr = xx + string_width(txt)/2;
		next_button.h = string_height(txt);
	
		var mouse_hover = mouse_y > next_button.y && mouse_y < next_button.y + 
									next_button.h && mouse_x < next_button.wr && mouse_x > next_button.wl;
	
		next_shade_curve_pos = draw_menu_item(xx, yy, txt, next_button, curveStruct, next_shade_curve_pos, menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);
	
		if (mouse_hover && menu_control && !global.midTransition) {
			if (mouse_check_button_pressed(mb_left)) { // click to select
					play_menu_select_sfx();
					menu_control = false;
					global.level++;
					transition_start(room_level, sq_fadeout, sq_fadein);
			}
		}
	}
}