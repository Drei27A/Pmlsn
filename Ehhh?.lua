-- Freeze Tool Pets Script
-- Press F to toggle freeze/unfreeze

local UserInputService = game:GetService("UserInputService")
local frozen = false

local function toggleFreeze()
    frozen = not frozen
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Tool") and obj:FindFirstChild("Handle") then
            obj.Handle.Anchored = frozen
        elseif obj:IsA("Model") and obj:FindFirstChild("Handle") then
            obj.Handle.Anchored = frozen
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
