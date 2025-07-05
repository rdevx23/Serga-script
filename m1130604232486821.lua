--[[
    Murder Mystery 2 GUI - DIAGNOSTIC SCRIPT
    Version: Test 1

    Purpose: This is a minimal script to test if the executor can render a basic GUI.
    It only creates a single, visible frame on the screen.

    Instructions:
    - Run this script.
    - If you see a grey square in the middle of your screen, the test is successful.
    - If you do NOT see a grey square, the issue is with the executor environment, not the script code.
]]

-- Clear any old GUI to be safe
pcall(function()
    game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MM2_DIAGNOSTIC_TEST"):Destroy()
end)

-- 1. Create the main GUI object
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MM2_DIAGNOSTIC_TEST"
screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 2. Create a single, visible frame
local testFrame = Instance.new("Frame")
testFrame.Name = "DiagnosticFrame"
testFrame.Parent = screenGui
testFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- A noticeable grey color
testFrame.BorderColor3 = Color3.fromRGB(255, 255, 255) -- A white border
testFrame.BorderSizePixel = 2
testFrame.Position = UDim2.fromScale(0.5, 0.5)
testFrame.AnchorPoint = Vector2.new(0.5, 0.5)
testFrame.Size = UDim2.new(0, 300, 0, 200) -- A decent size
testFrame.Visible = true -- Ensure it is visible

-- 3. Add a label to it so we know it's ours
local testLabel = Instance.new("TextLabel")
testLabel.Name = "DiagnosticLabel"
testLabel.Parent = testFrame
testLabel.Text = "DIAGNOSTIC TEST SUCCESSFUL"
testLabel.Font = Enum.Font.SourceSansBold
testLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
testLabel.TextSize = 24
testLabel.BackgroundTransparency = 1
testLabel.Size = UDim2.new(1, 0, 1, 0)
testLabel.TextWrapped = true

print("MM2 GUI: Diagnostic script loaded. A grey frame should be visible.") 