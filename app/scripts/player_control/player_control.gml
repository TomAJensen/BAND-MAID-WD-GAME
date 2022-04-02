/*
This file contains the functions for player control.
*/

/*
	All player objects must register with the control object.
*/

function get_input_state() {
	var dir_state = IDLE;
	dir_state = keyboard_check(vk_left) || gamepad_button_check(0, gp_padl) ? LEFT_DIR : dir_state;
	dir_state = keyboard_check(vk_right) || gamepad_button_check(0, gp_padr) ? RIGHT_DIR : dir_state;

	var attack_state = keyboard_check(vk_pageup) || gamepad_button_check(0, gp_face3) ? ATTACK_3 : IDLE; // X/square;
	attack_state = keyboard_check(vk_home) || gamepad_button_check(0, gp_face2) ? ATTACK_2 : attack_state; // B/circle;
	attack_state = keyboard_check(vk_insert) || gamepad_button_check(0, gp_face1) ? ATTACK_1 : attack_state; // A/Cross;

	return dir_state | attack_state
}


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
			player_controller.active_object = id;
			break;		
	}
	// setup for object	
	event_inherited();
	image_speed = 0;
}


function switch_state(state) {
	var control = instance_find(obj_control, 0);

	if( state != ATTACK_FINISHED) {
		if(control.state & ATTACK_CHECK > 0) {
			// currently processing an attack, can't interrupt.
			return;
		}
		if(state == control.state) {
			// no state change
			return
		}
	}
	
	var xPos = control.active_object.x;
	var oldActiveObj = control.active_object;
	
	// move all player objects off screen
	control.idle.x = -1000;
	control.walk_left.x = -1000;
	control.walk_right.x = -1000;
	control.attack_left.x = -1000;
	control.attack_right.x = -1000;
	control.attack_2_left.x = -1000;
	control.attack_2_right.x = -1000;
	control.attack_3_left.x = -1000;
	control.attack_3_right.x = -1000;

	if( state & ATTACK_CHECK ) {
		if(control.no_repeat) {
			// this prevents attacking over and over by holding key
			return;
		}
		
		state = state | control.cur_dir
	}
	print(string(state));
	switch(state) {
		case IDLE:
			control.active_object = control.idle;
			break
		case WALKING_LEFT:
			control.active_object = control.walk_left;
			control.cur_dir = LEFT_DIR;
			control.no_repeat = false;
			break;
		case WALKING_RIGHT:
			control.active_object = control.walk_right;
			control.cur_dir = RIGHT_DIR;
			control.no_repeat = false;
			break;
		case ATTACK_1_LEFT:
			control.active_object = control.attack_left;
			break;
		case ATTACK_1_RIGHT:
			control.active_object = control.attack_right;
			break;
		case ATTACK_2_LEFT:
			control.active_object = control.attack_2_left;
			break;
		case ATTACK_2_RIGHT:
			control.active_object = control.attack_2_right;
			break;
		case ATTACK_3_LEFT:
			control.active_object = control.attack_3_left;
			break;
		case ATTACK_3_RIGHT:
			control.active_object = control.attack_3_right;
			break;
		case ATTACK_FINISHED:
			control.state = 1024;
			control.active_object.x = xPos;
			return;
	}
	control.state = state;
	with(oldActiveObj) {
		event_perform(ev_other, STOP_EVU1);
	}
	
	with(control.active_object) {
		x = xPos;
		event_perform(ev_other, START_EVU0)
	}
}

/***********************************************
	Functions for controlling player walking	
************************************************/

///@function player_walking_start()
///@param {integer} direction to walk <LEFT | RIGHT>
///@description trigger walking state for the player
function player_walking_start(direction_to_walk) {
	var control = instance_find(obj_control, 0);

	control.active_object = self;
	visible = true;
	image_index = 0;	// start walk
	image_speed = orig_image_speeed;
}

///@function player_walking_stop()
//@description handle stop walking state.
function player_walking_stop(){
	
	image_speed = 0;
	image_index = 0;
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
	//x = -1000;
}

/// @function player_attack_start(attack_direction)
///@description trigger the player attack action 
function player_attack_start(attack_direction) {
	visible = true;
	image_index = 0;	// start attack start
	image_speed = orig_image_speeed;
}

/// @function _trigger_start(obj)
/// @param {assest} obj - object to update position and send start event.
//function _trigger_start(obj) {
//		// trigger the event for the wait object.
//		obj.x = x;
//		x = -1000;
//		with(obj) {
//			obj.visible = true;
//			event_perform(ev_other, START_EVU0);
//		}
//}

//function _reset_to_idle(control) {
//	var obj = instance_find(control.idle, 0);
//	_trigger_start(obj);
//	control.idle_flag = true;
//}

///@function player_attack_end()
///@description return to idle or walking after the player attack ends.
function player_attack_end(){
	if(!(get_input_state() & which_attack)) {
		switch_state(ATTACK_FINISHED);
	} else {
		player_attack_animation_end();
	}
}

/// @function player_attack_animation_end()
///@description setup to transition out of attack state
function player_attack_animation_end(){
	image_speed = 0
	alarm[1] = room_speed / 10;
	image_index = image_number - 1;
	image_index = 0;
}

// **************************************************************