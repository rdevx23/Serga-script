--[[
    Murder Mystery 2 GUI - Rebuilt from Diagnostic
    Version: 11 (Lazy Loading - Final)

    This version implements a true "lazy loading" system based on user feedback.
    Content for a tab is only created AFTER the tab is made visible on the first click.
    This ensures elements are always parented to a visible frame, fixing executor compatibility.
]]

-- =============================================
-- Section 1: Environment & Cleanup
-- =============================================
pcall(function()
    local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
    if playerGui:FindFirstChild("MM2_Main_GUI") then
        playerGui:FindFirstChild("MM2_Main_GUI"):Destroy()
    end
    if playerGui:FindFirstChild("MM2_Item_Spawner_GUI") then
        playerGui:FindFirstChild("MM2_Item_Spawner_GUI"):Destroy()
    end
     if playerGui:FindFirstChild("MM2_Progress_GUI") then
        playerGui:FindFirstChild("MM2_Progress_GUI"):Destroy()
    end
end)

local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- =============================================
-- Section 2: Main GUI Window
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

-- Reliable Dragging Mechanism
local userInputService = game:GetService("UserInputService")
local dragging, dragInput, lastPosition
topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; lastPosition = input.Position; dragInput = input
    end
end)
topBar.InputEnded:Connect(function(input)
    if input == dragInput then dragging = false end
end)
userInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - lastPosition
        mainFrame.Position = mainFrame.Position + UDim2.fromOffset(delta.X, delta.Y)
        lastPosition = input.Position
    end
end)

-- =============================================
-- Section 3: Tabs and Content Panels
-- =============================================
local tabsPanel = Instance.new("Frame")
tabsPanel.BackgroundTransparency = 1
tabsPanel.Size = UDim2.new(0, 150, 1, -40)
tabsPanel.Position = UDim2.new(0, 0, 0, 40)
tabsPanel.Parent = mainFrame
Instance.new("UIListLayout", tabsPanel).Padding = UDim.new(0, 5)

local contentPanel = Instance.new("Frame")
contentPanel.BackgroundTransparency = 1
contentPanel.Size = UDim2.new(1, -150, 1, -40)
contentPanel.Position = UDim2.new(0, 150, 0, 40)
contentPanel.Parent = mainFrame

-- =============================================
-- Section 4: UI Creation Helper Functions
-- =============================================
local function makeLabel(parent, text)
    local label = Instance.new("TextLabel")
    label.Text, label.Font, label.TextColor3, label.TextSize, label.BackgroundTransparency, label.TextXAlignment = text, Enum.Font.SourceSansBold, Color3.fromRGB(220, 220, 220), 16, 1, Enum.TextXAlignment.Left
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Parent = parent
    return label
end

local function makeInput(parent, placeholder)
    local textbox = Instance.new("TextBox")
    textbox.PlaceholderText, textbox.Font, textbox.TextSize, textbox.TextColor3, textbox.BackgroundColor3 = placeholder, Enum.Font.SourceSans, 14, Color3.fromRGB(240, 240, 240), Color3.fromRGB(50, 50, 50)
    textbox.Size = UDim2.new(1, 0, 0, 35)
    Instance.new("UICorner", textbox).CornerRadius = UDim.new(0, 4)
    Instance.new("UIPadding", textbox).PaddingLeft = UDim.new(0, 10)
    textbox.Parent = parent
    return textbox
end

local function makeButton(parent, title, size, onClick)
    local button = Instance.new("TextButton")
    button.Text, button.Font, button.TextSize, button.TextColor3, button.BackgroundColor3, button.TextXAlignment = title, Enum.Font.SourceSansBold, size, Color3.fromRGB(230, 230, 230), Color3.fromRGB(50, 50, 50), Enum.TextXAlignment.Center
    button.Size = UDim2.new(1, 0, 0, 40)
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 4)
    if onClick then button.MouseButton1Click:Connect(onClick) end
    button.Parent = parent
    return button
end

local function makeToggle(parent, text)
    local frame = Instance.new("Frame")
    frame.BackgroundTransparency, frame.Size = 1, UDim2.new(1, 0, 0, 30)
    makeLabel(frame, text).Size = UDim2.new(0.7, 0, 1, 0)
    local switch = Instance.new("TextButton")
    switch.Text, switch.Size, switch.Position, switch.AnchorPoint, switch.BackgroundColor3 = "", UDim2.new(0, 50, 0, 24), UDim2.new(1, -55, 0.5, 0), Vector2.new(0, 0.5), Color3.fromRGB(80, 80, 80)
    switch.Parent = frame
    Instance.new("UICorner", switch).CornerRadius = UDim.new(0, 12)
    local knob = Instance.new("Frame")
    knob.Size, knob.Position, knob.BackgroundColor3 = UDim2.fromOffset(20, 20), UDim2.fromPixels(2, 2), Color3.fromRGB(200, 200, 200)
    knob.Parent = switch
    Instance.new("UICorner", knob).CornerRadius = UDim.new(0, 10)
    local toggled = false
    switch.MouseButton1Click:Connect(function()
        toggled = not toggled
        switch.BackgroundColor3 = toggled and Color3.fromRGB(76, 175, 80) or Color3.fromRGB(80, 80, 80)
        knob:TweenPosition(toggled and UDim2.fromPixels(28, 2) or UDim2.fromPixels(2, 2), "Out", "Quad", 0.2, true)
    end)
    frame.Parent = parent
