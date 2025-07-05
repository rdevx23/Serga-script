-- MM2 GUI Script for Lua Executors
-- Created based on user requirements

local MM2GUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TopBar = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local TabsFrame = Instance.new("Frame")
local TradeScamTab = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local AutofarmTab = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local GoldyTab = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local DupeTab = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")

-- Tab Content Frames
local TradeScamFrame = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local UsernameBox = Instance.new("TextBox")
local UICorner_9 = Instance.new("UICorner")
local UsernameLabel = Instance.new("TextLabel")
local TradeScamButton = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local TradeScamStatus = Instance.new("TextLabel")

local AutofarmFrame = Instance.new("Frame")
local UICorner_11 = Instance.new("UICorner")
local AutofarmLabel = Instance.new("TextLabel")
local ESPButton = Instance.new("TextButton")
local UICorner_12 = Instance.new("UICorner")

local GoldyFrame = Instance.new("Frame")
local UICorner_13 = Instance.new("UICorner")
local GoldyItemBox = Instance.new("TextBox")
local UICorner_14 = Instance.new("UICorner")
local GoldyItemLabel = Instance.new("TextLabel")
local OpenCaseButton = Instance.new("TextButton")
local UICorner_15 = Instance.new("UICorner")
local CaseDisplay = Instance.new("Frame")
local UICorner_16 = Instance.new("UICorner")
local CaseImage = Instance.new("ImageLabel")
local UICorner_17 = Instance.new("UICorner")
local ItemImage = Instance.new("ImageLabel")
local UICorner_18 = Instance.new("UICorner")
local OpeningStatus = Instance.new("TextLabel")

local DupeFrame = Instance.new("Frame")
local UICorner_19 = Instance.new("UICorner")
local OpenItemSpawnerButton = Instance.new("TextButton")
local UICorner_20 = Instance.new("UICorner")
local DupeLabel = Instance.new("TextLabel")

-- Item Spawner Menu (initially hidden)
local ItemSpawnerFrame = Instance.new("Frame")
local UICorner_21 = Instance.new("UICorner")
local ItemSpawnerLabel = Instance.new("TextLabel")
local ItemNameBox = Instance.new("TextBox")
local UICorner_22 = Instance.new("UICorner")
local SpawnButton = Instance.new("TextButton")
local UICorner_23 = Instance.new("UICorner")
local CloseSpawnerButton = Instance.new("TextButton")
local UICorner_24 = Instance.new("UICorner")

-- Spawning Progress Frame (initially hidden)
local SpawningProgressFrame = Instance.new("Frame")
local UICorner_25 = Instance.new("UICorner")
local SpawningItemLabel = Instance.new("TextLabel")
local ProgressBar = Instance.new("Frame")
local UICorner_26 = Instance.new("UICorner")
local ProgressFill = Instance.new("Frame")
local UICorner_27 = Instance.new("UICorner")
local ProgressLabel = Instance.new("TextLabel")
local ItemPreview = Instance.new("ImageLabel")
local UICorner_28 = Instance.new("UICorner")

-- Set properties for GUI elements
MM2GUI.Name = "MM2GUI"
MM2GUI.Parent = game.CoreGui
MM2GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
MM2GUI.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = MM2GUI
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 10)

TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TopBar.Size = UDim2.new(1, 0, 0, 30)

UICorner_2.Parent = TopBar
UICorner_2.CornerRadius = UDim.new(0, 10)

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "MM2 Menu"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
CloseButton.Position = UDim2.new(1, -25, 0.5, -10)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14

UICorner_3.Parent = CloseButton
UICorner_3.CornerRadius = UDim.new(0, 5)

TabsFrame.Name = "TabsFrame"
TabsFrame.Parent = MainFrame
TabsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TabsFrame.BackgroundTransparency = 1
TabsFrame.Position = UDim2.new(0, 0, 0, 35)
TabsFrame.Size = UDim2.new(1, 0, 0, 30)

TradeScamTab.Name = "TradeScamTab"
TradeScamTab.Parent = TabsFrame
TradeScamTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TradeScamTab.Position = UDim2.new(0, 10, 0, 0)
TradeScamTab.Size = UDim2.new(0.25, -15, 1, -5)
TradeScamTab.Font = Enum.Font.GothamSemibold
TradeScamTab.Text = "Trade Scam"
TradeScamTab.TextColor3 = Color3.fromRGB(255, 255, 255)
TradeScamTab.TextSize = 14

