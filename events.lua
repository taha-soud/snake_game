local Events = {}
local listeners = {}

function Events:subscribe(event, callback)
    listeners[event] = listeners[event] or {}
    table.insert(listeners[event], callback)
end

function Events:emit(event, data)
    print("Emitting:", event) -- DEBUG
    if listeners[event] then
        for _, callback in ipairs(listeners[event]) do
            print("Calling listener for:", event) -- DEBUG
            callback(data)
        end
    else
        print("No listeners found for:", event)
    end
end


return Events
