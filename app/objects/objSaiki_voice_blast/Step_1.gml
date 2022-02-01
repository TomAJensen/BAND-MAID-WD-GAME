/// @description track the vocal burst
if(track) {
	var saiki_attack = instance_find(objSaiki_Attack, 0)	
	if(x - saiki_attack.x > 500){
		visible = false;
		x = saiki_attack.x;
		speed = 0;
		image_index = 0;
		track = false;
	}
}

