
import irishgreencitrus.raylibv as rl

/* const (
	screen_width = 800
	screen_height = 450
) */
fn main() {

	// Init
	rl.init_window(screen_height, screen_width, 'RaylibV Input Mouse Wheel example'.str)

	mut box_position_y := screen_height / 2 - 40
	scroll_speed := 4

	rl.set_target_fps(60)

	// Main loop
	for !rl.window_should_close() {
		// Update
	box_position_y -= int(rl.get_mouse_wheel_move() * scroll_speed)

	// Draw
	rl.begin_drawing()

	rl.clear_background(rl.raywhite)
	rl.draw_rectangle(screen_width/2 -40, box_position_y, 80, 80, rl.maroon)

	rl.draw_text("Use mouse wheel to move the cube up and down".str, 10, 10, 20, rl.gray)
	rl.draw_text("Box position Y: %03i {$box_position_y}".str, 10, 40, 20, rl.lightgray)

	rl.end_drawing()
}
rl.close_window()

}