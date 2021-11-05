/// @description Insert description here
// You can write your code in this editor
graph_destroy(graph); // reset graph upon each room end
//ds_list_destroy(act_line);
if (global.cleared && room == room_level) {
	num_cleared_levels++;	
}
show_debug_message(num_cleared_levels);