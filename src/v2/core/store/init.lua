--[[
    HyperUI v2 - State Store
    A lightweight Rodux-inspired state container for the UI Tree.
    Optimized for selective subscriptions to prevent global re-renders.
]]

local Store = {}
Store.__index = Store

function Store.new()
    local initialState = {
        windows = {},
        notifications = {},
        theme = "Default",
        registry = {}, -- nodeId -> { type, props, children, parentId }
    }

    local self = setmetatable({
        _state = initialState,
        _listeners = {},
        _subscribers = {}, -- nodeId -> { list of callbacks }
    }, Store)
    
    return self
end

function Store:GetState()
    return self._state
end

-- Deep clone for immutability
local function DeepCopy(t)
    local copy = {}
    for k, v in pairs(t) do
        if type(v) == "table" then
            copy[k] = DeepCopy(v)
        else
            copy[k] = v
        end
    end
    return copy
end

function Store:Dispatch(action)
    local oldState = self._state
    local newState = DeepCopy(oldState)
    
    local changedNodes = {} -- Track which node IDs changed
    
    if action.type == "ADD_WINDOW" then
        local window = action.window
        newState.windows[window.id] = window
        newState.registry[window.id] = {
            type = "Window",
            props = window,
            children = {},
        }
    elseif action.type == "UPDATE_ELEMENT" then
        local node = newState.registry[action.id]
        if node then
            for k, v in pairs(action.props) do
                node.props[k] = v
            end
            table.insert(changedNodes, action.id)
        end
    elseif action.type == "ADD_TAB" then
        local window = newState.registry[action.windowId]
        if window then
            newState.registry[action.tab.id] = {
                type = "Tab",
                props = action.tab,
                children = {},
                parentId = action.windowId,
            }
            table.insert(window.children, action.tab.id)
            table.insert(changedNodes, action.windowId)
        end
    elseif action.type == "ADD_SECTION" then
        local tab = newState.registry[action.tabId]
        if tab then
            newState.registry[action.section.id] = {
                type = "Section",
                props = action.section,
                children = {},
                parentId = action.tabId,
            }
            table.insert(tab.children, action.section.id)
            table.insert(changedNodes, action.tabId)
        end
    elseif action.type == "ADD_ELEMENT" then
        local parent = newState.registry[action.parentId]
        if parent then
            newState.registry[action.element.id] = {
                type = action.element.type,
                props = action.element.props,
                children = {},
                parentId = action.parentId,
            }
            table.insert(parent.children, action.element.id)
            table.insert(changedNodes, action.parentId)
        end
    elseif action.type == "SET_THEME" then
        newState.theme = action.theme
    elseif action.type == "ADD_NOTIFICATION" then
        newState.notifications[action.notification.id] = action.notification
    elseif action.type == "REMOVE_NOTIFICATION" then
        newState.notifications[action.id] = nil
    end
    
    self._state = newState
    
    -- Global listeners
    for _, listener in ipairs(self._listeners) do
        task.spawn(listener, newState, oldState)
    end
    
    -- Specific node subscribers
    for _, nodeId in ipairs(changedNodes) do
        if self._subscribers[nodeId] then
            for _, callback in ipairs(self._subscribers[nodeId]) do
                task.spawn(callback, newState.registry[nodeId])
            end
        end
    end
end

function Store:Subscribe(nodeId, callback)
    if not self._subscribers[nodeId] then
        self._subscribers[nodeId] = {}
    end
    table.insert(self._subscribers[nodeId], callback)
    
    return function()
        local list = self._subscribers[nodeId]
        if list then
            local index = table.find(list, callback)
            if index then
                table.remove(list, index)
            end
        end
    end
end

function Store:OnUpdate(callback)
    table.insert(self._listeners, callback)
    return function()
        local index = table.find(self._listeners, callback)
        if index then
            table.remove(self._listeners, index)
        end
    end
end

function Store:Destroy()
    self._state = nil
    self._listeners = {}
    self._subscribers = {}
end

return Store
