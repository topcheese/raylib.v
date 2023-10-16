import irishgreencitrus.raylibv as rl

const (
	screen_width  = 800
	screen_height = 450
)




fn main() {
	rl.set_config_flags(rl.flag_msaa_4x_hint)
	mut gamepad := 0
	rl.init_window(screen_width, screen_height, 'raylib [core] example - gamepad input'.str)

	rl.set_target_fps(60)

	// Main loop
	for !rl.window_should_close() {
		rl.begin_drawing()
		rl.clear_background(rl.raywhite)

		if rl.is_key_pressed(rl.key_left ) && gamepad > 0{
			gamepad--
		}
		if rl.is_key_pressed(rl.key_right) {
			gamepad++
		}

		if rl.is_gamepad_available(gamepad) {
			rl.draw_text('gam'.str, gamepad, rl.get_gamepad_name(gamepad)), 10, 10, 10, rl.black
		}

		rl.end_drawing()
	}
	rl.close_window()
}