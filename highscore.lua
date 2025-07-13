local HighScore = {}

function HighScore:save(score)
    local file <close> = io.open("highscore.txt", "w")
    if file then
        file:write(tostring(score))
    end
end

function HighScore:load()
    local file <close> = io.open("highscore.txt", "r")
    if file then
        local content = file:read("*a")
        return tonumber(content) or 0
    end
    return 0
end

return HighScore
