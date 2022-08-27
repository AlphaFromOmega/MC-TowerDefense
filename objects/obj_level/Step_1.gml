/// @description ?		

var _col_list = ds_list_create();
var _col_num = collision_line_list(mouse_x, mouse_y - 16, mouse_x, room_height, obj_block, false, false, _col_list, true);
var _depth = 10000;
var _highest = noone;
for (var c = 0; c < _col_num; c++;)
{
	if (_col_list[| c].object_index == obj_highlight)
	{
		continue;
	}
	if (_depth > _col_list[| c].depth && (point_distance(mouse_x, mouse_y, _col_list[| c].x, _col_list[| c].sprite_y) <= 8))
	{
		_depth = _col_list[| c].depth;
		_highest = _col_list[| c];
	}
}
	ds_list_destroy(_col_list);

if (instance_exists(_highest))
{
	var _col_list = ds_list_create();
	var _col_num = collision_point_list(_highest.x, _highest.y, obj_block, false, false, _col_list, true);
	var _repeat = true;
	while (_repeat)
	{
		_repeat = false;
		for (var i = 0; i < _col_num; i++;)
		{
			if (_highest.z - 1 == _col_list[| i].z)
			{
				_highest = _col_list[| i].id;
				_repeat = true;
			}
		}
	}
	ds_list_destroy(_col_list);
	
	highlighted = _highest;
	if (keyboard_check(vk_space))
	{
		highlighted.selected = true;
		show_debug_message(string(highlighted.depth));
	}
	
	if (mouse_check_button_pressed(mb_right))
	{
		var _index = scr_auto_tile_value_47(_highest.connected, 1, 1, 1);
		var _shadow = scr_auto_tile_value_47(_highest.shadow, 1, 1, 1);
		show_debug_message("////////////////");
		for (var i = 0; i < 3; i++)
		{
			show_debug_message("[" + string(_highest.connected[# 0, i]) + ", " + string(_highest.connected[# 1, i]) + ", " + string(_highest.connected[# 2, i]) + "]")
		}
		show_debug_message("index" + string(_index));
		for (var i = 0; i < 3; i++)
		{
			show_debug_message("[" + string(_highest.shadow[# 0, i]) + ", " + string(_highest.shadow[# 1, i]) + ", " + string(_highest.shadow[# 2, i]) + "]")
		}
		show_debug_message("Shadow" + string(_shadow));
		show_debug_message("////////////////");
	}
}