end

-- =============================================
-- Section 5: Tab System (Lazy Loading - Final)
-- =============================================
local function makeContentFrame()
    local frame = Instance.new("Frame")
    frame.BackgroundTransparency = 1
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Visible = false
    frame.Parent = contentPanel
    Instance.new("UIPadding", frame).Padding = UDim.new(0,15)
    Instance.new("UIListLayout", frame).Padding = UDim.new(0, 10)
    return frame
end

local tradeScamFrame, autoFarmFrame, godlySpawnerFrame, dupeGenFrame = makeContentFrame(), makeContentFrame(), makeContentFrame(), makeContentFrame()
local allContentFrames = {tradeScamFrame, autoFarmFrame, godlySpawnerFrame, dupeGenFrame}
local allTabButtons = {}
local populatedTabs = {}

local function switchTab(tabButton, frameToShow)
    for _, frame in ipairs(allContentFrames) do frame.Visible = false end
    for _, button in ipairs(allTabButtons) do
        button.BackgroundColor3, button.TextColor3 = Color3.fromRGB(24, 24, 24), Color3.fromRGB(200, 200, 200)
    end
    frameToShow.Visible = true
    tabButton.BackgroundColor3, tabButton.TextColor3 = Color3.fromRGB(35, 35, 35), Color3.fromRGB(255, 255, 255)
end

-- =============================================
-- Section 6: Population Functions & Tab Creation
-- =============================================
local function populateTradeScam()
    makeLabel(tradeScamFrame, "Victim Name")
    makeInput(tradeScamFrame, "UsernameHere")
    makeButton(tradeScamFrame, "Freeze Trade", 18)
    makeButton(tradeScamFrame, "Force Accept", 16)
end

local function populateAutoFarm()
    makeToggle(autoFarmFrame, "Box ESP")
    makeToggle(autoFarmFrame, "Skeleton ESP")
end

local function populateGodlySpawner()
    makeLabel(godlySpawnerFrame, "Enter Item Name")
    makeInput(godlySpawnerFrame, "e.g. Harvester")
    makeButton(godlySpawnerFrame, "SPAWN", 16)
end

local itemSpawnerGui
local function populateDupeGenerate()
    makeButton(dupeGenFrame, "Open Item Spawner", 16, function()
        if itemSpawnerGui then itemSpawnerGui.Enabled = true end
    end)
end

local function makeTabButton(text, contentFrame, populationFunc)
    local button = Instance.new("TextButton")
    button.Text, button.Font, button.TextSize, button.TextColor3, button.BackgroundColor3, button.TextXAlignment = "  " .. text, Enum.Font.SourceSans, 16, Color3.fromRGB(200, 200, 200), Color3.fromRGB(24, 24, 24), Enum.TextXAlignment.Left
    button.Size = UDim2.new(1, 0, 0, 35)
    button.Parent = tabsPanel
    
    button.MouseButton1Click:Connect(function()
        switchTab(button, contentFrame)
        if not populatedTabs[contentFrame] then
            populationFunc()
            populatedTabs[contentFrame] = true
        end
    end)
    
    table.insert(allTabButtons, button)
    return button
end

local tradeScamButton = makeTabButton("Trade Scam", tradeScamFrame, populateTradeScam)
makeTabButton("AutoFarm/ESP", autoFarmFrame, populateAutoFarm)
makeTabButton("Godly Spawner", godlySpawnerFrame, populateGodlySpawner)
makeTabButton("Dupe/Generate", dupeGenFrame, populateDupeGenerate)

-- =============================================
-- Section 7: Item Spawner Window
-- =============================================
itemSpawnerGui = Instance.new("ScreenGui")
itemSpawnerGui.Name, itemSpawnerGui.ZIndexBehavior, itemSpawnerGui.Enabled = "MM2_Item_Spawner_GUI", Enum.ZIndexBehavior.Sibling, false
itemSpawnerGui.Parent = playerGui

local spawnerFrame = Instance.new("Frame")
spawnerFrame.BackgroundColor3, spawnerFrame.BorderColor3, spawnerFrame.BorderSizePixel = Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 255, 127), 2
spawnerFrame.Position, spawnerFrame.AnchorPoint, spawnerFrame.Size = UDim2.fromScale(0.5, 0.5), Vector2.new(0.5, 0.5), UDim2.new(0, 350, 0, 220)
spawnerFrame.Parent = itemSpawnerGui

local spawnerTitle = makeLabel(spawnerFrame, "Item Spawner")
spawnerTitle.Size, spawnerTitle.TextXAlignment, spawnerTitle.TextSize = UDim2.new(1, 0, 0, 40), Enum.TextXAlignment.Center, 20

