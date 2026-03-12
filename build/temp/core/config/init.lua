




local a = game:GetService("HttpService")

local b = {}
b.__index = b

function b.new(c, d)
    local e = setmetatable({
        Store = c,
        FileName = d.FileName or "HyperUI_Config.json",
        AutoSave = d.AutoSave ~= false,
        Data = {},
    }, b)
    
    
    e.Store:OnUpdate(function(f)
        if not e.AutoSave then return end
        
        local g = false
        for h, i in pairs(f.registry or {}) do
            if i.props and i.props.value ~= nil then
                if not e.Data[h] or e.Data[h].value ~= i.props.value then
                    e.Data[h] = { value = i.props.value }
                    g = true
                end
            end
        end
        
        if g then
            e:Save()
        end
    end)
    
    return e
end

function b:Save(c)
    local d, e = pcall(function()
        local d = a:JSONEncode(self.Data)
        writefile(self.FileName, d)
    end)
    
    if not d then
        warn("[HyperUI] Failed to save config:", e)
    end
    return d
end

function b:Load()
    if not isfile(self.FileName) then return false end
    
    local c, d = pcall(function()
        local c = readfile(self.FileName)
        return a:JSONDecode(c)
    end)
    
    if c and type(d) == "table" then
        self.Data = d
        
        for e, f in pairs(self.Data) do
            self.Store:Dispatch({
                type = "UPDATE_ELEMENT",
                id = e,
                props = f
            })
        end
        return true
    end
    
    return false
end

function b:UpdateValue(c, d, e)
    if not self.Data[c] then
        self.Data[c] = {}
    end
    self.Data[c][d] = e
    
    if self.AutoSave then
        self:Save()
    end
end

return b
