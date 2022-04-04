/// @description make more transperant.
image_alpha = image_alpha >= .03 ? image_alpha - .03 : 0;
if(image_alpha > 0) {
	alarm[0] = 2;
} else {
	with(fade_control) {
		event_perform(ev_other, ev_user15);
	}
}
