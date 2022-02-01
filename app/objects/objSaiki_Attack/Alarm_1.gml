/// @description step through the attack animation
if(attack_part_1) {
	if(image_index == max_frames) {
		attack_part_1 = false;
	} else {
		image_index += 1;
		var delay = motion_delay;
		if(image_index == max_frames) {
			delay = motion_delay * 3;
			var voice_blast = instance_find(objSaiki_voice_blast, 0)
			voice_blast.alarm[0] = 1;
		}
		alarm[1] = delay;
	}
}
if(!attack_part_1) {
	if(image_index == 0) {
		visible = false;
		// determine if the an arrow key is being pressed
		if keyboard_check_direct(vk_right) {
			startWalking();	
		} else {
			var saiki = instance_find(objSaiki_Idle, 0);
			saiki.visible = true;
		}
		attack_part_1 = true;
	} else {
		image_index -= 1;
		alarm[1] = motion_delay;
	}
}

