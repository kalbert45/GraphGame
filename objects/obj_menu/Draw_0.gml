/// @description draw menu

draw_set_font(MenuFont);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
for (var i = 0; i < menu_items; i++) {
	var txt = menu[i];
	var xx = menu_x
	var yy = menu_y - 120 + i*120;
	draw_set_color(c_white);
	draw_text(xx,yy,txt);
}