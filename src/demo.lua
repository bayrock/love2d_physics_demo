--[[
demo.lua
Author: Bayrock (http://Devinity.org)
]]

game = {}

function game.Load() -- Loads or reloads the demo
	love.physics.setMeter(64)
	world = love.physics.newWorld(0, 9.81 * 64, true)

	objects = {}
	objects.ball = {} -- Stores the ball objects
	objects.ballGhost = {}
	curBalls = 1

	objects.square = {} -- Loads the physic arguments for the square
	objects.square.body = love.physics.newBody(world, 200, windowHeight/2, "dynamic")
	objects.square.shape = love.physics.newRectangleShape(25, 25, 50, 50)
	objects.square.fixture = love.physics.newFixture(objects.square.body, objects.square.shape)
	objects.square.fixture:setRestitution(0.15)

	objects.ground = {} -- Loads the physic arguments for the ground
	objects.ground.body = love.physics.newBody(world, 0, windowHeightB)
	objects.ground.shape = love.physics.newRectangleShape(windowWidth*2, 0)
	objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape)

	objects.ceiling = {} -- Loads the physic arguments for the ceiling
	objects.ceiling.body = love.physics.newBody(world, 0, 0)
	objects.ceiling.shape = love.physics.newRectangleShape(windowWidth*2, 50)
	objects.ceiling.fixture = love.physics.newFixture(objects.ceiling.body, objects.ceiling.shape)

	objects.leftWall = {} -- Loads the physic arguments for the left wall
	objects.leftWall.body = love.physics.newBody(world, 0, 0)
	objects.leftWall.shape = love.physics.newRectangleShape(50, windowHeightB*2)
	objects.leftWall.fixture = love.physics.newFixture(objects.leftWall.body, objects.leftWall.shape)

	objects.rightWall = {} -- Loads the physic arguments for the right wall
	objects.rightWall.body = love.physics.newBody(world, 775, 0)
	objects.rightWall.shape = love.physics.newRectangleShape(0, windowHeightB*2)
	objects.rightWall.fixture = love.physics.newFixture(objects.rightWall.body, objects.rightWall.shape)
end

local keyDown = love.keyboard.isDown
function game.Input() -- Controls the square object
	if keyDown("w") or keyDown("up") then
		objects.square.body:applyForce(0, -600)
	elseif keyDown("s") or keyDown("down") then
		objects.square.body:applyForce(0, 600)
	elseif keyDown("a") or keyDown("left") then
		objects.square.body:applyForce(-500, 0)
	elseif keyDown("d") or keyDown("right") then
		objects.square.body:applyForce(500, 0)
	end
end

function game.Draw() -- Draws demo assets
	love.graphics.setColor(204, 204, 204) -- Draw the walls
	love.graphics.rectangle("fill", objects.ground.body:getX(), objects.ground.body:getY(), windowWidth, wallWidth)
	love.graphics.rectangle("fill", objects.ceiling.body:getX(), objects.ceiling.body:getY(), windowWidth, wallWidth)
	love.graphics.rectangle("fill", objects.leftWall.body:getX(), objects.leftWall.body:getY(), wallWidth, windowHeightB)
	love.graphics.rectangle("fill", objects.rightWall.body:getX(), objects.rightWall.body:getY(), wallWidth, windowHeightB)

	love.graphics.setColor(2, 132, 130) -- Draw the balls
	for q = 1, #objects.ball do
		love.graphics.circle("fill", objects.ball[q].body:getX(), objects.ball[q].body:getY(), objects.ball[q].shape:getRadius())
	end

	if mouse == true then
		love.graphics.circle("fill", objects.ballGhost.body:getX(), objects.ballGhost.body:getY(), objects.ballGhost.shape:getRadius())
	end

	love.graphics.setColor(150, 220, 170) -- Draw the square polygon
  	love.graphics.polygon("fill", objects.square.body:getWorldPoints(objects.square.shape:getPoints()))

	if debug then -- Draw debug variables
		love.graphics.print(projectName..version, 30, 30) -- Display version
		love.graphics.print("FPS: "..love.timer.getFPS( ), 30, 45) -- Display FPS
		love.graphics.print("Balls spawned: "..#objects.ball, 30, 60) -- Display number of ball objects on screen
	end
end

function addBall() -- Adds a ball object
	local mX, mY = love.mouse.getPosition()
	objects.ball[curBalls] = {}

	objects.ball[curBalls].body = love.physics.newBody(world, mX, mY, "dynamic")
	objects.ball[curBalls].shape = love.physics.newCircleShape(ballSize)
	objects.ball[curBalls].fixture = love.physics.newFixture(objects.ball[curBalls].body, objects.ball[curBalls].shape, 1)
	objects.ball[curBalls].fixture:setRestitution(0.9)
	curBalls = curBalls + 1
end

function removeBalls() -- Removes all ball objects
	for b = #objects.ball, 1, -1 do
		objects.ball[b].body:destroy()
		table.remove(objects.ball, b)
	end
	curBalls = 1
end

function sizeTimer(dt) -- ballSize timer
	local mX, mY = love.mouse.getPosition()
  	objects.ballGhost.body = love.physics.newBody(world, mX, mY, "dynamic")
  	objects.ballGhost.shape = love.physics.newCircleShape(ballSize)

	ballSize = ballSize + 15 * dt
end

function UPDATE_GAME(dt) -- Called by love.update constantly
	if mouse == true then sizeTimer(dt) end
	world:update(dt)
	game.Input()
end

function DRAW_GAME() -- Draws to the screen
	game.Draw()
end