UICorner_4.Parent = TradeScamTab
UICorner_4.CornerRadius = UDim.new(0, 5)

AutofarmTab.Name = "AutofarmTab"
AutofarmTab.Parent = TabsFrame
AutofarmTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
AutofarmTab.Position = UDim2.new(0.25, 0, 0, 0)
AutofarmTab.Size = UDim2.new(0.25, -10, 1, -5)
AutofarmTab.Font = Enum.Font.GothamSemibold
AutofarmTab.Text = "Autofarm/ESP"
AutofarmTab.TextColor3 = Color3.fromRGB(200, 200, 200)
AutofarmTab.TextSize = 14

UICorner_5.Parent = AutofarmTab
UICorner_5.CornerRadius = UDim.new(0, 5)

GoldyTab.Name = "GoldyTab"
GoldyTab.Parent = TabsFrame
GoldyTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
GoldyTab.Position = UDim2.new(0.5, 0, 0, 0)
GoldyTab.Size = UDim2.new(0.25, -10, 1, -5)
GoldyTab.Font = Enum.Font.GothamSemibold
GoldyTab.Text = "Goldy Spawner"
GoldyTab.TextColor3 = Color3.fromRGB(200, 200, 200)
GoldyTab.TextSize = 14

UICorner_6.Parent = GoldyTab
UICorner_6.CornerRadius = UDim.new(0, 5)

DupeTab.Name = "DupeTab"
DupeTab.Parent = TabsFrame
DupeTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
DupeTab.Position = UDim2.new(0.75, 5, 0, 0)
DupeTab.Size = UDim2.new(0.25, -15, 1, -5)
DupeTab.Font = Enum.Font.GothamSemibold
DupeTab.Text = "Dupe/Generate"
DupeTab.TextColor3 = Color3.fromRGB(200, 200, 200)
DupeTab.TextSize = 14

UICorner_7.Parent = DupeTab
UICorner_7.CornerRadius = UDim.new(0, 5)

-- Trade Scam Frame
TradeScamFrame.Name = "TradeScamFrame"
TradeScamFrame.Parent = MainFrame
TradeScamFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TradeScamFrame.Position = UDim2.new(0, 10, 0, 70)
TradeScamFrame.Size = UDim2.new(1, -20, 1, -80)
TradeScamFrame.Visible = true

UICorner_8.Parent = TradeScamFrame
UICorner_8.CornerRadius = UDim.new(0, 8)

UsernameLabel.Name = "UsernameLabel"
UsernameLabel.Parent = TradeScamFrame
UsernameLabel.BackgroundTransparency = 1
UsernameLabel.Position = UDim2.new(0, 20, 0, 20)
UsernameLabel.Size = UDim2.new(1, -40, 0, 20)
UsernameLabel.Font = Enum.Font.GothamSemibold
UsernameLabel.Text = "Enter Username:"
UsernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
UsernameLabel.TextSize = 14
UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left

UsernameBox.Name = "UsernameBox"
UsernameBox.Parent = TradeScamFrame
UsernameBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
UsernameBox.Position = UDim2.new(0, 20, 0, 50)
UsernameBox.Size = UDim2.new(1, -40, 0, 30)
UsernameBox.Font = Enum.Font.Gotham
UsernameBox.PlaceholderText = "Username here..."
UsernameBox.Text = ""
UsernameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UsernameBox.TextSize = 14

UICorner_9.Parent = UsernameBox
UICorner_9.CornerRadius = UDim.new(0, 6)

TradeScamButton.Name = "TradeScamButton"
TradeScamButton.Parent = TradeScamFrame
TradeScamButton.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
TradeScamButton.Position = UDim2.new(0, 20, 0, 100)
TradeScamButton.Size = UDim2.new(1, -40, 0, 35)
TradeScamButton.Font = Enum.Font.GothamBold
TradeScamButton.Text = "Start Trade Scam"
TradeScamButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TradeScamButton.TextSize = 16

UICorner_10.Parent = TradeScamButton
UICorner_10.CornerRadius = UDim.new(0, 6)

