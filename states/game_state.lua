
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
