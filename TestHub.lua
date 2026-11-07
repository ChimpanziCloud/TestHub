--[[
    TestHub v1 — Blox Fruits Anticheat Testing Script
    Executor-compatible (Delta, Synapse, Fluxus, etc.)
    No key system. Basic UI hub for anticheat R&D.
]]

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local IsMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- State
local Toggles = {}
local Connections = {}
local HubOpen = true

--------------------------------------------------------------
-- UTILITY
--------------------------------------------------------------
local function protect(gui)
    if syn and syn.protect_gui then
        syn.protect_gui(gui)
    elseif gethui then
        gui.Parent = gethui()
        return
    end
    gui.Parent = game:GetService("CoreGui")
end

local function tween(obj, props, dur)
    TweenService:Create(obj, TweenInfo.new(dur or 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
end

local function disconnect(name)
    if Connections[name] then
        Connections[name]:Disconnect()
        Connections[name] = nil
    end
end

local function getChar()
    return LP.Character or LP.CharacterAdded:Wait()
end

local function getHRP()
    local c = getChar()
    return c and c:FindFirstChild("HumanoidRootPart")
end

local function getHumanoid()
    local c = getChar()
    return c and c:FindFirstChildOfClass("Humanoid")
end

--------------------------------------------------------------
-- UI BUILDER
--------------------------------------------------------------
-- Cleanup old
if game:GetService("CoreGui"):FindFirstChild("TestHub") then
    game:GetService("CoreGui"):FindFirstChild("TestHub"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TestHub"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
protect(ScreenGui)

-- Colors
local Colors = {
    bg       = Color3.fromRGB(25, 25, 35),
    sidebar  = Color3.fromRGB(20, 20, 30),
    topbar   = Color3.fromRGB(30, 30, 45),
    accent   = Color3.fromRGB(100, 80, 255),
    accent2  = Color3.fromRGB(130, 110, 255),
    text     = Color3.fromRGB(220, 220, 230),
    dimtext  = Color3.fromRGB(140, 140, 160),
    toggle_on  = Color3.fromRGB(100, 80, 255),
    toggle_off = Color3.fromRGB(60, 60, 75),
    card     = Color3.fromRGB(35, 35, 50),
}

-- Main Frame
local MainW = IsMobile and 340 or 520
local MainH = IsMobile and 320 or 370
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, MainW, 0, MainH)
Main.Position = UDim2.new(0.5, -MainW/2, 0.5, -MainH/2)
Main.BackgroundColor3 = Colors.bg
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 8)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Colors.accent
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.5

-- Shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.6
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
Shadow.ZIndex = -1
Shadow.Parent = Main

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 36)
TopBar.BackgroundColor3 = Colors.topbar
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 8)

-- Fix bottom corners of topbar
local TopBarFix = Instance.new("Frame")
TopBarFix.Size = UDim2.new(1, 0, 0, 10)
TopBarFix.Position = UDim2.new(0, 0, 1, -10)
TopBarFix.BackgroundColor3 = Colors.topbar
TopBarFix.BorderSizePixel = 0
TopBarFix.Parent = TopBar

-- Title
local Title = Instance.new("TextLabel")
Title.Text = "⚡ TestHub v1"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextColor3 = Colors.accent2
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 14, 0, 0)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Subtitle
local Sub = Instance.new("TextLabel")
Sub.Text = "Anticheat Test Suite"
Sub.Font = Enum.Font.Gotham
Sub.TextSize = 11
Sub.TextColor3 = Colors.dimtext
Sub.BackgroundTransparency = 1
Sub.Size = UDim2.new(0, 150, 1, 0)
Sub.Position = UDim2.new(0, 135, 0, 0)
Sub.TextXAlignment = Enum.TextXAlignment.Left
Sub.Parent = TopBar

-- Close / Minimize
local function makeTopBtn(text, posX, callback)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.TextColor3 = Colors.dimtext
    btn.BackgroundTransparency = 1
    btn.Size = UDim2.new(0, 36, 0, 36)
    btn.Position = UDim2.new(1, posX, 0, 0)
    btn.Parent = TopBar
    btn.MouseButton1Click:Connect(callback)
    btn.MouseEnter:Connect(function() tween(btn, {TextColor3 = Colors.text}, 0.15) end)
    btn.MouseLeave:Connect(function() tween(btn, {TextColor3 = Colors.dimtext}, 0.15) end)
    return btn
