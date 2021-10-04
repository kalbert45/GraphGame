// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function play_menu_select_sfx(){
	var sound = choose(menu_selectG_,menu_selectEflat,menu_selectEflat_,menu_selectAflat,menu_selectBflat);
	audio_play_sound(sound, 0, false);
}