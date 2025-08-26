--// Simple Pet/Mob Freeze & Teleport Script
--// Made for Executor use only

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local Toggle = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
Toggle.Size = UDim2.new(0, 120, 0, 40)
Toggle.Position = UDim2.new(0.05, 0, 0.2, 0)
Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.Text = "Freeze Pets: OFF"
Toggle.Parent = ScreenGui
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Toggle

-- Variables
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local enabled = false

-- Toggle Button
Toggle.MouseButton1Click:Connect(function()
    enabled = not enabled
    Toggle.Text = "Freeze Pets: " .. (enabled and "ON" or "OFF")
end)

-- Function to bring non-player models
RunService.Heartbeat:Connect(function()
    if enabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        for _, obj in ipairs(workspace:GetDescendants()) do
            -- Check if it's a movable model (pets, mobs, etc.)
            if obj:IsA("Model") and obj:FindFirstChild("HumanoidRootPart") then
                local owner = Players:GetPlayerFromCharacter(obj)
                if not owner then
                    -- Teleport them to you and keep stuck
                    obj:MoveTo(hrp.Position + Vector3.new(0,3,0))
                    if obj.PrimaryPart then
                        obj:SetPrimaryPartCFrame(hrp.CFrame * CFrame.new(0,3,0))
                    end
                end
            end
        end
    end
end)
