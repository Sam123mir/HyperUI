--[[
    HyperUI v2 - Configuration & Persistence
    Handles saving and loading UI state to the filesystem.
]]

local HttpService = game:GetService("HttpService")

local ConfigSystem = {}
ConfigSystem.__index = ConfigSystem

function ConfigSystem.new(store, options)
    local self = setmetatable({
        Store = store,
        FileName = options.FileName or "HyperUI_Config.json",
        AutoSave = options.AutoSave ~= false,
        Data = {},
    }, ConfigSystem)
    
    -- Subscribe to store to handle auto-saving on changes
    self.Store:OnUpdate(function(state)
        if not self.AutoSave then return end
        
        local changed = false
        for id, node in pairs(state.registry or {}) do
            if node.props and node.props.value ~= nil then
                if not self.Data[id] or self.Data[id].value ~= node.props.value then
                    self.Data[id] = { value = node.props.value }
                    changed = true
                end
            end
        end
        
        if changed then
            self:Save()
        end
    end)
    
    return self
end

function ConfigSystem:Save(name)
    local success, err = pcall(function()
        local content = HttpService:JSONEncode(self.Data)
        writefile(self.FileName, content)
    end)
    
    if not success then
        warn("[HyperUI] Failed to save config:", err)
    end
    return success
end

function ConfigSystem:Load()
    if not isfile(self.FileName) then return false end
    
    local success, result = pcall(function()
        local content = readfile(self.FileName)
        return HttpService:JSONDecode(content)
    end)
    
    if success and type(result) == "table" then
        self.Data = result
        -- Apply loaded data to store
        for id, props in pairs(self.Data) do
            self.Store:Dispatch({
                type = "UPDATE_ELEMENT",
                id = id,
                props = props
            })
        end
        return true
    end
    
    return false
end

function ConfigSystem:UpdateValue(id, key, value)
    if not self.Data[id] then
        self.Data[id] = {}
    end
    self.Data[id][key] = value
    
    if self.AutoSave then
        self:Save()
    end
end

return ConfigSystem
