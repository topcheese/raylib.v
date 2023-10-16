import irishgreencitrus.raylibv as rl



const (
	screen_width = 800
	screen_height = 450
)


fn main() {
	// init_window initializes the game window with the specified width, height and title
	rl.init_window(screen_width, screen_height, "raylibv [core] example - mouse input".str)
	
	// ball_position stores the current position of the ball, initialized off screen
	mut ball_position := rl.Vector2{-100, -100}

	// ball_color stores the current color of the ball
	mut ball_color := rl.Color{r: 255, g: 0, b: 0, a: 139}

	// set_target_fps sets the target framerate for the game loop
	rl.set_target_fps(60)


	// The main game loop, runs until the window is closed
	for !rl.window_should_close() {

		// Update ball position to mouse position
		ball_position = rl.get_mouse_position()

		// Check mouse buttons pressed and update ball color
		if rl.is_mouse_button_pressed(rl.mouse_button_left) {
			ball_color = rl.Color{r: 128, g: 0, b: 0, a: 50} // Maroon
		} else if rl.is_mouse_button_pressed(rl.mouse_button_middle) {
			ball_color = rl.Color{r: 00, g: 255, b: 0, a: 50} // Lime
		} else if rl.is_mouse_button_pressed(rl.mouse_button_right) {
			ball_color = rl.Color{r: 0, g: 0, b: 139, a: 50} // Dark Blue
		} else if rl.is_mouse_button_pressed(rl.mouse_button_side) {
			ball_color = rl.Color{r: 128, g: 0, b: 128, a: 50} // Purple
		} else if rl.is_mouse_button_pressed(rl.mouse_button_extra) {
			ball_color = rl.Color{r: 255, g: 255, b: 0, a: 50}  // Yellow
		} else if rl.is_mouse_button_pressed(rl.mouse_button_forward) {
			ball_color = rl.Color{r: 255, g: 165, b: 0, a: 50} // Orange
		} else if rl.is_mouse_button_pressed(rl.mouse_button_back) {
			ball_color = rl.Color{r: 245, g: 245, b: 220, a: 50} // Beige
		} else {
			println('Something went wrong!')
		}

		// Draw the scene
		rl.begin_drawing()
		rl.clear_background(rl.raywhite)

		// Draw the ball at the current position and color
		rl.draw_circle_v(ball_position, 40, ball_color)

		// Display instructions
		rl.draw_text("Move ball with mouse and click mouse buttons to change color".str, 10, 10, 20, rl.gray)

		// End the drawing and update the screen
		rl.end_drawing()
	}
	// Close the game window
	rl.close_window()
}
