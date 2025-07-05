--[[
    Murder Mystery 2 GUI Script
    Back to Basics - Version 6 by Gemini

    This version reverts to a simpler, more direct tab management system for maximum compatibility,
    as requested by the user. It retains all previously requested visual features.
]]

-- =============================================
-- Section 1: Environment & Cleanup
-- =============================================
if game:GetService("RunService"):IsStudio() then return end

local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Clean up any and all previous GUI elements this script creates
pcall(function()
    playerGui:FindFirstChild("MM2_Main_GUI"):Destroy()
    playerGui:FindFirstChild("MM2_Item_Spawner_GUI"):Destroy()
    playerGui:FindFirstChild("MM2_Progress_GUI"):Destroy()
end)

-- =============================================
-- Section 2: Main Window & Draggability
-- =============================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MM2_Main_GUI"
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Parent = screenGui
-- mainFrame.Active = true -- Removed potentially problematic properties
-- mainFrame.Draggable = true
mainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
mainFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
mainFrame.Position = UDim2.fromScale(0.5, 0.5)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Size = UDim2.new(0, 420, 0, 280)
mainFrame.ClipsDescendants = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Parent = mainFrame
topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.BorderSizePixel = 0

local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = topBar
titleLabel.Text = "Murder Mystery 2"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
titleLabel.TextSize = 18
titleLabel.BackgroundTransparency = 1
titleLabel.Position = UDim2.new(0, 15, 0.5, 0)
titleLabel.AnchorPoint = Vector2.new(0, 0.5)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Reliable drag functionality (re-implemented)
local userInputService = game:GetService("UserInputService")
local dragging, dragInput, lastPosition

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        lastPosition = input.Position
        dragInput = input
    end
end)

topBar.InputEnded:Connect(function(input)
    if input == dragInput then
        dragging = false
    end
end)

userInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - lastPosition
        mainFrame.Position = UDim2.new(
            mainFrame.Position.X.Scale, mainFrame.Position.X.Offset + delta.X,
            mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset + delta.Y
        )
        lastPosition = input.Position
    end
end)

-- Container for tab buttons
local tabsPanel = Instance.new("Frame")
tabsPanel.Parent = mainFrame
tabsPanel.BackgroundTransparency = 1
tabsPanel.Size = UDim2.new(0, 150, 1, -40)
tabsPanel.Position = UDim2.new(0, 0, 0, 40)
Instance.new("UIListLayout", tabsPanel).Padding = UDim.new(0, 5)

-- Container for tab content
local contentPanel = Instance.new("Frame")
contentPanel.Parent = mainFrame
contentPanel.BackgroundTransparency = 1
contentPanel.Size = UDim2.new(1, -150, 1, -40)
contentPanel.Position = UDim2.new(0, 150, 0, 40)

-- =============================================
-- Section 3: Simple UI Creation Functions
-- =============================================
local function makeLabel(parent, text)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Text = text
    label.Font = Enum.Font.SourceSansBold
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextSize = 16
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 0, 20)
    label.TextXAlignment = Enum.TextXAlignment.Left
    return label
end

local function makeInput(parent, placeholder)
    local textbox = Instance.new("TextBox")
    textbox.Parent = parent
    textbox.PlaceholderText = placeholder
    textbox.Font = Enum.Font.SourceSans
    textbox.TextSize = 14
    textbox.TextColor3 = Color3.fromRGB(240, 240, 240)
    textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    textbox.Size = UDim2.new(1, 0, 0, 35)
    Instance.new("UICorner", textbox).CornerRadius = UDim.new(0, 4)
    local padding = Instance.new("UIPadding", textbox)
    padding.PaddingLeft = UDim.new(0, 10)
    return textbox
end

local function makeButton(parent, title, size, onClick)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = title
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = size
    button.TextColor3 = Color3.fromRGB(230, 230, 230)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Size = UDim2.new(1, 0, 0, 40)
    button.TextXAlignment = Enum.TextXAlignment.Center
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 4)
    if onClick then
        button.MouseButton1Click:Connect(onClick)
    end
    return button
end

