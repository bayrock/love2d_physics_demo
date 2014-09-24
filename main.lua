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
	if key == "`" and debug == 0 then
		debug = 1
	elseif key == "`" and debug == 1 then
		debug = 0
	end

	if key == "r" then
		game.load()
	end
end

function love.mousepressed( x, y, button )
	addBall()
end

function love.mousereleased( x, y, button )
end

function love.quit()
	print("Exiting...")
end -- end of LOVE functions
