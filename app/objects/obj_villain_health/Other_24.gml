/// @description take damage
current_health -= damage_to_take;
damage_to_take = 0;
print(string(current_health))
if(current_health <= 0) {
	with(other) {
		event_perform(ev_other, ev_user15);
	}
}
