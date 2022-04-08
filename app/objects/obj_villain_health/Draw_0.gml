/// @description display health status
draw_self();
draw_set_color(c_lime);
var top = (y - sprite_yoffset) + 1;
var left = (x - sprite_xoffset) + 1;
var health_width = current_health / max_health * 50;
draw_rectangle( left, top,  left + health_width, 2 + top, false);

