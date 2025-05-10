-- Zoro Hub (Dark GUI with Toggle Buttons)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ZoroHub"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Position = UDim2.new(0.7, 0, 0.25, 0)
frame.Size = UDim2.new(0, 220, 0, 160)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Text = "Zoro Hub"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

local toggles = {
    {Name = "Freeze Trade", OnToggle = function(on)
        if on then
            print("Freeze Trade: ON")
        else
            print("Freeze Trade: OFF")
        end
    end},
    {Name = "Auto Accept", OnToggle = function(on)
        print("Auto Accept:", on)
    end},
    {Name = "Auto Add Items", OnToggle = function(on)
        print("Auto Add Items:", on)
    end}
}

for i, t in ipairs(toggles) do
    local container = Instance.new("Frame", frame)
    container.Size = UDim2.new(1, -20, 0, 30)
    container.Position = UDim2.new(0, 10, 0, 30 + (i - 1) * 35)
    container.BackgroundTransparency = 1

    local label = Instance.new("TextLabel", container)
    label.Text = t.Name
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left

    local toggle = Instance.new("TextButton", container)
    toggle.Size = UDim2.new(0, 40, 0, 20)
    toggle.Position = UDim2.new(1, -45, 0.5, -10)
    toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    toggle.Text = ""
    toggle.AutoButtonColor = false
    toggle.BorderSizePixel = 0

    local state = false
    local circle = Instance.new("Frame", toggle)
    circle.Size = UDim2.new(0, 16, 0, 16)
    circle.Position = UDim2.new(0, 2, 0.5, -8)
    circle.BackgroundColor3 = Color3.new(1, 1, 1)
    circle.BorderSizePixel = 0
    circle.Name = "Knob"
    circle.ZIndex = 2
    circle.BackgroundTransparency = 0
    circle.AnchorPoint = Vector2.new(0, 0)

    toggle.MouseButton1Click:Connect(function()
        state = not state
        if state then
            toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
            circle.Position = UDim2.new(1, -18, 0.5, -8)
        else
            toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            circle.Position = UDim2.new(0, 2, 0.5, -8)
        end
        t.OnToggle(state)
    end)
end
