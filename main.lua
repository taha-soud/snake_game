local GameState = require("gamestate")
local Input = require("input")

local gameState = GameState:new()
local input = Input:new()

-- Bind input keys for the snake game
input:bind("up", function()
    if gameState.current == "playing" then
        gameState.states.playing:changeDirection(0, -1)
    end
end)

input:bind("down", function()
    if gameState.current == "playing" then
        gameState.states.playing:changeDirection(0, 1)
    end
end)

input:bind("left", function()
    if gameState.current == "playing" then
        gameState.states.playing:changeDirection(-1, 0)
    end
end)

input:bind("right", function()
    if gameState.current == "playing" then
        gameState.states.playing:changeDirection(1, 0)
    end
end)

input:bind("return", function()
    if gameState.current == "menu" then
        gameState:switch("playing")
    end
end)

function love.update(dt)
    gameState:update(dt)
end

function love.draw()
    gameState:draw()
end

function love.keypressed(key)
    input:handleKey(key)
end
