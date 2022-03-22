AI = {}

function AI:load()
	self.width = 20
	self.height = 100
	self.x = love.graphics.getWidth() - self.width - 25
	self.y = love.graphics.getHeight() / 2
	self.yvel = 0
	self.speed = 400
	self.timer = 0
	self.diff = 0.4
	self.offset = 13
	self.score = 0
end

function AI:update(dt)
	self:move(dt)
	--self:checkBoundary()
	-- timer is a way to do difficulty
	-- bigger timer means slower response from ai
	self.timer = self.timer + dt
	if self.timer > self.diff then
		self.timer = 0
		self:target()
	end
end

function AI:move(dt)
	-- Update position
	self.y = self.y + self.yvel * dt
end

function AI:checkBoundary()
	if self.y < 0 then
		self.y = 0
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height
	end
end

function AI:target()
	if Ball.y + Ball.height < self.y + self.offset then
		self.yvel = -self.speed
	elseif Ball.y > self.y + self.height - self.offset then
		self.yvel = self.speed
	else
		self.yvel = 0
	end
end

function AI:draw()
	-- AI is a rectangle
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end