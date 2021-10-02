/// @description draw menu

draw_set_font(MenuFont);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

// line spacing
var gap = 120

for (var i = 0; i < menu_items; i++) {
	var txt = menu[i];
	var xx = menu_x;
	var yy = menu_y - gap + i*gap;
	button_menu[i].y = yy - string_height(txt)/2;
	button_menu[i].wl = xx - string_width(txt)/2;
	button_menu[i].wr = xx + string_width(txt)/2;
	button_menu[i].h = string_height(txt);
	
	var mouse_hover = mouse_y > button_menu[i].y && mouse_y < button_menu[i].y + button_menu[i].h && mouse_x < button_menu[i].wr && mouse_x > button_menu[i].wl;
	
	if (mouse_hover && menu_control) {
		if (mouse_check_button_pressed(mb_left)) {
				selected = i;
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