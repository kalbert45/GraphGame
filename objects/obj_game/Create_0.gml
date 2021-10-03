
// fix gui display
#macro RES_W 1920
#macro RES_H 1080
display_set_gui_size(RES_W, RES_H);

if (display_aa >= 8) {
	display_reset(8, false);
}
else {
	display_reset(display_aa, false);	
}

cursor_sprite = spr_cursor;

