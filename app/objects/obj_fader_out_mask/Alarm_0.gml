/// @description make more transperant.
image_alpha = image_alpha <= .97 ? image_alpha + .03 : 1;
if(image_alpha < 1) {
	alarm[0] = 2;
} else {
	with(fade_control) {
		event_perform(ev_other, ev_user14);
	}
}
