local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local Shadow = Instance.new("Frame")
local FeatureContainer = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local TradeScamButton = Instance.new("Frame")
local Button = Instance.new("TextButton")
local Icon = Instance.new("ImageLabel")
local Title_2 = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local SpawnItemsButton = Instance.new("Frame")
local Button_2 = Instance.new("TextButton")
local Icon_2 = Instance.new("ImageLabel")
local Title_3 = Instance.new("TextLabel")
local Status_2 = Instance.new("TextLabel")
local DupeItemsButton = Instance.new("Frame")
local Button_3 = Instance.new("TextButton")
local Icon_3 = Instance.new("ImageLabel")
local Title_4 = Instance.new("TextLabel")
local Status_3 = Instance.new("TextLabel")
local LevelBoostButton = Instance.new("Frame")
local Button_4 = Instance.new("TextButton")
local Icon_4 = Instance.new("ImageLabel")
local Title_5 = Instance.new("TextLabel")
local Status_4 = Instance.new("TextLabel")
local InvisibilityButton = Instance.new("Frame")
local Button_5 = Instance.new("TextButton")
local Icon_5 = Instance.new("ImageLabel")
local Title_6 = Instance.new("TextLabel")
local Status_5 = Instance.new("TextLabel")
local SpeedBoostButton = Instance.new("Frame")
local Button_6 = Instance.new("TextButton")
local Icon_6 = Instance.new("ImageLabel")
local Title_7 = Instance.new("TextLabel")
local Status_6 = Instance.new("TextLabel")
local FlyButton = Instance.new("Frame")
local Button_7 = Instance.new("TextButton")
local Icon_7 = Instance.new("ImageLabel")
local Title_8 = Instance.new("TextLabel")
local Status_7 = Instance.new("TextLabel")
local WallHackButton = Instance.new("Frame")
local Button_8 = Instance.new("TextButton")
local Icon_8 = Instance.new("ImageLabel")
local Title_9 = Instance.new("TextLabel")
local Status_8 = Instance.new("TextLabel")

-- Properties

ScreenGui.Name = "MM2HackMenu"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -225)
MainFrame.Size = UDim2.new(0, 400, 0, 450)

TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 40)

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Font = Enum.Font.GothamSemibold
Title.Text = "MM2 ULTIMATE GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22.000

CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -30, 0.5, -10)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14.000

Shadow.Name = "Shadow"
Shadow.Parent = MainFrame
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.700
Shadow.BorderSizePixel = 0
Shadow.Position = UDim2.new(0, 5, 0, 5)
Shadow.Size = UDim2.new(1, 0, 1, 0)
Shadow.ZIndex = -1

FeatureContainer.Name = "FeatureContainer"
FeatureContainer.Parent = MainFrame
FeatureContainer.Active = true
FeatureContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FeatureContainer.BackgroundTransparency = 1.000
FeatureContainer.BorderSizePixel = 0
FeatureContainer.Position = UDim2.new(0, 0, 0, 40)
FeatureContainer.Size = UDim2.new(1, 0, 1, -40)
FeatureContainer.CanvasSize = UDim2.new(0, 0, 0, 500)
FeatureContainer.ScrollBarThickness = 6

UIListLayout.Parent = FeatureContainer
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 12)

UIPadding.Parent = FeatureContainer
UIPadding.PaddingTop = UDim.new(0, 15)

-- Create Feature Buttons with consistent styling

-- Trade Scam Button
TradeScamButton.Name = "TradeScamButton"
TradeScamButton.Parent = FeatureContainer
TradeScamButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TradeScamButton.BorderSizePixel = 0
TradeScamButton.Size = UDim2.new(0.9, 0, 0, 50)

Button.Name = "Button"
Button.Parent = TradeScamButton
Button.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.9, -40, 0.5, -15)
Button.Size = UDim2.new(0, 30, 0, 30)
Button.Font = Enum.Font.GothamSemibold
Button.Text = "OFF"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextSize = 14.000

Icon.Name = "Icon"
Icon.Parent = TradeScamButton
Icon.BackgroundTransparency = 1.000
Icon.Position = UDim2.new(0, 10, 0.5, -15)
Icon.Size = UDim2.new(0, 30, 0, 30)
Icon.Image = "rbxassetid://7072717958" -- Trade icon
Icon.ImageColor3 = Color3.fromRGB(255, 70, 70)

