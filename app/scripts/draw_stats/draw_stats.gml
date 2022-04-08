// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_stats(alpha){
	// first draw the health 
	var health_left_offset = 179;
	var secondary_left_offset = 172;
	var base_width = sprite_width - health_left_offset; // account for the blank left space.
	var width = base_width * (current_health / health_max);
	draw_sprite_part_ext(spr_player_stats, maid_offset + 1, health_left_offset, y, width, sprite_height, health_left_offset, y, 1, 1, c_white, alpha);
	// draw the secondary gauge
	base_width = sprite_width - secondary_left_offset; // account for the blank left space.
	width = base_width * (current_secondary / secondary_max);
	draw_sprite_part_ext(spr_player_stats, maid_offset + 2, secondary_left_offset, y, width, sprite_height, secondary_left_offset, y, 1, 1, c_white, alpha);
	// draw the grey image
	draw_sprite_ext(spr_player_stats, maid_offset + 4, x, y, 1, 1, 0, c_white, alpha);
	// draw super gauge
	var super_height = sprite_height * (current_super / super_max);
	var super_y = (y + sprite_height) - super_height
	draw_sprite_part_ext(spr_player_stats, maid_offset + 3, x, super_y, sprite_width, super_height, x, super_y, 1, 1, c_white, alpha);
	//draw_sprite_part_ext(sprite, subimg, left, top, width, height, x, y, xscale, yscale, colour, alpha);
}