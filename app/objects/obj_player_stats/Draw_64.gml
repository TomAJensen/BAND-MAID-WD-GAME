/// @description draw the player stats if not in a fade
// first draw the health 
var fader_control = instance_find(obj_fader_control, 0);
var alpha = 1;
if(fader_control.fade_mask_instance != noone) {
	alpha = 1 - fader_control.fade_mask_instance.image_alpha;
}
//if(!fader_control.fading) {
	draw_stats(alpha);
//}
