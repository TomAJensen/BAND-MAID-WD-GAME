/// @description
var controller = instance_find(obj_control, 0);
if(controller.active_object != noone) {
	x = controller.active_object.x;
	y = controller.active_object.y;
	depth = controller.active_object.depth;
}
