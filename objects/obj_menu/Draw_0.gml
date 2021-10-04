/// @description draw menu
if (room == room_start) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);

	// line spacing
	var gap = 120
	
	
	// variables for lerp
	var min_scale = 1; // Minimum scale
	var max_scale = 1.3; // Maximum scale
	var scale_spd = 0.1; // Speed of scaling
	
	// draw title
	draw_set_font(TitleFont);
	draw_set_color(c_black);
	draw_text(title_x - 10, title_y + 7, title);
	draw_set_color(c_orange);
	draw_text(title_x, title_y, title);
	
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

	// draw options submenu
	for (var j = 0; j < submenu_items; j++) {
		
		var sub_txt = submenu[j][0];
		
		if (j == 3) { // back button on top left
			var sub_xx = (room_width / 2) + 100;
			var sub_yy = 100;
		}
		else {
			var sub_xx = submenu_x;
			var sub_yy = submenu_y + j*gap;
		}
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
}

// draw level select menu
else if (room == room_levelselect) { // temp
	draw_set_color(c_white);
	draw_text(100, 100, "BACK");
	
	var txt = "Level 1";
	var xx = menu_x;
	var yy = menu_y;
	button_level1 = new button(0,0,0,0);
	button_level1.y = yy - string_height(txt)/2;
	button_level1.wl = xx - string_width(txt)/2;
	button_level1.wr = xx + string_width(txt)/2;
	button_level1.h = string_height(txt);
	
	var mouse_hover = mouse_y > button_level1.y && mouse_y < button_level1.y + 
								button_level1.h && mouse_x < button_level1.wr && mouse_x > button_level1.wl;
		//temporary code						
	if (mouse_hover && mouse_check_button_pressed(mb_left)) {
		transition_start(room_level1, sq_fadeout, sq_fadein);
	}
	
	draw_set_color(c_white);
	draw_text(xx, yy, txt);
}