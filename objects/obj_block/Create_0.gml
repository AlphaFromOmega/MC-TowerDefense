/// @description ?

// Constants
sprite_left = bbox_left - x;
sprite_right = bbox_right - x;
sprite_bottom = bbox_bottom - y;
sprite_top = bbox_top - y;

// Variables
steps = 16;
created = false;
if !(variable_instance_get(id, "side"))
{
	side = sprite_index
}

built = false;
selected = false;

x = floor(x / sprite_width) * sprite_width + (x - bbox_left);
room_y = round(y / sprite_height) * sprite_height + (y - bbox_top);
y = room_y;
z = depth - 100;

sprite_y = room_y + z*8;
bottom = false;
check = false;

shadows = 0;
joints = 0;

connected = ds_grid_create(3, 3);
shadow = ds_grid_create(3, 3);

for (var i = 0; i < 3; i++;)
{
	for (var j = 0; j < 3; j++;)
	{
		connected[# i, j] = false;
		shadow[# i, j] = true;
	}
}

depth = (z - room_y);

if (variable_instance_get(obj_level, "loaded"))
{
	if (obj_level.loaded)
	{
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
		check_blocks();
		shadows = scr_auto_tile_value_47(shadow, 1, 1, 1);
		joints = scr_auto_tile_value_47(connected, 1, 1, 1);
	}
}

b_display = (!connected[# 1, 2] || bottom);