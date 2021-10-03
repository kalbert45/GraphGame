/// @description draw menu
if (room == room_start) {
	draw_set_font(MenuFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);

	// line spacing
	var gap = 120

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
	
		if (mouse_hover && menu_control) {
			if (mouse_check_button_pressed(mb_left)) {
					select = i;
					menu_control = false;
				}
			draw_set_color(c_dkgray);
			draw_text(xx,yy,txt);
		
		}
		else {
			draw_set_color(c_white);
			draw_text(xx,yy,txt);
		}
	}

	// draw options submenu
	for (var j = 0; j < submenu_items; j++) {
		
		var sub_txt = submenu[j][0];
		
		if (j == 3) {
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
	
		if (sub_mouse_hover && menu_control) {
			if (mouse_check_button_pressed(mb_left)) {
					select = -1;
					menu_control = false;
				}
			draw_set_color(c_dkgray);
			draw_text(sub_xx,sub_yy,sub_txt);
		}	
		else {
				draw_set_color(c_white);
				draw_text(sub_xx,sub_yy,sub_txt);
		}
	}
}

else if (room == room_levelselect) {
	draw_set_color(c_white);
	draw_text(100, 100, "BACK");
}