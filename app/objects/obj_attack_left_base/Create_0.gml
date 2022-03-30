/// @description setup which attack needs to be registered
switch(which_attack) {
	case ATTACK_1:
		player_register_object_for_control(id, player_object_type.attack_left);
		break;
	case ATTACK_2:
		player_register_object_for_control(id, player_object_type.attack_2_left);
		break;	
	case ATTACK_3:
		player_register_object_for_control(id, player_object_type.attack_3_left);
		break;	
	
}
player_attack_setup();