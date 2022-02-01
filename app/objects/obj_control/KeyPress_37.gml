/// @description start chracter walking left
facing = -1;
idle_flag += 1;
var wl= instance_find(walk_left, 0);
with(wl){
	event_perform(ev_other, START_EVU0);
}