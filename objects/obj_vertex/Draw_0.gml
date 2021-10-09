/// draw, scale sprite, dynamic glow on select, normal on activate
var min_scale = 1; // Minimum scale
var max_scale = 1.3; // Maximum scale
var mouse_hover = position_meeting(mouse_x, mouse_y, id); // Check if mouse is hovering
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

var val = animcurve_channel_evaluate(obj_game.glow_curve_channel, glow_curve_pos);
if (id.activated) {
	if (id == global.selected || val != 0.5) {
		glow_curve_pos = (glow_curve_pos + obj_game.glow_curve_speed) mod 1;	
	}
}
else {
	if (val != 0) {
		if ((0.25 < glow_curve_pos) && (glow_curve_pos < 0.75)) {
			glow_curve_pos += obj_game.glow_curve_speed;
		}
		else {
			glow_curve_pos = (glow_curve_pos - obj_game.glow_curve_speed + 1) mod 1;	
		}
	}
}

if (global.cleared) {
	shader_curve_pos[0] -= obj_game.shader_curve_speed;		
	shader_curve_pos[1] = 0;
}
else if (id == obj_game.act_line[| 0] || id == obj_game.act_line[| ds_list_size(obj_game.act_line) - 1]) {	
	shader_curve_pos[0] += obj_game.shader_curve_speed;	
	if (shader_curve_pos[0] >= 1) {
		shader_curve_pos[1] += 	obj_game.shader_curve_speed;	
	}
}
else {
	shader_curve_pos[1] -= obj_game.shader_curve_speed;
	if (shader_curve_pos[1] <= 0) {
		shader_curve_pos[0] -= 	obj_game.shader_curve_speed;	
	}	
}



gpu_set_blendmode(bm_add);
for (var c = 1; c < 2; c+= 0.1) {
	draw_sprite_ext(sprite_index, image_index,x,y,c*image_xscale,c*image_yscale, image_angle,image_blend,(1-shader_curve_pos[0])*val*0.1);
	draw_sprite_ext(end_sprite, image_index,x,y,c*image_xscale,c*image_yscale, image_angle,image_blend,shader_curve_pos[0]*val*0.1);
}
gpu_set_blendmode(bm_normal);


draw_sprite_ext(sprite_index, image_index,x,y,image_xscale,image_yscale, image_angle,image_blend,(1-shader_curve_pos[1]));
draw_sprite_ext(end_sprite, image_index,x,y,image_xscale,image_yscale, image_angle,image_blend,shader_curve_pos[0]);







