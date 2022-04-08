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
#macro START 999
#macro BACK 2048

#macro ATTACK_1_EVENT ev_user15
#macro INPUT_RIGHT_EVENT ev_user11
#macro INPUT_LEFT_EVENT ev_user12
#macro ATTACK_2_EVENT ev_user14
#macro ATTACK_3_EVENT ev_user13
#macro ATTACK_1 2
#macro ATTACK_2 4
#macro ATTACK_3 8
#macro ATTACK_FINISHED 32

#macro LEFT_DIR 16
#macro RIGHT_DIR 1
#macro ATTACK_CHECK 2 + 4 + 8

// States
#macro IDLE 0
#macro WALKING_LEFT 16
#macro WALKING_RIGHT 1
#macro ATTACK_1_LEFT WALKING_LEFT + ATTACK_1
#macro ATTACK_1_RIGHT WALKING_RIGHT + ATTACK_1
#macro ATTACK_2_LEFT WALKING_LEFT + ATTACK_2
#macro ATTACK_2_RIGHT WALKING_RIGHT + ATTACK_2
#macro ATTACK_3_LEFT WALKING_LEFT + ATTACK_3
#macro ATTACK_3_RIGHT WALKING_RIGHT + ATTACK_3
#macro VOID_STATE 1024

#macro HEALTH_BAR_FLOAT 5

enum player_object_type {
	idle,
	attack_left,
	attack_right,
	walk_left,
	walk_right,
	attack_2_left,
	attack_2_right,
	attack_3_left,
	attack_3_right,

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