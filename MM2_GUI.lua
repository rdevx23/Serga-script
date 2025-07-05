--[[
    Murder Mystery 2 GUI - UGLY DIAGNOSTIC
    Version: 14 (Forcing visibility of core panels)

    This is a final, minimalist test.
    - Removes all automation (UIListLayout).
    - Removes transparency from core panels, giving them bright colors.
    - Creates only ONE tab and its content, positioned manually.
    The goal is to see if the core tab/content panels render AT ALL.
]]

-- =============================================
-- Section 1: Environment & Cleanup
-- =============================================
pcall(function()
    local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
    if playerGui:FindFirstChild("MM2_Main_GUI") then
        playerGui:FindFirstChild("MM2_Main_GUI"):Destroy()
    end
end)

local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- =============================================
-- Section 2: Main GUI (Visibility Test)
-- =============================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MM2_Main_GUI"
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
mainFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
mainFrame.Position = UDim2.fromScale(0.5, 0.5)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Size = UDim2.new(0, 420, 0, 280)
mainFrame.ClipsDescendants = true
mainFrame.Visible = true
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "Murder Mystery 2"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
titleLabel.TextSize = 18
titleLabel.BackgroundTransparency = 1
titleLabel.Position = UDim2.new(0, 15, 0.5, 0)
titleLabel.AnchorPoint = Vector2.new(0, 0.5)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = topBar

-- =============================================
-- Section 3: UGLY DIAGNOSTIC PANELS
-- =============================================
-- !! TEST !! Making tabs panel solid red and removing UIListLayout
local tabsPanel = Instance.new("Frame")
tabsPanel.Name = "TabsPanel"
tabsPanel.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- RED
tabsPanel.Size = UDim2.new(0, 150, 1, -40)
tabsPanel.Position = UDim2.new(0, 0, 0, 40)
tabsPanel.Parent = mainFrame

-- !! TEST !! Making content panel solid blue
local contentPanel = Instance.new("Frame")
contentPanel.Name = "ContentPanel"
contentPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- BLUE
contentPanel.Size = UDim2.new(1, -150, 1, -40)
contentPanel.Position = UDim2.new(0, 150, 0, 40)
contentPanel.Parent = mainFrame


-- =============================================
-- Section 4: UGLY DIAGNOSTIC CONTENT
-- =============================================
-- !! TEST !! Manually create and position ONE button
local tradeScamButton = Instance.new("TextButton")
tradeScamButton.Name = "TestButton"
tradeScamButton.Text = "  Trade Scam"
tradeScamButton.Font = Enum.Font.SourceSans
tradeScamButton.TextSize = 16
tradeScamButton.TextColor3 = Color3.fromRGB(255, 255, 255)
tradeScamButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tradeScamButton.TextXAlignment = Enum.TextXAlignment.Left
tradeScamButton.Size = UDim2.new(1, -10, 0, 35) -- A bit smaller than the panel
tradeScamButton.Position = UDim2.new(0.5, 0, 0, 5) -- Centered with padding
tradeScamButton.AnchorPoint = Vector2.new(0.5, 0)
tradeScamButton.Parent = tabsPanel

-- !! TEST !! Manually create and make ONE content frame visible
local tradeScamFrame = Instance.new("Frame")
tradeScamFrame.Name = "TestContent"
tradeScamFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Dark Grey
tradeScamFrame.Size = UDim2.new(1, 0, 1, 0)
tradeScamFrame.Visible = true
tradeScamFrame.Parent = contentPanel

local testLabel = Instance.new("TextLabel")
testLabel.Name = "TestLabel"
testLabel.Text = "IF YOU SEE THIS, IT WORKS!"
testLabel.Font = Enum.Font.SourceSansBold
testLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- GREEN
testLabel.TextSize = 18
testLabel.BackgroundTransparency = 1
testLabel.Size = UDim2.new(1, -20, 0, 30)
testLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
testLabel.AnchorPoint = Vector2.new(0.5, 0.5)
testLabel.Parent = tradeScamFrame

print("MM2 GUI: UGLY DIAGNOSTIC script loaded.")
print(" --> If you see RED and BLUE panels, the issue is found.") 