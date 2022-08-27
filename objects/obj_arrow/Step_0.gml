/// @description ?
if (life <= 0)
{
	instance_destroy()
}
else
{
	life--;
}
sprite_y = y + z*8;
image_angle = direction;
depth = (z - bbox_bottom);