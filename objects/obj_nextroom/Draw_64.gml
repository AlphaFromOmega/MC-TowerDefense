/// @description ?
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fn_menu);
if (nextroom)
{
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "Loading");
}
else
{
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "Press Space");
}