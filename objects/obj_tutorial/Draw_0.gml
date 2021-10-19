/// @description Insert description here
// You can write your code in this editor
if (room == room_level) {
	if (obj_menu.current_level == 1) {
		draw_set_font(TutorialFont);
		draw_set_color(c_white);
		var xx = 960;
		var yy = 230;
		var txt = "Click or drag to connect stars"
		draw_text(xx, yy, txt);
		
		var xx = 960;
		var yy = 750;
		var txt = "Draw all lines to solve the puzzle"
		draw_text(xx, yy, txt);
	}
	if (obj_menu.current_level == 2) {
		draw_set_font(TutorialFont);
		draw_set_color(c_white);
		var xx = 960;
		var yy = 260;
		var txt = "You can right click to erase lines"
		draw_text(xx, yy, txt);
		
		var xx = 960;
		var yy = 840;
		var txt = "Or press 'R' to reset the puzzle"
		draw_text(xx, yy, txt);
	}
	if (obj_menu.current_level == 5) {
		draw_set_font(TutorialFont);
		draw_set_color(c_white);
		var xx = 960;
		var yy = 160;
		var txt = "Pink stars play with different rules"
		draw_text(xx, yy, txt);
		
		var xx = 960;
		var yy = 760;
		var txt = "Make a loop using each star exactly once\nto solve the puzzle"
		draw_text(xx, yy, txt);
	}
}