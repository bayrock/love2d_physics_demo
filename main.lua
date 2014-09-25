--[[
main.lua
Author: Bayrock (http://Devinity.org)
]]

require("core")
require("conf")

--[[
Start of LOVE engine functions
]]

function love.load()
	game.load() -- Player loading
	love.graphics.setBackgroundColor(255, 255, 255)
	print("Loaded "..tostring(projectName)..tostring(version))
end

function love.draw()
	DRAW_GAME() -- Player drawing
end

function love.update(dt)
	UPDATE_GAME(dt) -- Player updating

--	print()
end

function love.focus(bool)
end

function love.keypressed( key, unicode )
end

function love.keyreleased( key, unicode )
	if key == "`" or key == "/"and debug == 0 then -- Enable debug overlay
		debug = 1
		print("Debug overlay enabled")
	elseif key == "`" or key == "/" and debug == 1 then -- Disable debug overlay
		debug = 0
	 	print("Debug overlay disabled")
	end

	if key == "r" then
		game.load()
		print("Reloaded demo")
	end
end

function love.mousepressed( x, y, button )
	if button == "l" then -- Adds balls on left click
		addBall()
	else -- Removes balls on right click
		removeBalls()
		print("Cleaned all ball objects")
	end
end

function love.mousereleased( x, y, button )
end

function love.quit()
	print("Exiting...")
end -- end of LOVE functions
