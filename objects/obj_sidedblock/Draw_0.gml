/// @description Render 3D + Soft Shadows

draw_sprite_ext(sprite_index, image_index, x, sprite_y + (16 - steps)/2, 1, 1, image_angle, c_white, image_alpha);
draw_sprite_ext(spr_shadow, shadows, x, sprite_y + (16 - steps)/2, 1, 1, 0, c_white, image_alpha/2);
if (b_display)
{
	draw_sprite_part_ext(sides[image_angle div 90], image_index, 0, 16 - steps, 16, steps, bbox_left, sprite_y + sprite_bottom + 1 + (16 - steps)/2, 1, 0.5, c_white, image_alpha);
	draw_sprite_ext(spr_shadow, 28, x, sprite_y + sprite_bottom + 1 + sprite_height/4, 1, 0.5, 0, c_white, 0.5);
	
	draw_set(c_black, 0.25);
	draw_rectangle(x + sprite_left, sprite_y + sprite_bottom + 1, x + sprite_right, sprite_y + sprite_bottom + 9, false);
	draw_set();
}

if (selected)
{
	draw_set(c_gray, 0.4);
	draw_rectangle(x + sprite_left, sprite_y + sprite_top, x + sprite_right, sprite_y + sprite_bottom + b_display * 8, false);
}