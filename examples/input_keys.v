// This code is a simple game application using the Raylib library in the V programming language. It creates a window with
// a moving ball. The ball's movement is controlled by the arrow keys.
module examples

import  irishgreencitrus.raylibv as rl



// The main function is the entry point of the program.

fn main() {

	// The rl.init_window function initializes a window with a specified width, height, and title.
	rl.init_window(screen_width, screen_height, "My Game".str)

	// A mutable ball_position variable is defined, representing the current position of the ball.
	mut ball_position := rl.Vector2{x: screen_width / 2, y: screen_height / 2}

	// The rl.set_target_fps function sets the target frames per second (fps) for the game loop.
	rl.set_target_fps(60)

	// The for !rl.window_should_close() loop runs until the window is closed. This is the main game loop.
	for !rl.window_should_close() {

		// Inside the game loop, the rl.is_key_down function checks if a specific key is being pressed. If the
		// right, left, up, or down arrow keys are pressed, the position of the ball is updated accordingly.
		if rl.is_key_down(rl.key_right) {
			ball_position.x += 2.0
		} else if rl.is_key_down(rl.key_left) {
			ball_position.x -= 2.0
		} else if rl.is_key_down(rl.key_up) {
			ball_position.y -= 2.0
		} else if rl.is_key_down(rl.key_down) {
			ball_position.y += 2.0
		} else {
			println('Something went wrong!')
		}
		

		// The rl.begin_drawing function signals the start of drawing commands.
		rl.begin_drawing()

		// The rl.clear_background function clears the screen with a specified color.
		rl.clear_background(rl.raywhite)

		// The rl.draw_text function draws a text string at a specified position, with a specified size and color.
		rl.draw_text("Use arrow keys to move the ball".str, 10, 10, 20, rl.gray)

		// The rl.draw_circle_v function draws a circle at the ball's current position.
		rl.draw_circle_v(ball_position, 20, rl.red)

		// The rl.end_drawing function signals the end of drawing commands and displays everything drawn since the
		// last call to rl.begin_drawing.
		rl.end_drawing()
	}

	// De-Initiallization
	// After the game loop ends, the rl.close_window function closes the window.
	rl.close_window()  // Close window and OpenGL context
}







