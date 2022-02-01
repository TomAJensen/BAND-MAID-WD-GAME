/// @description initiate attack

switch(facing) {
	case 1:
		walk_right.visible = false;
		var ar = instance_find(attack_right, 0);
		with(ar) {
			event_perform(ev_other, START_EVU0);
		}
		//event_perform_object(ar, ev_other, ev_user0);
		break;
	case -1:
	walk_left.visible = false ;
		var al = instance_find(attack_left, 0);
		with(al) {
			event_perform(ev_other, START_EVU0)
		}
		break;
}