/// @description
if(cycle_end != 0 and gamepad_button_check(0, gp_face1)) {
	image_index = image_index == cycle_end ? cycle_start : image_index;
}
