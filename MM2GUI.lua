-- MM2 Ultimate GUI
-- Create a visual GUI for MM2 with hack-like features

-- Create the main interface
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local FeatureList = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- Set up screen GUI
ScreenGui.Name = "MM2UltimateGUI"
ScreenGui.Parent = game:GetService("CoreGui") 
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Main frame styling
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
MainFrame.Size = UDim2.new(0, 350, 0, 400)

-- Top bar styling
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 35)

-- Title styling
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "MM2 ULTIMATE GUI"
Title.TextColor3 = Color3.fromRGB(255, 50, 50)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Close button styling
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -25, 0.5, -10)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14

-- Feature list styling
FeatureList.Name = "FeatureList"
FeatureList.Parent = MainFrame
FeatureList.BackgroundTransparency = 1
FeatureList.Position = UDim2.new(0, 0, 0, 40)
FeatureList.Size = UDim2.new(1, 0, 1, -45)
FeatureList.CanvasSize = UDim2.new(0, 0, 0, 470)
FeatureList.ScrollBarThickness = 4

-- List layout
UIListLayout.Parent = FeatureList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Function to create an input field for spawn/dupe items
local function createInputField(parent, placeholder)
    local InputFrame = Instance.new("Frame")
    local InputField = Instance.new("TextBox")
    local SubmitButton = Instance.new("TextButton")
    
    InputFrame.Name = "InputFrame"
    InputFrame.Parent = parent
    InputFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    InputFrame.BorderSizePixel = 0
    InputFrame.Position = UDim2.new(0, 0, 1, 5)
    InputFrame.Size = UDim2.new(1, 0, 0, 40)
    InputFrame.Visible = false
    
    InputField.Name = "InputField"
    InputField.Parent = InputFrame
    InputField.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    InputField.BorderSizePixel = 0
    InputField.Position = UDim2.new(0, 10, 0.5, -15)
    InputField.Size = UDim2.new(0.7, -15, 0, 30)
    InputField.Font = Enum.Font.Gotham
    InputField.PlaceholderText = placeholder
    InputField.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    InputField.Text = ""
    InputField.TextColor3 = Color3.fromRGB(255, 255, 255)
    InputField.TextSize = 14
    
    SubmitButton.Name = "SubmitButton"
    SubmitButton.Parent = InputFrame
    SubmitButton.BackgroundColor3 = Color3.fromRGB(50, 120, 255)
    SubmitButton.BorderSizePixel = 0
    SubmitButton.Position = UDim2.new(0.7, 5, 0.5, -15)
    SubmitButton.Size = UDim2.new(0.3, -15, 0, 30)
    SubmitButton.Font = Enum.Font.GothamSemibold
    SubmitButton.Text = "Submit"
    SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitButton.TextSize = 14
    
    -- Submit button functionality
    SubmitButton.MouseButton1Click:Connect(function()
        local itemName = InputField.Text
        
        if itemName ~= "" then
            -- Show notification with the item name
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = parent.Name:gsub("Button", "") .. " Success",
                Text = "Processing: " .. itemName,
                Duration = 3
            })
            
            -- Clear the input field
            InputField.Text = ""
        else
            -- Show error notification
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Error",
                Text = "Please enter an item name",
                Duration = 3
            })
        end
    end)
    
    return InputFrame
end

