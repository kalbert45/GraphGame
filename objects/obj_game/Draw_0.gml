/// draw graph
if (room != room_start && room != room_levelselect) {
	graph_draw(graph);
	graph_draw_act(graph, line_curve_struct);
}

if (global.mouse_activated) {
//	draw_set_color(c_orange);
//	draw_line_width(mouse_x, mouse_y, global.selected.x, global.selected.y, 5);
}