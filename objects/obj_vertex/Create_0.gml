//initialize activate variable and label
label = -1; // vertex label
activated = 0; // number of times the vertex has been activated, also serves as boolean
line_curve_pos[obj_game.max_degree / 2] = 0; // for drawing activated edges
inbound_v = ds_list_create();
v_prev_deselect = undefined; // previous deselected vertex for drawing lingering line

