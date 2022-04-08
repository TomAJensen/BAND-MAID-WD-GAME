/// @description this room can be used to hold the game in a pause before starting for vid capture

if(gamepad_button_check(0, gp_face1)) {
	room_goto(rm_game_start);
}
