local Events = {}
local listeners = {}

function Events:subscribe(event, callback)
    listeners[event] = listeners[event] or {}
    table.insert(listeners[event], callback)
end

function Events:emit(event, data)
    if listeners[event] then
        for _, callback in ipairs(listeners[event]) do
            callback(data)
        end
    end
end

return Events
