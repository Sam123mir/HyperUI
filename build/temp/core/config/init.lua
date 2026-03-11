




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