end

makeTopBtn("✕", -36, function()
    Main.Visible = false
    MainStroke.Thickness = 0
    task.wait(0.05)
    ScreenGui:Destroy()
    for _, c in Connections do pcall(function() c:Disconnect() end) end
end)

makeTopBtn("—", -70, function()
    HubOpen = not HubOpen
    tween(Main, {Size = HubOpen and UDim2.new(0, MainW, 0, MainH) or UDim2.new(0, MainW, 0, 36)}, 0.3)
end)

-- Dragging
do
    local dragging, dragStart, startPos
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
        end
    end)
    TopBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- Sidebar
local SideW = IsMobile and 80 or 110
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, SideW, 1, -36)
Sidebar.Position = UDim2.new(0, 0, 0, 36)
Sidebar.BackgroundColor3 = Colors.sidebar
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local SidebarLayout = Instance.new("UIListLayout", Sidebar)
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 2)
SidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

Instance.new("UIPadding", Sidebar).PaddingTop = UDim.new(0, 8)

-- Content Area
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -(SideW + 5), 1, -42)
ContentArea.Position = UDim2.new(0, SideW + 3, 0, 40)
ContentArea.BackgroundTransparency = 1
ContentArea.ClipsDescendants = true
ContentArea.Parent = Main

-- Tab Pages container
local Pages = {}
local TabButtons = {}
local ActiveTab = nil

local function createPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = Colors.accent
    page.BorderSizePixel = 0
    page.Visible = false
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Parent = ContentArea

    local layout = Instance.new("UIListLayout", page)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)

    Instance.new("UIPadding", page).PaddingRight = UDim.new(0, 6)

    Pages[name] = page
    return page
end

local function switchTab(name)
    if ActiveTab == name then return end
    for n, p in Pages do
        p.Visible = (n == name)
    end
    for n, btn in TabButtons do
        local active = (n == name)
        tween(btn, {BackgroundColor3 = active and Colors.accent or Colors.sidebar, TextColor3 = active and Colors.text or Colors.dimtext}, 0.2)
    end
    ActiveTab = name
end

local function createTab(icon, name, order)
    createPage(name)

    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Text = IsMobile and icon or (icon .. " " .. name)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = IsMobile and 11 or 12
    btn.TextColor3 = Colors.dimtext
    btn.BackgroundColor3 = Colors.sidebar
    btn.Size = UDim2.new(1, -12, 0, 32)
    btn.BorderSizePixel = 0
    btn.LayoutOrder = order
    btn.Parent = Sidebar

    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    btn.MouseButton1Click:Connect(function() switchTab(name) end)
    TabButtons[name] = btn
end

--------------------------------------------------------------
-- UI COMPONENTS
--------------------------------------------------------------
local function addLabel(page, text)
    local lbl = Instance.new("TextLabel")
    lbl.Text = "  " .. text
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 13
    lbl.TextColor3 = Colors.accent2
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(1, 0, 0, 24)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = page
    return lbl
end

local function addToggle(page, name, default, callback)
    Toggles[name] = default or false

    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, IsMobile and 40 or 34)
    card.BackgroundColor3 = Colors.card
    card.BorderSizePixel = 0
    card.Parent = page
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 6)

    local lbl = Instance.new("TextLabel")
    lbl.Text = "  " .. name
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 12
    lbl.TextColor3 = Colors.text
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(1, -60, 1, 0)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = card

    local toggleBg = Instance.new("Frame")
    toggleBg.Size = UDim2.new(0, 38, 0, 20)
    toggleBg.Position = UDim2.new(1, -48, 0.5, -10)
    toggleBg.BackgroundColor3 = Toggles[name] and Colors.toggle_on or Colors.toggle_off
    toggleBg.BorderSizePixel = 0
    toggleBg.Parent = card
    Instance.new("UICorner", toggleBg).CornerRadius = UDim.new(1, 0)

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 14, 0, 14)
    circle.Position = Toggles[name] and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    circle.BackgroundColor3 = Colors.text
    circle.BorderSizePixel = 0
    circle.Parent = toggleBg
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

    local btn = Instance.new("TextButton")
    btn.Text = ""
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Parent = card

    btn.MouseButton1Click:Connect(function()
        Toggles[name] = not Toggles[name]
        local on = Toggles[name]
        tween(toggleBg, {BackgroundColor3 = on and Colors.toggle_on or Colors.toggle_off}, 0.2)
        tween(circle, {Position = on and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)}, 0.2)
        if callback then callback(on) end
    end)

    return card
