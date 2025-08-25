-- Grow a Garden Freeze Script with GUI
-- Everything freezes except players

-- GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Toggle = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.Size = UDim2.new(0,150,0,60)
Frame.Position = UDim2.new(0.1,0,0.1,0)
Frame.Active = true
Frame.Draggable = true

Toggle.Parent = Frame
Toggle.Text = "Freeze: OFF"
Toggle.Size = UDim2.new(1,0,1,0)
Toggle.BackgroundColor3 = Color3.fromRGB(50,50,50)
Toggle.TextColor3 = Color3.fromRGB(255,255,255)

-- Freeze function
local frozen = false

function SetFreeze(state)
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v:IsDescendantOf(game.Players) then
            if state then
                v.Anchored = true
            else
                v.Anchored = false
            end
        end
    end
end

Toggle.MouseButton1Click:Connect(function()
    frozen = not frozen
    if frozen then
        Toggle.Text = "Freeze: ON"
        SetFreeze(true)
    else
        Toggle.Text = "Freeze: OFF"
        SetFreeze(false)
    end
end)
