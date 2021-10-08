/// @description Insert description here
// You can write your code in this editor
if (layer_exists("Particles")) layer_destroy("Particles");
layer_create(50, "Particles");

global.P_System = part_system_create_layer("Particles", true);
global.starParticle = part_type_create();
part_type_shape(global.starParticle, pt_shape_flare);
part_type_size(global.starParticle, 0.01, 0.07, 0, 0);
part_type_color3(global.starParticle, $D5F6FF, c_white, $FFEEAA);
part_type_alpha3(global.starParticle, 1, 0.5, 0);
part_type_speed(global.starParticle, 0.03,0.04,0,0);
part_type_direction(global.starParticle, 20,20,0,0);
part_type_blend(global.starParticle, false);
part_type_life(global.starParticle, 360, 2000);


global.Emitter = part_emitter_create(global.P_System);
part_emitter_region(global.P_System, global.Emitter, 0, room_width, 0 , room_height-5, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(global.P_System, global.Emitter, global.starParticle, 1);