/// draw, scale sprite, dynamic glow on select, normal on activate
var min_scale = 1; // Minimum scale
var max_scale = 1.3; // Maximum scale
if (global.selected == id) { // stay big if selected
	var goal_scale = max_scale; // Calculate goal scale
}
else {
	var goal_scale = (min_scale * !mouse_hover) + (max_scale * mouse_hover); // Calculate goal scale
}
var scale_spd = 0.1; // Speed of scaling

// Apply index and scale
if (id.activated) { // choose appropriate sprite
	image_index = 1;
}
else {
	image_index = mouse_hover;
}
image_xscale = lerp(image_xscale, goal_scale, scale_spd);
image_yscale = lerp(image_yscale, goal_scale, scale_spd);

if (id == global.selected) {
	glow_curve_pos = (glow_curve_pos + obj_game.glow_curve_speed) mod 1;	
}
else {
	if (glow_curve_pos != 0.5) {
		glow_curve_pos = (glow_curve_pos + obj_game.glow_curve_speed) mod 1;	
	}
}

var val = animcurve_channel_evaluate(obj_game.glow_curve_channel, glow_curve_pos);

if (id.activated) {
	gpu_set_blendmode(bm_add);
	for (var c = 1; c < 2; c+= 0.1) {
		draw_sprite_ext(sprite_index, image_index,x,y,c*image_xscale,c*image_yscale, image_angle,image_blend,val*0.1);
	}
	gpu_set_blendmode(bm_normal);
}
draw_self();

