/// @description ?
if (time <= 0)
{
	var _xx = x + lengthdir_x(8, image_angle);
	var _yy = y + lengthdir_y(8, image_angle);
	proj = instance_create_depth(_xx, _yy + 4, depth, obj_arrow);
	proj.owner = id;
	proj.z = z;
	proj.direction = image_angle;
	proj.image_angle = image_angle;
	time = reload;
	audio_play_sound(sfx_shoot, 100, false);
}
else
{
	time--;
}