end

local function addSlider(page, name, min, max, default, callback)
    local value = default

    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, IsMobile and 52 or 46)
    card.BackgroundColor3 = Colors.card
    card.BorderSizePixel = 0
    card.Parent = page
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 6)

    local lbl = Instance.new("TextLabel")
    lbl.Text = "  " .. name
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 11
    lbl.TextColor3 = Colors.text
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(0.6, 0, 0, 20)
    lbl.Position = UDim2.new(0, 0, 0, 2)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = card

    local valLabel = Instance.new("TextLabel")
    valLabel.Font = Enum.Font.GothamBold
    valLabel.TextSize = 11
    valLabel.TextColor3 = Colors.accent2
    valLabel.BackgroundTransparency = 1
    valLabel.Size = UDim2.new(0.35, 0, 0, 20)
    valLabel.Position = UDim2.new(0.6, 0, 0, 2)
    valLabel.TextXAlignment = Enum.TextXAlignment.Right
    valLabel.Text = tostring(math.floor(value))
    valLabel.Parent = card

    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, -20, 0, 6)
    track.Position = UDim2.new(0, 10, 0, 28)
    track.BackgroundColor3 = Colors.toggle_off
    track.BorderSizePixel = 0
    track.Parent = card
    Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

    local fill = Instance.new("Frame")
    local pct = (default - min) / (max - min)
    fill.Size = UDim2.new(pct, 0, 1, 0)
    fill.BackgroundColor3 = Colors.accent
    fill.BorderSizePixel = 0
    fill.Parent = track
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new(pct, -7, 0.5, -7)
    knob.BackgroundColor3 = Colors.text
    knob.BorderSizePixel = 0
    knob.ZIndex = 2
    knob.Parent = track
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local hitbox = Instance.new("TextButton")
    hitbox.Text = ""
    hitbox.Size = UDim2.new(1, 0, 0, 20)
    hitbox.Position = UDim2.new(0, 0, 0, 18)
    hitbox.BackgroundTransparency = 1
    hitbox.Parent = card

    local sliding = false
    local function updateSlider(inputPos)
        local trackAbsPos = track.AbsolutePosition.X
        local trackAbsSize = track.AbsoluteSize.X
        local relX = math.clamp((inputPos.X - trackAbsPos) / trackAbsSize, 0, 1)
        value = math.floor(min + (max - min) * relX)
        valLabel.Text = tostring(value)
        fill.Size = UDim2.new(relX, 0, 1, 0)
        knob.Position = UDim2.new(relX, -7, 0.5, -7)
        if callback then callback(value) end
    end

    hitbox.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = true
            updateSlider(input.Position)
        end
    end)
    hitbox.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input.Position)
        end
    end)

    return {card = card, getValue = function() return value end}
end

local function addButton(page, name, callback)
    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 12
    btn.TextColor3 = Colors.text
    btn.BackgroundColor3 = Colors.accent
    btn.Size = UDim2.new(1, 0, 0, IsMobile and 38 or 32)
    btn.BorderSizePixel = 0
    btn.Parent = page
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    btn.MouseButton1Click:Connect(callback)
    btn.MouseEnter:Connect(function() tween(btn, {BackgroundColor3 = Colors.accent2}, 0.15) end)
    btn.MouseLeave:Connect(function() tween(btn, {BackgroundColor3 = Colors.accent}, 0.15) end)
    return btn
end

local function addInfo(page, label, getValue)
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, 28)
    card.BackgroundColor3 = Colors.card
    card.BorderSizePixel = 0
    card.Parent = page
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 6)

    local lbl = Instance.new("TextLabel")
    lbl.Text = "  " .. label
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 11
    lbl.TextColor3 = Colors.dimtext
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(0.5, 0, 1, 0)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = card

    local val = Instance.new("TextLabel")
    val.Name = "Value"
    val.Text = tostring(getValue())
    val.Font = Enum.Font.GothamSemibold
    val.TextSize = 11
    val.TextColor3 = Colors.text
    val.BackgroundTransparency = 1
    val.Size = UDim2.new(0.5, -10, 1, 0)
    val.Position = UDim2.new(0.5, 0, 0, 0)
    val.TextXAlignment = Enum.TextXAlignment.Right
    val.Parent = card

    return val
