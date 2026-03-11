--[[
    HyperUI v2 - Focus Manager
    Coordinates which element has active input focus.
]]

local Signal = require(script.Parent.Parent.core.signal.Signal)

local FocusManager = {}
FocusManager.__index = FocusManager

function FocusManager.new(store)
    local self = setmetatable({
        Store = store,
        FocusedElement = nil,
        FocusChanged = Signal.new(),
    }, FocusManager)
    
    return self
end

function FocusManager:RequestFocus(elementId)
    if self.FocusedElement == elementId then return end
    
    local oldFocus = self.FocusedElement
    self.FocusedElement = elementId
    
    -- Notify store if needed for visual updates
    if oldFocus then
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = oldFocus,
            props = { focused = false }
        })
    end
    
    if elementId then
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = elementId,
            props = { focused = true }
        })
    end
    
    self.FocusChanged:Fire(elementId, oldFocus)
end

function FocusManager:ClearFocus()
    self:RequestFocus(nil)
end

function FocusManager:GetFocus()
    return self.FocusedElement
end

function FocusManager:Destroy()
    self.FocusChanged:Destroy()
end

return FocusManager
