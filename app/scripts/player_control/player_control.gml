/*
This file contains the functions for player control.

*/

///@function player_walking_start()
function player_walking_start(direction_to_walk) {
	var control = instance_find(obj_control, 0);
	if(control.attack_right.visible || control.attack_left.visible) return;	// In attack, so we don't go


	if(control.idle.visible) {
		// transition from idle to walk right
		with(control.idle) {
			visible = false;
		}
	} else {
		// Since idle is not visible and passed the attack checks we can assume walk_right/left is visible. 
		// determined based on facing direction
		if(direction_to_walk == LEFT) {
			control.walk_right.visible = false;
		} else {
			control.walk_left.visible = false;
		}
	}
	visible = true;
	image_index = 0;	// start walk
	image_speed = orig_image_speeed;
}

///@function player_walking_stop()
function player_walking_stop(){
	var control = instance_find(obj_control, 0);
	if(control.attack_left.visible || control.attack_right.visible) return; // in attack so return

	visible = false;
	image_speed = 0;
	image_index = 0;
	with(control.idle) {
		event_perform(ev_other, START_EVU0);
	}
}

/// @description register an object for control bye control handler
/// @functions player_register_object_for_control(id, type)
function player_register_object_for_control(id, type){
	
	// get the instance of the player controller
	var player_controller = instance_find(obj_control, 0);
	
	switch(type) {
		case player_object_type.attack_left:
			player_controller.attack_left = id;
			break;
		case player_object_type.attack_right:
			player_controller.attack_right = id;
			break;		
		case player_object_type.walk_left:
			player_controller.walk_left = id;
			break;		
		case player_object_type.walk_right:
			player_controller.walk_right = id;
			break;
		case player_object_type.idle:
			player_controller.idle = id;
			break;		
	}
	// setup for object	
	event_inherited();
	image_speed = 0;
}

///@function player_go_idle()
function player_go_idle(){
	visible = true;
	image_index = 0;
	image_speed = 0;
	alarm[1] = room_speed;
}

/// @function player_attack_start(attack_directions
function player_attack_start(attack_direction) {
	var control = instance_find(obj_control, 0);
	if(control.attack_right.visible || control.attack_left.visible) return;	// already in the attack


	if(control.idle.visible) {
		// transition from idle to attack left
		with(control.idle) {
			visible = false;
		}
	} else {
		// determined based on facing direction
		switch(attack_direction) {
			case LEFT:
				control.walk_left.visible = false;
				break;
			case RIGHT:
				control.walk_right.visible = false;
				break;
		}
	}
	visible = true;
	image_index = 0;	// start attack start
	image_speed = orig_image_speeed;
}

///@function player_attack_end()
function player_attack_end(){
	visible = false;
	var control = instance_find(obj_control, 0);
	if(control.idle_flag == 0) {
		var obj = instance_find(control.idle, 0);
		with(obj) {
			event_perform(ev_other, START_EVU0);
		}
	} else {
		var obj;
		if(keyboard_check(vk_right)) {
			obj = instance_find(control.walk_right, 0);
		} else if(keyboard_check(vk_left)) {
			obj = instance_find(control.walk_left, 0);
		}
	
		with(obj) {
			event_perform(ev_other, START_EVU0);
		}
	}
}

/// @function player_attack_animation_end()
function player_attack_animation_end(){
	image_speed = 0
	alarm[1] = room_speed / 2;
	image_index = image_number - 1;
}