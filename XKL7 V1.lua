game.StarterGui:SetCore("SendNotification", {
    Title = "Hey 卐";
    Text = "Made by BRCDEATH"; -- what the text says (ofc)
    Duration = 9;
})
wait(1)
game.StarterGui:SetCore("SendNotification", {
    Title = "Enjoy";
    Text = "Make sure Destroy all the fucker kid in bedwars"; -- what the text says (ofc)
    Duration = 9;
})

local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local function runcode(func)
	func()
end

local function playsound(id, volume) 
	local sound = Instance.new("Sound")
	sound.Parent = workspace
	sound.SoundId = id
	sound.PlayOnRemove = true 
	if volume then 
		sound.Volume = volume
	end
	sound:Destroy()
end

local function playanimation(id) 
	if isAlive() then 
		local animation = Instance.new("Animation")
		animation.AnimationId = id
		local animatior = lplr.Character.Humanoid.Animator
		animatior:LoadAnimation(animation):Play()
	end
end

function isNumber(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

function getinv(plr)
	local plr = plr or lplr
	local thingy, thingytwo = pcall(function() return InventoryUtil.getInventory(plr) end)
	return (thingy and thingytwo or {
		items = {},
		armor = {},
		hand = nil
	})
end

function getsword()
	local sd
	local higherdamage
	local swordslots
	local swords = getinv().items
	for i, v in pairs(swords) do
		if v.itemType:lower():find("sword") or v.itemType:lower():find("blade") then
			if higherdamage == nil or itemstuff[v.itemType].sword.damage > higherdamage then
				sd = v
				higherdamage = itemstuff[v.itemType].sword.damage
				swordslots = i
			end
		end
	end
	return sd, swordslots
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/BRCDEATH/BRCDEATH/main/Antlag"))()

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("XKL7 V1", "Ocean")

local Tab1 = Window:NewTab("Main")
local Tab1Section = Tab1:NewSection("Main")

Tab1Section:NewButton("Kill Aura","Opens Kill Aura",function()
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local cam = workspace.CurrentCamera
local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
local SwordCont = KnitClient.Controllers.SwordController

local aura = true
local DistVal = {["Value"] = 14}
function Aura()
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
			local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if mag <= DistVal["Value"] and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") then
				if v.Character.Humanoid.Health > 0 then
					aura = true
                    SwordCont:swingSwordAtMouse()
end
end
end
end
end

game:GetService("RunService").Stepped:connect(function()
Aura()
end)
end)

Tab1Section:NewToggle("NoClick Delay", "NoClick Delay", function(state)
    if state then
getgenv().funisus = v
        spawn(function()
            if getgenv().funisus and entity.isAlive then
                for i2,v2 in pairs(itemtable) do
                    if type(v2) == "table" and rawget(v2, "sword") then
                        v2.sword.attackSpeed = 0.000000001
                    end
                    SwordCont.isClickingTooFast = function() return false end
                end
            else
            end
        end)
    end
 
    end)

Tab1Section:NewToggle("No Fall", "No fall", function(state)
    if state then
        if entity.isAlive then
            spawn(function()
                repeat
                    if v == false then return end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.GroundHit:FireServer(workspace.Map.Blocks,1645488277.345853)
                until v == true
            end)
        end
    end

    end)

Tab1Section:NewButton("Inf jump", "", function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)

Tab1Section:NewToggle("Speed", "", function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23.5
		else
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
		end
end)

Tab1Section:NewToggle("No Swing", "Disable killaura swing", function(state)
	if state then
		if killauraswing["Enabled"] == true then
			killauraswing["Enabled"] = false
		end
	else
		if killauraswing["Enabled"] == false then
			killauraswing["Enabled"] = true
		end
	end
end)

Tab1Section:NewToggle("Nuker", "", function(state)
    if state then
        Nuker = true
			repeat task.wait(0.1)
				for _,v in pairs(workspace.PlacedItems:GetChildren()) do
					if v.Name == "bed" then
						local args = {
							[1] = {
								[1] = {
									[1] = "\11",
									[2] = "wooden_pickaxe",

									[3] = v
								}
							}
						}

						game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
					end
				end
			until not Nuker
		else
			Nuker = false
		end
	end)

Tab1Section:NewToggle("Reach", "", function(state)
    if state then
        CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = (reachval["Value"] - 0.0001)
    else
        CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = 14.4
    end
end)

Tab1Section:NewSlider("Fov", "SliderInfo", 200, 80, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Workspace.CurrentCamera. FieldOfView = s
end)

Tab1Section:NewToggle("AntiVoid", "Give's you a second chance to get back on land", function(state)
	if state then
		antivoidp = Instance.new("Part", workspace)
		antivoidp.Name = "AntiVoid"
		antivoidp.CanCollide = true
		antivoidp.Size = Vector3.new(2048, 1, 2048)
		antivoidp.Anchored = true
		antivoidp.Transparency = 1 - (antivoidtransparent["Value"] / 100)
		antivoidp.Material = Enum.Material.Neon
		antivoidp.Color = Color3.fromHSV(antivoidcolor["Hue"], antivoidcolor["Sat"], antivoidcolor["Value"])
		antivoidp.Position = Vector3.new(0, 23.5, 0)
		antivoidp.Touched:connect(function(touchedvoid)
			if touchedvoid.Parent:FindFirstChild("Humanoid") and touchedvoid.Parent.Name == lplr.Name then
				lplr.Character.Humanoid.Jump = true
				lplr.Character.Humanoid:ChangeState("Jumping")
				wait(0.2)
				lplr.Character.Humanoid:ChangeState("Jumping")
				wait(0.2)
				lplr.Character.Humanoid:ChangeState("Jumping")
			end
		end)
	else
		if antivoidp then
			antivoidp:Remove()
		end
	end
end)

Tab1Section:NewButton("toxic", "", function()
local choosePlayer = false --set true if you want to insult one person only
local chosenPlayer = "" --if chosePlayer = true, type playername in quotes

local Taunts = { --add as many as you wish
"千ぴくk you all this its ez.",
"L bozo.",
"千ぴくk  you kid fatherless.",
"Ez .",
"Dogwater.",
"fatherless.",
"Ohio kid 千ぴくker.",
"Pay to win to win like tanqr.",
"千ぴくk  you.",
"Ez L 千ぴくk  you .",
"kiddo running like a dog.",

}

local Remote = game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest

local function Insult()
   local players = game.Players:GetChildren()
   local howManyPlayers = #players
   
   local ran = math.random(1,howManyPlayers)
   local chosenOne = players[ran]
   local chance = math.random(1,17)
   
   if choosePlayer == true then
       Remote:FireServer(chosenPlayer.." " ..Taunts[math.random(1,#Taunts)],"All")
   elseif chance <= 5 then
       Remote:FireServer(chosenOne.Name.." " ..Taunts[math.random(1,#Taunts)],"All")
   else
       Remote:FireServer(Taunts[math.random(1,#Taunts)],"All")
   end
end
   

local randTime = math.random(5,10)

while true and wait(randTime) do
   Insult()
end
    print("...")
end)

Tab1Section:NewButton("FixCam", "fix camera bug on mobile", function()
	cam.CameraType = Enum.CameraType.Fixed
	cam.CameraType = Enum.CameraType.Custom
end)

Tab1Section:NewButton("AntiCheat Bypass", "AntiCheat Bypass", function()
local player = game.Players.LocalPlayer
	repeat
		wait()
	until player:FindFirstChild("Backpack")
	local Connection = game.DescendantAdded:Connect(function(Inst)
		local Success, Error = pcall(function()
			return Inst.DisplayOrder
		end)
		if tostring(Inst) ~= "DevConsoleMaster" and tostring(Inst) ~= "InputCatcher" and Error == "The current identity (2) cannot Class security check (lacking permission 1)" then
			while true do
			end
		end
	end)
	local toSave = {}
	local function saveScript(saved)
		toSave[saved] = true
		local storedName = saved.Name
		saved:GetPropertyChangedSignal("Disabled"):connect(function()
			if saved.Disabled then
				local robloxlocked = pcall(function()
					saved.Disabled = false
				end)
				if not robloxlocked then
					while true do
					end
				end
			end
		end)
		saved:GetPropertyChangedSignal("Name"):connect(function()
			saved.Name = storedName
		end)
	end
	for _, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("LocalScript") and (v.Name == "check" or v.Name == "checkDo") and v ~= script then
			saveScript(v)
		end
	end
	script.Parent.ChildRemoved:connect(function(child)
		if toSave[child] then
			local saved, cloned = pcall(function()
				return child:Clone()
			end)
			if saved then
				cloned.Parent = script.Parent
				saveScript(cloned)
			else
				while true do
				end
			end
		end
	end)
	local setUpCharacter = function(char)
		wait(5)
		for _, v in pairs(char:GetDescendants()) do
			if v:IsA("BasePart") and v:FindFirstChildOfClass("TouchTransmitter") then
				while true do
				end
			elseif v:IsA("BasePart") then
				v.ChildAdded:connect(function(child)
					if child:IsA("TouchTransmitter") then
						while true do
						end
					end
				end)
			end
		end
		char:WaitForChild("HumanoidRootPart"):GetPropertyChangedSignal("CFrame"):connect(function()
			while true do
			end
		end)
	end
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		wait(5)
		setUpCharacter(player.Character)
	end
	player.CharacterAdded:connect(function(char)
		wait(5)
		setUpCharacter(char)
	end)
	player.Backpack.ChildAdded:Connect(function(added)
		local toolCount = 0
		for i, v in pairs(player.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				toolCount = toolCount + 1
			end
		end
		for i, v in pairs(player.Character:GetChildren()) do
			if v:IsA("Tool") then
				toolCount = toolCount + 1
			end
		end
		for i, v in pairs(player:GetChildren()) do
			if v:IsA("Tool") then
				toolCount = toolCount + 1
			end
		end
		if toolCount > 2 then
			while true do
			end
		end
	end)
    print("...")
end)

local Tab1 = Window:NewTab("HUBS")
local Tab1Section = Tab1:NewSection("All Script of bedwar")

Tab1Section:NewButton("Darkai animation", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
end)

Tab1Section:NewButton("Keyboard", "Execute Keyboard Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

Tab1Section:NewButton("Vape (need config)", "op", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
end)

local Tab1 = Window:NewTab("Credits")
local Tab1Section = Tab1:NewSection("Made by BRCDEATH")
local Tab1Section = Tab1:NewSection("BETA V1")
Tab1Section:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

local player = game:GetService("Players")

local lplr = player.LocalPlayer

if lplr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then

      if lplr.Character:FindFirstChild("Torso") then

        torso = lplr.Character.Torso

      else

        torso = lplr.Character.UpperTorso

      end

      local CapeP = Instance.new("Part", torso.Parent)

      CapeP.Name = "Cape"

      CapeP.Anchored = false

      CapeP.CanCollide = false

      CapeP.TopSurface = 1

      CapeP.BottomSurface = 1

      CapeP.Color = Color3.fromRGB(101,0,255)

      CapeP.FormFactor = "Custom"

      CapeP.Size = Vector3.new(0.2,0.2,0.2)

      local decal = Instance.new("Decal", CapeP)

      decal.Texture = "http://www.roblox.com/asset/?id=9608953146"

      decal.Face = "Back"

      local msh = Instance.new("BlockMesh", CapeP)

      msh.Scale = Vector3.new(9,17.5,0.5)

      local motor = Instance.new("Motor", CapeP)

      motor.Part0 = CapeP

      motor.Part1 = torso

      motor.MaxVelocity = 0.01

      motor.C0 = CFrame.new(0,1.75,0) * CFrame.Angles(0,math.rad(90),0)

      motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)

      local wave = false

      repeat wait(1/44)

        decal.Transparency = torso.Transparency

        local ang = 0.1

        local oldmag = torso.Velocity.magnitude

        local mv = 0.002

        if wave then

          ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05

          wave = false

        else

          wave = true

        end

        ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)

        motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) + mv

        motor.DesiredAngle = -ang

        if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then

          motor.MaxVelocity = 0.04

        end

        repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1

        if torso.Velocity.magnitude < 0.1 then

          wait(0.1)

        end

      until not CapeP or CapeP.Parent ~= torso.Parent

    end 
