--[[
    Murder Mystery 2 GUI Script
    Complete Rebuild - Version 5 by Gemini
    This script is a complete rewrite from scratch to address all user requirements accurately.
]]

-- =============================================
-- Section 1: Environment Setup & Cleanup
-- =============================================
-- Do not run in Roblox Studio
if game:GetService("RunService"):IsStudio() then
    return
end

local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Destroy any previous instances of the GUI to prevent duplicates
pcall(function()
    playerGui:FindFirstChild("MM2MainGUI"):Destroy()
    playerGui:FindFirstChild("MM2ItemSpawner"):Destroy()
    playerGui:FindFirstChild("MM2Progress"):Destroy()
end)

-- =============================================
-- Section 2: Main GUI Structure
-- =============================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MM2MainGUI"
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main draggable window
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Parent = screenGui
mainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
mainFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
mainFrame.Position = UDim2.fromScale(0.5, 0.5)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Size = UDim2.new(0, 420, 0, 280) -- 30% smaller size
mainFrame.ClipsDescendants = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

-- Top bar for title and dragging
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

-- Drag functionality
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
        mainFrame.Position += UDim2.fromOffset(delta.X, delta.Y)
        lastPosition = input.Position
    end
end)

-- Tab and Content panels
local tabsPanel = Instance.new("Frame")
tabsPanel.Parent = mainFrame
tabsPanel.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
tabsPanel.Size = UDim2.new(0, 150, 1, -40)
tabsPanel.Position = UDim2.new(0, 0, 0, 40)
tabsPanel.BorderSizePixel = 0
Instance.new("UIListLayout", tabsPanel).Padding = UDim.new(0, 5)

local contentPanel = Instance.new("Frame")
contentPanel.Parent = mainFrame
contentPanel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
contentPanel.Size = UDim2.new(1, -150, 1, -40)
contentPanel.Position = UDim2.new(0, 150, 0, 40)
contentPanel.BorderSizePixel = 0

-- =============================================
-- Section 3: UI Element Creation Functions
-- =============================================
local function createLabel(parent, text)
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

local function createInput(parent, placeholder)
    local textbox = Instance.new("TextBox")
    textbox.Parent = parent
    textbox.PlaceholderText = placeholder
    textbox.Font = Enum.Font.SourceSans
    textbox.TextSize = 14
    textbox.TextColor3 = Color3.fromRGB(240, 240, 240)
    textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    textbox.BorderSizePixel = 0
    textbox.Size = UDim2.new(1, 0, 0, 35)
    Instance.new("UICorner", textbox).CornerRadius = UDim.new(0, 4)
    local padding = Instance.new("UIPadding", textbox)
    padding.PaddingLeft = UDim.new(0, 10)
    return textbox
end

local function createButton(parent, title, options)
    options = options or {}
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = title
    button.Font = options.Font or Enum.Font.SourceSansBold
    button.TextSize = options.TextSize or 16 -- Allow overriding text size
    button.TextColor3 = Color3.fromRGB(230, 230, 230)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.BorderSizePixel = 0
    button.Size = UDim2.new(1, 0, 0, 40)
    button.TextXAlignment = Enum.TextXAlignment.Center -- Always center text
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 4)
    if options.Callback then
        button.MouseButton1Click:Connect(options.Callback)
    end
    return button
end

local function createToggleSwitch(parent, text)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.BackgroundTransparency = 1
    frame.Size = UDim2.new(1, 0, 0, 30)

    createLabel(frame, text).Size = UDim2.new(0.7, 0, 1, 0)
    
    local switch = Instance.new("TextButton")
    switch.Parent = frame
    switch.Text = ""
    switch.Size = UDim2.new(0, 50, 0, 24)
    switch.Position = UDim2.new(1, -55, 0.5, 0)
    switch.AnchorPoint = Vector2.new(0, 0.5)
    switch.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    Instance.new("UICorner", switch).CornerRadius = UDim.new(0, 12)

    local knob = Instance.new("Frame")
    knob.Parent = switch
    knob.Size = UDim2.fromOffset(20, 20)
    knob.Position = UDim2.fromPixels(2, 2)
    knob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    knob.BorderSizePixel = 0
    Instance.new("UICorner", knob).CornerRadius = UDim.new(0, 10)
    
    local toggled = false
    switch.MouseButton1Click:Connect(function()
        toggled = not toggled
        local color = toggled and Color3.fromRGB(76, 175, 80) or Color3.fromRGB(80, 80, 80)
        local pos = toggled and UDim2.fromPixels(28, 2) or UDim2.fromPixels(2, 2)
        switch:TweenSizeAndPosition(switch.Size, switch.Position, "Out", "Quad", 0.2, true, function()
            switch.BackgroundColor3 = color
        end)
        knob:TweenPosition(pos, "Out", "Quad", 0.2, true)
    end)
    return frame
