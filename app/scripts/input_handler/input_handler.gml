/*****************************************
Script for handling of inputs.
*****************************************/

///@function handle_start_attack()
/// @param {Integer} attack_num
///@description trigger the players attack
function handle_start_attack(attack_num){
	var layer_id = layer_get_id("Background");
	var attacks_right = [attack_right, attack_2_right, attack_3_right]
	var attacks_left = [attack_left, attack_2_left, attack_3_left]
	with(layer_id) {
	
	}
	
	switch(facing) {
		case 1:
			walk_right.visible = false;
			var obj_to_find = attacks_right[attack_num];
			//var ar = instance_find(attack_right, 0);
			var ar = instance_find(obj_to_find, 0);
			with(ar) {
				event_perform(ev_other, START_EVU0);
			}
			break;
			
		case -1:
			walk_left.visible = false ;
			var obj_to_find = attacks_left[attack_num];
			//var al = instance_find(attack_left, 0);
			var al = instance_find(obj_to_find, 0);
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