
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

global.level = 0;

graph = undefined;

line_curve_pos_buffer = 0; // for animation in the case both endpoints are the same

var line_curve_asset = EaseCurves; // ease curve
line_curve_struct = animcurve_get(line_curve_asset);
line_curve_speed = 0.05;

var glow_curve_asset = SinCurve; // glow curve
var glow_curve_struct = animcurve_get(glow_curve_asset);
glow_curve_channel = animcurve_get_channel(glow_curve_struct, "Sin");		
glow_curve_speed = 0.005;