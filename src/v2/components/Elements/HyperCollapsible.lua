--[[
    HyperUI v2 - HyperCollapsible Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Accordion = require(script.Parent.HyperAccordion)

local function HyperCollapsible(props)
    -- Collapsible is essentially a simplified Accordion
    return React.createElement(Accordion, props)
end

return HyperCollapsible
