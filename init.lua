--
-- Usage:
--
--   local cl = require("layouts")
--   tile = cl.tile.draw()
--   tile = cl.utils.justify(tile)
--

local beautiful = require("beautiful")
local utils = require("layouts.utils")

local color_master = beautiful.color_dominant
local color_slave = beautiful.color_subjected

-- TODO load automatically all modules in a specific layouts directory
local tile = require("layouts.tile")
tile.color_dominant = color_dominant
tile.color_subjected = color_subjected
local max = require("layouts.max")
max.color_dominant = color_dominant
max.color_subjected = color_subjected

return {
	tile = tile,
	max = max,
	utils = utils
}

