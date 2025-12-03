local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	topmost = "window",
	height = 39,
	color = colors.bar.bg,
	sticky = true,
	shadow = true,
	border_color = colors.bar.border,
	padding_right = 2,
	padding_left = 2,
	blur_radius = 20,
})
