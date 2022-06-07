local botchats = {
  "Void On Top",
  "Holding Onwer",
  "We Leak Scripts etc",
  "CotraW",
  "lx16 is a man",
  "Yk Void Slaps All Servers",
  "Fun Fact We Give Scripts Out OpenSource",
  ".gg       /rwnPWAVeBH"
}
wait(1) if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local rservice = game:GetService("RunService")

coroutine.resume(coroutine.create(function() while wait(1) do pcall(function() for _,z in next, Players:GetPlayers() do if z ~= LocalPlayer then for _,v in next, z.Backpack:GetDescendants() do if v:IsA'Sound' then v.TimePosition = nil end end end end end) end end)) 
coroutine.resume(coroutine.create(function() while wait(1) do pcall(function() for _,z in next, Players:GetPlayers() do if z ~= LocalPlayer then if z.Character and z.Character:FindFirstChildOfClass("Tool") then for _,v in next, z.Character:GetDescendants() do if v:IsA'Sound' then v.TimePosition = nil end end end end end end) end end))

local function SkidFling(TargetPlayer)
    local Character = LocalPlayer.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid.RootPart
    
    local TCharacter = TargetPlayer.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle
    
    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end
    
    if Character and Humanoid and RootPart then
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        else
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
        local function FPos(BasePart,Pos,Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            RootPart.Velocity = Vector3.new(9e8,9e8,9e8)
            RootPart.RotVelocity = Vector3.new(9e8,9e8,9e8)
        end
        local function SFBasePart(BasePart)
            local TimeToWait = 2
            local Time = tick()
            local Angle = 0
            
            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 30 then
                        Angle = Angle + 10
                        FPos(BasePart,CFrame.new(0,1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 5,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                    else
                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(-30),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 1000 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
        workspace.FallenPartsDestroyHeight = 0/0
        local BV = Instance.new("BodyVelocity")
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e9,9e9,9e9)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
        end
        BV:Destroy()
        for _,x in next, Character:GetDescendants() do
            if x:IsA("BasePart") then
                x.Velocity,x.RotVelocity = Vector3.new(),Vector3.new()
            end
        end
        Humanoid:ChangeState("GettingUp")
        workspace.CurrentCamera.CameraSubject = Humanoid
    end
end

rservice.Stepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
        for _,z in next, LocalPlayer.Character:GetChildren() do if z:IsA'BasePart' then z.CanCollide = false end end
    end
end)
coroutine.resume(coroutine.create(function()
    while wait() do
        pcall(function()
            for _,z in pairs(Players:GetPlayers()) do
                if z ~= LocalPlayer then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and z and z.Character and z.Character:FindFirstChildOfClass("Humanoid").Sit == false then
                        SkidFling(z)
                        wait(1)
                    end
                end
            end
        end)
    end
end))
coroutine.resume(coroutine.create(function()
    while wait() do
        for _,z in next, Players:GetPlayers() do
            if z~=LocalPlayer then
                for i=1,30 do
                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(botchats[math.random(1, #botchats)], "All")
                wait(2.15)
            end
        end
        end
end
end))
for i = 1, 160 do
    if #Players:GetPlayers() <= 4 then
        break
    end
    wait(.65)
end
local GUIDs = {}
local maxPlayers = 0
local Http =
    game:GetService("HttpService"):JSONDecode(
    game:HttpGet(
        "https://games.roblox.com/v1/games/" ..
            game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&cursor="
    )
)
for i = 1, 100 do
    for i, v in next, Http.data do
        if v.playing ~= v.maxPlayers and v.id ~= game.JobId then
            maxPlayers = v.maxPlayers
            table.insert(GUIDs, {id = v.id, users = v.playing})
        end
    end
    if Http.nextPageCursor ~= null then
        Http =
            game:GetService("HttpService"):JSONDecode(
            game:HttpGet(
                "https://games.roblox.com/v1/games/"
                ..
                game.PlaceId
                ..
                "/servers/Public?sortOrder=Asc&limit=100&cursor="
                ..
                Http.nextPageCursor
            )
        )
    else
        break
    end
end
repeat wait() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[math.random(1, 3)].id, LocalPlayer) until not LocalPlayer
