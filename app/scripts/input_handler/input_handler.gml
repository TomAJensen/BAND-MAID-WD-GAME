/*****************************************
Script for handling of inputs.
*****************************************/

///@function handle_start_attack()
///@description trigger the players attack
function handle_start_attack(){
	var layer_id = layer_get_id("Background");
	with(layer_id) {
	
	}

	switch(facing) {
		case 1:
			walk_right.visible = false;
			var ar = instance_find(attack_right, 0);
			with(ar) {
				show_debug_message("yep, called a bunch")
				event_perform(ev_other, START_EVU0);
			}
			//event_perform_object(ar, ev_other, ev_user0); 
			break;
		case -1:
		walk_left.visible = false ;
			var al = instance_find(attack_left, 0);
			with(al) {
				event_perform(ev_other, START_EVU0)
			}
			break;
	}
}

///@function start_player_walking_left()
/// @description start player walking left
function start_player_walking_left() {
	facing = -1;
	idle_flag += 1;
	var wl= instance_find(walk_left, 0);
	with(wl){
		event_perform(ev_other, START_EVU0);
	}
}

///@function stop_player_walking_left()
/// @description stop player walking left
function stop_player_walking_left() {
	idle_flag -= 1;
	var wl = instance_find(walk_left, 0);
	with(wl) {
		event_perform(ev_other, STOP_EVU1);
	}
}

///@function start_player_walking_right()
/// @description start player walking right
function start_player_walking_right() {
	facing = 1;
	idle_flag += 1;
	var wr = instance_find(walk_right, 0);
	with(wr) {
		event_perform(ev_other, START_EVU0);
	}
}

///@function stop_player_walking_right()
/// @description stop player walking right
function stop_player_walking_right() {
	idle_flag -= 1;
	var wr = instance_find(walk_right, 0);
	with(wr) {
		event_perform(ev_other, STOP_EVU1);
	}
}