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
			player_controller.active_object = id;
			break;		
	}
	// setup for object	
	event_inherited();
	// Stop any animation
	image_speed = 0;
}

///@function get_input_state()
///@description get the state of the control input.
function get_input_state() {
	var dir_state = IDLE;
	dir_state = keyboard_check(vk_left) || gamepad_button_check(0, gp_padl) ? LEFT_DIR : dir_state;
	dir_state = keyboard_check(vk_right) || gamepad_button_check(0, gp_padr) ? RIGHT_DIR : dir_state;

	var attack_state = keyboard_check(vk_pageup) || gamepad_button_check(0, gp_face3) ? ATTACK_3 : IDLE; // X/square;
	attack_state = keyboard_check(vk_home) || gamepad_button_check(0, gp_face2) ? ATTACK_2 : attack_state; // B/circle;
	attack_state = keyboard_check(vk_insert) || gamepad_button_check(0, gp_face1) ? ATTACK_1 : attack_state; // A/Cross;
	
	var back_state = keyboard_check(vk_escape) || gamepad_button_check(0, gp_select) ? BACK : attack_state;

	return dir_state | attack_state | back_state
}

///@function player_switch_state(state)
///@param state {Integer}
///@Descripton process the input state
function player_switch_state(state) {

	var control = instance_find(obj_control, 0);
	
	if(state & BACK) {
		with(control.fade_control) {
			event_perform(ev_other, ev_user0);
		}
	}
	

	if(control.active_object == noone) {
		return
	}
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
	
	var yPos = control.active_object.y;
	var xPos = control.active_object.x;
	var oldActiveObj = control.active_object;
	
	// move all player objects off screen
	control.idle.y = -1000;
	control.walk_left.y = -1000;
	control.walk_right.y = -1000;
	control.attack_left.y = -1000;
	control.attack_right.y = -1000;
	control.attack_2_left.y = -1000;
	control.attack_2_right.y = -1000;
	control.attack_3_left.y = -1000;
	control.attack_3_right.y = -1000;

	if( state & ATTACK_CHECK ) {
		if(control.no_repeat) {
			// this prevents attacking over and over by holding key
			return;
		}
		
		// Since it is an attack, or the direction into the state. If the bit is already set, doesn't matter.
		state = state | control.cur_dir
	}
	
	switch(state) {
		case IDLE:
			control.active_object = control.idle;
			break
		case WALKING_LEFT:
			control.active_object = control.walk_left;
			// Set the current direction, so attack will happen from idle in this direction
			control.cur_dir = LEFT_DIR;	
			// Clear the no repeat flag.
			control.no_repeat = false;
			break;
		case WALKING_RIGHT:
			control.active_object = control.walk_right;
			// Set the current direction, so attack will happen from idle in this direction
			control.cur_dir = RIGHT_DIR;
			// Clear the no repeat flag.
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
			control.state = VOID_STATE;
			// reset active objects position since it was moved off screen.
			control.active_object.y = yPos;
			return;
	}
	// Save the new state
	control.state = state;
	
	// Trigger the stop event for the previously active object.
	with(oldActiveObj) {
		event_perform(ev_other, STOP_EVU1);
	}
	
	// Trigger the start event for the newly activated object.
	with(control.active_object) {
		y = yPos;
		x = xPos;
		event_perform(ev_other, START_EVU0)
	}
}

/***********************************************
	Functions for controlling player walking	
************************************************/

///@function player_walking_start()
///@param {integer} direction to walk <LEFT | RIGHT>
///@description Handle walking state for the player
function player_walking_start(walk_direction) {
	
	// Set this object as the currently active object.
	var control = instance_find(obj_control, 0);
	control.active_object = self;

	// start the object animating
	visible = true;
	image_index = 0;	// start walk
	image_speed = orig_image_speeed;
	
	//layer_hspeed("Background", walk_direction == RIGHT ? -3 : 3);
	hspeed = walk_direction == RIGHT ? 3 : -3;
	
	
}

///@function player_walking_stop()
//@description handle stop walking state.
function player_walking_stop(){
	
	// Stop animating and hide
	visible = false;
	image_speed = 0;
	image_index = 0;
	//layer_hspeed("Background", 0);
	hspeed = 0;
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
	y = -1000;
}

/// @function player_attack_start()
///@description start the attack animation
function player_attack_start() {
	visible = true;
	image_index = 0;	// start attack start
	image_speed = orig_image_speeed;
}


///@function player_attack_end()
///@description Handle finishing the attack
function player_attack_end(){
	// check and see if the attack input is still down
	if(!(get_input_state() & which_attack)) {
		// Nope, so handle the attack being finished
		player_switch_state(ATTACK_FINISHED);
	} else {
		// Yep, so reset the alarm
		player_attack_animation_end();
	}
}

/// @function player_attack_animation_end()
///@description Stop the animation loop, set the alarm to end the attack
function player_attack_animation_end(){
	image_speed = 0
	alarm[1] = room_speed / 10;
	image_index = image_number - 1;
	image_index = 0;
}

// **************************************************************