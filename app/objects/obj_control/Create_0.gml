/// @description determin which Maid will play the level and set them up
state = VOID_STATE;


var saiki = [obj_saiki_idle,
			obj_saiki_walk_left, 
			obj_saiki_walk_right, 
			obj_saiki_attack_left,
			obj_saiki_attack_right,
			obj_saiki_attack_2_left,
			obj_saiki_attack_2_right,
			obj_saiki_attack_3_left,
			obj_saiki_attack_3_right
			]

var akane = [obj_akane_idle,
			obj_akane_walk_left, 
			obj_akane_walk_right, 
			obj_akane_attack_left,
			obj_akane_attack_right,
			obj_akane_attack_2_left,
			obj_akane_attack_2_right,
			obj_akane_attack_3_left,
			obj_akane_attack_3_right
]

var miku = [obj_miku_idle,
			obj_miku_walk_left,
			obj_miku_walk_right,
			obj_miku_attack_left,
			obj_miku_attack_right,
			obj_miku_attack_2_left,
			obj_miku_attack_2_right,
			obj_miku_attack_3_left,
			obj_miku_attack_3_right,
			]

var objects = [];
switch(global.which_maid) {
	case "saiki":
		objects = saiki;
		break;
	case "akane":
		objects = akane;
		break;
	case "miku":
		objects = miku;
		break;
}	

for(var i = 0; i < array_length(objects); i++) {
	var obj = instance_create_layer(640, 480, "Instances", objects[i]);
	print("something" + string(obj));
}

