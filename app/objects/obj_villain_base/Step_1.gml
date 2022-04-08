/// @description Set the depth of the character and place health bar
depth = room_height - y;
// bring health-o-meter to proper location
if(health_bar != noone) {
	health_bar.x = x;
	health_bar.y = y - sprite_height - HEALTH_BAR_FLOAT;
	health_bar.base_y = y
}