local itemDropdownButton = makeInput(spawnerFrame, "Select an item...")
itemDropdownButton.Position, itemDropdownButton.AnchorPoint, itemDropdownButton.Size = UDim2.new(0.5, 0, 0, 50), Vector2.new(0.5, 0), UDim2.new(0.9, 0, 0, 35)

local dropdownScroll = Instance.new("ScrollingFrame")
dropdownScroll.Size, dropdownScroll.Position, dropdownScroll.AnchorPoint = UDim2.new(0.9, 0, 0, 100), UDim2.new(0.5, 0, 0, 85), Vector2.new(0.5, 0)
dropdownScroll.BackgroundColor3, dropdownScroll.BorderColor3, dropdownScroll.BorderSizePixel, dropdownScroll.Visible = Color3.fromRGB(40, 40, 40), Color3.fromRGB(80, 80, 80), 1, false
dropdownScroll.Parent = spawnerFrame
Instance.new("UIListLayout", dropdownScroll).Padding = UDim.new(0, 2)

local itemList, selectedItem = { "Harvester", "Candy", "Sugar", "Icebreaker", "Elderwood Revolver", "Lightbringer", "Darkbringer", "Chroma Lightbringer", "Chroma Darkbringer", "Batwing", "Icewing", "Nik's Scythe", "America", "Blood", "Phaser", "Laser", "Shadow", "Splitter", "Deathshard", "Fang", "Saw", "Slasher", "Tides", "Heat", "Luger", "Pixel", "Shark", "Flames", "Chill", "Clockwork", "Spider", "Virtual" }, ""
for _, name in ipairs(itemList) do
    local btn = makeButton(dropdownScroll, name, 14, function()
        itemDropdownButton.Text, selectedItem, dropdownScroll.Visible = name, name, false
    end)
    btn.Size = UDim2.new(1, -10, 0, 25)
end
itemDropdownButton.Focused:Connect(function() dropdownScroll.Visible = true end)
itemDropdownButton.FocusLost:Connect(function() task.wait(0.1) dropdownScroll.Visible = false end)

local closeButton = makeButton(spawnerFrame, "Close Menu", 16, function() itemSpawnerGui.Enabled = false end)
closeButton.Position, closeButton.AnchorPoint, closeButton.Size = UDim2.new(0.05, 0, 1, -40), Vector2.new(0, 1), UDim2.new(0.4, -5, 0, 35)

local function runSpawnSequence()
    if selectedItem == "" then return end
    itemSpawnerGui.Enabled = false
    
    local progressGui = Instance.new("ScreenGui")
    progressGui.Name = "MM2_Progress_GUI"
    progressGui.Parent = playerGui
    
    local pFrame = Instance.new("Frame")
    pFrame.Position, pFrame.AnchorPoint, pFrame.Size, pFrame.BackgroundColor3 = UDim2.fromScale(0.5, 0.8), Vector2.new(0.5, 0.5), UDim2.new(0, 350, 0, 80), Color3.fromRGB(20, 20, 20)
    pFrame.Parent = progressGui
    
    local pText = makeLabel(pFrame, "Spawning...")
    pText.Position, pText.AnchorPoint, pText.TextXAlignment = UDim2.new(0.5, 0, 0, 15), Vector2.new(0.5, 0), Enum.TextXAlignment.Center
    
    local barBg = Instance.new("Frame")
    barBg.Position, barBg.AnchorPoint, barBg.Size, barBg.BackgroundColor3 = UDim2.new(0.5, 0, 0, 45), Vector2.new(0.5, 0), UDim2.new(0.9, 0, 0, 15), Color3.fromRGB(10, 10, 10)
    barBg.Parent = pFrame
    
    local barFill = Instance.new("Frame")
    barFill.Size, barFill.BackgroundColor3 = UDim2.new(0, 0, 1, 0), Color3.fromRGB(0, 122, 255)
    barFill.Parent = barBg
    
    for i = 1, 100 do
        task.wait(0.1)
        pText.Text = string.format("Spawning: %s (%d%%)", selectedItem, i)
        barFill:TweenSize(UDim2.new(i / 100, 0, 1, 0), "Out", "Linear", 0.1, true)
    end
    
    pText.Text = "Spawned: " .. selectedItem
    local newItem = Instance.new("Tool")
    newItem.Name = selectedItem
    Instance.new("Part", newItem).Name = "Handle"
    newItem.Parent = player.Backpack
    
    task.wait(1.5)
    progressGui:Destroy()
end

local spawnBtn = makeButton(spawnerFrame, "Spawn", 16, runSpawnSequence)
spawnBtn.Position, spawnBtn.AnchorPoint, spawnBtn.Size = UDim2.new(0.95, 0, 1, -40), Vector2.new(1, 1), UDim2.new(0.5, -5, 0, 35)

-- =============================================
-- Section 8: Finalization
-- =============================================
-- Manually trigger the first tab's visibility and population
switchTab(tradeScamButton, tradeScamFrame)
populateTradeScam()
populatedTabs[tradeScamFrame] = true

print("MM2 GUI: Lazy loading fix script loaded.") 