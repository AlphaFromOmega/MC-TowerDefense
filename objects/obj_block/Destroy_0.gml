/// @description ?
var _surround_list = ds_list_create();
var _surround_num = collision_rectangle_list(x - 24, y - 24, x + 24, y + 24, obj_block, false, false, _surround_list, true);
for (var c = 0; c < _surround_num; c++;)
{
	with (_surround_list[| c])
	{
		check_blocks();
		shadows = scr_auto_tile_value_47(shadow, 1, 1, 1);
		joints = scr_auto_tile_value_47(connected, 1, 1, 1);
	}
}