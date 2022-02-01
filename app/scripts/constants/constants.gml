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
