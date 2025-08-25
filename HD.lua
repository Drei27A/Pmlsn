-- Freeze Pets Script for Grow a Garden
-- Press F to toggle

local UserInputService = game:GetService("UserInputService")
local frozen = false

local function toggleFreeze()
    frozen = not frozen
    for _, pet in pairs(workspace:GetDescendants()) do
        if pet:IsA("Model") and pet.Name:lower():find("cat") or pet.Name:lower():find("pet") then
            for _, part in pairs(pet:GetChildren()) do
                if part:IsA("BasePart") or part.Name == "Handle" then
                    part.Anchored = frozen
                end
            end
        end
    end
    print(frozen and "✅ Pets Frozen" or "❌ Pets Unfrozen")
end

-- Keybind: press F
UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.F then
        toggleFreeze()
    end
end)
