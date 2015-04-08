local cairo = require("lgi").cairo

local max = {
	LEFT = 0,
	TOP = 90,
	RIGHT = 180,
	BOTTOM = 270,

	width = 65,
	height = 65,

	strokewidth = 3,

	color_dominant = { r = 255, g = 255, b = 255 },
	color_subjected = { r = 255, g = 255, b = 255 }
}

function max.draw()
	local width = max.width
	local height = max.height
	local strokewidth = max.strokewidth
	local margin = strokewidth / 2
	local dominant = max.color_dominant
	local subjected = max.color_subjected

	local img = cairo.ImageSurface(cairo.Format.ARGB32, width, height)
	local ctx = cairo.Context(img)

	ctx:rectangle(margin, margin, width - 2*margin, height - 2*margin)
	ctx:set_source_rgb(subjected.r, subjected.g, subjected.b)
	ctx:set_line_width(strokewidth)
	ctx:stroke()

	local a_width = width/2 - 2*strokewidth
	local a_height = height/2 - 2*strokewidth
	local a_strokewidth = strokewidth * 1.25
	local a_margin = a_strokewidth / 2
	local arrow = cairo.ImageSurface(cairo.Format.ARGB32, a_width, a_height)
	local a_ctx = cairo.Context(arrow)
	a_ctx:new_path()
	a_ctx:move_to(  3*margin  + a_margin,   3*margin   + a_margin)
	a_ctx:line_to(  1*a_width - a_margin,   1*a_height - a_margin)
	a_ctx:move_to(  1*a_width - a_margin, 0.5*a_height)
	a_ctx:line_to(  1*a_width - a_margin,   1*a_height - a_margin)
	a_ctx:line_to(0.5*a_width,              1*a_height - a_margin)
	a_ctx:set_source_rgb(dominant.r, dominant.g, dominant.b)
	a_ctx:set_line_width(a_strokewidth)
	a_ctx:stroke()
	for i = 0, 3 do
		local justification = i * 90
		local towards_x = justification % 270 > 0 and 1 or 0
		local towards_y = ((justification + 270) % 360) % 270 > 0 and 1 or 0
		ctx:translate(width * towards_x, height * towards_y)
		ctx:rotate(math.rad(justification))
		ctx:set_source_surface(arrow, width/2, height/2) 
		ctx:paint()
	end

	return img
end

return max

