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
	game.load() -- Game loading
	love.graphics.setBackgroundColor(255, 255, 255)
	print("Loaded "..projectName..version)
end

function love.draw()
	DRAW_GAME() -- Game drawing
end

function love.update(dt)
	UPDATE_GAME(dt) -- Game updating

--	print()
end

function love.focus(bool)
end

function love.keypressed( key, unicode )
end

function love.keyreleased( key, unicode )
	if key == "`" and debug == false or key == "/" and debug == false then
		debug = true
		print("Debug overlay enabled")
	elseif key == "`" and debug == true or key == "/" and debug == true then
		debug = false
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
