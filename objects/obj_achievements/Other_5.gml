/// sets steam achievements

if (room == room_level && global.cleared) {
	if (obj_game.num_cleared_levels == 59) {
		steam_set_achievement("ACHIEVEMENT_COMPLETE");
	}
	else if (obj_menu.current_level <= 10) {
		var achieved = true;
		for (var i = 0; i < 10; i++) {
			if (!global.cleared_levels[i][0])	{
				achieved = false;
			}
		}
		if (achieved) {
			steam_set_achievement("ACHIEVEMENT_10LEVELS");	
		}
	}
	else if (obj_menu.current_level > 10 && obj_menu.current_level <= 20) {
		var achieved = true;
		for (var i = 10; i < 20; i++) {
			if (!global.cleared_levels[i][0])	{
				achieved = false;
			}
		}
		if (achieved) {
			steam_set_achievement("ACHIEVEMENT_20LEVELS");	
		}		
	}
	else if (obj_menu.current_level > 20 && obj_menu.current_level <= 30) {
		var achieved = true;
		for (var i = 20; i < 30; i++) {
			if (!global.cleared_levels[i][0])	{
				achieved = false;
			}
		}
		if (achieved) {
			steam_set_achievement("ACHIEVEMENT_30LEVELS");	
		}		
	}
	else if (obj_menu.current_level > 30 && obj_menu.current_level <= 40) {
		var achieved = true;
		for (var i = 30; i < 40; i++) {
			if (!global.cleared_levels[i][0])	{
				achieved = false;
			}
		}
		if (achieved) {
			steam_set_achievement("ACHIEVEMENT_40LEVELS");	
		}		
	}
	else if (obj_menu.current_level > 40 && obj_menu.current_level <= 50) {
		var achieved = true;
		for (var i = 40; i < 50; i++) {
			if (!global.cleared_levels[i][0])	{
				achieved = false;
			}
		}
		if (achieved) {
			steam_set_achievement("ACHIEVEMENT_50LEVELS");	
		}		
	}
	else if (obj_menu.current_level > 50 && obj_menu.current_level <= 60) {
		var achieved = true;
		for (var i = 50; i < 60; i++) {
			if (!global.cleared_levels[i][0])	{
				achieved = false;
			}
		}
		if (achieved) {
			steam_set_achievement("ACHIEVEMENT_60LEVELS");	
		}		
	}
}