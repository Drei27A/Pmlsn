-- Freeze All Except Player Script (Grow a Garden)
-- Made for Exploit use only

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Size = UDim2.new(0, 150, 0, 60)
Frame.Position = UDim2.new(0.05, 0, 0.1, 0)

ToggleButton.Parent = Frame
ToggleButton.Size = UDim2.new(1, 0, 1, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 18
ToggleButton.Text = "Freeze: OFF"

-- Main Freeze Logic
local freezeEnabled = false

local function setFreeze(state)
    freezeEnabled = state
    if freezeEnabled then
        ToggleButton.Text = "Freeze: ON"
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Anchored == false then
                local playerChar = game.Players.LocalPlayer.Character
                if playerChar and obj:IsDescendantOf(playerChar) == false then
                    obj.Anchored = true
                end
            end
        end
    else
        ToggleButton.Text = "Freeze: OFF"
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Anchored == true then
                local playerChar = game.Players.LocalPlayer.Character
                if playerChar and obj:IsDescendantOf(playerChar) == false then
                    obj.Anchored = false
                end
            end
        end
    end
end

-- Toggle Button Click
ToggleButton.MouseButton1Click:Connect(function()
    setFreeze(not freezeEnabled)
end)
