function UpdateGame(dt)
	-- Update Player, Ai and Ball
	Player:update(dt)
	AI:update(dt)
	Ball:update(dt)
end

function DrawGame()
		-- Draw Player, Ai and Ball
	Player:draw()
	AI:draw()
	Ball:draw()

	-- Draw UI and Score
	-- Draw court
	love.graphics.line(love.graphics.getWidth() / 2, 0, love.graphics.getWidth() / 2, love.graphics.getHeight())
	-- Print scores
	love.graphics.setFont(font32)
	love.graphics.print(Player.score, love.graphics.getWidth() / 2 - 22, 0)
	love.graphics.print(AI.score, love.graphics.getWidth() / 2 + 2, 0)
end

function UpdateSplash(dt)
	-- if user hits spacebar proceed to game state
	if love.keyboard.isDown("space") then
		gameState = "game" 
	end
end

function DrawSplash(dt)
	-- Draw splash screen
	-- print intro and instructions
	love.graphics.setFont(font64)
	love.graphics.print("Pong clone by NCR Mouse", 164, 120)
	love.graphics.setFont(font32)
	love.graphics.print("W raises paddle", 464, 300)
	love.graphics.print("S lowers paddle", 464, 340)
	love.graphics.print("First to 3 points wins", 424, 400)
	love.graphics.print("Press Spacebar to begin!", 384, 480)


end

function UpdateEnd(dt)

end

function DrawEnd()
	love.graphics.setFont(font128)
	love.graphics.print("Game Over!", 224, 120)
	love.graphics.setFont(font64)
	love.graphics.print(winner.." is the winner!", 344, 400)
end
