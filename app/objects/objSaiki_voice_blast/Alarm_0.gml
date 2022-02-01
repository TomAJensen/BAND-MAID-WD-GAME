/// @description handle saiki voice blast
switch(image_index) {
	case 0:
		visible = true;
	case 1:
		image_index++;
		alarm[0] = room_speed / 15;	
		break;
	case 2:
		direction = 0;
		speed = 15;
		track = true;
		break;
}