#macro JUMP_HEIGHT 150
#macro DIR_UP 90
#macro DIR_UP_RIGHT 45
#macro DIR_UP_LEFT 135
#macro DIR_LEFT 180
#macro DIR_RIGHT 0
#macro START_EVU0 ev_user0
#macro STOP_EVU1 ev_user1
#macro LEFT -1
#macro RIGHT 1

#macro ATTACK_1_EVENT ev_user15
#macro INPUT_RIGHT_EVENT ev_user11
#macro INPUT_LEFT_EVENT ev_user12
#macro ATTACK_2_event ev_user14
#macro ATTACK_3_event ev_user13


enum player_object_type {
	idle,
	attack_left,
	attack_right,
	walk_left,
	walk_right
}
	
enum background_control {
	left,
	right
}

enum input_value {
	input_left,
	input_right,
	input_attack_1,
	input_attack_2,
	input_attack3
}