/// @description variables
selected = -1;

menu_control = true;

menu[2] = "Quit";
menu[1] = "Options";
menu[0] = "Level select";

submenu[2,2] = ["Music Volume:", 5];
submenu[1,1] = ["SFX Volume:", 5];
submenu[0,0] = ["Reset Progress", 0];

menu_items = array_length(menu);

menu_x = room_width / 4;
menu_y = 2 * room_height / 3;

function button(_y, _wl, _wr, _h) constructor {
	y = _y;
	wl = _wl;
	wr = _wr;
	h = _h;
}

button_menu[2] = new button(0,0,0,0);
button_menu[1] = new button(0,0,0,0);
button_menu[0] = new button(0,0,0,0);