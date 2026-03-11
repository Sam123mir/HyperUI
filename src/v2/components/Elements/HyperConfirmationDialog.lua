--[[
    HyperUI v2 - HyperConfirmationDialog Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Modal = require(script.Parent.HyperModal)
local Button = require(script.Parent.HyperButton)

local function HyperConfirmationDialog(props)
    return React.createElement(Modal, {
        Open = props.Open,
        Title = props.Title,
        Content = props.Content,
    }, {
        Cancel = React.createElement(Button, {
            Text = props.CancelText or "Cancel",
            Size = UDim2.fromOffset(100, 32),
            Callback = props.OnCancel,
        }),
        Confirm = React.createElement(Button, {
            Text = props.ConfirmText or "Confirm",
            Size = UDim2.fromOffset(100, 32),
            BackgroundColor = Color3.fromRGB(200, 50, 50), -- Alert color
            Callback = props.OnConfirm,
        })
    })
end

return HyperConfirmationDialog
