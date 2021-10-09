// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function color_to_array(color){
	var hex = [];
	var ret = [];

	// Make sure this is a color code
	while( array_length_1d( hex) < 6){
		hex[array_length_1d(hex)] = 0;
	}
	if( array_length_1d( hex) > 6){
		show_error( "Unknown color: " + string( argument0), true);
		return -1;
	}

	// Convert hex to RGB
	for( var i = 0; i < 3; ++i){
		ret[i] = hex[i * 2 + 1] * 16 + hex[i * 2];
		ret[i] /= 255; // Change from 255 to float
	}

	return ret;
}