/// @description start walking right
facing = 1;
idle_flag += 1;
var wr = instance_find(walk_right, 0);
with(wr) {
	event_perform(ev_other, START_EVU0);
}