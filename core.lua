--[[
core.lua
Author: Bayrock (http://Devinity.org)
]]

debug = 0
game = {}

function game.load()
	love.physics.setMeter(64) -- Sets 64 as the meter scale
	world = love.physics.newWorld(0, 9.81 * 64, true)

	objects = {}

	objects.ball = {} -- Loads the physics arguments for the ball
	objects.ball.body = love.physics.newBody(world, 800/2, 600/2, "dynamic")
	objects.ball.shape = love.physics.newCircleShape(20)
	objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1)
	objects.ball.fixture:setRestitution(0.9)

	objects.square = {} -- Loads the physic arguments for the square
	objects.square.body = love.physics.newBody(world, 150, 150, "dynamic")
	objects.square.shape = love.physics.newRectangleShape(50, 50)
	objects.square.fixture = love.physics.newFixture(objects.square.body, objects.square.shape)

	objects.ground = {} -- Loads the physic arguments for the ground
	objects.ground.body = love.physics.newBody(world, 0, 575)
	objects.ground.shape = love.physics.newRectangleShape(800*2, 0)
	objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape)

	objects.cieling = {} -- Loads the physic arguments for the cieling
	objects.cieling.body = love.physics.newBody(world, 0, 0)
	objects.cieling.shape = love.physics.newRectangleShape(800*2, 50)
	objects.cieling.fixture = love.physics.newFixture(objects.cieling.body, objects.cieling.shape)

	objects.leftWall = {} -- Loads the physic arguments for the left wall
	objects.leftWall.body = love.physics.newBody(world, 0, 0)
	objects.leftWall.shape = love.physics.newRectangleShape(50, 575*2)
	objects.leftWall.fixture = love.physics.newFixture(objects.leftWall.body, objects.leftWall.shape)

	objects.rightWall = {} -- Loads the physic arguments for the right wall
	objects.rightWall.body = love.physics.newBody(world, 775, 0)
	objects.rightWall.shape = love.physics.newRectangleShape(0, 575*2)
	objects.rightWall.fixture = love.physics.newFixture(objects.rightWall.body, objects.rightWall.shape)
end

function game.controls()
	if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
		objects.ball.body:applyForce(0, -400)
	elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
		objects.ball.body:applyForce(0, 400)
	elseif love.keyboard.isDown("a") or love.keyboard.isDown("left") then
		objects.ball.body:applyForce(-400, 0)
	elseif love.keyboard.isDown("d") or love.keyboard.isDown("right") then
		objects.ball.body:applyForce(400, 0)
	end
end

function game.draw()
	love.graphics.setColor(204, 204, 204) -- Draw the walls
	love.graphics.rectangle("fill", objects.ground.body:getX(), objects.ground.body:getY(), 800, 25)
	love.graphics.rectangle("fill", objects.cieling.body:getX(), objects.cieling.body:getY(), 800, 25)
	love.graphics.rectangle("fill", objects.leftWall.body:getX(), objects.leftWall.body:getY(), 25, 575)
	love.graphics.rectangle("fill", objects.rightWall.body:getX(), objects.rightWall.body:getY(), 25, 575)

	love.graphics.setColor(2, 132, 130) -- Draw the ball
	love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())

	love.graphics.setColor(150, 220, 170) -- Draw the square
	love.graphics.rectangle("fill", objects.square.body:getX(), objects.square.body:getY(), 50, 50)

	if debug == 1 then -- Draw debug variables
		love.graphics.print(version, 25, 25) -- Display version
		love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 25, 40) -- Display FPS
	end
end


function UPDATE_GAME(dt)
	world:update(dt)
	game.controls()
end

function DRAW_GAME()
	game.draw()
end
