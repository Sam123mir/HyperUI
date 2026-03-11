



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.HyperModal)
local c = require(script.Parent.HyperButton)

local function HyperConfirmationDialog(d)
    return a.createElement(b, {
        Open = d.Open,
        Title = d.Title,
        Content = d.Content,
    }, {
        Cancel = a.createElement(c, {
            Text = d.CancelText or "Cancel",
            Size = UDim2.fromOffset(100, 32),
            Callback = d.OnCancel,
        }),
        Confirm = a.createElement(c, {
            Text = d.ConfirmText or "Confirm",
            Size = UDim2.fromOffset(100, 32),
            BackgroundColor = Color3.fromRGB(200, 50, 50), 
            Callback = d.OnConfirm,
        })
    })
end

return HyperConfirmationDialog
