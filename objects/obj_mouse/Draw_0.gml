/// @description Insert description here
// You can write your code in this editor
if (global.mouse_activated) {
	if (mouse_curve_pos < 1) {
		mouse_curve_pos += 0.02;	
	}
}
else {
	if (mouse_curve_pos > 0) {
		mouse_curve_pos -= 0.05;	
	}
}
gpu_set_blendmode(bm_add);
for (var c = 1; c < 2; c+= 0.1) {
	draw_sprite_ext(spr_vertex, 0,mouse_x,mouse_y,c*2*mouse_curve_pos,c*2*mouse_curve_pos, 0,image_blend, mouse_curve_pos*0.05);
}
gpu_set_blendmode(bm_normal);