local function makeToggle(parent, text)
    local frame = Instance.new("Frame", parent)
    frame.BackgroundTransparency = 1
    frame.Size = UDim2.new(1, 0, 0, 30)
    
    makeLabel(frame, text).Size = UDim2.new(0.7, 0, 1, 0)
    
    local switch = Instance.new("TextButton", frame)
    switch.Text = ""
    switch.Size = UDim2.new(0, 50, 0, 24)
    switch.Position = UDim2.new(1, -55, 0.5, 0)
    switch.AnchorPoint = Vector2.new(0, 0.5)
    switch.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    Instance.new("UICorner", switch).CornerRadius = UDim.new(0, 12)

    local knob = Instance.new("Frame", switch)
    knob.Size = UDim2.fromOffset(20, 20)
    knob.Position = UDim2.fromPixels(2, 2)
    knob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Instance.new("UICorner", knob).CornerRadius = UDim.new(0, 10)
    
    local toggled = false
    switch.MouseButton1Click:Connect(function()
        toggled = not toggled
        local color = toggled and Color3.fromRGB(76, 175, 80) or Color3.fromRGB(80, 80, 80)
        local pos = toggled and UDim2.fromPixels(28, 2) or UDim2.fromPixels(2, 2)
        switch.BackgroundColor3 = color
        knob:TweenPosition(pos, "Out", "Quad", 0.2, true)
    end)
end

-- =============================================
-- Section 4: Tab Creation and Switching Logic (Simple Method)
-- =============================================
local function makeContentFrame()
    local frame = Instance.new("Frame")
    frame.Parent = contentPanel
    frame.BackgroundTransparency = 1
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Visible = false -- All content frames are invisible by default
    local padding = Instance.new("UIPadding", frame)
    padding.PaddingTop = UDim.new(0, 15)
    padding.PaddingLeft = UDim.new(0, 15)
    padding.PaddingRight = UDim.new(0, 15)
    Instance.new("UIListLayout", frame).Padding = UDim.new(0, 10)
    return frame
end

-- Create all content frames first
local tradeScamFrame = makeContentFrame()
local autoFarmFrame = makeContentFrame()
local godlySpawnerFrame = makeContentFrame()
local dupeGenFrame = makeContentFrame()

local allContentFrames = {tradeScamFrame, autoFarmFrame, godlySpawnerFrame, dupeGenFrame}
local tabButtons = {}

local function switchTab(frameToShow)
    for _, frame in ipairs(allContentFrames) do
        frame.Visible = false
    end
    for _, button in ipairs(tabButtons) do
        button.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
        button.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
    frameToShow.Visible = true
end

