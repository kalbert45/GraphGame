/// create camera
view_enabled = true;
view_visible[0] = true;

cameraX = 0;
cameraY = 0;

camera_set_view_size(view_camera[0], cameraWidth, cameraHeight);
camera_set_view_pos(view_camera[0], cameraX, cameraY);

displayWidth = window_sizes[current_window][0];
displayHeight = window_sizes[current_window][1];

window_set_size(displayWidth, displayHeight);
surface_resize(application_surface, displayWidth, displayHeight);

