require("player")
require("ball")
require("ai")
require("scene")

function love.load()
	-- Assets
	collideSound= love.audio.newSource("hit.wav", "static")
	scoreSound= love.audio.newSource("score.wav", "static")
	-- Create fonts
	font32 = love.graphics.newFont(32)
	font64 = love.graphics.newFont(64)
	font128 = love.graphics.newFont(128)
	-- Initialize all objects
	Player:load()
	AI:load()
	Ball:load()
	-- Misc
	love.graphics.setBackgroundColor(42/255, 111/255, 201/255, 255)
	-- set initial state
	gameState = "splash"
	winner = ""
end

function love.update(dt)
	-- Call an update function based on game state
	if gameState == "splash" then
		UpdateSplash(dt)
	elseif gameState == "game" then
		UpdateGame(dt)
	elseif gameState == "end" then
		UpdateEnd(dt)
	end

	-- Check points and set gameover accordingly
	if Player.score == 3 then
		gameState = "end"
		winner = "Player"
	elseif AI.score == 3 then
		gameState = "end"
		winner = "AI"
	end

end

function love.draw()
	-- Call an draw function based on game state
	if gameState == "splash" then
		DrawSplash(dt)
	elseif gameState == "game" then
		DrawGame(dt)
	elseif gameState == "end" then
		DrawEnd(dt)
	end

end

function checkCollide(a, b)

	-- https://developer.mozilla.org/en-US/docs/Games/Techniques/2D_collision_detection
	-- This is a simple bounding box collision 
	if a.x + a.width > b.x and 
	   a.x < b.x + b.width and 
	   a.y + a.height > b.y and 
	   a.y < b.y + b.height then
		return true
	else
		return false
	end
end