end

-- =============================================
-- Section 4: Item Spawner Window
-- =============================================
local itemSpawnerGui = Instance.new("ScreenGui")
itemSpawnerGui.Name = "MM2ItemSpawner"
itemSpawnerGui.Parent = playerGui
itemSpawnerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
itemSpawnerGui.Enabled = false

local spawnerFrame = Instance.new("Frame")
spawnerFrame.Parent = itemSpawnerGui
spawnerFrame.Name = "ItemSpawnerFrame"
spawnerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
spawnerFrame.BorderColor3 = Color3.fromRGB(0, 255, 127) -- Green border
spawnerFrame.BorderSizePixel = 2
spawnerFrame.Position = UDim2.fromScale(0.5, 0.5)
spawnerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
spawnerFrame.Size = UDim2.new(0, 350, 0, 220)

local spawnerTitle = createLabel(spawnerFrame, "Item Spawner")
spawnerTitle.Size = UDim2.new(1, 0, 0, 40)
spawnerTitle.TextXAlignment = Enum.TextXAlignment.Center
spawnerTitle.Position = UDim2.fromScale(0.5, 0)
spawnerTitle.AnchorPoint = Vector2.new(0.5, 0)
spawnerTitle.Font = Enum.Font.SourceSansBold
spawnerTitle.TextSize = 20

local itemDropdownButton = createInput(spawnerFrame, "Select an item...")
itemDropdownButton.Position = UDim2.new(0.5, 0, 0, 50)
itemDropdownButton.AnchorPoint = Vector2.new(0.5, 0)
itemDropdownButton.Size = UDim2.new(0.9, 0, 0, 35)

local dropdownScroll = Instance.new("ScrollingFrame")
dropdownScroll.Parent = spawnerFrame
dropdownScroll.Size = UDim2.new(0.9, 0, 0, 100)
dropdownScroll.Position = UDim2.new(0.5, 0, 0, 85)
dropdownScroll.AnchorPoint = Vector2.new(0.5, 0)
dropdownScroll.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
dropdownScroll.BorderSizePixel = 1
dropdownScroll.BorderColor3 = Color3.fromRGB(80, 80, 80)
dropdownScroll.Visible = false
Instance.new("UIListLayout", dropdownScroll).Padding = UDim.new(0, 2)

local itemList = { "Harvester", "Candy", "Sugar", "Icebreaker", "Elderwood Revolver", "Lightbringer", "Darkbringer", "Chroma Lightbringer", "Chroma Darkbringer", "Batwing", "Icewing", "Nik's Scythe", "America", "Blood", "Phaser", "Laser", "Shadow", "Splitter", "Deathshard", "Fang", "Saw", "Slasher", "Tides", "Heat", "Luger", "Pixel", "Shark", "Flames", "Chill", "Clockwork", "Spider", "Virtual" }
local selectedItem = ""

for _, itemName in ipairs(itemList) do
    local itemBtn = createButton(dropdownScroll, itemName, { TextSize = 14 })
    itemBtn.Size = UDim2.new(1, -10, 0, 25)
    itemBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    itemBtn.Callback = function()
        itemDropdownButton.Text = itemName
        selectedItem = itemName
        dropdownScroll.Visible = false
    end
end

itemDropdownButton.GotFocus:Connect(function() dropdownScroll.Visible = true end)
itemDropdownButton.FocusLost:Connect(function() task.wait(0.1); if not dropdownScroll:IsDescendantOf(userInputService:GetFocusedTextBox()) then dropdownScroll.Visible = false end end)

local closeSpawnerBtn = createButton(spawnerFrame, "Close Menu")
closeSpawnerBtn.Size = UDim2.new(0.4, -5, 0, 35)
closeSpawnerBtn.Position = UDim2.new(0.05, 0, 1, -40)
closeSpawnerBtn.AnchorPoint = Vector2.new(0, 0)
closeSpawnerBtn.Callback = function() itemSpawnerGui.Enabled = false end

