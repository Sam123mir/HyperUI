



local a = {}
a.__index = a

local b = require(script.Parent.Element)

function a.new(c, d, e, f)
    local g = setmetatable({
        Id = c,
        TabId = d,
        WindowId = e,
        Store = f,
    }, a)
    
    return g
end

local function CreateElement(c, d, e)
    local f = game:GetService("HttpService"):GenerateGUID(false)
    
    c.Store:Dispatch({
        type = "ADD_ELEMENT",
        parentId = c.Id,
        element = {
            id = f,
            type = d,
            props = e,
        }
    })
    
    return b.new(f, c.Store)
end

function a:CreateButton(c)
    return CreateElement(self, "Button", c)
end

function a:CreateIconButton(c)
    return CreateElement(self, "IconButton", c)
end

function a:CreateToggle(c)
    return CreateElement(self, "Toggle", c)
end

function a:CreateCheckbox(c)
    return CreateElement(self, "Checkbox", c)
end

function a:CreateSlider(c)
    return CreateElement(self, "Slider", c)
end

function a:CreateDropdown(c)
    return CreateElement(self, "Dropdown", c)
end

function a:CreateMultiDropdown(c)
    c.Multi = true
    return CreateElement(self, "Dropdown", c)
end

function a:CreateKeybind(c)
    return CreateElement(self, "Keybind", c)
end

function a:CreateInput(c)
    return CreateElement(self, "Input", c)
end

function a:CreateNumberInput(c)
    return CreateElement(self, "NumberInput", c)
end

function a:CreateSearchInput(c)
    return CreateElement(self, "SearchInput", c)
end

function a:CreateTextArea(c)
    return CreateElement(self, "TextArea", c)
end

function a:CreateLabel(c)
    return CreateElement(self, "Label", c)
end

function a:CreateBadge(c)
    return CreateElement(self, "Badge", c)
end

function a:CreateIcon(c)
    return CreateElement(self, "Icon", c)
end

function a:CreateProgressBar(c)
    return CreateElement(self, "ProgressBar", c)
end

function a:CreateComboBox(c)
    return CreateElement(self, "ComboBox", c)
end

function a:CreateAvatar(c)
    return CreateElement(self, "Avatar", c)
end

function a:CreateDivider(c)
    return CreateElement(self, "Divider", c or {})
end

function a:CreateSpacer(c)
    return CreateElement(self, "Spacer", { Height = c })
end

function a:CreateAccordion(c)
    return CreateElement(self, "Accordion", c)
end

function a:CreateCollapsible(c)
    return CreateElement(self, "Collapsible", c)
end

function a:CreateCopyButton(c)
    return CreateElement(self, "CopyButton", c)
end

function a:CreateTag(c)
    return CreateElement(self, "Tag", c)
end

function a:CreateStatusIndicator(c)
    return CreateElement(self, "StatusIndicator", c)
end

function a:CreateGrid(c)
    return CreateElement(self, "Grid", c)
end

function a:CreateStack(c)
    return CreateElement(self, "Stack", c)
end

function a:CreateVirtualList(c)
    return CreateElement(self, "VirtualList", c)
end

return a
