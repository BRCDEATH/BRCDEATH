local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("XKL7 BEDWAR HUB", "Ocean")

-- Tabs

local Tab1 = Window:NewTab("Main")
local Tab1Section = Tab1:NewSection("BETA")

-- Buttons/Windows/Idk

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

Tab1Section:NewButton("Inf jump", "", function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)

Tab1Section:NewToggle("Reach", "", function(state)
    if state then
        CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = (reachval["Value"] - 0.0001)
    else
        CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = 14.4
    end
end)

Tab1Section:NewSlider("Range 18-1", "", 18, 1, function(val) -- 500 (MaxValue) | 0 (MinValue)
	reachval["Value"] = val
end)

Tab1Section:NewSlider("Distance 1-20", "Increase killaura distance", 20, 1, function(val)
	DistVal["Value"] = val
end)

Tab1Section:NewToggle("CFrame", "", function(state)
	if state then
		BindToStepped("CFrameWalkSpeed", 1, function(time, delta)
			if entity.isAlive then
				local newpos = (lplr.Character.Humanoid.MoveDirection  * (speedval["Value"] - lplr.Character.Humanoid.WalkSpeed)) * delta

				local raycastparameters = RaycastParams.new()
				raycastparameters.FilterDescendantsInstances = {lplr.Character}
				local ray = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, newpos, raycastparameters)
				if ray then newpos = (ray.Position - lplr.Character.HumanoidRootPart.Position) end
				lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + newpos
			end
		end)
	else
		UnbindFromStepped("CFrameWalkSpeed")
	end
end)

Tab1Section:NewSlider("Speed 1-42", "idk its working but will fix its soon", 42, 1, function(s)
	speedval["Value"] = s
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

local Tab1 = Window:NewTab("auto toxic")
local Tab1Section = Tab1:NewSection("")

Tab1Section:NewButton("Keyboard", "Execute Keyboard Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

Tab1Section:NewButton("Vape (need config)", "op", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
end)

Tab1Section:NewButton("infinite yeield", "op", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

local Tab1 = Window:NewTab("Credits")
local Tab1Section = Tab1:NewSection("Owner of Script LOCKSKULL")
local Tab1Section = Tab1:NewSection("Thank you using my script")

game.StarterGui:SetCore("SendNotification", {
    Title = "XKL7";
    Text = "Made by LOCKSKULL"; -- what the text says (ofc)
    Duration = 60;
})
wait(1)
game.StarterGui:SetCore("SendNotification", {
    Title = "Enjoy";
    Text = "auto Fov"; -- what the text says (ofc)
    Duration = 60;
})

game.Workspace.CurrentCamera.FieldOfView = 170
