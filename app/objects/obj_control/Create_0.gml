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
var current_maid = 0;
switch(global.which_maid) {
	case "saiki":
		objects = saiki;
		current_maid = 0;
		break;
	case "misa":
		current_maid = 1;
		break;
	case "kanami":
		current_maid = 2;
		break;
	case "akane":
		current_maid = 3;
		objects = akane;
		break;
	case "miku":
		current_maid = 4;
		objects = miku;
		break;
}	

for(var i = 0; i < array_length(objects); i++) {
	var obj = instance_create_layer(640, 480, "Instances", objects[i]);
	print("something" + string(obj));
}
var inst_stats = instance_create_layer(0,0,"Instances", obj_player_stats);
inst_stats.current_maid = current_maid;
inst_stats.health_max = 100;
inst_stats.current_health = 100;
inst_stats.super_max = 100;
inst_stats.current_super = 70;
inst_stats.secondary_max = 100;
inst_stats.current_secondary = 100;

with(inst_stats) {
	event_perform(ev_other, ev_user0);	
}

