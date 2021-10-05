
// fix gui display
#macro RES_W 1920
#macro RES_H 1080
display_set_gui_size(RES_W, RES_H);

if (display_aa >= 8) {
	display_reset(8, true);
}
else {
	display_reset(display_aa, true);	
}

cursor_sprite = spr_cursor;

graph = undefined;

line_curve_asset = EaseCurves; // ease curve
line_curve_struct = animcurve_get(line_curve_asset);

line_curve_speed = 0.05;

audio_play_sound(BGM, -1, true);