end

--------------------------------------------------------------
-- TABS
--------------------------------------------------------------
createTab("🏠", "Main", 1)
createTab("⚔️", "Combat", 2)
createTab("🌾", "Farm", 3)
createTab("📍", "Teleport", 4)
createTab("⚙️", "Misc", 5)

--------------------------------------------------------------
-- MAIN TAB
--------------------------------------------------------------
do
    local pg = Pages["Main"]
    addLabel(pg, "Player Info")

    local hpVal = addInfo(pg, "Health", function()
        local h = getHumanoid()
        return h and math.floor(h.Health) .. "/" .. math.floor(h.MaxHealth) or "N/A"
    end)

    local posVal = addInfo(pg, "Position", function()
        local hrp = getHRP()
        if not hrp then return "N/A" end
        local p = hrp.Position
        return math.floor(p.X) .. ", " .. math.floor(p.Y) .. ", " .. math.floor(p.Z)
    end)

    local velVal = addInfo(pg, "Velocity", function()
        local hrp = getHRP()
        if not hrp then return "0" end
        return tostring(math.floor(hrp.AssemblyLinearVelocity.Magnitude))
    end)

    addInfo(pg, "Executor", function()
        return identifyexecutor and identifyexecutor() or "Unknown"
    end)

    -- Update loop
    Connections["info_update"] = RunService.Heartbeat:Connect(function()
        pcall(function()
            local h = getHumanoid()
            hpVal.Text = h and math.floor(h.Health) .. "/" .. math.floor(h.MaxHealth) or "N/A"
            local hrp = getHRP()
            if hrp then
                local p = hrp.Position
                posVal.Text = math.floor(p.X) .. ", " .. math.floor(p.Y) .. ", " .. math.floor(p.Z)
                velVal.Text = tostring(math.floor(hrp.AssemblyLinearVelocity.Magnitude))
            end
        end)
    end)

    addLabel(pg, "Quick Actions")
    addButton(pg, "Rejoin Server", function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LP)
    end)
    addButton(pg, "Server Hop", function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LP)
    end)
end

