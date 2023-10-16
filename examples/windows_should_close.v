import irishgreencitrus.raylibv as rl

const (
	screen_width  = 800
	screen_height = 450
)

fn main() {
	rl.init_window(screen_width, screen_height, 'raylib [core] example - window should close'.str)

	rl.set_exit_key(rl.key_null)

	mut exit_window_requested := false
	mut exit_window := false

	rl.set_target_fps(60)

	for !exit_window {
		// Update
		if rl.window_should_close() || rl.is_key_pressed(rl.key_escape) {
			exit_window_requested = true
		}

		if exit_window_requested {
			if rl.is_key_pressed(rl.key_y) {
				exit_window = true
			} else if rl.is_key_pressed(rl.key_n) {
				exit_window_requested = false
			}
		}

		rl.begin_drawing()
		rl.clear_background(rl.raywhite)

		if exit_window_requested {
			rl.draw_rectangle(0, 100, screen_width, 200, rl.black)
			rl.draw_text('Are you sure you want to exit program? [Y/N]'.str, 40, 180, 30, rl.white)			
		} else {
			rl.draw_text('Try to close the window to get confirmation message!'.str, 120, 200, 20, rl.lightgray)
		}
		rl.end_drawing()
	}
	rl.close_window()
}