-- Function to create a level input field
local function createLevelInput(parent)
    local InputFrame = Instance.new("Frame")
    local InputField = Instance.new("TextBox")
    local SetButton = Instance.new("TextButton")
    
    InputFrame.Name = "LevelInputFrame"
    InputFrame.Parent = parent
    InputFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    InputFrame.BorderSizePixel = 0
    InputFrame.Position = UDim2.new(0, 0, 1, 5)
    InputFrame.Size = UDim2.new(1, 0, 0, 40)
    InputFrame.Visible = false
    
    InputField.Name = "LevelInput"
    InputField.Parent = InputFrame
    InputField.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    InputField.BorderSizePixel = 0
    InputField.Position = UDim2.new(0, 10, 0.5, -15)
    InputField.Size = UDim2.new(0.7, -15, 0, 30)
    InputField.Font = Enum.Font.Gotham
    InputField.PlaceholderText = "Enter level (1-100)"
    InputField.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    InputField.Text = ""
    InputField.TextColor3 = Color3.fromRGB(255, 255, 255)
    InputField.TextSize = 14
    
    SetButton.Name = "SetButton"
    SetButton.Parent = InputFrame
    SetButton.BackgroundColor3 = Color3.fromRGB(50, 120, 255)
    SetButton.BorderSizePixel = 0
    SetButton.Position = UDim2.new(0.7, 5, 0.5, -15)
    SetButton.Size = UDim2.new(0.3, -15, 0, 30)
    SetButton.Font = Enum.Font.GothamSemibold
    SetButton.Text = "Set"
    SetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SetButton.TextSize = 14
    
    -- Set button functionality
    SetButton.MouseButton1Click:Connect(function()
        local level = tonumber(InputField.Text)
        
        if level and level >= 1 and level <= 100 then
            -- Show notification with the level
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Level Boost",
                Text = "Setting level to: " .. level,
                Duration = 3
            })
            
            -- Clear the input field
            InputField.Text = ""
        else
            -- Show error notification
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Error",
                Text = "Please enter a valid level (1-100)",
                Duration = 3
            })
        end
    end)
    
    return InputFrame
end