--------------------------------------------------------------
-- COMBAT TAB
--------------------------------------------------------------
do
    local pg = Pages["Combat"]
    addLabel(pg, "Movement Exploits (Anticheat Triggers)")

    local defaultWalkSpeed = 16
    local defaultJumpPower = 50
    local speedValue = 100
    local jumpValue = 150

    pcall(function()
        local h = getHumanoid()
        if h then
            defaultWalkSpeed = h.WalkSpeed
            defaultJumpPower = h.JumpPower
        end
    end)

    addToggle(pg, "Speed Hack (WalkSpeed)", false, function(on)
        local h = getHumanoid()
        if h then h.WalkSpeed = on and speedValue or defaultWalkSpeed end
    end)
    addSlider(pg, "Speed Value", 16, 500, 100, function(v)
        speedValue = v
        if Toggles["Speed Hack (WalkSpeed)"] then
            local h = getHumanoid()
            if h then h.WalkSpeed = v end
        end
    end)

    addToggle(pg, "Jump Power", false, function(on)
        local h = getHumanoid()
        if h then h.JumpPower = on and jumpValue or defaultJumpPower end
    end)
    addSlider(pg, "Jump Value", 50, 500, 150, function(v)
        jumpValue = v
        if Toggles["Jump Power"] then
            local h = getHumanoid()
            if h then h.JumpPower = v end
        end
    end)

    addToggle(pg, "No Clip", false, function(on)
        disconnect("noclip")
        if on then
            Connections["noclip"] = RunService.Stepped:Connect(function()
                pcall(function()
                    local char = getChar()
                    if not char then return end
                    for _, p in char:GetDescendants() do
                        if p:IsA("BasePart") then
                            p.CanCollide = false
                        end
                    end
                end)
            end)
        end
    end)

    addToggle(pg, "Infinite Jump", false, function(on)
        disconnect("infjump")
        if on then
            Connections["infjump"] = UserInputService.JumpRequest:Connect(function()
                local h = getHumanoid()
                if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        end
    end)

    addLabel(pg, "Combat Mods")

    addToggle(pg, "Fly", false, function(on)
        disconnect("fly")
        local hrp = getHRP()
        if not hrp then return end

        if on then
            local bv = Instance.new("BodyVelocity")
            bv.Name = "TestHubFly"
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.zero
            bv.Parent = hrp

            local bg = Instance.new("BodyGyro")
            bg.Name = "TestHubGyro"
            bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bg.D = 200
            bg.P = 9000
            bg.Parent = hrp

            local flySpeed = 80
            Connections["fly"] = RunService.RenderStepped:Connect(function()
                pcall(function()
                    local cf = Camera.CFrame
                    local moveDir = Vector3.zero
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir += cf.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir -= cf.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir -= cf.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir += cf.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir += Vector3.new(0,1,0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir -= Vector3.new(0,1,0) end

                    bv.Velocity = moveDir * flySpeed
                    bg.CFrame = cf
                end)
            end)
        else
            for _, v in getHRP():GetChildren() do
                if v.Name == "TestHubFly" or v.Name == "TestHubGyro" then
                    v:Destroy()
                end
            end
        end
    end)
end

--------------------------------------------------------------
-- FARM TAB
--------------------------------------------------------------
do
    local pg = Pages["Farm"]
    addLabel(pg, "Auto Farm (Anticheat Triggers)")

    addToggle(pg, "Auto Attack (Click)", false, function(on)
        disconnect("autoclick")
        if on then
            Connections["autoclick"] = task.spawn(function()
                while Toggles["Auto Attack (Click)"] do
                    pcall(function()
                        if mouse1click then
                            mouse1click()
                        end
                    end)
                    task.wait(0.15)
                end
            end)
        end
    end)

    addToggle(pg, "Auto Collect (Nearby Items)", false, function(on)
        disconnect("autocollect")
        if on then
            Connections["autocollect"] = RunService.Heartbeat:Connect(function()
                pcall(function()
                    local hrp = getHRP()
                    if not hrp then return end
                    for _, v in Workspace:GetDescendants() do
                        if v:IsA("TouchTransmitter") and v.Parent and v.Parent:IsA("BasePart") then
                            local dist = (v.Parent.Position - hrp.Position).Magnitude
                            if dist < 50 then
                                firetouchinterest(hrp, v.Parent, 0)
                                task.wait()
                                firetouchinterest(hrp, v.Parent, 1)
                            end
                        end
                    end
                end)
            end)
        end
    end)

    addToggle(pg, "Mob ESP", false, function(on)
        -- Clear existing
        for _, v in Workspace:GetDescendants() do
            if v:IsA("Highlight") and v.Name == "TestHubESP" then v:Destroy() end
        end

        if on then
            local function applyESP()
                for _, v in Workspace:GetDescendants() do
                    if v:IsA("Highlight") and v.Name == "TestHubESP" then v:Destroy() end
                end
                for _, npc in Workspace:GetChildren() do
                    pcall(function()
                        if npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") and not Players:GetPlayerFromCharacter(npc) then
                            local h = Instance.new("Highlight")
                            h.Name = "TestHubESP"
                            h.FillColor = Color3.fromRGB(255, 50, 50)
                            h.FillTransparency = 0.7
                            h.OutlineColor = Color3.fromRGB(255, 100, 100)
                            h.Adornee = npc
                            h.Parent = npc
                        end
                    end)
                end
            end
            applyESP()
            Connections["mob_esp_refresh"] = task.spawn(function()
                while Toggles["Mob ESP"] do
                    applyESP()
                    task.wait(3)
                end
            end)
        end
    end)

    addLabel(pg, "Auto Farm")

    addToggle(pg, "Auto Farm (Nearest Mob)", false, function(on)
        disconnect("autofarm")
        if on then
            Connections["autofarm"] = task.spawn(function()
                while Toggles["Auto Farm (Nearest Mob)"] do
                    pcall(function()
                        local hrp = getHRP()
                        if not hrp then return end
                        local nearest, nearDist = nil, math.huge
                        for _, npc in Workspace:GetChildren() do
                            if npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart")
                                and not Players:GetPlayerFromCharacter(npc)
                                and npc.Humanoid.Health > 0 then
                                local dist = (npc.HumanoidRootPart.Position - hrp.Position).Magnitude
                                if dist < nearDist then
                                    nearest = npc
                                    nearDist = dist
                                end
                            end
                        end
                        if nearest then
                            hrp.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                            task.wait(0.1)
                            if mouse1click then mouse1click() end
                        end
                    end)
                    task.wait(0.2)
                end
            end)
        end
    end)

    addToggle(pg, "Auto Farm (TP Kill)", false, function(on)
        disconnect("autofarm_tp")
        if on then
            Connections["autofarm_tp"] = task.spawn(function()
                while Toggles["Auto Farm (TP Kill)"] do
                    pcall(function()
                        local hrp = getHRP()
                        if not hrp then return end
                        for _, npc in Workspace:GetChildren() do
                            if npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart")
                                and not Players:GetPlayerFromCharacter(npc)
                                and npc.Humanoid.Health > 0 then
                                hrp.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
                                task.wait(0.1)
                                if mouse1click then mouse1click() end
                                task.wait(0.1)
                                if mouse1click then mouse1click() end
                                break
                            end
                        end
                    end)
                    task.wait(0.3)
                end
            end)
        end
    end)

    addLabel(pg, "Fruit Finder")

    addToggle(pg, "Fruit ESP", false, function(on)
        for _, v in Workspace:GetDescendants() do
            if v:IsA("Highlight") and v.Name == "TestHubFruitESP" then v:Destroy() end
        end
        if on then
            Connections["fruit_esp"] = task.spawn(function()
                while Toggles["Fruit ESP"] do
                    for _, v in Workspace:GetDescendants() do
                        if v:IsA("Highlight") and v.Name == "TestHubFruitESP" then v:Destroy() end
                    end
                    for _, v in Workspace:GetDescendants() do
                        pcall(function()
                            if v:IsA("Tool") and v.Name:find("Fruit") or (v:IsA("Model") and v.Name:find("Fruit")) then
                                local part = v:IsA("BasePart") and v or v:FindFirstChildWhichIsA("BasePart")
                                if part and not v:FindFirstChild("TestHubFruitESP") then
                                    local h = Instance.new("Highlight")
                                    h.Name = "TestHubFruitESP"
                                    h.FillColor = Color3.fromRGB(255, 215, 0)
                                    h.FillTransparency = 0.3
                                    h.OutlineColor = Color3.fromRGB(255, 255, 100)
                                    h.Adornee = v
                                    h.Parent = v
                                end
                            end
                        end)
                    end
                    task.wait(2)
                end
            end)
        else
            disconnect("fruit_esp")
        end
    end)

    addButton(pg, "🍎 TP to Nearest Fruit", function()
        pcall(function()
            local hrp = getHRP()
            if not hrp then return end
            local nearest, nearDist = nil, math.huge
            for _, v in Workspace:GetDescendants() do
                pcall(function()
                    if (v:IsA("Tool") or v:IsA("Model")) and v.Name:find("Fruit") then
                        local part = v:IsA("BasePart") and v or v:FindFirstChildWhichIsA("BasePart")
                        if part then
                            local dist = (part.Position - hrp.Position).Magnitude
                            if dist < nearDist then
                                nearest = part
                                nearDist = dist
                            end
                        end
                    end
                end)
            end
            if nearest then
                hrp.CFrame = nearest.CFrame * CFrame.new(0, 3, 0)
            else
                warn("[TestHub] No fruits found in workspace")
            end
        end)
    end)
end

--------------------------------------------------------------
-- TELEPORT TAB
--------------------------------------------------------------
do
    local pg = Pages["Teleport"]
    addLabel(pg, "Blox Fruits Islands")

    local islands = {
        {"Pirate Starter", CFrame.new(-1134, 15, 3855)},
        {"Marine Starter", CFrame.new(-2596, 73, 2063)},
        {"Jungle", CFrame.new(-1249, 35, 356)},
        {"Pirate Village", CFrame.new(-1155, 5, 3840)},
        {"Desert", CFrame.new(932, 20, 4437)},
        {"Frozen Village", CFrame.new(1208, 60, -1361)},
        {"Colosseum", CFrame.new(-1457, 7.5, -2876)},
        {"Magma Village", CFrame.new(-5280, 12, 8445)},
        {"Underwater City", CFrame.new(3845, -2295, -11160)},
        {"Fountain City", CFrame.new(5254, 36, 4060)},
    }

    for _, island in islands do
        addButton(pg, "📍 " .. island[1], function()
            pcall(function()
                local hrp = getHRP()
                if hrp then
                    hrp.CFrame = island[2]
                end
            end)
        end)
    end
end

--------------------------------------------------------------
-- MISC TAB
--------------------------------------------------------------
do
    local pg = Pages["Misc"]
    addLabel(pg, "Visual / Debug")

    addToggle(pg, "Fullbright", false, function(on)
        local lighting = game:GetService("Lighting")
        if on then
            lighting.Brightness = 2
            lighting.ClockTime = 14
            lighting.FogEnd = 100000
            lighting.GlobalShadows = false
        else
            lighting.Brightness = 1
            lighting.ClockTime = 14
            lighting.FogEnd = 10000
            lighting.GlobalShadows = true
        end
    end)

    addToggle(pg, "Player ESP", false, function(on)
        for _, p in Players:GetPlayers() do
            pcall(function()
                if p ~= LP and p.Character then
                    local existing = p.Character:FindFirstChild("TestHubPlayerESP")
                    if existing then existing:Destroy() end
                    if on then
                        local h = Instance.new("Highlight")
                        h.Name = "TestHubPlayerESP"
                        h.FillColor = Color3.fromRGB(50, 150, 255)
                        h.FillTransparency = 0.6
                        h.OutlineColor = Color3.fromRGB(100, 200, 255)
                        h.Adornee = p.Character
                        h.Parent = p.Character
                    end
                end
            end)
        end
    end)

    addToggle(pg, "Anti AFK", false, function(on)
        disconnect("antiafk")
        if on then
            local vu = game:GetService("VirtualUser")
            Connections["antiafk"] = LP.Idled:Connect(function()
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end)
        end
    end)

    addLabel(pg, "Anticheat Info")
    addButton(pg, "Print Remote Events (Console)", function()
        local count = 0
        for _, v in ReplicatedStorage:GetDescendants() do
            if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                print("[TestHub]", v.ClassName, v:GetFullName())
                count += 1
            end
        end
        print("[TestHub] Found", count, "remotes")
    end)
    addButton(pg, "Log Network Traffic (10s)", function()
        print("[TestHub] Logging remote fires for 10 seconds...")
        -- This requires hookfunction support from executor
        if not hookfunction then
            warn("[TestHub] hookfunction not available in this executor")
            return
        end
        -- Basic namecall logging
        local old
        old = hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()
            if method == "FireServer" or method == "InvokeServer" then
                print("[TestHub Remote]", method, self:GetFullName(), ...)
            end
            return old(self, ...)
        end)
        task.delay(10, function()
            hookmetamethod(game, "__namecall", old)
            print("[TestHub] Stopped logging.")
        end)
    end)
end

--------------------------------------------------------------
-- INIT
--------------------------------------------------------------
switchTab("Main")

-- Floating mobile toggle button
if IsMobile then
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = "MobileToggle"
    toggleBtn.Text = "⚡"
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 20
    toggleBtn.TextColor3 = Colors.text
    toggleBtn.BackgroundColor3 = Colors.accent
    toggleBtn.Size = UDim2.new(0, 44, 0, 44)
    toggleBtn.Position = UDim2.new(0, 10, 0.5, -22)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.ZIndex = 10
    toggleBtn.Parent = ScreenGui
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)

    -- Make toggle button draggable
    local tDrag, tStart, tPos
    toggleBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            tDrag = true; tStart = input.Position; tPos = toggleBtn.Position
        end
    end)
    toggleBtn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then tDrag = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if tDrag and input.UserInputType == Enum.UserInputType.Touch then
            local d = input.Position - tStart
            toggleBtn.Position = UDim2.new(tPos.X.Scale, tPos.X.Offset + d.X, tPos.Y.Scale, tPos.Y.Offset + d.Y)
        end
    end)

    toggleBtn.MouseButton1Click:Connect(function()
        HubOpen = not HubOpen
        tween(Main, {Size = HubOpen and UDim2.new(0, MainW, 0, MainH) or UDim2.new(0, MainW, 0, 0)}, 0.3)
    end)
end

-- Toggle key (Right Ctrl — desktop only)
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        HubOpen = not HubOpen
        tween(Main, {Size = HubOpen and UDim2.new(0, MainW, 0, MainH) or UDim2.new(0, MainW, 0, 36)}, 0.3)
    end
end)

-- Open animation
Main.Size = UDim2.new(0, MainW, 0, 0)
tween(Main, {Size = UDim2.new(0, MainW, 0, MainH)}, 0.4)

print("[TestHub v1] Loaded — Right Ctrl to toggle UI")
