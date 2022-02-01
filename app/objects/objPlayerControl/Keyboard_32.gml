/// @description Trigger Saiki's attack
var saiki_idle = instance_find(objSaiki_Idle, 0);
var saiki_walking = instance_find(objSaiki_walk_right, 0);
var saiki_attack = instance_find(objSaiki_Attack, 0)
if(saiki_attack.visible) return;
if(saiki_idle.visible) {
	show_debug_message("Saiki Idle visible")
	saiki_idle.visible = false;
	saiki_attack.who_was_visible = saiki_idle;
} else if(saiki_walking.visible) {
	show_debug_message("Saiki walking visible")
	saiki_walking.visible = false;
	saiki_attack.who_was_visible = saiki_walking;
	var back_layer = layer_get_id("Background");
	layer_hspeed(back_layer, 0);
}

saiki_attack.visible = true;
saiki_attack.alarm[1] = saiki_attack.motion_delay;
saiki_attack.attack_part_1 = true;

