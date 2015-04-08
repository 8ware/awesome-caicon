local tile = require("max")
local utils = require("utils")

tile.color_dominant = { r = 255, g = 0, b = 0 }
tile.color_subjected = { r = 0, g = 255, b = 0 }
tile.width = 200
tile.height = 200
tile.strokewidth = 10

j = 0
if arg[1] == "t" then
	j = tile.TOP
elseif arg[1] == "r" then
	j = tile.RIGHT
elseif arg[1] == "b" then
	j = tile.BOTTOM
elseif arg[1] == "l" then
	j = tile.LEFT
end

img = tile.draw()
img = utils.justify(img, j)
img:write_to_png("test.png")