Title_2.Name = "Title"
Title_2.Parent = TradeScamButton
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.Position = UDim2.new(0, 50, 0, 5)
Title_2.Size = UDim2.new(0, 200, 0, 20)
Title_2.Font = Enum.Font.GothamSemibold
Title_2.Text = "Trade Scam"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 16.000
Title_2.TextXAlignment = Enum.TextXAlignment.Left

Status.Name = "Status"
Status.Parent = TradeScamButton
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1.000
Status.Position = UDim2.new(0, 50, 0, 25)
Status.Size = UDim2.new(0, 200, 0, 20)
Status.Font = Enum.Font.Gotham
Status.Text = "Auto accept valuable trades"
Status.TextColor3 = Color3.fromRGB(180, 180, 180)
Status.TextSize = 14.000
Status.TextXAlignment = Enum.TextXAlignment.Left

-- Spawn Items Button
SpawnItemsButton.Name = "SpawnItemsButton"
SpawnItemsButton.Parent = FeatureContainer
SpawnItemsButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpawnItemsButton.BorderSizePixel = 0
SpawnItemsButton.Size = UDim2.new(0.9, 0, 0, 50)

Button_2.Name = "Button"
Button_2.Parent = SpawnItemsButton
Button_2.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
Button_2.BorderSizePixel = 0
Button_2.Position = UDim2.new(0.9, -40, 0.5, -15)
Button_2.Size = UDim2.new(0, 30, 0, 30)
Button_2.Font = Enum.Font.GothamSemibold
Button_2.Text = "OFF"
Button_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Button_2.TextSize = 14.000

Icon_2.Name = "Icon"
Icon_2.Parent = SpawnItemsButton
Icon_2.BackgroundTransparency = 1.000
Icon_2.Position = UDim2.new(0, 10, 0.5, -15)
Icon_2.Size = UDim2.new(0, 30, 0, 30)
Icon_2.Image = "rbxassetid://6031302931" -- Item icon
Icon_2.ImageColor3 = Color3.fromRGB(255, 70, 70)

Title_3.Name = "Title"
Title_3.Parent = SpawnItemsButton
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.Position = UDim2.new(0, 50, 0, 5)
Title_3.Size = UDim2.new(0, 200, 0, 20)
Title_3.Font = Enum.Font.GothamSemibold
Title_3.Text = "Spawn Items"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 16.000
Title_3.TextXAlignment = Enum.TextXAlignment.Left

Status_2.Name = "Status"
Status_2.Parent = SpawnItemsButton
Status_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status_2.BackgroundTransparency = 1.000
Status_2.Position = UDim2.new(0, 50, 0, 25)
Status_2.Size = UDim2.new(0, 200, 0, 20)
Status_2.Font = Enum.Font.Gotham
Status_2.Text = "Spawn rare knives and guns"
Status_2.TextColor3 = Color3.fromRGB(180, 180, 180)
Status_2.TextSize = 14.000
Status_2.TextXAlignment = Enum.TextXAlignment.Left

-- Dupe Items Button
DupeItemsButton.Name = "DupeItemsButton"
DupeItemsButton.Parent = FeatureContainer
DupeItemsButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
DupeItemsButton.BorderSizePixel = 0
DupeItemsButton.Size = UDim2.new(0.9, 0, 0, 50)

Button_3.Name = "Button"
Button_3.Parent = DupeItemsButton
Button_3.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
Button_3.BorderSizePixel = 0
Button_3.Position = UDim2.new(0.9, -40, 0.5, -15)
Button_3.Size = UDim2.new(0, 30, 0, 30)
Button_3.Font = Enum.Font.GothamSemibold
Button_3.Text = "OFF"
Button_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Button_3.TextSize = 14.000

Icon_3.Name = "Icon"
Icon_3.Parent = DupeItemsButton
Icon_3.BackgroundTransparency = 1.000
Icon_3.Position = UDim2.new(0, 10, 0.5, -15)
Icon_3.Size = UDim2.new(0, 30, 0, 30)
Icon_3.Image = "rbxassetid://6035078892" -- Copy icon
Icon_3.ImageColor3 = Color3.fromRGB(255, 70, 70)

Title_4.Name = "Title"
Title_4.Parent = DupeItemsButton
Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_4.BackgroundTransparency = 1.000
Title_4.Position = UDim2.new(0, 50, 0, 5)
Title_4.Size = UDim2.new(0, 200, 0, 20)
Title_4.Font = Enum.Font.GothamSemibold
Title_4.Text = "Dupe Items"
Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_4.TextSize = 16.000
Title_4.TextXAlignment = Enum.TextXAlignment.Left

