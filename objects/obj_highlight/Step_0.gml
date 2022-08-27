/// @description ?
image_angle += (keyboard_check_pressed(ord("Q")) - keyboard_check_pressed(ord("E"))) * 90;
image_angle = wrap(image_angle, 360);

var _inst = obj_level.highlighted
if (instance_exists(obj_level) && instance_exists(_inst))
{
	x = _inst.x;
	sprite_y = _inst.sprite_y - 8;
	if (mouse_check_button_pressed(mb_left))
	{
		var _int = instance_create_depth(x, _inst.room_y - 4, _inst.z + 99, obj_dispenser);
		_int.image_angle = image_angle;
		_int.built = true;
	}
	if (mouse_check_button_pressed(mb_right) && _inst.built)
	{
		instance_create_depth(_inst.x, _inst.y, 0, obj_shadowchecker)
		instance_destroy(_inst);
	}
}
depth = -10000;
