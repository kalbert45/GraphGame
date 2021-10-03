// transitions
global.midTransition = false;
global.roomTarget = -1;

function transition_place_sequence(_type){
	if (layer_exists("Transition")) layer_destroy("Transition");
	var _lay = layer_create(-9999, "Transition");
	layer_sequence_create(_lay, 0, 0, _type);
}

function transition_start(_room_target, _type_out, _type_in) {
	if (!global.midTransition) {
		global.midTransition = true;
		global.roomTarget = _room_target;
		transition_place_sequence(_type_out);
		layer_set_target_room(_room_target);
		transition_place_sequence(_type_in);
		layer_reset_target_room();
		return true;			
	}
	else {
		return false;	
	}
}

function transition_change_room() {
	room_goto(global.roomTarget);	
}

function transition_finished() {
	layer_sequence_destroy(self.elementID);
	global.midTransition = false;
}