Status_3.Name = "Status"
Status_3.Parent = DupeItemsButton
Status_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status_3.BackgroundTransparency = 1.000
Status_3.Position = UDim2.new(0, 50, 0, 25)
Status_3.Size = UDim2.new(0, 200, 0, 20)
Status_3.Font = Enum.Font.Gotham
Status_3.Text = "Duplicate selected inventory items"
Status_3.TextColor3 = Color3.fromRGB(180, 180, 180)
Status_3.TextSize = 14.000
Status_3.TextXAlignment = Enum.TextXAlignment.Left

-- Level Boost Button
LevelBoostButton.Name = "LevelBoostButton"
LevelBoostButton.Parent = FeatureContainer
LevelBoostButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
LevelBoostButton.BorderSizePixel = 0
LevelBoostButton.Size = UDim2.new(0.9, 0, 0, 50)

Button_4.Name = "Button"
Button_4.Parent = LevelBoostButton
Button_4.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
Button_4.BorderSizePixel = 0
Button_4.Position = UDim2.new(0.9, -40, 0.5, -15)
Button_4.Size = UDim2.new(0, 30, 0, 30)
Button_4.Font = Enum.Font.GothamSemibold
Button_4.Text = "OFF"
Button_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Button_4.TextSize = 14.000

Icon_4.Name = "Icon"
Icon_4.Parent = LevelBoostButton
Icon_4.BackgroundTransparency = 1.000
Icon_4.Position = UDim2.new(0, 10, 0.5, -15)
Icon_4.Size = UDim2.new(0, 30, 0, 30)
Icon_4.Image = "rbxassetid://6026568215" -- Level up icon
Icon_4.ImageColor3 = Color3.fromRGB(255, 70, 70)

Title_5.Name = "Title"
Title_5.Parent = LevelBoostButton
Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_5.BackgroundTransparency = 1.000
Title_5.Position = UDim2.new(0, 50, 0, 5)
Title_5.Size = UDim2.new(0, 200, 0, 20)
Title_5.Font = Enum.Font.GothamSemibold
Title_5.Text = "Level Boost"
Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_5.TextSize = 16.000
Title_5.TextXAlignment = Enum.TextXAlignment.Left

Status_4.Name = "Status"
Status_4.Parent = LevelBoostButton
Status_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status_4.BackgroundTransparency = 1.000
Status_4.Position = UDim2.new(0, 50, 0, 25)
Status_4.Size = UDim2.new(0, 200, 0, 20)
Status_4.Font = Enum.Font.Gotham
Status_4.Text = "Auto XP farming"
Status_4.TextColor3 = Color3.fromRGB(180, 180, 180)
Status_4.TextSize = 14.000
Status_4.TextXAlignment = Enum.TextXAlignment.Left

-- Invisibility Button
InvisibilityButton.Name = "InvisibilityButton"
InvisibilityButton.Parent = FeatureContainer
InvisibilityButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
InvisibilityButton.BorderSizePixel = 0
InvisibilityButton.Size = UDim2.new(0.9, 0, 0, 50)

Button_5.Name = "Button"
Button_5.Parent = InvisibilityButton
Button_5.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
Button_5.BorderSizePixel = 0
Button_5.Position = UDim2.new(0.9, -40, 0.5, -15)
Button_5.Size = UDim2.new(0, 30, 0, 30)
Button_5.Font = Enum.Font.GothamSemibold
Button_5.Text = "OFF"
Button_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Button_5.TextSize = 14.000

Icon_5.Name = "Icon"
Icon_5.Parent = InvisibilityButton
Icon_5.BackgroundTransparency = 1.000
Icon_5.Position = UDim2.new(0, 10, 0.5, -15)
Icon_5.Size = UDim2.new(0, 30, 0, 30)
Icon_5.Image = "rbxassetid://6034230648" -- Ghost icon
Icon_5.ImageColor3 = Color3.fromRGB(255, 70, 70)

Title_6.Name = "Title"
Title_6.Parent = InvisibilityButton
Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_6.BackgroundTransparency = 1.000
Title_6.Position = UDim2.new(0, 50, 0, 5)
Title_6.Size = UDim2.new(0, 200, 0, 20)
Title_6.Font = Enum.Font.GothamSemibold
Title_6.Text = "Invisibility"
Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_6.TextSize = 16.000
Title_6.TextXAlignment = Enum.TextXAlignment.Left

