local MenuState = {}

function MenuState:update(dt)
end

function MenuState:draw()
    love.graphics.printf("Press Enter to Start", 0, 300, 800, "center")
end

return MenuState
