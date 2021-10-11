// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function play_graph_sfx(){
	var sound = choose(bell_G_,bell_Eflat,bell_Bflat_, bell_Bflatlow, bell_Aflat_, bell_F);
	if (sound == obj_audio.prev_note) {
		var sound = choose(bell_G_,bell_Eflat,bell_Bflat_, bell_Bflatlow, bell_Aflat_, bell_F);
	}
	obj_audio.prev_note = sound;
	audio_play_sound(sound, 0, false);
}