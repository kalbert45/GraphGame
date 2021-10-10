// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function play_graph_sfx(){
	var sound = choose(bell_G_,bell_Eflat,bell_Aflat_,bell_Bflat_);
	audio_play_sound(sound, 0, false);
}