local function runSpawnSequence()
    if selectedItem == "" then return end
    itemSpawnerGui.Enabled = false

    local progressGui = Instance.new("ScreenGui", playerGui)
    progressGui.Name = "MM2Progress"
    progressGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local progressFrame = Instance.new("Frame", progressGui)
    progressFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    progressFrame.Position = UDim2.fromScale(0.5, 0.8)
    progressFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    progressFrame.Size = UDim2.new(0, 350, 0, 80)
    
    local progressText = createLabel(progressFrame, "Spawning...")
    progressText.Position = UDim2.new(0.5, 0, 0, 15)
    progressText.AnchorPoint = Vector2.new(0.5, 0)
    progressText.TextXAlignment = Enum.TextXAlignment.Center
    
    local barBg = Instance.new("Frame", progressFrame)
    barBg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    barBg.Position = UDim2.new(0.5, 0, 0, 45)
    barBg.AnchorPoint = Vector2.new(0.5, 0)
    barBg.Size = UDim2.new(0.9, 0, 0, 15)
    
    local barFill = Instance.new("Frame", barBg)
    barFill.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
    barFill.Size = UDim2.new(0, 0, 1, 0)
    
    for i = 1, 100 do
        task.wait(0.1) -- 10 seconds total
        local percent = i
        progressText.Text = string.format("Spawning: %s (%d%%)", selectedItem, percent)
        barFill:TweenSize(UDim2.new(percent / 100, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
    end
    
    progressText.Text = "Spawned: " .. selectedItem
    local newItem = Instance.new("Tool", player.Backpack); newItem.Name = selectedItem
    Instance.new("Part", newItem).Name = "Handle"
    
    task.wait(1.5)
    progressGui:Destroy()
end

local spawnItemBtn = createButton(spawnerFrame, "Spawn")
spawnItemBtn.Size = UDim2.new(0.5, -5, 0, 35)
spawnItemBtn.Position = UDim2.new(0.95, 0, 1, -40)
spawnItemBtn.AnchorPoint = Vector2.new(1, 0)
spawnItemBtn.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
spawnItemBtn.Callback = runSpawnSequence


-- =============================================
-- Section 5: Tab Management & Creation
-- =============================================
local allTabs = {}

local function selectTab(tabToSelect)
    for _, t in pairs(allTabs) do
        t.button.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
        t.button.TextColor3 = Color3.fromRGB(200, 200, 200)
        t.frame.Visible = false
    end
    tabToSelect.button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    tabToSelect.button.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabToSelect.frame.Visible = true
end

local function createTab(name)
    local tabButton = Instance.new("TextButton")
    tabButton.Parent = tabsPanel
    tabButton.Text = "  " .. name
    tabButton.Font = Enum.Font.SourceSans
    tabButton.TextSize = 16
    tabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    tabButton.BorderSizePixel = 0
    tabButton.Size = UDim2.new(1, 0, 0, 35)
    tabButton.TextXAlignment = Enum.TextXAlignment.Left
    
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = name .. "Content"
    contentFrame.Parent = contentPanel
    contentFrame.BackgroundTransparency = 1
    contentFrame.BorderSizePixel = 0
    contentFrame.Size = UDim2.new(1, 0, 1, 0)
    contentFrame.Visible = false
    
    local padding = Instance.new("UIPadding", contentFrame)
    padding.PaddingTop = UDim.new(0, 15)
    padding.PaddingLeft = UDim.new(0, 15)
    padding.PaddingRight = UDim.new(0, 15)
    
    Instance.new("UIListLayout", contentFrame).Padding = UDim.new(0, 10)
    
    local tabData = { button = tabButton, frame = contentFrame }
    tabButton.MouseButton1Click:Connect(function() selectTab(tabData) end)
    
    return tabData
end

-- Create and populate tabs
local tradeScam = createTab("Trade Scam")
allTabs[1] = tradeScam
createLabel(tradeScam.frame, "Victim Name")
local victimInput = createInput(tradeScam.frame, "UsernameHere")
createButton(tradeScam.frame, "Freeze Trade", { TextSize = 18 }) -- Enlarged text
createButton(tradeScam.frame, "Force Accept")

local autoFarm = createTab("AutoFarm/ESP")
allTabs[2] = autoFarm
createToggleSwitch(autoFarm.frame, "Box ESP")
createToggleSwitch(autoFarm.frame, "Skeleton ESP")

local godlySpawner = createTab("Godly Spawner")
allTabs[3] = godlySpawner
createLabel(godlySpawner.frame, "Enter Item Name")
local godlyInput = createInput(godlySpawner.frame, "e.g. Harvester")
createButton(godlySpawner.frame, "SPAWN")

local dupeGen = createTab("Dupe/Generate")
allTabs[4] = dupeGen
createButton(dupeGen.frame, "Open Item Spawner", {
    Callback = function()
        itemSpawnerGui.Enabled = true
    end
})

-- =============================================
-- Section 6: Finalization
-- =============================================
-- Select the first tab by default
if allTabs[1] then
    selectTab(allTabs[1])
end

print("MM2 GUI: Complete rebuild loaded successfully.") 