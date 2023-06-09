if layer_get_id("Tiles_1") != -1 {
	global.tileset = layer_get_id("Tiles_1")
	with obj_solid {
		switch object_index
		{
			case obj_destroyable: case obj_toughblock: case obj_bigdestroyable: case obj_destructible: case obj_panicblock: case obj_panicblock_alt: break;
			default: visible = false break;
		}
	}
}
didpanicsound = global.panic
switch room
{
	case agm_secret1: case agm_secret2:
		checkSecret(room) // because why not?
		break;
}

if global.panic or room == endscreen exit;
var music_choice = -1

switch room
{
	case hubroom:
		music_choice = d_hub
		break;
	case tutorial_1: case tutorial_2: case tutorial_3: case tutorial_4: case tutorial_5: case tutorial_6:
		music_choice = d_tutorial
		break;
	case entrance_1: case entrance_2: case entrance_3:
		music_choice = d_entrance
		break;
	case chateau_1:
		music_choice = d_chateau
		break;
	case agm_1: case agm_2: case agm_3: case agm_4: case agm_5:
		music_choice = d_agm
		break;
	case agm_secret1: case agm_secret2:
		music_choice = d_agmsecret
		break;
	case armory_1: case armory_left1: case armory_left2: case armory_left3: case armory_right1: case armory_right2: case armory_right3: case armory_right4:
		music_choice = d_military
		break;
}

if music_choice != -1 scr_playmusic(music_choice)