/// @description Spawn the objects

var obj = instance_find(to_spawn, 0);
var curr_x = obj.x + every;
var curr_y = obj.y
var layer_id = layer_get_id("Instances");

for(var i = 0; i < total; i++) {
	var newObj = instance_create_layer(curr_x, curr_y, layer_id, to_spawn);
	curr_x += every;
}
