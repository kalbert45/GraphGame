/// draw graph
if (room != room_start) {
	graph_draw(graph);
}

if (global.mouse_activated) {
	draw_set_color(c_orange);
	draw_line_width(mouse_x, mouse_y, global.selected.x, global.selected.y, 5);
}