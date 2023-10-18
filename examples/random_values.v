import irishgreencitrus.raylibv as rl

const (
	screen_width  = 800
	screen_height = 450
)
fn main()  {

	rl.init_window(screen_width, screen_height, 'raylib [core] example - generate random values'.str)

	mut rand_value := rl.get_random_value(-8, 5)  // Get a random integer number between -8 and 5 (both included)
	mut frames_counter := 0 // Variable used to count frames

	rl.set_target_fps(60)

	// Main game loop
	for !rl.window_should_close() {
		frames_counter++

		// Every two seconds (120 frames) a new random value is generated
		if frames_counter / 120 %2 == 1 {
			rand_value = rl.get_random_value(-8, 5)
			frames_counter = 0
		}

		// Draw
		rl.begin_drawing()
		rl.clear_background(rl.raywhite)

		rl.draw_text('Every 2 seconds a new random value is generated:'.str, 130, 100, 20, rl.maroon)
		rl.draw_text('$rand_value'.str, 360, 180, 80, rl.lightgray)
		rl.end_drawing()
	}
	rl.close_window()

}