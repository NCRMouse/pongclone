Ball = {}

function Ball:load()
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.width = 20
	self.height = 20
	self.speed = 200
	self.xvel = -self.speed
	self.yvel = 0
end

function Ball:update(dt)
	self:move(dt)
	self:collide()
	self.speed = self.speed + 1

	if self.x < 0 then
		-- If the ball goes past the player AI scores
		-- play sound
		scoreSound:play()
		AI.score = AI.score + 1
		-- reset ball position and speed
		self.x = love.graphics.getWidth() / 2
		self.y = love.graphics.getHeight() / 2
		self.yvel = 0
		self.xvel = 200
		self.speed = 200
	elseif self.x > love.graphics.getWidth() then
		-- If the ball goes past the AI player scores
		-- play sound
		scoreSound:play()
		Player.score = Player.score + 1
		-- reset ball position and speed
		self.x = love.graphics.getWidth() / 2
		self.y = love.graphics.getHeight() / 2
		self.yvel = 0
		self.xvel = 200
		self.speed = 200
	end
end

function Ball:move(dt)
	-- update position
	self.x = self.x + self.xvel * dt 
	self.y = self.y + self.yvel * dt 
end

function Ball:collide()
	-- Check for collison using bounding box function in main
	if checkCollide(self, Player) then
		collideSound:play()
		self.xvel = self.speed
		local middleBall = self.y + self.height / 2
		local middlePlayer = Player.y + Player.height / 2	
		local collisionPosition = middleBall - middlePlayer
		self.yvel = collisionPosition * 5
	end

	if checkCollide(self, AI) then
		collideSound:play()
		self.xvel = -self.speed
		local middleBall = self.y + self.height / 2
		local middleAI = AI.y + AI.height / 2	
		local collisionPosition = middleBall - middleAI
		self.yvel = collisionPosition * 5
	end

	if self.y < 0 then
		-- play a sound if ball collides with top or bottom
		collideSound:play()
		self.y = 0
		self.yvel = -self.yvel
	elseif self.y + self.height > love.graphics.getHeight() then
		collideSound:play()
		self.y  = love.graphics.getHeight() - self.height
		self.yvel = -self.yvel
	end
end


function Ball:draw()
	-- Ball is a rectangle
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end