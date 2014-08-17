local cairo = require("lgi").cairo

local tile = {
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

function tile.draw()
	local width = tile.width
	local height = tile.height
	local strokewidth = tile.strokewidth
	local margin = strokewidth / 2
	local dominant = tile.color_dominant
	local subjected = tile.color_subjected

	local img = cairo.ImageSurface(cairo.Format.ARGB32, width, height)
	local ctx = cairo.Context(img)

	ctx:new_path()
	ctx:move_to(0.5*width,          0.25*height)
	ctx:line_to(0.5*width,             0*height + margin)
	ctx:line_to(  0*width + margin,    0*height + margin)
	ctx:line_to(  0*width + margin,    1*height - margin)
	ctx:line_to(0.5*width,             1*height - margin)
	ctx:line_to(0.5*width,          0.75*height)
	ctx:set_source_rgb(dominant.r, dominant.g, dominant.b)
	ctx:set_line_width(strokewidth)
	ctx:stroke()

	ctx:new_path()
	ctx:move_to(0.5*width,          0.25*height)
	ctx:line_to(0.5*width,          0.75*height)
	ctx:move_to(0.5*width,           0.5*height)
	ctx:line_to(  1*width,           0.5*height)
	ctx:move_to(0.5*width,             0*height + margin)
	ctx:line_to(  1*width - margin,    0*height + margin)
	ctx:line_to(  1*width - margin,    1*height - margin)
	ctx:line_to(0.5*width,             1*height - margin)
	ctx:set_source_rgb(subjected.r, subjected.g, subjected.b)
	ctx:set_line_width(strokewidth)
	ctx:stroke()

	return img
end

return tile

