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
	
	if (mouse_hover && menu_control) {
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
		var xx = menu_x - 480 + (i mod 10)*gap;
		var yy = menu_y - 320 + j*gap;
		level_buttons[i].y = yy - string_height(txt)/2;
		level_buttons[i].wl = xx - string_width(txt)/2;
		level_buttons[i].wr = xx + string_width(txt)/2;
		level_buttons[i].h = string_height(txt);
	
		var mouse_hover = mouse_y > level_buttons[i].y && mouse_y < level_buttons[i].y + 
									level_buttons[i].h && mouse_x < level_buttons[i].wr && mouse_x > level_buttons[i].wl;
			//temporary code						
		if (mouse_hover && mouse_check_button_pressed(mb_left)) {
			transition_start(i+2, sq_fadeout, sq_fadein);
		}
	
		draw_set_color(c_white);
		draw_text(xx, yy, txt);
	}
}
else {
	// make menu button; currently back button
	var txt = "MENU";
	var xx = 100;
	var yy = 100;
	back_button.y = yy - string_height(txt)/2;
	back_button.wl = xx - string_width(txt)/2;
	back_button.wr = xx + string_width(txt)/2;
	back_button.h = string_height(txt);
	
	var mouse_hover = mouse_y > back_button.y && mouse_y < back_button.y + 
								back_button.h && mouse_x < back_button.wr && mouse_x > back_button.wl;
	
	back_shade_curve_pos = draw_menu_item(xx, yy, txt, back_button, curveStruct, back_shade_curve_pos, menu_shade_curve_speed, uni_shade, menu_shade, mouse_hover, min_scale, max_scale, scale_spd);
	
	if (mouse_hover && menu_control) {
		if (mouse_check_button_pressed(mb_left)) { // click to select
				play_menu_select_sfx();
				menu_control = false;
				transition_start(room_start, sq_fadeout, sq_fadein);
		}
	}
	
	if (global.cleared) {
			// make back button
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
	
		if (mouse_hover && menu_control) {
			if (mouse_check_button_pressed(mb_left)) { // click to select
					play_menu_select_sfx();
					menu_control = false;
					transition_start(room+1, sq_fadeout, sq_fadein);
			}
		}
	}
}