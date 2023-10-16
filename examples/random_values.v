import irishgreencitrus.raylibv as rl

const (
	screen_width  = 800
	screen_height = 450
)

fn main()  {

	rl.init_window(screen_width, screen_height, 'raylib [core] example - generate random values')
	for !rl.window_should_close() {}

}