/// @description stop movement
var saiki_attack = instance_find(objSaiki_Attack, 0);
if(saiki_attack.visible) return;

var back_layer = layer_get_id("Background");
layer_hspeed(back_layer, 0);
var saiki_walk = instance_find(objSaiki_walk_right, 0);
var saiki_idle = instance_find(objSaiki_Idle, 0);
saiki_walk.visible = false;
saiki_idle.visible = true;
