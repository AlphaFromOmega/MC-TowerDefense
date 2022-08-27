/// @description Render 3D + Soft Shadows

draw_sprite_ext(sprite_index, image_index, x, sprite_y + (16 - steps)/2, 1, 1, image_angle, c_white, image_alpha);
if (b_display)
{
	draw_sprite_part_ext(sides[image_angle div 90], image_index, 0, 16 - steps, 16, steps, bbox_left, sprite_y + sprite_bottom + 1 + (16 - steps)/2, 1, 0.5, c_white, image_alpha);
}