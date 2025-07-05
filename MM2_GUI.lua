--[[
    Murder Mystery 2 GUI - Rebuilt from Diagnostic
    Version: 8 (Compatibility Fix)

    This version changes all UI element creation to set properties BEFORE parenting.
    This is a compatibility fix for executors that struggle to render elements on hidden frames.
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

local mainFrameCorner = Instance.new("UICorner")
mainFrameCorner.CornerRadius = UDim.new(0, 8)
mainFrameCorner.Parent = mainFrame

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
        dragging = true
        lastPosition = input.Position
        dragInput = input
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
local tabsLayout = Instance.new("UIListLayout")
tabsLayout.Padding = UDim.new(0, 5)
tabsLayout.Parent = tabsPanel

local contentPanel = Instance.new("Frame")
contentPanel.BackgroundTransparency = 1
contentPanel.Size = UDim2.new(1, -150, 1, -40)
contentPanel.Position = UDim2.new(0, 150, 0, 40)
contentPanel.Parent = mainFrame

-- =============================================
-- Section 4: UI Creation Helper Functions (Safe Parenting)
-- =============================================
local function makeLabel(parent, text)
    local label = Instance.new("TextLabel")
    label.Text = text
    label.Font = Enum.Font.SourceSansBold
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextSize = 16
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Parent = parent
    return label
end

local function makeInput(parent, placeholder)
    local textbox = Instance.new("TextBox")
    textbox.PlaceholderText = placeholder
    textbox.Font = Enum.Font.SourceSans
    textbox.TextSize = 14
    textbox.TextColor3 = Color3.fromRGB(240, 240, 240)
    textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    textbox.Size = UDim2.new(1, 0, 0, 35)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = textbox
    
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 10)
    padding.Parent = textbox
    
    textbox.Parent = parent
    return textbox
end

local function makeButton(parent, title, size, onClick)
    local button = Instance.new("TextButton")
    button.Text = title
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = size
    button.TextColor3 = Color3.fromRGB(230, 230, 230)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextXAlignment = Enum.TextXAlignment.Center
    button.Size = UDim2.new(1, 0, 0, 40)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = button
    
    if onClick then button.MouseButton1Click:Connect(onClick) end
    
    button.Parent = parent
    return button
end

local function makeToggle(parent, text)
    local frame = Instance.new("Frame")
    frame.BackgroundTransparency = 1
    frame.Size = UDim2.new(1, 0, 0, 30)

    local label = makeLabel(frame, text)
    label.Size = UDim2.new(0.7, 0, 1, 0)
    
    local switch = Instance.new("TextButton")
    switch.Text = ""
    switch.Size = UDim2.new(0, 50, 0, 24)
    switch.Position = UDim2.new(1, -55, 0.5, 0)
    switch.AnchorPoint = Vector2.new(0, 0.5)
    switch.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    switch.Parent = frame
    
    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(0, 12)
    switchCorner.Parent = switch

    local knob = Instance.new("Frame")
    knob.Size = UDim2.fromOffset(20, 20)
    knob.Position = UDim2.fromPixels(2, 2)
    knob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    knob.Parent = switch
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(0, 10)
    knobCorner.Parent = knob
    
    local toggled = false
    switch.MouseButton1Click:Connect(function()
        toggled = not toggled
        switch.BackgroundColor3 = toggled and Color3.fromRGB(76, 175, 80) or Color3.fromRGB(80, 80, 80)
        knob:TweenPosition(toggled and UDim2.fromPixels(28, 2) or UDim2.fromPixels(2, 2), "Out", "Quad", 0.2, true)
    end)
    
    frame.Parent = parent
end

-- =============================================
-- Section 5: Tab System (Simple & Reliable)
-- =============================================
local function makeContentFrame()
    local frame = Instance.new("Frame")
    frame.BackgroundTransparency = 1
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Visible = false
    frame.Parent = contentPanel
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop, padding.PaddingLeft, padding.PaddingRight = UDim.new(0, 15), UDim.new(0, 15), UDim.new(0, 15)
    padding.Parent = frame
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = frame
    
    return frame
end

local tradeScamFrame, autoFarmFrame, godlySpawnerFrame, dupeGenFrame = makeContentFrame(), makeContentFrame(), makeContentFrame(), makeContentFrame()
local allContentFrames = {tradeScamFrame, autoFarmFrame, godlySpawnerFrame, dupeGenFrame}
local allTabButtons = {}

local function switchTab(tabButton, frameToShow)
    for _, frame in ipairs(allContentFrames) do frame.Visible = false end
    for _, button in ipairs(allTabButtons) do
        button.BackgroundColor3, button.TextColor3 = Color3.fromRGB(24, 24, 24), Color3.fromRGB(200, 200, 200)
    end
    frameToShow.Visible = true
    tabButton.BackgroundColor3, tabButton.TextColor3 = Color3.fromRGB(35, 35, 35), Color3.fromRGB(255, 255, 255)
end

local function makeTabButton(text, contentFrame)
    local button = Instance.new("TextButton")
    button.Text = "  " .. text
    button.Font = Enum.Font.SourceSans
    button.TextSize = 16
    button.TextColor3 = Color3.fromRGB(200, 200, 200)
    button.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Size = UDim2.new(1, 0, 0, 35)
    button.Parent = tabsPanel
    
    button.MouseButton1Click:Connect(function() switchTab(button, contentFrame) end)
    table.insert(allTabButtons, button)
    return button
end

-- Create tab buttons
local tradeScamButton = makeTabButton("Trade Scam", tradeScamFrame)
makeTabButton("AutoFarm/ESP", autoFarmFrame)
makeTabButton("Godly Spawner", godlySpawnerFrame)
makeTabButton("Dupe/Generate", dupeGenFrame)

-- =============================================
-- Section 6: Populate Tabs
-- =============================================
makeLabel(tradeScamFrame, "Victim Name")
makeInput(tradeScamFrame, "UsernameHere")
makeButton(tradeScamFrame, "Freeze Trade", 18) -- Enlarged text
makeButton(tradeScamFrame, "Force Accept", 16)

makeToggle(autoFarmFrame, "Box ESP")
makeToggle(autoFarmFrame, "Skeleton ESP")

makeLabel(godlySpawnerFrame, "Enter Item Name")
makeInput(godlySpawnerFrame, "e.g. Harvester")
makeButton(godlySpawnerFrame, "SPAWN", 16)

local itemSpawnerGui -- Forward declare
makeButton(dupeGenFrame, "Open Item Spawner", 16, function()
    if itemSpawnerGui then itemSpawnerGui.Enabled = true end
end)

-- =============================================
-- Section 7: Item Spawner Window
-- =============================================
itemSpawnerGui = Instance.new("ScreenGui")
itemSpawnerGui.Name = "MM2_Item_Spawner_GUI"
itemSpawnerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
itemSpawnerGui.Enabled = false
itemSpawnerGui.Parent = playerGui

local spawnerFrame = Instance.new("Frame")
spawnerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
spawnerFrame.BorderColor3 = Color3.fromRGB(0, 255, 127)
spawnerFrame.BorderSizePixel = 2
spawnerFrame.Position = UDim2.fromScale(0.5, 0.5)
spawnerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
spawnerFrame.Size = UDim2.new(0, 350, 0, 220)
spawnerFrame.Parent = itemSpawnerGui

local spawnerTitle = makeLabel(spawnerFrame, "Item Spawner")
spawnerTitle.Size, spawnerTitle.TextXAlignment, spawnerTitle.TextSize = UDim2.new(1, 0, 0, 40), Enum.TextXAlignment.Center, 20

local itemDropdownButton = makeInput(spawnerFrame, "Select an item...")
itemDropdownButton.Position, itemDropdownButton.AnchorPoint, itemDropdownButton.Size = UDim2.new(0.5, 0, 0, 50), Vector2.new(0.5, 0), UDim2.new(0.9, 0, 0, 35)

local dropdownScroll = Instance.new("ScrollingFrame")
dropdownScroll.Size = UDim2.new(0.9, 0, 0, 100)
dropdownScroll.Position = UDim2.new(0.5, 0, 0, 85)
dropdownScroll.AnchorPoint = Vector2.new(0.5, 0)
dropdownScroll.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
dropdownScroll.BorderColor3 = Color3.fromRGB(80, 80, 80)
dropdownScroll.BorderSizePixel = 1
dropdownScroll.Visible = false
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
closeButton.Position = UDim2.new(0.05, 0, 1, -40)
closeButton.AnchorPoint = Vector2.new(0, 1)
closeButton.Size = UDim2.new(0.4, -5, 0, 35)

local function runSpawnSequence()
    if selectedItem == "" then return end
    itemSpawnerGui.Enabled = false
    
    local progressGui = Instance.new("ScreenGui")
    progressGui.Name = "MM2_Progress_GUI"
    progressGui.Parent = playerGui
    
    local pFrame = Instance.new("Frame")
    pFrame.Position = UDim2.fromScale(0.5, 0.8)
    pFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    pFrame.Size = UDim2.new(0, 350, 0, 80)
    pFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    pFrame.Parent = progressGui
    
    local pText = makeLabel(pFrame, "Spawning...")
    pText.Position = UDim2.new(0.5, 0, 0, 15)
    pText.AnchorPoint = Vector2.new(0.5, 0)
    pText.TextXAlignment = Enum.TextXAlignment.Center
    
    local barBg = Instance.new("Frame")
    barBg.Position = UDim2.new(0.5, 0, 0, 45)
    barBg.AnchorPoint = Vector2.new(0.5, 0)
    barBg.Size = UDim2.new(0.9, 0, 0, 15)
    barBg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    barBg.Parent = pFrame
    
    local barFill = Instance.new("Frame")
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
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
spawnBtn.Position = UDim2.new(0.95, 0, 1, -40)
spawnBtn.AnchorPoint = Vector2.new(1, 1)
spawnBtn.Size = UDim2.new(0.5, -5, 0, 35)

-- =============================================
-- Section 8: Finalization
-- =============================================
switchTab(tradeScamButton, tradeScamFrame)
print("MM2 GUI: Rebuilt script with compatibility fix loaded successfully.") 