



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.HyperAccordion)

local function HyperCollapsible(c)
    
    return a.createElement(b, c)
end

return HyperCollapsible