TradeScamStatus.Name = "TradeScamStatus"
TradeScamStatus.Parent = TradeScamFrame
TradeScamStatus.BackgroundTransparency = 1
TradeScamStatus.Position = UDim2.new(0, 20, 0, 150)
TradeScamStatus.Size = UDim2.new(1, -40, 0, 20)
TradeScamStatus.Font = Enum.Font.Gotham
TradeScamStatus.Text = "Status: Idle"
TradeScamStatus.TextColor3 = Color3.fromRGB(200, 200, 200)
TradeScamStatus.TextSize = 14
TradeScamStatus.TextXAlignment = Enum.TextXAlignment.Left

-- Autofarm/ESP Frame
AutofarmFrame.Name = "AutofarmFrame"
AutofarmFrame.Parent = MainFrame
AutofarmFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
AutofarmFrame.Position = UDim2.new(0, 10, 0, 70)
AutofarmFrame.Size = UDim2.new(1, -20, 1, -80)
AutofarmFrame.Visible = false

UICorner_11.Parent = AutofarmFrame
UICorner_11.CornerRadius = UDim.new(0, 8)

AutofarmLabel.Name = "AutofarmLabel"
AutofarmLabel.Parent = AutofarmFrame
AutofarmLabel.BackgroundTransparency = 1
AutofarmLabel.Position = UDim2.new(0, 0, 0, 30)
AutofarmLabel.Size = UDim2.new(1, 0, 0, 40)
AutofarmLabel.Font = Enum.Font.GothamBold
AutofarmLabel.Text = "Autofarm & ESP Features"
AutofarmLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutofarmLabel.TextSize = 18

ESPButton.Name = "ESPButton"
ESPButton.Parent = AutofarmFrame
ESPButton.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
ESPButton.Position = UDim2.new(0.5, -75, 0.5, -20)
ESPButton.Size = UDim2.new(0, 150, 0, 40)
ESPButton.Font = Enum.Font.GothamBold
ESPButton.Text = "Coming Soon..."
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.TextSize = 16

UICorner_12.Parent = ESPButton
UICorner_12.CornerRadius = UDim.new(0, 6)

-- Goldy Spawner Frame
GoldyFrame.Name = "GoldyFrame"
GoldyFrame.Parent = MainFrame
GoldyFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
GoldyFrame.Position = UDim2.new(0, 10, 0, 70)
GoldyFrame.Size = UDim2.new(1, -20, 1, -80)
GoldyFrame.Visible = false

UICorner_13.Parent = GoldyFrame
UICorner_13.CornerRadius = UDim.new(0, 8)

GoldyItemLabel.Name = "GoldyItemLabel"
GoldyItemLabel.Parent = GoldyFrame
GoldyItemLabel.BackgroundTransparency = 1
GoldyItemLabel.Position = UDim2.new(0, 20, 0, 20)
GoldyItemLabel.Size = UDim2.new(1, -40, 0, 20)
GoldyItemLabel.Font = Enum.Font.GothamSemibold
GoldyItemLabel.Text = "Select Goldy Item:"
GoldyItemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
GoldyItemLabel.TextSize = 14
GoldyItemLabel.TextXAlignment = Enum.TextXAlignment.Left

GoldyItemBox.Name = "GoldyItemBox"
GoldyItemBox.Parent = GoldyFrame
GoldyItemBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GoldyItemBox.Position = UDim2.new(0, 20, 0, 50)
GoldyItemBox.Size = UDim2.new(1, -40, 0, 30)
GoldyItemBox.Font = Enum.Font.Gotham
GoldyItemBox.PlaceholderText = "Item name here..."
GoldyItemBox.Text = ""
GoldyItemBox.TextColor3 = Color3.fromRGB(255, 255, 255)
GoldyItemBox.TextSize = 14

UICorner_14.Parent = GoldyItemBox
UICorner_14.CornerRadius = UDim.new(0, 6)

OpenCaseButton.Name = "OpenCaseButton"
OpenCaseButton.Parent = GoldyFrame
OpenCaseButton.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
OpenCaseButton.Position = UDim2.new(0, 20, 0, 100)
OpenCaseButton.Size = UDim2.new(1, -40, 0, 35)
OpenCaseButton.Font = Enum.Font.GothamBold
OpenCaseButton.Text = "Open Case"
OpenCaseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenCaseButton.TextSize = 16

UICorner_15.Parent = OpenCaseButton
UICorner_15.CornerRadius = UDim.new(0, 6)

CaseDisplay.Name = "CaseDisplay"
CaseDisplay.Parent = GoldyFrame
CaseDisplay.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CaseDisplay.Position = UDim2.new(0.5, -60, 0, 150)
CaseDisplay.Size = UDim2.new(0, 120, 0, 70)
CaseDisplay.Visible = false

