local cairo = require("lgi").cairo

local function justify(image, justification)
	local width = image.width
	local height = image.height

	if justification > 0 then
		local tmp = cairo.ImageSurface(cairo.Format.ARGB32, width, height)
		ctx  = cairo.Context(tmp)
		local towards_x = justification % 270 > 0 and 1 or 0
		local towards_y = ((justification + 270) % 360) % 270 > 0 and 1 or 0
		ctx:translate(width * towards_x, height * towards_y)
		ctx:rotate(math.rad(justification))
		ctx:set_source_surface(img, 0, 0)
		ctx:paint()
		image = tmp
	end
	
	return image
end

return {
	justify = justify
}

