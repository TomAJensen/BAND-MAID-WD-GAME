/// @description stop the movement animation
idle_flag -= 1;
var wr = instance_find(walk_right, 0);
with(wr) {
	event_perform(ev_other, STOP_EVU1);
}
