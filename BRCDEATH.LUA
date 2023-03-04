local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()

local Window = Library.CreateLib("NEONBED", "Bloodtheme")

local Tab1 = Window:NewTab("Main")

local Tab1Section = Tab1:NewSection("")

Tab1Section:NewButton("Kill Aura","",function()

local player = game:GetService("Players")

local lplr = player.LocalPlayer

local cam = workspace.CurrentCamera

local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)

local SwordCont = KnitClient.Controllers.SwordController

local aura = true

local DistVal = {["Value"] = 14}

function Aura()

	for i,v in pairs(game.Players:GetChildren()) do		if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then

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

Tab1Section:NewToggle("BedAura", "Bed Aura", function(state)

    if state then

        repeat

            task.wait(0.1)

            if isalive(lplr) and lplr.Character:FindFirstChild("Humanoid").Health > 0.1 then

                local beds = getbeds()

                for i,v in pairs(beds) do

                    local mag = (v.Position - lplr.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude

                    if mag < Distance["Value"] then

                        game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.DamageBlock:InvokeServer({

                            ["blockRef"] = {

                                ["blockPosition"] = getserverpos(v.Position)

                            },

                            ["hitPosition"] = getserverpos(v.Position),

                            ["hitNormal"] = getserverpos(v.Position)

                        })

                    end

                end

            end

        until not Enabled

    else

        Enabled = false

    end

end)

UtilitySection:NewToggle("Antivoid", "Antivoid", function(state)

    if state then

        local e = Instance.new("Part",workspace)

		e.Size = Vector3.new(99999999,2,999999999999)

		e.Position = Vector3.new(0,20,0)

		e.Anchored = true

		e.BrickColor = BrickColor.new("Royal purple")

		e.Transparency = 0.5

		local function PlayerTouched(Part)

			local Parent = Part.Parent

			if game.Players:GetPlayerFromCharacter(Parent) then

				for i = 1,3 do wait()

					Parent.HumanoidRootPart.CFrame = Parent.HumanoidRootPart.CFrame + Vector3.new(0,25,0)

				end

			end

		end

		e.Touched:connect(PlayerTouched)

    else

        e:Destroy()

    end

end)

Tab1Section:NewToggle("Antivoid", "Antivoid", function(state)

    if state then

        local e = Instance.new("Part",workspace)

		e.Size = Vector3.new(99999999,2,999999999999)

		e.Position = Vector3.new(0,20,0)

		e.Anchored = true

		e.BrickColor = BrickColor.new("Royal purple")

		e.Transparency = 0.5

		local function PlayerTouched(Part)

			local Parent = Part.Parent

			if game.Players:GetPlayerFromCharacter(Parent) then

				for i = 1,3 do wait()

					Parent.HumanoidRootPart.CFrame = Parent.HumanoidRootPart.CFrame + Vector3.new(0,25,0)

				end

			end

		end

		e.Touched:connect(PlayerTouched)

    else

        e:Destroy()

    end

end)

Tab1Section:NewToggle("Velocity", "Anti knockback", function(state)--springs

    if state then

        KnockbackTable["kbDirectionStrength"] = 0

		KnockbackTable["kbUpwardStrength"] = 0

    else

        KnockbackTable["kbDirectionStrength"] = 100

		KnockbackTable["kbUpwardStrength"] = 100

    end

end)

Tab1Section:NewToggle("NoFall", "NoFall", function(state)

    if state then

        while true do

            wait()

            game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.GroundHit:FireServer()

        end

    else

        print("hi")

    end

end)

local tableofrandom = {"8C403AE6-9477-4CA1-832C-B5975D0F0C49","EB8A0EF1-FF95-48C5-BDB0-E6C218230C63","81B43368-D44E-4662-B4AB-B3564A78A155", "6823994F-EDB0-4494-AD45-D248EC4CD070", "83E8CB3C-33B5-4ECB-A4A2-86121EE0E17C"}

local users = {}

local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

function getID(plr)

	for _,v in pairs(users) do

		if v == plr.Name then

			return true

		end

	end

	return false

end

function whitelisted()

	for _,v in pairs(tableofrandom) do

		if v == HWID then

			return true

		end

	end

	return false

end

notify("Has succesfully loaded!", "NEONBED", 3)
