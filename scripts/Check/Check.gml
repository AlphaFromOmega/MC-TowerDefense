//@function check_blocks(excluded)
function check_blocks()
{
	var _col_num, _excluded;
	var _col_list = ds_list_create();
	b_display = false;
	if (argument_count > 0)
	{
		for (var i = 0; i < argument_count; i++)
		{
			_excluded[i] = argument[i];
		}
	}
	
	for (var i = -1; i < 2; i++)
	{
		for (var j = -1; j < 2; j++)
		{
			_col_list = ds_list_create();
			_col_num = collision_point_list(x + i * 16, y + j * 16, obj_block, false, false, _col_list, false);
			for (var c = 0; c < _col_num; c++;)
			{
				if (_col_list[| c].z == z)
				{
					connected[# i + 1, j + 1] = true;
					if (argument_count > 0)
					{
						for (var k = 0; k < array_length(_excluded); k++)
						{
							if (_excluded[k] == _col_list[| c])
							{
								connected[# i + 1, j + 1] = false;
							}
						}
					}
					
					if (i == 0 && j == 1)
					{
						if (_col_list[| c].steps < steps)
						{
							b_display = true;
						}
					}
					break;
				}
			}
			ds_list_destroy(_col_list);
		}
	}
	if (b_display == false)
	{
		b_display = (!connected[# 1, 2]);
	}

	for (var i = -1; i < 2; i++)
	{
		for (var j = -1; j < 2; j++)
		{
			if !(connected[# i + 1, j + 1])
			{
				_col_list = ds_list_create();
				_col_num = collision_point_list(x + i * 16, y + j * 16, obj_block, false, false, _col_list, true);
				var _z = 1000;
				var _highest = noone;
				for (var c = 0; c < _col_num; c++;)
				{
					if (instance_exists(_col_list[| c]) && _col_list[| c].z > z && _col_list[| c].z < _z)
					{
						_z = _col_list[| c].z;
						_highest = _col_list[| c];
					}
				}
				if (instance_exists(_highest))
				{
					_highest.shadow[# 2 - (i + 1), 2 - (j + 1)] = false;
				}
				ds_list_destroy(_col_list);
			}
		}
	}
	ds_list_destroy(_col_list);
}

/// @function wrap(grid, grid_x, grid_y, value)
function scr_auto_tile_value_47(grid, xx, yy, val)
{

	var gw = ds_grid_width(grid);
	var gh = ds_grid_height(grid);

	var tile = 0;
	var bit = 0;

	//Basically, below checks to see all cells around targeted cell.
	//Looking first if it's not 'out of bounds' then see if value matches for auto-wall.
	if(grid[# xx-1, yy-1] == val)//up_left
	{
		if(grid[# xx-1, yy] == val && grid[# xx, yy-1] == val)
		{
			bit = bit | 1;
		}
	}
	if(grid[# xx, yy-1] == val)//up
	{
		bit = bit | 2;
	}
	if(grid[# xx+1, yy-1] == val)//up_right
	{
		if(grid[# xx+1, yy] == val && grid[# xx, yy-1] == val)
		{
			bit = bit | 4;
		}
	}
	if(grid[# xx-1, yy] == val)//left
	{
		bit = bit | 8;
	}
	if(grid[# xx+1, yy] == val)//right
	{
		bit = bit | 16;
	}
	if(grid[# xx-1, yy+1] == val)//down_left
	{
		if(grid[# xx-1, yy] == val && grid[# xx, yy+1] == val)
		{
			bit = bit | 32;
		}
	}
	if(grid[# xx, yy+1] == val)//down
	{
		bit = bit | 64;
	}
	if(grid[# xx+1, yy+1] == val)//down_right
	{
		if(grid[# xx+1, yy] == val && grid[# xx, yy+1] == val)
		{
			bit = bit | 128;
		}
	}

	var hx = gw-1;
	var hy = gh-1;

	if(xx == 0)
	{
		bit = bit | 8;

		if(yy == 0)
		{
			bit = bit | 1;
			bit = bit | 2;
		
			if(grid[# xx, yy+1] == val)
			{
				bit = bit | 32;
			}
			if(grid[# xx+1, yy])
			{
				bit = bit | 4;
			}
		}
		else if(yy == hy)
		{
			bit = bit | 32;
			bit = bit | 64;
	
			if(grid[# xx, yy-1] == val)
			{
				bit = bit | 1;
			}
			if(grid[# xx+1, yy])
			{
				bit = bit | 128;
			}
		}
		else
		{
			if(grid[# xx, yy-1] == val)
			{
				bit = bit | 1;
			}
			if(grid[# xx, yy+1])
			{
				bit = bit | 32;
			}
		}
	}
	else if(xx == hx)
	{
		bit = bit | 16;

		if(yy == 0)
		{
			bit = bit | 2;
			bit = bit | 4;
	
			if(grid[# xx-1, yy] == val)
			{
				bit = bit | 1;
			}
			if(grid[# xx, yy+1])
			{
				bit = bit | 128;
			}
		}
		else if(yy == hy)
		{
			bit = bit | 64;
			bit = bit | 128;
	
			if(grid[# xx-1, yy] == val)
			{
				bit = bit | 32;
			}
			if(grid[# xx, yy-1])
			{
				bit = bit | 4;
			}
		}
		else
		{
			if(grid[# xx, yy-1] == val)
			{
				bit = bit | 4;
			}
			if(grid[# xx, yy+1])
			{
				bit = bit | 128;
			}
		}
	}
	else
	{
		if(yy == 0)
		{
			bit = bit | 2;
	
			if(grid[# xx-1, yy] == val)
			{
				bit = bit | 1;
			}
			if(grid[# xx+1, yy])
			{
				bit = bit | 4;
			}
		}
		else if(yy == hy)
		{
			bit = bit | 64;
	
			if(grid[# xx-1, yy] == val)
			{
				bit = bit | 32;
			}
			if(grid[# xx+1, yy])
			{
				bit = bit | 128;
			}
		}
	}

	switch(bit)
	{
		case 0: tile = 46; break;
		case 2: tile = 44; break;
		case 8: tile = 45; break;
		case 10: tile = 39; break;
		case 11: tile = 38; break;
		case 16: tile = 43; break;
		case 18: tile = 41; break;
		case 22: tile = 40; break;
		case 24: tile = 33; break;
		case 26: tile = 31; break;
		case 27: tile = 30; break;
		case 30: tile = 29; break;
		case 31: tile = 28; break;
		case 64: tile = 42; break;
		case 66: tile = 32; break;
		case 72: tile = 37; break;
		case 74: tile = 27; break;
		case 75: tile = 25; break;
		case 80: tile = 35; break;
		case 82: tile = 19; break;
		case 86: tile = 18; break;
		case 88: tile = 23; break;
		case 90: tile = 15; break;
		case 91: tile = 14; break;
		case 94: tile = 13; break;
		case 95: tile = 12; break;
		case 104: tile = 36; break;
		case 106: tile = 26; break;
		case 107: tile = 24; break;
		case 120: tile = 21; break;
		case 122: tile = 7; break;
		case 123: tile = 6; break;
		case 126: tile = 5; break;
		case 127: tile = 4; break;
		case 208: tile = 34; break;
		case 210: tile = 17; break;
		case 214: tile = 16; break;
		case 216: tile = 22; break;
		case 218: tile = 11; break;
		case 219: tile = 10; break;
		case 222: tile = 9; break;
		case 223: tile = 8; break;
		case 248: tile = 20; break;
		case 250: tile = 3; break;
		case 251: tile = 2; break;
		case 254: tile = 1; break;
		case 255: tile = 0; break;
		default: tile = -1; break;//That means no tile
	}

	return tile;
}