UICorner_16.Parent = CaseDisplay
UICorner_16.CornerRadius = UDim.new(0, 6)

CaseImage.Name = "CaseImage"
CaseImage.Parent = CaseDisplay
CaseImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CaseImage.BackgroundTransparency = 1
CaseImage.Position = UDim2.new(0, 10, 0, 10)
CaseImage.Size = UDim2.new(1, -20, 1, -20)
CaseImage.Image = "rbxassetid://6934005990" -- Placeholder case image
CaseImage.ScaleType = Enum.ScaleType.Fit

UICorner_17.Parent = CaseImage
UICorner_17.CornerRadius = UDim.new(0, 4)

ItemImage.Name = "ItemImage"
ItemImage.Parent = GoldyFrame
ItemImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemImage.BackgroundTransparency = 1
ItemImage.Position = UDim2.new(0.5, -50, 0, 150)
ItemImage.Size = UDim2.new(0, 100, 0, 100)
ItemImage.Image = "rbxassetid://6934005990" -- Placeholder item image
ItemImage.ScaleType = Enum.ScaleType.Fit
ItemImage.Visible = false

UICorner_18.Parent = ItemImage
UICorner_18.CornerRadius = UDim.new(0, 4)

OpeningStatus.Name = "OpeningStatus"
OpeningStatus.Parent = GoldyFrame
OpeningStatus.BackgroundTransparency = 1
OpeningStatus.Position = UDim2.new(0, 0, 0, 150)
OpeningStatus.Size = UDim2.new(1, 0, 0, 20)
OpeningStatus.Font = Enum.Font.Gotham
OpeningStatus.Text = ""
OpeningStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
OpeningStatus.TextSize = 14
OpeningStatus.Visible = false

-- Dupe/Generate Frame
DupeFrame.Name = "DupeFrame"
DupeFrame.Parent = MainFrame
DupeFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
DupeFrame.Position = UDim2.new(0, 10, 0, 70)
DupeFrame.Size = UDim2.new(1, -20, 1, -80)
DupeFrame.Visible = false

UICorner_19.Parent = DupeFrame
UICorner_19.CornerRadius = UDim.new(0, 8)

DupeLabel.Name = "DupeLabel"
DupeLabel.Parent = DupeFrame
DupeLabel.BackgroundTransparency = 1
DupeLabel.Position = UDim2.new(0, 0, 0, 30)
DupeLabel.Size = UDim2.new(1, 0, 0, 40)
DupeLabel.Font = Enum.Font.GothamBold
DupeLabel.Text = "Item Duplication"
DupeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DupeLabel.TextSize = 18

OpenItemSpawnerButton.Name = "OpenItemSpawnerButton"
OpenItemSpawnerButton.Parent = DupeFrame
OpenItemSpawnerButton.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
OpenItemSpawnerButton.Position = UDim2.new(0.5, -75, 0.5, -20)
OpenItemSpawnerButton.Size = UDim2.new(0, 150, 0, 40)
OpenItemSpawnerButton.Font = Enum.Font.GothamBold
OpenItemSpawnerButton.Text = "Open Item Spawner"
OpenItemSpawnerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenItemSpawnerButton.TextSize = 16

UICorner_20.Parent = OpenItemSpawnerButton
UICorner_20.CornerRadius = UDim.new(0, 6)

-- Item Spawner Menu
ItemSpawnerFrame.Name = "ItemSpawnerFrame"
ItemSpawnerFrame.Parent = MM2GUI
ItemSpawnerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ItemSpawnerFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
ItemSpawnerFrame.Size = UDim2.new(0, 350, 0, 250)
ItemSpawnerFrame.Visible = false
ItemSpawnerFrame.ZIndex = 10

UICorner_21.Parent = ItemSpawnerFrame
UICorner_21.CornerRadius = UDim.new(0, 10)

ItemSpawnerLabel.Name = "ItemSpawnerLabel"
ItemSpawnerLabel.Parent = ItemSpawnerFrame
ItemSpawnerLabel.BackgroundTransparency = 1
ItemSpawnerLabel.Position = UDim2.new(0, 0, 0, 15)
ItemSpawnerLabel.Size = UDim2.new(1, 0, 0, 30)
ItemSpawnerLabel.Font = Enum.Font.GothamBold
ItemSpawnerLabel.Text = "Item Spawner"
ItemSpawnerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemSpawnerLabel.TextSize = 18
ItemSpawnerLabel.ZIndex = 10

