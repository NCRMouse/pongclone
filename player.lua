Player = {}

function Player:load()
	self.x = 25
	self.y = love.graphics.getHeight() / 2
	self.width = 20
	self.height = 100
	self.yvel = 400
	self.score = 0

end

function Player:update(dt)
	self:move(dt)
	self:checkBoundary()
end

function Player:move(dt)
	-- Intercept key presses act accordingly
	if love.keyboard.isDown("w") then
		self.y = self.y - self.yvel * dt 
	elseif love.keyboard.isDown("s") then
		self.y = self.y + self.yvel * dt
	end
end

function Player:checkBoundary()
	-- If player is above or below screen change position
	if self.y < 0 then
		self.y = 0
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height
	end
end

function Player:draw()
	-- Player paddle is a rectangle
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end