-- Function to create a speed slider
local function createSpeedSlider(parent)
    local SliderFrame = Instance.new("Frame")
    local SliderBackground = Instance.new("Frame")
    local SliderFill = Instance.new("Frame")
    local SliderButton = Instance.new("TextButton")
    local SpeedValue = Instance.new("TextLabel")
    local SetButton = Instance.new("TextButton")
    
    SliderFrame.Name = "SpeedSliderFrame"
    SliderFrame.Parent = parent
    SliderFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Position = UDim2.new(0, 0, 1, 5)
    SliderFrame.Size = UDim2.new(1, 0, 0, 60)
    SliderFrame.Visible = false
    
    SliderBackground.Name = "SliderBackground"
    SliderBackground.Parent = SliderFrame
    SliderBackground.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    SliderBackground.BorderSizePixel = 0
    SliderBackground.Position = UDim2.new(0.05, 0, 0.3, -5)
    SliderBackground.Size = UDim2.new(0.7, 0, 0, 10)
    
    SliderFill.Name = "SliderFill"
    SliderFill.Parent = SliderBackground
    SliderFill.BackgroundColor3 = Color3.fromRGB(50, 120, 255)
    SliderFill.BorderSizePixel = 0
    SliderFill.Size = UDim2.new(0.1, 0, 1, 0)
    
    SliderButton.Name = "SliderButton"
    SliderButton.Parent = SliderBackground
    SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderButton.BorderSizePixel = 0
    SliderButton.Position = UDim2.new(0.1, -5, 0.5, -10)
    SliderButton.Size = UDim2.new(0, 10, 0, 20)
    SliderButton.Text = ""
    SliderButton.ZIndex = 2
    
    SpeedValue.Name = "SpeedValue"
    SpeedValue.Parent = SliderFrame
    SpeedValue.BackgroundTransparency = 1
    SpeedValue.Position = UDim2.new(0.1, 0, 0.6, 0)
    SpeedValue.Size = UDim2.new(0.3, 0, 0, 20)
    SpeedValue.Font = Enum.Font.GothamSemibold
    SpeedValue.Text = "x1.0"
    SpeedValue.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedValue.TextSize = 14
    SpeedValue.TextXAlignment = Enum.TextXAlignment.Center
    
    SetButton.Name = "SetButton"
    SetButton.Parent = SliderFrame
    SetButton.BackgroundColor3 = Color3.fromRGB(50, 120, 255)
    SetButton.BorderSizePixel = 0
    SetButton.Position = UDim2.new(0.75, 10, 0.3, -15)
    SetButton.Size = UDim2.new(0.2, -10, 0, 30)
    SetButton.Font = Enum.Font.GothamSemibold
    SetButton.Text = "Set"
    SetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SetButton.TextSize = 14
    
    -- Create labels for the slider
    local MinLabel = Instance.new("TextLabel")
    local MaxLabel = Instance.new("TextLabel")
    
    MinLabel.Name = "MinLabel"
    MinLabel.Parent = SliderFrame
    MinLabel.BackgroundTransparency = 1
    MinLabel.Position = UDim2.new(0.05, -10, 0.3, -25)
    MinLabel.Size = UDim2.new(0, 20, 0, 20)
    MinLabel.Font = Enum.Font.Gotham
    MinLabel.Text = "x1"
    MinLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    MinLabel.TextSize = 12
    
    MaxLabel.Name = "MaxLabel"
    MaxLabel.Parent = SliderFrame
    MaxLabel.BackgroundTransparency = 1
    MaxLabel.Position = UDim2.new(0.75, -10, 0.3, -25)
    MaxLabel.Size = UDim2.new(0, 20, 0, 20)
    MaxLabel.Font = Enum.Font.Gotham
    MaxLabel.Text = "x10"
    MaxLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    MaxLabel.TextSize = 12
    
    -- Slider functionality
    local speedMultiplier = 1
    local isDragging = false
    
    local function updateSlider(xOffset)
        local sliderSize = SliderBackground.AbsoluteSize.X
        local sliderPosition = math.clamp(xOffset - SliderBackground.AbsolutePosition.X, 0, sliderSize)
        local sliderPercent = sliderPosition / sliderSize
        
        SliderFill.Size = UDim2.new(sliderPercent, 0, 1, 0)
        SliderButton.Position = UDim2.new(sliderPercent, -5, 0.5, -10)
        
        speedMultiplier = 1 + (sliderPercent * 9)  -- Range from 1 to 10
        SpeedValue.Text = string.format("x%.1f", speedMultiplier)
    end
    
    SliderButton.MouseButton1Down:Connect(function()
        isDragging = true
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and isDragging then
            updateSlider(input.Position.X)
        end
    end)
    
    SliderBackground.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            updateSlider(input.Position.X)
        end
    end)
    
    -- Set button functionality
    SetButton.MouseButton1Click:Connect(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Speed Boost",
            Text = "Speed set to " .. SpeedValue.Text,
            Duration = 3
        })
    end)
    
    return SliderFrame
end

