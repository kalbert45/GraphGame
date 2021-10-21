/// @description draw menu

// variables for lerp
var min_scale = 1; // Minimum scale
var max_scale = 1.3; // Maximum scale
var scale_spd = 0.1; // Speed of scaling

draw_sprite(spr_moon, 0, 1650+(0.9*obj_camera.cameraX), 200+(0.9*obj_camera.cameraY));

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
	var xx = 2*room_width/3 + 100;
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
	
	var txt = "Juan Pablo del Peral - Alegreya font";
	var xx = submenu_x + 1920;
	var yy = submenu_y +340;
	draw_set_color(c_white);
	draw_text(xx, yy, txt);
	
	var txt = "99Sounds & Rudi Fiasco - Upright Piano plugin";
	var xx = submenu_x + 1920;
	var yy = submenu_y +390;
	draw_set_color(c_white);
	draw_text(xx, yy, txt);
	
	var txt = "Alan ViSTa - BellsEbuth plugin";
	var xx = submenu_x + 1920;
	var yy = submenu_y +440;
	draw_set_color(c_white);
	draw_text(xx, yy, txt);
	
	var txt = "Johan Aakerlund - Comfortaa font";
	var xx = submenu_x + 1920;
	var yy = submenu_y +490;
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
			var sub_xx = (room_width / 3) + 100;
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
				}
				if (mouse_check_button(mb_left)) {
					reset_counter++;
					draw_set_color(c_red);
					draw_set_alpha(reset_counter / 360);
					draw_text_transformed(sub_xx,sub_yy,sub_txt, 1.03, 1.03, 0);
					draw_set_alpha(1);
					if (reset_counter == 420) {
						for (var i = 0; i < num_levels; i++) {
							global.cleared_levels[i][0] = false;	
						}
						select = -1;
						menu_control = false;
					}
				}
				else {
					reset_counter = 0;	
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
			sub_xx = submenu_x + sprite_get_width(spr_arrow)/2 + 20;
			
			resolution_buttons[0].y = sub_yy - sprite_get_height(spr_arrow)/2;
			resolution_buttons[0].wl = sub_xx - sprite_get_width(spr_arrow)/2;
			resolution_buttons[0].wr = sub_xx + sprite_get_width(spr_arrow)/2;
			resolution_buttons[0].h = sprite_get_height(spr_arrow);
	
			var sub_mouse_hover = mouse_y > resolution_buttons[0].y && mouse_y < resolution_buttons[0].y + 
										resolution_buttons[0].h && mouse_x < resolution_buttons[0].wr && mouse_x > resolution_buttons[0].wl;
	
			// draw submenu item
			resolution_shade_curve_pos[0] = draw_arrowleft_item(sub_xx, sub_yy, spr_arrow, resolution_buttons[0], curveStruct, resolution_shade_curve_pos[0], menu_shade_curve_speed, uni_shade, menu_shade, sub_mouse_hover, min_scale, max_scale, scale_spd);
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
			
			sub_txt = string(obj_camera.window_sizes[obj_camera.current_window][0]) + " x " + string(obj_camera.window_sizes[obj_camera.current_window][1]);
			sub_xx = submenu_x + string_width(sub_txt)/2 + sprite_get_width(spr_arrow) + 40;
			draw_set_color(c_white);
			draw_text(sub_xx, sub_yy, sub_txt);
			
			
			sub_xx = submenu_x + 1.5*sprite_get_width(spr_arrow) + string_width(sub_txt) + 60;
			
			resolution_buttons[1].y = sub_yy - sprite_get_height(spr_arrow)/2;
			resolution_buttons[1].wl = sub_xx - sprite_get_width(spr_arrow)/2;
			resolution_buttons[1].wr = sub_xx + sprite_get_width(spr_arrow)/2;
			resolution_buttons[1].h = sprite_get_height(spr_arrow);
	
			var sub_mouse_hover = mouse_y > resolution_buttons[1].y && mouse_y < resolution_buttons[1].y + 
										resolution_buttons[1].h && mouse_x < resolution_buttons[1].wr && mouse_x > resolution_buttons[1].wl;
	
			// draw submenu item
			resolution_shade_curve_pos[1] = draw_arrowright_item(sub_xx, sub_yy, spr_arrow, resolution_buttons[1], curveStruct, resolution_shade_curve_pos[1], menu_shade_curve_speed, uni_shade, menu_shade, sub_mouse_hover, min_scale, max_scale, scale_spd);
			if (sub_mouse_hover && menu_control) {
				if (mouse_check_button_pressed(mb_left)) {
					play_menu_select_sfx();
					with (obj_camera) {
						current_window = (current_window +1) mod (max_window + 1);
						
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

	var gap = 100;
	
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
	var clear_count = 0;
	draw_set_font(LevelFont);
	for (var i = 0; i < num_levels; i++) {
		var j = i div 10;
		var txt = string(i+1);
		var xx = menu_x - 450 + ((j div 3) * 1920) + (i mod 10)*gap;
		var yy = menu_y - 360 + 1.5*(j mod 3)*gap;
		if (i % 10 == 0) {
			if (clear_count >= 8*j) {
				clear_count = 8*j;	
			}
		}
		if (clear_count < 8*j) { // draw grey level
			draw_set_color(c_dkgrey);
			draw_text(xx, yy, txt);
		}
		else if (global.cleared_levels[i][0]) { // draw yellow level
			clear_count++;	
			
			if (i < num_levels/2 && obj_camera.cameraX == 0 && menu_control) {
			
				level_buttons[i].y = yy - 25;
				level_buttons[i].wl = xx - 25;
				level_buttons[i].wr = xx + 25;
				level_buttons[i].h = gap/2;
			
				var mouse_hover = mouse_y > level_buttons[i].y && mouse_y < level_buttons[i].y + 
											level_buttons[i].h && mouse_x < level_buttons[i].wr && mouse_x > level_buttons[i].wl;
										
				var time = string_replace_all(string(global.cleared_levels[i][1][0]) + ":" + string_format(global.cleared_levels[i][1][1], 2, 0) + ":" + string_format(global.cleared_levels[i][1][2], 2, 0), " ", "0");
			
				level_shade_curve_pos[i] = draw_level_item_clear(xx, yy, txt,time, level_buttons[i], curveStruct, level_shade_curve_pos[i], menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);
				if (mouse_hover && menu_control && !global.midTransition && mouse_check_button_pressed(mb_left)) {
					play_graph_sfx();
					select = i+1;
				}
			}
			else if (i >= num_levels/2 && obj_camera.cameraX == 1920 && menu_control) {
				level_buttons[i].y = yy - 25;
				level_buttons[i].wl = xx - 25;
				level_buttons[i].wr = xx + 25;
				level_buttons[i].h = gap/2;
			
				var mouse_hover = mouse_y > level_buttons[i].y && mouse_y < level_buttons[i].y + 
											level_buttons[i].h && mouse_x < level_buttons[i].wr && mouse_x > level_buttons[i].wl;
										
				var time = string_replace_all(string(global.cleared_levels[i][1][0]) + ":" + string_format(global.cleared_levels[i][1][1], 2, 0) + ":" + string_format(global.cleared_levels[i][1][2], 2, 0), " ", "0");
			
				level_shade_curve_pos[i] = draw_level_item_clear(xx, yy, txt,time, level_buttons[i], curveStruct, level_shade_curve_pos[i], menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);
				if (mouse_hover && menu_control && !global.midTransition && mouse_check_button_pressed(mb_left)) {
					play_graph_sfx();
					select = i+1;
				}	
			}
			else {
				draw_set_color($D5F6FF);
				draw_text(xx, yy, txt);
			}
		}
		
		else { // draw available blue level
			if (i < num_levels/2 && obj_camera.cameraX == 0 && menu_control) {
			
				level_buttons[i].y = yy - 25;
				level_buttons[i].wl = xx - 25;
				level_buttons[i].wr = xx + 25;
				level_buttons[i].h = gap/2;
			
				var mouse_hover = mouse_y > level_buttons[i].y && mouse_y < level_buttons[i].y + 
											level_buttons[i].h && mouse_x < level_buttons[i].wr && mouse_x > level_buttons[i].wl;
										
				var time = string_replace_all(string(global.cleared_levels[i][2][0]) + ":" + string_format(global.cleared_levels[i][2][1], 2, 0) + ":" + string_format(global.cleared_levels[i][2][2], 2, 0), " ", "0");							
				level_shade_curve_pos[i] = draw_level_item_blue(xx, yy, txt,time, level_buttons[i], curveStruct, level_shade_curve_pos[i], menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);
				if (mouse_hover && menu_control && !global.midTransition && mouse_check_button_pressed(mb_left)) {
					play_graph_sfx();
					select = i+1;
				}
			}
			else if (i >= num_levels/2 && obj_camera.cameraX == 1920 && menu_control) {
			
				level_buttons[i].y = yy - 25;
				level_buttons[i].wl = xx - 25;
				level_buttons[i].wr = xx + 25;
				level_buttons[i].h = gap/2;
			
				var mouse_hover = mouse_y > level_buttons[i].y && mouse_y < level_buttons[i].y + 
											level_buttons[i].h && mouse_x < level_buttons[i].wr && mouse_x > level_buttons[i].wl;
										
				var time = string_replace_all(string(global.cleared_levels[i][2][0]) + ":" + string_format(global.cleared_levels[i][2][1], 2, 0) + ":" + string_format(global.cleared_levels[i][2][2], 2, 0), " ", "0");							
				level_shade_curve_pos[i] = draw_level_item_blue(xx, yy, txt,time, level_buttons[i], curveStruct, level_shade_curve_pos[i], menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);
				if (mouse_hover && menu_control && !global.midTransition && mouse_check_button_pressed(mb_left)) {
					play_graph_sfx();
					select = i+1;
				}
			}
			else {
				draw_set_color($FFEEAA);
				draw_text(xx, yy, txt);
			}
		}
	}
	if (clear_count div 8 < 5) {
		var j = clear_count div 8;
		var txt = string(clear_count mod 8) + "/8"; 
		var xx = menu_x - 450 + ((j div 3) * 1920) + 10.5*gap;
		var yy = menu_y - 360 + 1.5*(j mod 3)*gap;
		draw_set_color($D5F6FF);
		draw_set_font(LevelFont);
		draw_text(xx,yy,txt);
	}
	
	
	// create next button
	var xx = menu_x + 450;
	var yy = menu_y+90;
	next_button.y = yy - sprite_get_height(spr_arrowbig)/2;
	next_button.wl = xx - sprite_get_width(spr_arrowbig)/2;
	next_button.wr = xx + sprite_get_width(spr_arrowbig)/2;
	next_button.h = sprite_get_height(spr_arrowbig);

	var mouse_hover = mouse_y > next_button.y && mouse_y < next_button.y + 
								next_button.h && mouse_x < next_button.wr && mouse_x > next_button.wl;
		
	next_shade_curve_pos = draw_next_arrow(xx, yy, spr_arrowbig, next_button, curveStruct, next_shade_curve_pos, menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);
		
	if (mouse_hover && menu_control && !global.midTransition) {
		if (mouse_check_button_pressed(mb_left)) { // click to select
				play_menu_select_sfx();
				menu_control = false;
				select = -2;
		}
	}
	
	
	// create back button
	var xx = menu_x - 450 + 1920;
	var yy = menu_y+90;
	next_button.y = yy - sprite_get_height(spr_arrowbigleft)/2;
	next_button.wl = xx - sprite_get_width(spr_arrowbigleft)/2;
	next_button.wr = xx + sprite_get_width(spr_arrowbigleft)/2;
	next_button.h = sprite_get_height(spr_arrowbigleft);

	var mouse_hover = mouse_y > next_button.y && mouse_y < next_button.y + 
								next_button.h && mouse_x < next_button.wr && mouse_x > next_button.wl;
		
	next_shade_curve_pos = draw_next_arrow(xx, yy, spr_arrowbigleft, next_button, curveStruct, next_shade_curve_pos, menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);
		
	if (mouse_hover && menu_control && !global.midTransition) {
		if (mouse_check_button_pressed(mb_left)) { // click to select
				play_menu_select_sfx();
				menu_control = false;
				select = -1;
		}
	}
	
	
	draw_set_font(MenuFont);
}



else {
	var gap = 120;
	
	draw_set_font(OptionsFont);
	draw_set_color(c_white);
	draw_text(95, 90, string(current_level));
	
	draw_set_font(MenuFont);
	// make menu button
	var txt = "MENU";
	var xx = 100;
	var yy = room_height/2 - 100;
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
				pause_time = true;
				//transition_place_sequence(Sequence3);
				select = 0;
				//instance_deactivate_all(true);
				//global.level = 0;
				//transition_start(room_start, sq_fadeout, sq_fadein);
		}
	}
	
	if (!global.cleared) {
		draw_set_font(TimerFont);
		draw_set_halign(fa_left);
		draw_set_color($FFEEAA);
		var sub_txt = string_replace_all(string(global.cleared_levels[current_level-1][2][0]) + ":" + string_format(global.cleared_levels[current_level-1][2][1], 2, 0) + ":" + string_format(global.cleared_levels[current_level-1][2][2], 2, 0), " ", "0");
		var sub_xx = menu_x - string_width(sub_txt)/2;
		var sub_yy = 1080 + menu_y - 4*gap + 50;
		draw_text(sub_xx, sub_yy, sub_txt);
		draw_set_halign(fa_center);
	}
	draw_set_font(MenuFont);
	var sub_txt = "Continue";	
	var sub_xx = menu_x;
	var sub_yy = 1080 + menu_y - 2*gap;
			
	options_button_menu[0].y = sub_yy - string_height(sub_txt)/2;
	options_button_menu[0].wl = sub_xx - string_width(sub_txt)/2;
	options_button_menu[0].wr = sub_xx + string_width(sub_txt)/2;
	options_button_menu[0].h = string_height(sub_txt);
	
	var sub_mouse_hover = mouse_y > options_button_menu[0].y && mouse_y < options_button_menu[0].y + 
								options_button_menu[0].h && mouse_x < options_button_menu[0].wr && mouse_x > options_button_menu[0].wl;
	
	// draw submenu item
	submenu_shade_curve_pos[0] = draw_menu_item(sub_xx, sub_yy, sub_txt, options_button_menu[0], curveStruct, submenu_shade_curve_pos[0], menu_shade_curve_speed, uni_shade, menu_shade, sub_mouse_hover, min_scale, max_scale, scale_spd);
	if (sub_mouse_hover && menu_control) {
		if (mouse_check_button_pressed(mb_left)) {
			play_menu_select_sfx();
			pause_time = false;
			select = 4;
			menu_control = false;
		}
	}
	var clear_count = 10;
	if (current_level % 10 == 0) {
		clear_count = 0;
		for (var i = current_level - 10; i < current_level; i++) {
			if (global.cleared_levels[i][0]) {
				clear_count++;	
			}
		}
	}
	if (clear_count < 8) {
		
		var sub_txt = "Skip Level";	
		var sub_xx = menu_x;
		var sub_yy = 1080 + menu_y - gap;
			
		draw_set_color(c_dkgrey);
		draw_text(sub_xx, sub_yy, sub_txt);
	}
	else {
		var sub_txt = "Skip Level";	
		var sub_xx = menu_x;
		var sub_yy = 1080 + menu_y - gap;
			
		options_button_menu[1].y = sub_yy - string_height(sub_txt)/2;
		options_button_menu[1].wl = sub_xx - string_width(sub_txt)/2;
		options_button_menu[1].wr = sub_xx + string_width(sub_txt)/2;
		options_button_menu[1].h = string_height(sub_txt);
	
		var sub_mouse_hover = mouse_y > options_button_menu[1].y && mouse_y < options_button_menu[1].y + 
									options_button_menu[1].h && mouse_x < options_button_menu[1].wr && mouse_x > options_button_menu[1].wl;
	
		// draw submenu item
		submenu_shade_curve_pos[1] = draw_menu_item(sub_xx, sub_yy, sub_txt, options_button_menu[1], curveStruct, submenu_shade_curve_pos[1], menu_shade_curve_speed, uni_shade, menu_shade, sub_mouse_hover, min_scale, max_scale, scale_spd);
		if (sub_mouse_hover && menu_control) {
			if (mouse_check_button_pressed(mb_left)) {
				play_menu_select_sfx();
				select = 3;
				menu_control = false;
			}
		}	
	}
	
	var sub_txt = "Restart Level (R)";	
	var sub_xx = menu_x;
	var sub_yy = 1080 + menu_y;
			
	options_button_menu[2].y = sub_yy - string_height(sub_txt)/2;
	options_button_menu[2].wl = sub_xx - string_width(sub_txt)/2;
	options_button_menu[2].wr = sub_xx + string_width(sub_txt)/2;
	options_button_menu[2].h = string_height(sub_txt);
	
	var sub_mouse_hover = mouse_y > options_button_menu[2].y && mouse_y < options_button_menu[2].y + 
								options_button_menu[2].h && mouse_x < options_button_menu[2].wr && mouse_x > options_button_menu[2].wl;
	
	// draw submenu item
	submenu_shade_curve_pos[2] = draw_menu_item(sub_xx, sub_yy, sub_txt, options_button_menu[2], curveStruct, submenu_shade_curve_pos[2], menu_shade_curve_speed, uni_shade, menu_shade, sub_mouse_hover, min_scale, max_scale, scale_spd);
	if (sub_mouse_hover && menu_control) {
		if (mouse_check_button_pressed(mb_left)) {
			play_menu_select_sfx();
			select = 2;
			menu_control = false;
		}
	}
	var sub_txt = "Quit";	
	var sub_xx = menu_x;
	var sub_yy = 1080 + menu_y + gap;
			
	options_button_menu[3].y = sub_yy - string_height(sub_txt)/2;
	options_button_menu[3].wl = sub_xx - string_width(sub_txt)/2;
	options_button_menu[3].wr = sub_xx + string_width(sub_txt)/2;
	options_button_menu[3].h = string_height(sub_txt);
	
	var sub_mouse_hover = mouse_y > options_button_menu[3].y && mouse_y < options_button_menu[3].y + 
								options_button_menu[3].h && mouse_x < options_button_menu[3].wr && mouse_x > options_button_menu[3].wl;
	
	// draw submenu item
	submenu_shade_curve_pos[3] = draw_menu_item(sub_xx, sub_yy, sub_txt, options_button_menu[3], curveStruct, submenu_shade_curve_pos[3], menu_shade_curve_speed, uni_shade, menu_shade, sub_mouse_hover, min_scale, max_scale, scale_spd);
	if (sub_mouse_hover && menu_control) {
		if (mouse_check_button_pressed(mb_left)) {
			play_menu_select_sfx();
			select = 1;
			menu_control = false;
		}
	}
		
	
	if (global.cleared) {
		next_alpha_curve_pos = clamp(next_alpha_curve_pos, 0, 1);
		next_alpha_curve_pos += 0.01;
		clear_timer_curve_pos = clamp(clear_timer_curve_pos, 0, 1);
		clear_timer_curve_pos += 0.03;
		
		var curveChannel = animcurve_get_channel(curveStruct, "EaseIn");
		var val = animcurve_channel_evaluate(curveChannel, clear_timer_curve_pos);
		
		var txt = string_replace_all(string(global.cleared_levels[current_level-1][1][0]) + ":" + string_format(global.cleared_levels[current_level-1][1][1], 2, 0) + ":" + string_format(global.cleared_levels[current_level-1][1][2], 2, 0), " ", "0");
		var xx = room_width/2;
		var yy = room_height/2 - (120 * val);
		draw_set_color($D5F6FF);
		draw_set_alpha(next_alpha_curve_pos);
		draw_set_font(TimerFont);
		draw_text(xx, yy, txt);	
		draw_set_font(MenuFont);
		
		
		if (clear_count < 8) {
			// make next level button
			draw_set_font(MenuFont);
			var txt = "EXIT";
			var xx = room_width - 150;
			var yy = room_height/2 - 100;
			next_button.y = yy - string_height(txt)/2;
			next_button.wl = xx - string_width(txt)/2;
			next_button.wr = xx + string_width(txt)/2;
			next_button.h = string_height(txt);

			var mouse_hover = mouse_y > next_button.y && mouse_y < next_button.y + 
										next_button.h && mouse_x < next_button.wr && mouse_x > next_button.wl;
		
			next_shade_curve_pos = draw_exit_item(xx, yy, txt, next_button, curveStruct, next_shade_curve_pos, menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd, next_alpha_curve_pos);
		
			if (mouse_hover && menu_control && !global.midTransition) {
				if (mouse_check_button_pressed(mb_left)) { // click to select
						play_menu_select_sfx();
						menu_control = false;
						transition_start(room_levelselect, sq_fadeout, sq_fadein);
				}
			}
		}
		else {
			// make next level button
			draw_set_font(MenuFont);
			var txt = "NEXT";
			var xx = room_width - 150;
			var yy = room_height/2 - 100;
			next_button.y = yy - sprite_get_height(spr_arrowbig)/2;
			next_button.wl = xx - string_width(txt)/2;
			next_button.wr = xx + string_width(txt)/2 + sprite_get_width(spr_arrowbig) + 40;
			next_button.h = sprite_get_height(spr_arrowbig);

			var mouse_hover = mouse_y > next_button.y && mouse_y < next_button.y + 
										next_button.h && mouse_x < next_button.wr && mouse_x > next_button.wl;
		
			next_shade_curve_pos = draw_next_item(xx, yy, txt, spr_arrowbig, next_button, curveStruct, next_shade_curve_pos, menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd, next_alpha_curve_pos);
		
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
}