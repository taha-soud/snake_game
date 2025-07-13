local SnakeGame = {}
local Events = require("events")

SnakeGame.__index = SnakeGame

function SnakeGame:new()
    local game = {
        snake = {
            {x = 10, y = 10}
        },
        direction = {x = 1, y = 0},
        food = {x = 15, y = 15},
        score = 0,
        timer = 0,
        speed = 0.15,
        gameOver = false
    }
    return setmetatable(game, SnakeGame)
end

function SnakeGame:update(dt)
    if self.gameOver then return end

    self.timer = self.timer + dt
    if self.timer >= self.speed then
        self.timer = 0

        -- Move snake
        local head = self.snake[1]
        local newHead = {
            x = head.x + self.direction.x,
            y = head.y + self.direction.y
        }

        -- Check wall collision
        if newHead.x < 0 or newHead.x >= 40 or newHead.y < 0 or newHead.y >= 30 then
            self.gameOver = true
            return
        end

        -- Check self collision
        for i = 1, #self.snake do
            if self.snake[i].x == newHead.x and self.snake[i].y == newHead.y then
                self.gameOver = true
                return
            end
        end

       table.insert(self.snake, 1, newHead)

-- Check food collision
if newHead.x == self.food.x and newHead.y == self.food.y then
    self.score = self.score + 1
    self.food = {
        x = love.math.random(0, 39),
        y = love.math.random(0, 29)
    }
    Events:emit("food_eaten", { score = self.score })  -- ✅ emit event here
else
    table.remove(self.snake)
end

    end
end

function SnakeGame:draw()
    local size = 20

    if self.gameOver then
        love.graphics.printf("Game Over - Score: " .. self.score, 0, 300, 800, "center")
        return
    end

    -- Draw food
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.food.x * size, self.food.y * size, size, size)

    -- Draw snake
    love.graphics.setColor(0, 1, 0)
    for _, segment in ipairs(self.snake) do
        love.graphics.rectangle("fill", segment.x * size, segment.y * size, size, size)
    end

    -- Score
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score: " .. self.score, 10, 10)
end

function SnakeGame:changeDirection(dx, dy)
    if self.direction.x == -dx and self.direction.y == -dy then return end
    self.direction = {x = dx, y = dy}
end

return SnakeGame
