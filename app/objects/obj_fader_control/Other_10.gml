/// @description start a fade out
fading = true;
var _x = camera_get_view_x(view_camera[0]);
fade_mask_instance = instance_create_layer(_x,0,"Instances", obj_fader_out_mask);
