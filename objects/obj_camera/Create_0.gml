/// initialize camera variables, never change these
window_sizes = [[1024,768],[1280,800],[1280,1024],[1280,720],[1360, 768],[1366,768],[1440, 900],[1600, 900],[1680, 1050],[1920, 1080]]

max_width = display_get_width();
max_height = display_get_height();

for (var i = 1; i < array_length(window_sizes); i++) {
	if (window_sizes[i][0] > max_width || window_sizes[i][1] > max_height) {
		break;
	}
}
max_window = i - 1;
current_window = max_window;


cameraXTo = 1920;
cameraYTo = 1080;

cameraWidth = 1920;
cameraHeight = 1080;