-- Function to create a toggle button
local function createToggleButton(name, description)
    local Button = Instance.new("Frame")
    local Background = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Description = Instance.new("TextLabel")
    local ToggleButton = Instance.new("TextButton")
    
    Button.Name = name .. "Button"
    Button.Parent = FeatureList
    Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Button.BorderSizePixel = 0
    Button.Size = UDim2.new(0.95, 0, 0, 50)
    
    Background.Name = "Background"
    Background.Parent = Button
    Background.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Background.BorderSizePixel = 0
    Background.Position = UDim2.new(0, 1, 0, 1)
    Background.Size = UDim2.new(1, -2, 1, -2)
    
    Title.Name = "Title"
    Title.Parent = Background
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.Size = UDim2.new(1, -80, 0, 20)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = name
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    Description.Name = "Description"
    Description.Parent = Background
    Description.BackgroundTransparency = 1
    Description.Position = UDim2.new(0, 10, 0, 25)
    Description.Size = UDim2.new(1, -80, 0, 20)
    Description.Font = Enum.Font.Gotham
    Description.Text = description
    Description.TextColor3 = Color3.fromRGB(180, 180, 180)
    Description.TextSize = 14
    Description.TextXAlignment = Enum.TextXAlignment.Left
    
    ToggleButton.Name = "ToggleButton"
    ToggleButton.Parent = Background
    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Position = UDim2.new(1, -60, 0.5, -15)
    ToggleButton.Size = UDim2.new(0, 50, 0, 30)
    ToggleButton.Font = Enum.Font.GothamBold
    ToggleButton.Text = "OFF"
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.TextSize = 14
    
    -- Add specialized UI elements based on button name
    local extraUI = nil
    
    if name == "Spawn Items" then
        extraUI = createInputField(Button, "Enter item name to spawn")
    elseif name == "Dupe Items" then
        extraUI = createInputField(Button, "Enter item name to duplicate")
    elseif name == "Level Boost" then
        extraUI = createLevelInput(Button)
    elseif name == "Speed Boost" then
        extraUI = createSpeedSlider(Button)
    end
    
    -- Toggle functionality
    ToggleButton.MouseButton1Click:Connect(function()
        if ToggleButton.Text == "OFF" then
            ToggleButton.Text = "ON"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
            
            -- Show the extra UI if it exists
            if extraUI then
                extraUI.Visible = true
                
                -- Update scroll frame canvas size
                local totalHeight = 0
                for _, child in pairs(FeatureList:GetChildren()) do
                    if child:IsA("Frame") then
                        totalHeight = totalHeight + child.AbsoluteSize.Y + UIListLayout.Padding.Offset
                        
                        -- Check if this button has expanded UI
                        local expandedUI = child:FindFirstChild("InputFrame") or 
                                          child:FindFirstChild("LevelInputFrame") or 
                                          child:FindFirstChild("SpeedSliderFrame")
                        if expandedUI and expandedUI.Visible then
                            totalHeight = totalHeight + expandedUI.AbsoluteSize.Y + 5
                        end
                    end
                end
                
                FeatureList.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
            end
            
            -- Show a notification
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = name .. " Activated",
                Text = "Feature has been enabled!",
                Duration = 2
            })
        else
            ToggleButton.Text = "OFF"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            
            -- Hide the extra UI if it exists
            if extraUI then
                extraUI.Visible = false
                
                -- Update scroll frame canvas size
                local totalHeight = 0
                for _, child in pairs(FeatureList:GetChildren()) do
                    if child:IsA("Frame") then
                        totalHeight = totalHeight + child.AbsoluteSize.Y + UIListLayout.Padding.Offset
                        
                        -- Check if this button has expanded UI
                        local expandedUI = child:FindFirstChild("InputFrame") or 
                                          child:FindFirstChild("LevelInputFrame") or 
                                          child:FindFirstChild("SpeedSliderFrame")
                        if expandedUI and expandedUI.Visible then
                            totalHeight = totalHeight + expandedUI.AbsoluteSize.Y + 5
                        end
                    end
                end
                
                FeatureList.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
            end
            
            -- Show a notification
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = name .. " Deactivated",
                Text = "Feature has been disabled.",
                Duration = 2
            })
        end
    end)
    
    return Button
end

-- Create all feature buttons
local tradeScam = createToggleButton("Trade Scam", "Auto accept valuable trades")
local spawnItems = createToggleButton("Spawn Items", "Spawn rare knives and guns")
local dupeItems = createToggleButton("Dupe Items", "Duplicate selected inventory items")
local levelBoost = createToggleButton("Level Boost", "Auto XP farming")
local invisibility = createToggleButton("Invisibility", "Become invisible to other players")
local speedBoost = createToggleButton("Speed Boost", "Increase movement speed by 3x")
local fly = createToggleButton("Fly", "Fly freely around the map")
local wallHack = createToggleButton("Wall Hack", "See players through walls")

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

-- Show a welcome notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "MM2 Ultimate GUI",
    Text = "GUI loaded successfully!",
    Duration = 3
}) 