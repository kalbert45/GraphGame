//global.settings = ds_map_create(); // settings
//#macro set		global.settings

//ds_map_add(set, "SFX Volume", [1, [0,1]]);
//ds_map_add(set, "Music Volume", [1, [0,1]]);

/// @description variables
num_levels = 20;

var curveAsset = EaseCurves; // ease curve
curveStruct = animcurve_get(curveAsset);

camera_curve_pos = 0;
camera_curve_speed = 0.016;

menu_shade_curve_pos[2] = 0;
submenu_shade_curve_pos[4] = 0;
back_shade_curve_pos = 0;
next_shade_curve_pos = 0;

menu_shade_curve_speed = 0.05;


menu_shade = 0.6; // controls shade of menu options
uni_shade = shader_get_uniform(FontShader, "shade");

title = "Little Stars";
title_x = 960;
title_y = 360;

menu[2] = "Quit";
menu[1] = "Options";
menu[0] = "Level select";

submenu[4] = ["BACK"];
submenu[3] = ["Reset Progress"];
submenu[2] = ["Window size:"];
submenu[1] = ["SFX Volume:", 1];
submenu[0] = ["Music Volume:", 1];

menu_items = array_length(menu);
submenu_items = array_length(submenu);

menu_x = room_width / 4;
submenu_x = 3 * room_width / 4;
menu_y = 2 * room_height / 3;
submenu_y = room_height / 3;

function button(_y, _wl, _wr, _h) constructor {
	y = _y;
	wl = _wl;
	wr = _wr;
	h = _h;
}

back_button = new button(0,0,0,0);

next_button = new button(0,0,0,0);

button_menu[2] = new button(0,0,0,0);
button_menu[1] = new button(0,0,0,0);
button_menu[0] = new button(0,0,0,0);

options_button_menu[4] = new button(0,0,0,0);
options_button_menu[3] = new button(0,0,0,0);
options_button_menu[2] = new button(0,0,0,0);
options_button_menu[1] = new button(0,0,0,0);
options_button_menu[0] = new button(0,0,0,0);

for (var i = num_levels - 1; i > -1; i--) {
	level_buttons[num_levels] = new button(0,0,0,0);
}