ItemNameBox.Name = "ItemNameBox"
ItemNameBox.Parent = ItemSpawnerFrame
ItemNameBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ItemNameBox.Position = UDim2.new(0.5, -125, 0.5, -40)
ItemNameBox.Size = UDim2.new(0, 250, 0, 35)
ItemNameBox.Font = Enum.Font.Gotham
ItemNameBox.PlaceholderText = "Enter item name..."
ItemNameBox.Text = ""
ItemNameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemNameBox.TextSize = 14
ItemNameBox.ZIndex = 10

UICorner_22.Parent = ItemNameBox
UICorner_22.CornerRadius = UDim.new(0, 6)

SpawnButton.Name = "SpawnButton"
SpawnButton.Parent = ItemSpawnerFrame
SpawnButton.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
SpawnButton.Position = UDim2.new(0.5, -75, 0.5, 15)
SpawnButton.Size = UDim2.new(0, 150, 0, 40)
SpawnButton.Font = Enum.Font.GothamBold
SpawnButton.Text = "Spawn"
SpawnButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpawnButton.TextSize = 16
SpawnButton.ZIndex = 10

UICorner_23.Parent = SpawnButton
UICorner_23.CornerRadius = UDim.new(0, 6)

CloseSpawnerButton.Name = "CloseSpawnerButton"
CloseSpawnerButton.Parent = ItemSpawnerFrame
CloseSpawnerButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
CloseSpawnerButton.Position = UDim2.new(1, -30, 0, 10)
CloseSpawnerButton.Size = UDim2.new(0, 20, 0, 20)
CloseSpawnerButton.Font = Enum.Font.GothamBold
CloseSpawnerButton.Text = "X"
CloseSpawnerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseSpawnerButton.TextSize = 14
CloseSpawnerButton.ZIndex = 10

UICorner_24.Parent = CloseSpawnerButton
UICorner_24.CornerRadius = UDim.new(0, 5)

-- Spawning Progress Frame
SpawningProgressFrame.Name = "SpawningProgressFrame"
SpawningProgressFrame.Parent = MM2GUI
SpawningProgressFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpawningProgressFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
SpawningProgressFrame.Size = UDim2.new(0, 350, 0, 250)
SpawningProgressFrame.Visible = false
SpawningProgressFrame.ZIndex = 15

UICorner_25.Parent = SpawningProgressFrame
UICorner_25.CornerRadius = UDim.new(0, 10)

SpawningItemLabel.Name = "SpawningItemLabel"
SpawningItemLabel.Parent = SpawningProgressFrame
SpawningItemLabel.BackgroundTransparency = 1
SpawningItemLabel.Position = UDim2.new(0, 0, 0, 20)
SpawningItemLabel.Size = UDim2.new(1, 0, 0, 30)
SpawningItemLabel.Font = Enum.Font.GothamBold
SpawningItemLabel.Text = "Spawning: Gingerscope"
SpawningItemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpawningItemLabel.TextSize = 18
SpawningItemLabel.ZIndex = 15

ProgressBar.Name = "ProgressBar"
ProgressBar.Parent = SpawningProgressFrame
ProgressBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ProgressBar.Position = UDim2.new(0.5, -125, 0.5, 30)
ProgressBar.Size = UDim2.new(0, 250, 0, 20)
ProgressBar.ZIndex = 15

UICorner_26.Parent = ProgressBar
UICorner_26.CornerRadius = UDim.new(0, 10)

ProgressFill.Name = "ProgressFill"
ProgressFill.Parent = ProgressBar
ProgressFill.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.ZIndex = 16

UICorner_27.Parent = ProgressFill
UICorner_27.CornerRadius = UDim.new(0, 10)

ProgressLabel.Name = "ProgressLabel"
ProgressLabel.Parent = SpawningProgressFrame
ProgressLabel.BackgroundTransparency = 1
ProgressLabel.Position = UDim2.new(0, 0, 0.5, 60)
ProgressLabel.Size = UDim2.new(1, 0, 0, 20)
ProgressLabel.Font = Enum.Font.Gotham
ProgressLabel.Text = "0%"
ProgressLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ProgressLabel.TextSize = 16
ProgressLabel.ZIndex = 15

