/// create camera

cameraX = 0;
cameraXTo = 1920;
cameraY = 0;

cameraWidth = 1920;
cameraHeight = 1080;

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], cameraWidth, cameraHeight);
camera_set_view_pos(view_camera[0], cameraX, cameraY);

displayScale = 1;
displayWidth = cameraWidth * displayScale;
displayHeight = cameraHeight * displayScale;

window_set_size(displayWidth, displayHeight);
surface_resize(application_surface, displayWidth, displayHeight);

