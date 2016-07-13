local Tile = require("scripts/util/Tile")

local Maprender = {}

Maprender.tiles = {
	Tile.newTile("Grass", "grass.png"),
	Tile.newTile("WallUp", "wall_up.png"),
	Tile.newTile("WallSide", "wall_side.png"),
	Tile.newTile("WallCornerTL", "wall_corner_topleft.png"),
	Tile.newTile("WallCornerBL", "wall_corner_bottomleft.png"),
	Tile.newTile("WallCornerTR", "wall_corner_topright.png"),
	Tile.newTile("WallCornerBR", "wall_corner_bottomright.png"),
}

Maprender.collidables = {
	"WallUp",
	"WallSide",
	"WallCornerTL",
	"WallCornerBL",
	"WallCornerTR",
	"WallCornerBR",
}


function Maprender:draw()
	love.graphics.setColor(255,255,255)
	for y = 1, #map.tiles do
		for x = 1, #map.tiles[y] do
			local tile = map.tiles[y][x]
			for i = 1, #Maprender.tiles do
				if Maprender.tiles[i].name == tile then

					local image = Maprender.tiles[i].image
					
					love.graphics.draw(image, x*32-cameraX, y*32-cameraY)
				end
			end
		end
	end

	if runMode == "Editor" then
		-- render image of placing
		love.graphics.setColor(255,255,255,100)
		for i = 1, #Maprender.tiles do
			if Maprender.tiles[i].name == editor.selectedBlock then
				local image = Maprender.tiles[i].image
				love.graphics.draw(image, mouseX*32-cameraX, mouseY*32)
			end
		end
	end
end

return Maprender