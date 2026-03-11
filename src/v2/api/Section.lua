--[[
    HyperUI v2 - Section API
]]

local SectionAPI = {}
SectionAPI.__index = SectionAPI

local Element = require(script.Parent.Element)

function SectionAPI.new(id, tabId, windowId, store)
    local self = setmetatable({
        Id = id,
        TabId = tabId,
        WindowId = windowId,
        Store = store,
    }, SectionAPI)
    
    return self
end

local function CreateElement(self, elementType, config)
    local elementId = game:GetService("HttpService"):GenerateGUID(false)
    
    self.Store:Dispatch({
        type = "ADD_ELEMENT",
        parentId = self.Id,
        element = {
            id = elementId,
            type = elementType,
            props = config,
        }
    })
    
    return Element.new(elementId, self.Store)
end

function SectionAPI:CreateButton(config)
    return CreateElement(self, "Button", config)
end

function SectionAPI:CreateIconButton(config)
    return CreateElement(self, "IconButton", config)
end

function SectionAPI:CreateToggle(config)
    return CreateElement(self, "Toggle", config)
end

function SectionAPI:CreateCheckbox(config)
    return CreateElement(self, "Checkbox", config)
end

function SectionAPI:CreateSlider(config)
    return CreateElement(self, "Slider", config)
end

function SectionAPI:CreateDropdown(config)
    return CreateElement(self, "Dropdown", config)
end

function SectionAPI:CreateMultiDropdown(config)
    config.Multi = true
    return CreateElement(self, "Dropdown", config)
end

function SectionAPI:CreateKeybind(config)
    return CreateElement(self, "Keybind", config)
end

function SectionAPI:CreateInput(config)
    return CreateElement(self, "Input", config)
end

function SectionAPI:CreateNumberInput(config)
    return CreateElement(self, "NumberInput", config)
end

function SectionAPI:CreateSearchInput(config)
    return CreateElement(self, "SearchInput", config)
end

function SectionAPI:CreateTextArea(config)
    return CreateElement(self, "TextArea", config)
end

function SectionAPI:CreateLabel(config)
    return CreateElement(self, "Label", config)
end

function SectionAPI:CreateBadge(config)
    return CreateElement(self, "Badge", config)
end

function SectionAPI:CreateIcon(config)
    return CreateElement(self, "Icon", config)
end

function SectionAPI:CreateProgressBar(config)
    return CreateElement(self, "ProgressBar", config)
end

function SectionAPI:CreateComboBox(config)
    return CreateElement(self, "ComboBox", config)
end

function SectionAPI:CreateAvatar(config)
    return CreateElement(self, "Avatar", config)
end

function SectionAPI:CreateDivider(config)
    return CreateElement(self, "Divider", config or {})
end

function SectionAPI:CreateSpacer(height)
    return CreateElement(self, "Spacer", { Height = height })
end

function SectionAPI:CreateAccordion(config)
    return CreateElement(self, "Accordion", config)
end

function SectionAPI:CreateCollapsible(config)
    return CreateElement(self, "Collapsible", config)
end

function SectionAPI:CreateCopyButton(config)
    return CreateElement(self, "CopyButton", config)
end

function SectionAPI:CreateTag(config)
    return CreateElement(self, "Tag", config)
end

function SectionAPI:CreateStatusIndicator(config)
    return CreateElement(self, "StatusIndicator", config)
end

function SectionAPI:CreateGrid(config)
    return CreateElement(self, "Grid", config)
end

function SectionAPI:CreateStack(config)
    return CreateElement(self, "Stack", config)
end

function SectionAPI:CreateVirtualList(config)
    return CreateElement(self, "VirtualList", config)
end

return SectionAPI
