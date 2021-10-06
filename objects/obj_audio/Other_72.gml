/// play bgm
if (audio_group_is_loaded(ag_BGM)) {
	if (!audio_is_playing(BGM)) {
		audio_play_sound(BGM, 100, true);
	}
}

if (audio_group_is_loaded(ag_SFX)) {
	sfx_loaded = true;	
}
