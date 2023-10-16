import irishgreencitrus.raylibv as rl

const (
	screen_width  = 800
	screen_height = 450
)

fn main() {

	rl.init_window(screen_width, screen_height, 'raylib [core] example - 2d camera mouse zoom'.str)

	mut camera := rl.Camera2D{}
	camera.zoom = 1.0

	rl.set_target_fps(60)

	for !rl.window_should_close() {





		// Translate based on mouse right click
		if rl.is_mouse_button_down(rl.mouse_button_right) {
			mut delta := rl.Vector2{-100, -100}
			delta = rl.get_mouse_delta()
			delta = rl.vector2_scale(delta, -1.0/camera.zoom)

			camera.target = rl.vector2_add(camera.target, delta)
		}
		
		// Zoom, based on mouse wheel
		mut wheel := rl.get_mouse_wheel_move()

		if wheel != 0 {
			// Get the world point that is under the mouse
			mut mouse_world_position := rl.get_screen_to_world_2d(rl.get_mouse_position(), camera)

			// Set the offset to where the mouse is
			camera.offset = rl.get_mouse_position()

			// Set the target to match, so that the camera maps the world space point
			// under the cursor to the screen space point under the cursor at any zoom
			camera.target = mouse_world_position

			// Zoom increment
			zoom_increment := 0.125
			camera.zoom += f32(wheel * zoom_increment)

			if camera.zoom < zoom_increment {
				camera.zoom = f32(zoom_increment)
			}
		}

		rl.begin_drawing()
		rl.clear_background(rl.black)

		rl.begin_mode_2d(camera)

		// Draw the 3d grid, rotate 90 degrees and centered around 0.0
		// just so we have something in the XY plane
		rl.rl_push_matrix()
		rl.rl_translatef(0, 25*50, 0)
		rl.rl_rotatef(90, 1, 0, 0)
		rl.draw_grid(100, 50)
		rl.rl_pop_matrix()

		// Draw a reference circle
		rl.draw_circle(100, 100, 50, rl.yellow)

		rl.end_mode_2d()

		rl.draw_text('Mouse right button drag to move, mouse wheel to zoom'.str, 10, 10, 10, rl.white)


		rl.end_drawing()
	}
	rl.close_window()
}