Status_5.Name = "Status"
Status_5.Parent = InvisibilityButton
Status_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status_5.BackgroundTransparency = 1.000
Status_5.Position = UDim2.new(0, 50, 0, 25)
Status_5.Size = UDim2.new(0, 200, 0, 20)
Status_5.Font = Enum.Font.Gotham
Status_5.Text = "Become invisible to other players"
Status_5.TextColor3 = Color3.fromRGB(180, 180, 180)
Status_5.TextSize = 14.000
Status_5.TextXAlignment = Enum.TextXAlignment.Left

-- Speed Boost Button
SpeedBoostButton.Name = "SpeedBoostButton"
SpeedBoostButton.Parent = FeatureContainer
SpeedBoostButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedBoostButton.BorderSizePixel = 0
SpeedBoostButton.Size = UDim2.new(0.9, 0, 0, 50)

Button_6.Name = "Button"
Button_6.Parent = SpeedBoostButton
Button_6.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
Button_6.BorderSizePixel = 0
Button_6.Position = UDim2.new(0.9, -40, 0.5, -15)
Button_6.Size = UDim2.new(0, 30, 0, 30)
Button_6.Font = Enum.Font.GothamSemibold
Button_6.Text = "OFF"
Button_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Button_6.TextSize = 14.000

Icon_6.Name = "Icon"
Icon_6.Parent = SpeedBoostButton
Icon_6.BackgroundTransparency = 1.000
Icon_6.Position = UDim2.new(0, 10, 0.5, -15)
Icon_6.Size = UDim2.new(0, 30, 0, 30)
Icon_6.Image = "rbxassetid://6026568250" -- Speed icon
Icon_6.ImageColor3 = Color3.fromRGB(255, 70, 70)

Title_7.Name = "Title"
Title_7.Parent = SpeedBoostButton
Title_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_7.BackgroundTransparency = 1.000
Title_7.Position = UDim2.new(0, 50, 0, 5)
Title_7.Size = UDim2.new(0, 200, 0, 20)
Title_7.Font = Enum.Font.GothamSemibold
Title_7.Text = "Speed Boost"
Title_7.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_7.TextSize = 16.000
Title_7.TextXAlignment = Enum.TextXAlignment.Left

Status_6.Name = "Status"
Status_6.Parent = SpeedBoostButton
Status_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status_6.BackgroundTransparency = 1.000
Status_6.Position = UDim2.new(0, 50, 0, 25)
Status_6.Size = UDim2.new(0, 200, 0, 20)
Status_6.Font = Enum.Font.Gotham
Status_6.Text = "Increase movement speed by 3x"
Status_6.TextColor3 = Color3.fromRGB(180, 180, 180)
Status_6.TextSize = 14.000
Status_6.TextXAlignment = Enum.TextXAlignment.Left

-- Fly Button
FlyButton.Name = "FlyButton"
FlyButton.Parent = FeatureContainer
FlyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FlyButton.BorderSizePixel = 0
FlyButton.Size = UDim2.new(0.9, 0, 0, 50)

Button_7.Name = "Button"
Button_7.Parent = FlyButton
Button_7.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
Button_7.BorderSizePixel = 0
Button_7.Position = UDim2.new(0.9, -40, 0.5, -15)
Button_7.Size = UDim2.new(0, 30, 0, 30)
Button_7.Font = Enum.Font.GothamSemibold
Button_7.Text = "OFF"
Button_7.TextColor3 = Color3.fromRGB(255, 255, 255)
Button_7.TextSize = 14.000

Icon_7.Name = "Icon"
Icon_7.Parent = FlyButton
Icon_7.BackgroundTransparency = 1.000
Icon_7.Position = UDim2.new(0, 10, 0.5, -15)
Icon_7.Size = UDim2.new(0, 30, 0, 30)
Icon_7.Image = "rbxassetid://6031302931" -- Fly icon
Icon_7.ImageColor3 = Color3.fromRGB(255, 70, 70)

Title_8.Name = "Title"
Title_8.Parent = FlyButton
Title_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_8.BackgroundTransparency = 1.000
Title_8.Position = UDim2.new(0, 50, 0, 5)
Title_8.Size = UDim2.new(0, 200, 0, 20)
Title_8.Font = Enum.Font.GothamSemibold
Title_8.Text = "Fly"
Title_8.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_8.TextSize = 16.000
Title_8.TextXAlignment = Enum.TextXAlignment.Left

Status_7.Name = "Status"
Status_7.Parent = FlyButton
Status_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status_7.BackgroundTransparency = 1.000
Status_7.Position = UDim2.new(0, 50, 0, 25)
Status_7.Size = UDim2.new(0, 200, 0, 20)
Status_7.Font = Enum.Font.Gotham
Status_7.Text = "Fly freely around the map"
Status_7.TextColor3 = Color3.fromRGB(180, 180, 180)
Status_7.TextSize = 14.000
Status_7.TextXAlignment = Enum.TextXAlignment.Left

