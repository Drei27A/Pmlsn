-- 100% Smart Freeze Pets Script
-- Press F to toggle on/off

local UserInputService = game:GetService("UserInputService")
local frozen = false

local function toggleFreeze()
    frozen = not frozen
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("HumanoidRootPart") then
            -- you can add more checks here if needed (like only for "Pet" names)
            obj.HumanoidRootPart.Anchored = frozen
        end
    end
    print(frozen and "✅ Pets Frozen" or "❌ Pets Unfrozen")
end

-- Keybind F
UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.F then
        toggleFreeze()
    end
end)
