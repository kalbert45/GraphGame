global.settings = ds_map_create(); // settings
#macro set		global.settings

ds_map_add(set, "SFX Volume", [5, [0,10]]);
ds_map_add(set, "Music Volume", [5, [0,10]]);

/// @description variables
curveAsset = EaseCurves; // ease curve for camera
curveStruct = animcurve_get(curveAsset);
curvePosition = 0;
curveSpeed = 0.016;

select = -1; // selected menu option

menu_control = true; // player control of menu

menu[2] = "Quit";
menu[1] = "Options";
menu[0] = "Level select";

submenu[3] = ["BACK"];
submenu[2] = ["Reset Progress:"];
submenu[1] = ["SFX Volume:", 5];
submenu[0] = ["Music Volume", 5];

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

button_menu[2] = new button(0,0,0,0);
button_menu[1] = new button(0,0,0,0);
button_menu[0] = new button(0,0,0,0);

options_button_menu[3] = new button(0,0,0,0);
options_button_menu[2] = new button(0,0,0,0);
options_button_menu[1] = new button(0,0,0,0);
options_button_menu[0] = new button(0,0,0,0);