/// @description


if(y > max_y) {
	vspeed = 0;
	y = max_y;
	alarm[0] = room_speed * random(3) + .5;
} else if(y < min_y) {
	vspeed = 0;
	y = min_y;
	alarm[1] = room_speed + random(3) + .5;
}