local function makeTabButton(text, contentFrame)
    local tabButton = Instance.new("TextButton")
    tabButton.Parent = tabsPanel
    tabButton.Text = "  " .. text
    tabButton.Font = Enum.Font.SourceSans
    tabButton.TextSize = 16
    tabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    tabButton.Size = UDim2.new(1, 0, 0, 35)
    tabButton.TextXAlignment = Enum.TextXAlignment.Left
    
    tabButton.MouseButton1Click:Connect(function()
        switchTab(contentFrame)
        tabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    table.insert(tabButtons, tabButton)
    return tabButton
end

-- Create tab buttons and link them to content frames
local tradeScamButton = makeTabButton("Trade Scam", tradeScamFrame)
local autoFarmButton = makeTabButton("AutoFarm/ESP", autoFarmFrame)
local godlySpawnerButton = makeTabButton("Godly Spawner", godlySpawnerFrame)
local dupeGenButton = makeTabButton("Dupe/Generate", dupeGenFrame)


-- =============================================
-- Section 5: Populate Tabs
-- =============================================
-- Trade Scam
makeLabel(tradeScamFrame, "Victim Name")
makeInput(tradeScamFrame, "UsernameHere")
makeButton(tradeScamFrame, "Freeze Trade", 18) -- Enlarged text
makeButton(tradeScamFrame, "Force Accept", 16)

-- AutoFarm/ESP
makeToggle(autoFarmFrame, "Box ESP")
makeToggle(autoFarmFrame, "Skeleton ESP")

-- Godly Spawner
makeLabel(godlySpawnerFrame, "Enter Item Name")
makeInput(godlySpawnerFrame, "e.g. Harvester")
makeButton(godlySpawnerFrame, "SPAWN", 16)

-- Dupe/Generate
local itemSpawnerGui -- Forward declare

makeButton(dupeGenFrame, "Open Item Spawner", 16, function()
    if itemSpawnerGui then itemSpawnerGui.Enabled = true end
end)

-- =============================================
-- Section 6: Item Spawner Window
-- =============================================
itemSpawnerGui = Instance.new("ScreenGui")
itemSpawnerGui.Name = "MM2_Item_Spawner_GUI"
itemSpawnerGui.Parent = playerGui
itemSpawnerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
itemSpawnerGui.Enabled = false

local spawnerFrame = Instance.new("Frame", itemSpawnerGui)
spawnerFrame.Name = "ItemSpawnerFrame"
spawnerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
spawnerFrame.BorderColor3 = Color3.fromRGB(0, 255, 127) -- Green
spawnerFrame.BorderSizePixel = 2
spawnerFrame.Position = UDim2.fromScale(0.5, 0.5)
spawnerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
spawnerFrame.Size = UDim2.new(0, 350, 0, 220)

local spawnerTitle = makeLabel(spawnerFrame, "Item Spawner")
spawnerTitle.Size = UDim2.new(1, 0, 0, 40)
spawnerTitle.TextXAlignment = Enum.TextXAlignment.Center
spawnerTitle.TextSize = 20

local itemDropdownButton = makeInput(spawnerFrame, "Select an item...")
itemDropdownButton.Position = UDim2.new(0.5, 0, 0, 50)
itemDropdownButton.AnchorPoint = Vector2.new(0.5, 0)
itemDropdownButton.Size = UDim2.new(0.9, 0, 0, 35)

local dropdownScroll = Instance.new("ScrollingFrame", spawnerFrame)
dropdownScroll.Size = UDim2.new(0.9, 0, 0, 100)
dropdownScroll.Position = UDim2.new(0.5, 0, 0, 85)
dropdownScroll.AnchorPoint = Vector2.new(0.5, 0)
dropdownScroll.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
dropdownScroll.BorderColor3 = Color3.fromRGB(80, 80, 80)
dropdownScroll.BorderSizePixel = 1
dropdownScroll.Visible = false
Instance.new("UIListLayout", dropdownScroll).Padding = UDim.new(0, 2)

local itemList = { "Harvester", "Candy", "Sugar", "Icebreaker", "Elderwood Revolver", "Lightbringer", "Darkbringer", "Chroma Lightbringer", "Chroma Darkbringer", "Batwing", "Icewing", "Nik's Scythe", "America", "Blood", "Phaser", "Laser", "Shadow", "Splitter", "Deathshard", "Fang", "Saw", "Slasher", "Tides", "Heat", "Luger", "Pixel", "Shark", "Flames", "Chill", "Clockwork", "Spider", "Virtual" }
local selectedItem = ""

for _, itemName in ipairs(itemList) do
    makeButton(dropdownScroll, itemName, 14, function()
        itemDropdownButton.Text = itemName
        selectedItem = itemName
        dropdownScroll.Visible = false
    end).Size = UDim2.new(1, -10, 0, 25)
end

itemDropdownButton.Focused:Connect(function() dropdownScroll.Visible = true end)
itemDropdownButton.FocusLost:Connect(function() task.wait(0.1); dropdownScroll.Visible = false end)

makeButton(spawnerFrame, "Close Menu", 16, function()
    itemSpawnerGui.Enabled = false
end).Position = UDim2.new(0.05, 0, 1, -40);

local function runSpawnSequence()
    if selectedItem == "" then return end
    itemSpawnerGui.Enabled = false
    
    local progressGui = Instance.new("ScreenGui", playerGui)
    progressGui.Name = "MM2_Progress_GUI"
    
    local pFrame = Instance.new("Frame", progressGui)
    pFrame.Position = UDim2.fromScale(0.5, 0.8)
    pFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    pFrame.Size = UDim2.new(0, 350, 0, 80)
    pFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    
    local pText = makeLabel(pFrame, "Spawning...")
    pText.Position = UDim2.new(0.5, 0, 0, 15)
    pText.AnchorPoint = Vector2.new(0.5, 0)
    pText.TextXAlignment = Enum.TextXAlignment.Center
    
    local barBg = Instance.new("Frame", pFrame)
    barBg.Position = UDim2.new(0.5, 0, 0, 45)
    barBg.AnchorPoint = Vector2.new(0.5, 0)
    barBg.Size = UDim2.new(0.9, 0, 0, 15)
    barBg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    
    local barFill = Instance.new("Frame", barBg)
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
    
    for i = 1, 100 do
        task.wait(0.1)
        pText.Text = string.format("Spawning: %s (%d%%)", selectedItem, i)
        barFill:TweenSize(UDim2.new(i / 100, 0, 1, 0), "Out", "Linear", 0.1, true)
    end
    
    pText.Text = "Spawned: " .. selectedItem
    local newItem = Instance.new("Tool", player.Backpack); newItem.Name = selectedItem
    Instance.new("Part", newItem).Name = "Handle"
    
    task.wait(1.5)
    progressGui:Destroy()
end

local spawnBtn = makeButton(spawnerFrame, "Spawn", 16, runSpawnSequence)
spawnBtn.Position = UDim2.new(0.95, 0, 1, -40)
spawnBtn.AnchorPoint = Vector2.new(1, 0)
spawnBtn.Size = UDim2.new(0.5, -5, 0, 35)

-- =============================================
-- Section 7: Finalization
-- =============================================
-- Set default tab
switchTab(tradeScamFrame)
tradeScamButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
tradeScamButton.TextColor3 = Color3.fromRGB(255, 255, 255)

print("MM2 GUI: Back-to-Basics version loaded.") 