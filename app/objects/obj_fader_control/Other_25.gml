/// @description Fade done
fading = false;
if(starter != noone) {
	with(starter) {
		event_perform(ev_other, ev_user0);
	}
}
instance_destroy(fade_mask_instance);
fade_mask_instance = noone;