-- Wall Hack Button
WallHackButton.Name = "WallHackButton"
WallHackButton.Parent = FeatureContainer
WallHackButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
WallHackButton.BorderSizePixel = 0
WallHackButton.Size = UDim2.new(0.9, 0, 0, 50)

Button_8.Name = "Button"
Button_8.Parent = WallHackButton
Button_8.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
Button_8.BorderSizePixel = 0
Button_8.Position = UDim2.new(0.9, -40, 0.5, -15)
Button_8.Size = UDim2.new(0, 30, 0, 30)
Button_8.Font = Enum.Font.GothamSemibold
Button_8.Text = "OFF"
Button_8.TextColor3 = Color3.fromRGB(255, 255, 255)
Button_8.TextSize = 14.000

Icon_8.Name = "Icon"
Icon_8.Parent = WallHackButton
Icon_8.BackgroundTransparency = 1.000
Icon_8.Position = UDim2.new(0, 10, 0.5, -15)
Icon_8.Size = UDim2.new(0, 30, 0, 30)
Icon_8.Image = "rbxassetid://6023565901" -- Wall Hack icon
Icon_8.ImageColor3 = Color3.fromRGB(255, 70, 70)

Title_9.Name = "Title"
Title_9.Parent = WallHackButton
Title_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_9.BackgroundTransparency = 1.000
Title_9.Position = UDim2.new(0, 50, 0, 5)
Title_9.Size = UDim2.new(0, 200, 0, 20)
Title_9.Font = Enum.Font.GothamSemibold
Title_9.Text = "Wall Hack"
Title_9.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_9.TextSize = 16.000
Title_9.TextXAlignment = Enum.TextXAlignment.Left

Status_8.Name = "Status"
Status_8.Parent = WallHackButton
Status_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status_8.BackgroundTransparency = 1.000
Status_8.Position = UDim2.new(0, 50, 0, 25)
Status_8.Size = UDim2.new(0, 200, 0, 20)
Status_8.Font = Enum.Font.Gotham
Status_8.Text = "See players through walls"
Status_8.TextColor3 = Color3.fromRGB(180, 180, 180)
Status_8.TextSize = 14.000
Status_8.TextXAlignment = Enum.TextXAlignment.Left

-- Add functionality for visual effect (no actual hacking)

-- Make GUI draggable
local UserInputService = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Button toggle functionality (visual only)
local function setupToggle(button)
    button.MouseButton1Click:Connect(function()
        if button.Text == "OFF" then
            button.Text = "ON"
            button.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
            local icon = button.Parent:FindFirstChild("Icon")
            if icon then
                icon.ImageColor3 = Color3.fromRGB(0, 255, 100)
            end
        else
            button.Text = "OFF"
            button.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
            local icon = button.Parent:FindFirstChild("Icon")
            if icon then
                icon.ImageColor3 = Color3.fromRGB(255, 70, 70)
            end
        end
    end)
end

setupToggle(Button)
setupToggle(Button_2)
setupToggle(Button_3)
setupToggle(Button_4)
setupToggle(Button_5)
setupToggle(Button_6)
setupToggle(Button_7)
setupToggle(Button_8)

-- Notification when starting script
local function createNotification()
    local NotifFrame = Instance.new("Frame")
    local NotifText = Instance.new("TextLabel")
    
    NotifFrame.Name = "NotifFrame"
    NotifFrame.Parent = ScreenGui
    NotifFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Position = UDim2.new(0, -300, 0.85, 0)
    NotifFrame.Size = UDim2.new(0, 250, 0, 60)
    
    NotifText.Name = "NotifText"
    NotifText.Parent = NotifFrame
    NotifText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifText.BackgroundTransparency = 1.000
    NotifText.Size = UDim2.new(1, 0, 1, 0)
    NotifText.Font = Enum.Font.GothamSemibold
    NotifText.Text = "MM2 Ultimate GUI Loaded!"
    NotifText.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifText.TextSize = 18.000
    
    -- Animate notification
    NotifFrame:TweenPosition(UDim2.new(0, 20, 0.85, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 1)
    
    wait(3)
    
    NotifFrame:TweenPosition(UDim2.new(0, -300, 0.85, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quint, 1, false, function()
        NotifFrame:Destroy()
    end)
end

createNotification() 