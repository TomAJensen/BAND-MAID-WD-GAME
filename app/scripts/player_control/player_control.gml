/*
This file contains the functions for player control.
*/

/*
	All player objects must register with the control object.
*/

/// @description register an object for control by control handler
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
		case player_object_type.attack_2_left:
			player_controller.attack_2_left = id;
			break
		case player_object_type.attack_2_right:
			player_controller.attack_2_right = id;
			break;
		case player_object_type.attack_3_left:
			player_controller.attack_3_left = id;
			break
		case player_object_type.attack_3_right:
			player_controller.attack_3_right = id;
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


/***********************************************
	Functions for controlling player walking	
************************************************/

///@function player_walking_start()
///@param {integer} direction to walk <LEFT | RIGHT>
///@description trigger walking state for the player
function player_walking_start(direction_to_walk) {
	var control = instance_find(obj_control, 0);

	// if in an attack state player doesn't start walking.
	if(control.attack_right.visible || control.attack_left.visible) return;	// In attack, so we don't go

	if(control.idle.visible) {
		// transition from idle to walk right
		x = control.idle.x;
		with(control.idle) {
			x = -1000;
			visible = false;
		}
	} else {
		// Since idle is not visible and passed the attack checks we can assume walk_right/left is visible. 
		// determined based on direction which to make invisible.
		if(direction_to_walk == LEFT) {
			if(control.walk_right != obj_control) {
				control.walk_right.visible = false;
				x = control.walk_right.x;
				control.walk_right.x = -1000;
			}
		} else {
			if(control.walk_left != obj_control) {
				control.walk_left.visible = false;
				x = control.walk_left.x;
				control.walk_left.x = -1000
			}
		}
	}
	visible = true;
	image_index = 0;	// start walk
	image_speed = orig_image_speeed;
}

///@function player_walking_stop()
//@description handle stop walking state.
function player_walking_stop(){
	var control = instance_find(obj_control, 0);
	// if player in attack mode exit function
	if(control.attack_left.visible || control.attack_right.visible) return; // in attack so return

	visible = false;
	image_speed = 0;
	image_index = 0;
	control.idle.x = x;
	x = -1000;
	with(control.idle) {
		event_perform(ev_other, START_EVU0);
	}
}



/***********************************************
	Functions for controlling player idling	
************************************************/

///@function player_idle_setup(idle_wait)
/// @param {Real} idle_wait  Seconds to wait until idle animation begins. 
///@description Set the delay time until the idle animation starts to cycle.
function player_idle_setup(time_to_wait = 3) {
	alarm[0] = room_speed * time_to_wait;
}

///@function player_go_idle()
/// Setup to start idle animation after an attack or walking.
function player_go_idle(){
	visible = true;
	image_index = 0;
	image_speed = 0;
	alarm[0] = room_speed;
}

///@function player_idle_start_animation()
///@description start the player idle animation
function player_idle_start_animation() {
	image_speed = orig_image_speeed;
}

//******************************************************


/***********************************************
	Functions for controlling player attacks	
************************************************/

///@function player_attack_setup()
///@description setup for attack object
function player_attack_setup() {
	// make the object invisible.
	visible=false;
	x = -1000;
}

/// @function player_attack_start(attack_directions
///@description trigger the player attack action 
function player_attack_start(attack_direction) {
	var control = instance_find(obj_control, 0);
	// if already in attack, exit
	if(control.attack_right.visible || control.attack_left.visible) return;	// already in the attack


	if(control.idle.visible) {
		// transition from idle to attack left
		x = control.idle.x;
		with(control.idle) {			
			x = -1000;
			visible = false;
		}
	} else {
		// so not in attack nor idle
		// determined based on facing direction
		switch(attack_direction) {
			case LEFT:
				control.walk_left.visible = false;
				x = control.walk_left.x;
				control.walk_left.x = -1000;
				break;
			case RIGHT:
				control.walk_right.visible = false;
				x = control.walk_right.x
				control.walk_right.x = -1000
				break;
		}
	}
	visible = true;
	image_index = 0;	// start attack start
	image_speed = orig_image_speeed;
}

///@function player_attack_end()
///@description return to idle or walking after the player attack ends.
function player_attack_end(){
	visible = false;
	var control = instance_find(obj_control, 0);
	if(control.idle_flag == 0) {
		// in idle state so trigger event for idle object.
		var obj = instance_find(control.idle, 0);
		obj.x = x;
		x = -1000;
		with(obj) {
			event_perform(ev_other, START_EVU0);
		}
	} else {
		var obj;
		// get walk object based on what arrow key is pressed.
		if(keyboard_check(vk_right)) {
			obj = instance_find(control.walk_right, 0);
		} else if(keyboard_check(vk_left)) {
			obj = instance_find(control.walk_left, 0);
		}
	
		// trigger the event for the wait object.
		obj.x = x;
		x = -1000;
		with(obj) {
			event_perform(ev_other, START_EVU0);
		}
	}
}

/// @function player_attack_animation_end()
///@description setup to transition out of attack state
function player_attack_animation_end(){
	image_speed = 0
	alarm[1] = room_speed / 10;
	image_index = image_number - 1;
}

// **************************************************************