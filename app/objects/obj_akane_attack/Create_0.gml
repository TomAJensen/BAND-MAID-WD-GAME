/// @description initialize Akane attack
original_image_speed = image_speed;
image_speed = 0;
visible = 0;
var objAkaneIdle = instance_find(obj_akane_idle, 0);
var objAkaneAttack = instance_find(obj_akane_attack, 0);
with(objAkaneIdle) {
	attack_obj = objAkaneAttack;
}