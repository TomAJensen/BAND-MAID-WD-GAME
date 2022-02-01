/// @description stop walking left
idle_flag -= 1;
var wl = instance_find(walk_left, 0);
with(wl) {
	event_perform(ev_other, STOP_EVU1);
}