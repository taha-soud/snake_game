local Events = require("events")

Events:subscribe("food_eaten", function(data)
    print("Score increased to:", data.score)
end)

local SnakeGame = require("snake_game")

local GameState = {}
local game = SnakeGame:new()

function GameState:update(dt)
    game:update(dt)
end

function GameState:draw()
    game:draw()
end

function GameState:changeDirection(dx, dy)
    game:changeDirection(dx, dy)
end

return GameState
