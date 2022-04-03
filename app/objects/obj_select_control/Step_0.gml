/// @description handle left right selection
var dir = IDLE;

var maids = ["", "akane", "miku", "saiki", ""];

if(gamepad_button_check(0, gp_padl) ||  keyboard_check(vk_left)) {
	dir = LEFT
} else if(gamepad_button_check(0, gp_padr) ||  keyboard_check(vk_right)) {
	dir = RIGHT;
} else if(gamepad_button_check(0, gp_start) || keyboard_check(vk_enter)) {
	dir = START
} else if(gamepad_button_check(0, gp_select) || keyboard_check(vk_escape)) {
	dir = BACK;
}

var obj = instance_find(obj_title_maids_selected, 0);
switch(dir) {
	case BACK:
		if(!pressed) {
			game_end();
		}
		break;
	case IDLE:
		pressed = false;
		break
	case LEFT:
	case RIGHT:
		if(!pressed) {
			pressed = true;
			var obj = instance_find(obj_title_maids_selected, 0);
			with(obj) {
				image_index += dir;
				image_index = image_index < 0 ? image_number - 1 : image_index;
				image_index = image_index == image_number ? 0 : image_index
			}
		}
		break;
		
	case START:
		global.which_maid = maids[obj.image_index];
		if(global.which_maid != "") {
			room_goto(rm_level_1);
		}
		break;
}
