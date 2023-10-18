import irishgreencitrus.raylibv as rl

const (
	screen_width  = 800
	screen_height = 450
)
const max_colors_count = 21

fn main() {
	rl.init_window(screen_width, screen_height, 'raylib [shapes] example - colors palette'.str)

	colors := [max_colors_count]{rl.darkgray, rl.maroon, rl.orange, rl.darkgreen, rl.darkblue, rl.darkpurple, rl.darkbrown,
	rl.gray, rl.red, rl.gold, rl.lime, rl.blue, rl.violet, rl.brown, rl.lightgray, rl.pink, rl.yellow,
	rl.green, rl.skyblue, rl.purple, rl.beige}

	color_names := [max_colors_count]{'DARKGREY', 'MAROON', 'ORANGE', 'DARKGREEN', 'DARKBLUE', 'DARKPURPLE',
	'DARKBROWN', 'GRAY', 'RED', 'GOLD', 'LIME', 'BLUE', 'VIOLET', 'BROWN', 'LIGHTGREY', 'PINK', 'YELLOW', 'GREEN', 'SKYBLUE',
	'PURPLE', 'BEIGE'}

	mut colors_rec := [max_colors_count]rl.Rectangle{}

	for i :=0; i < max_colors_count; i++ {
		colors_rec[i].x = 20.0 + 100.0 * f32(i%7) + 10.0 * f32(i%7)
		colors_rec[i].y = 80.0 + 100.0 * f32(i%7) + 10.0 * f32(i/7)
		colors_rec[i].width = 100.0
		colors_rec[i].height = 100.0
	}

	mut color_state := [max_colors_count]{}

	mut mouse_point := rl.Vector2{0.0, 0.0}

	rl.set_target_fps(60)

	for !rl.window_should_close() {

		// Update
		mouse_point = rl.get_mouse_position()

		for ii := 0; ii < max_colors_count; ii++ {
			if rl.check_collision_point_rec(mouse_point, colors_rec[ii]){
				color_state[ii] = 1
			} else {
				color_state[ii] = 0
			}
		}
		
		rl.begin_drawing()


		rl.end_drawing()
	}
	rl.close_window()

}