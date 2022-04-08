/// @description
health_bar = instance_create_layer(0,0, "Instances", obj_villain_health)
if(health_bar != noone) {
	health_bar.max_health = starting_max_health;
	health_bar.current_health = starting_max_health;
	health_bar.base_y = y;
}

