/// @description determin which Maid will play the level.
var saiki = [obj_saiki_idle,
			obj_saiki_walk_left, 
			obj_saiki_walk_right, 
			obj_saiki_attack_left,
			obj_akane_attack_right,
			obj_saiki_attack_2_left,
			obj_saiki_attack_2_right,
			obj_saiki_attack_3_left,
			obj_saiki_attack_3_right
			]


var objects = [];
switch(global.which_maid) {
	case "saiki":
		objects = saiki;
		break;
}	

for(var i = 0; i < array_length(objects); i++) {
	var obj = instance_create_layer(640, 480, "Instances", objects[i]);
	print("something" + string(obj));
}