ItemPreview.Name = "ItemPreview"
ItemPreview.Parent = SpawningProgressFrame
ItemPreview.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ItemPreview.Position = UDim2.new(0.5, -50, 0, 60)
ItemPreview.Size = UDim2.new(0, 100, 0, 100)
ItemPreview.Image = "rbxassetid://6934005990" -- Placeholder image
ItemPreview.ZIndex = 15

UICorner_28.Parent = ItemPreview
UICorner_28.CornerRadius = UDim.new(0, 6)

-- Tab Switching Logic
local function hideAllFrames()
    TradeScamFrame.Visible = false
    AutofarmFrame.Visible = false
    GoldyFrame.Visible = false
    DupeFrame.Visible = false
    
    TradeScamTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    AutofarmTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    GoldyTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    DupeTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    
    TradeScamTab.TextColor3 = Color3.fromRGB(200, 200, 200)
    AutofarmTab.TextColor3 = Color3.fromRGB(200, 200, 200)
    GoldyTab.TextColor3 = Color3.fromRGB(200, 200, 200)
    DupeTab.TextColor3 = Color3.fromRGB(200, 200, 200)
end

-- Connect Tab Buttons
TradeScamTab.MouseButton1Click:Connect(function()
    hideAllFrames()
    TradeScamFrame.Visible = true
    TradeScamTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TradeScamTab.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

AutofarmTab.MouseButton1Click:Connect(function()
    hideAllFrames()
    AutofarmFrame.Visible = true
    AutofarmTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    AutofarmTab.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

GoldyTab.MouseButton1Click:Connect(function()
    hideAllFrames()
    GoldyFrame.Visible = true
    GoldyTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    GoldyTab.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

DupeTab.MouseButton1Click:Connect(function()
    hideAllFrames()
    DupeFrame.Visible = true
    DupeTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    DupeTab.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

-- Close Button
CloseButton.MouseButton1Click:Connect(function()
    MM2GUI:Destroy()
end)

-- Trade Scam Button
TradeScamButton.MouseButton1Click:Connect(function()
    local username = UsernameBox.Text
    if username == "" then
        TradeScamStatus.Text = "Status: Please enter a username"
        TradeScamStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    
    TradeScamStatus.Text = "Status: Sending trade to " .. username .. "..."
    TradeScamStatus.TextColor3 = Color3.fromRGB(100, 255, 100)
    
    -- This is just visual, no actual functionality
    wait(2)
    TradeScamStatus.Text = "Status: Trade accepted!"
end)

-- Open Case Button (Goldy Spawner)
OpenCaseButton.MouseButton1Click:Connect(function()
    local itemName = GoldyItemBox.Text
    if itemName == "" then
        OpeningStatus.Text = "Please enter an item name"
        OpeningStatus.Visible = true
        OpeningStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    
    -- Case opening animation
    CaseDisplay.Visible = true
    OpeningStatus.Text = "Opening case..."
    OpeningStatus.Visible = true
    OpeningStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    -- Simulate opening animation
    wait(1)
    CaseDisplay.Visible = false
    ItemImage.Visible = true
    OpeningStatus.Text = "You got: " .. itemName .. "!"
    OpeningStatus.TextColor3 = Color3.fromRGB(100, 255, 100)
end)

-- Open Item Spawner Button
OpenItemSpawnerButton.MouseButton1Click:Connect(function()
    ItemSpawnerFrame.Visible = true
end)

-- Close Spawner Button
CloseSpawnerButton.MouseButton1Click:Connect(function()
    ItemSpawnerFrame.Visible = false
end)

-- Spawn Button
SpawnButton.MouseButton1Click:Connect(function()
    local itemName = ItemNameBox.Text
    if itemName == "" then
        return
    end
    
    ItemSpawnerFrame.Visible = false
    SpawningProgressFrame.Visible = true
    SpawningItemLabel.Text = "Spawning: " .. itemName
    
    -- Simulate progress
    for i = 1, 100 do
        ProgressFill.Size = UDim2.new(i/100, 0, 1, 0)
        ProgressLabel.Text = i .. "%"
        wait(0.03) -- Adjust speed as needed
    end
    
    wait(0.5)
    SpawningProgressFrame.Visible = false
end)

-- Initialize with Trade Scam tab active
hideAllFrames()
TradeScamFrame.Visible = true
TradeScamTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TradeScamTab.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Return the GUI object so it can be referenced
return MM2GUI 