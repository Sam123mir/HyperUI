





local a = {}
a.__index = a

function a.new()
    local b = {
        windows = {},
        notifications = {},
        theme = "Default",
        registry = {}, 
    }

    local c = setmetatable({
        _state = b,
        _listeners = {},
        _subscribers = {}, 
    }, a)
    
    return c
end

function a:GetState()
    return self._state
end


local function DeepCopy(b)
    local c = {}
    for d, e in pairs(b) do
        if type(e) == "table" then
            c[d] = DeepCopy(e)
        else
            c[d] = e
        end
    end
    return c
end

function a:Dispatch(b)
    local c = self._state
    local d = DeepCopy(c)
    
    local e = {} 
    
    if b.type == "ADD_WINDOW" then
        local f = b.window
        d.windows[f.id] = f
        d.registry[f.id] = {
            type = "Window",
            props = f,
            children = {},
        }
    elseif b.type == "UPDATE_ELEMENT" then
        local f = d.registry[b.id]
        if f then
            for g, h in pairs(b.props) do
                f.props[g] = h
            end
            table.insert(e, b.id)
        end
    elseif b.type == "ADD_TAB" then
        local f = d.registry[b.windowId]
        if f then
            d.registry[b.tab.id] = {
                type = "Tab",
                props = b.tab,
                children = {},
                parentId = b.windowId,
            }
            table.insert(f.children, b.tab.id)
            table.insert(e, b.windowId)
        end
    elseif b.type == "ADD_SECTION" then
        local f = d.registry[b.tabId]
        if f then
            d.registry[b.section.id] = {
                type = "Section",
                props = b.section,
                children = {},
                parentId = b.tabId,
            }
            table.insert(f.children, b.section.id)
            table.insert(e, b.tabId)
        end
    elseif b.type == "ADD_ELEMENT" then
        local f = d.registry[b.parentId]
        if f then
            d.registry[b.element.id] = {
                type = b.element.type,
                props = b.element.props,
                children = {},
                parentId = b.parentId,
            }
            table.insert(f.children, b.element.id)
            table.insert(e, b.parentId)
        end
    elseif b.type == "SET_THEME" then
        d.theme = b.theme
    elseif b.type == "ADD_NOTIFICATION" then
        d.notifications[b.notification.id] = b.notification
    elseif b.type == "REMOVE_NOTIFICATION" then
        d.notifications[b.id] = nil
    end
    
    self._state = d
    
    
    for f, g in ipairs(self._listeners) do
        task.spawn(g, d, c)
    end
    
    
    for f, g in ipairs(e) do
        if self._subscribers[g] then
            for h, i in ipairs(self._subscribers[g]) do
                task.spawn(i, d.registry[g])
            end
        end
    end
end

function a:Subscribe(b, c)
    if not self._subscribers[b] then
        self._subscribers[b] = {}
    end
    table.insert(self._subscribers[b], c)
    
    return function()
        local d = self._subscribers[b]
        if d then
            local e = table.find(d, c)
            if e then
                table.remove(d, e)
            end
        end
    end
end

function a:OnUpdate(b)
    table.insert(self._listeners, b)
    return function()
        local c = table.find(self._listeners, b)
        if c then
            table.remove(self._listeners, c)
        end
    end
end

function a:Destroy()
    self._state = nil
    self._listeners = {}
    self._subscribers = {}
end

return a
