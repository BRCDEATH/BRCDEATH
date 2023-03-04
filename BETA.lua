local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()

local Window = Library.CreateLib("NEONBED", "Ocean")

local Tab1 = Window:NewTab("Main")

local Tab1Section = Tab1:NewSection("")

Tab1Section:NewToggle("Killaura", "Killaura", function(state)--moon

    if state then

        local anims = { --Moon stuff that was probably helped by vape no cap

            Normal = {

                {CFrame = CFrame.new(1, -1, 2) * CFrame.Angles(math.rad(295), math.rad(55), math.rad(290)), Time = 0.25},

                {CFrame = CFrame.new(-1, 1, -2.2) * CFrame.Angles(math.rad(200), math.rad(60), math.rad(1)), Time = 0.25}

            },

        }

        local origC0 = cam.Viewmodel.RightHand.RightWrist.C0

        local ui2 = Instance.new("ScreenGui")

        local nearestID = nil

        ui2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

        target = nil

        repeat

                if not isalive(lplr) then

                    repeat wait() until isalive(lplr)

                end

                for _,v in pairs(game.Players:GetPlayers()) do

                    if v ~= lplr then

                        nearestID = v

                        target = v.Name

                        if v.Team ~= lplr.Team and v ~= lplr and isalive(v) and v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 20 then

                            local sword = getSword()

                            if sword ~= nil then

                                bedwars["SwordController"].lastAttack = game:GetService("Workspace"):GetServerTimeNow() - 0.11

                                HitRemote:SendToServer({

                                    ["weapon"] = sword.tool,

                                    ["entityInstance"] = v.Character,

                                    ["validate"] = {

                                        ["raycast"] = {

                                            ["cameraPosition"] = hashFunc(cam.CFrame.Position),

                                            ["cursorDirection"] = hashFunc(Ray.new(cam.CFrame.Position, v.Character:FindFirstChild("HumanoidRootPart").Position).Unit.Direction)

                                        },

                                        ["targetPosition"] = hashFunc(v.Character:FindFirstChild("HumanoidRootPart").Position),

                                        ["selfPosition"] = hashFunc(lplr.Character:FindFirstChild("HumanoidRootPart").Position + ((lplr.Character:FindFirstChild("HumanoidRootPart").Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude > 14 and (CFrame.lookAt(lplr.Character:FindFirstChild("HumanoidRootPart").Position, v.Character:FindFirstChild("HumanoidRootPart").Position).LookVector * 4) or Vector3.new(0, 0, 0)))

                                    },

                                    ["chargedAttack"] = {["chargeRatio"] = 0.8}

                                })

                            end

                        end

                    end

                end

            task.wait(0.12)

        until not Enabled

    else

        Enabled = false

    end

end)

Tab1Section:NewToggle("Velocity", "Anti knockback", function(state)--springs

    if state then

        KnockbackTable["kbDirectionStrength"] = 0

		KnockbackTable["kbUpwardStrength"] = 0    else

        KnockbackTable["kbDirectionStrength"] = 100

		KnockbackTable["kbUpwardStrength"] = 100

    end

end)

Tab1Section:NewToggle("CFrame", "lol", function(state)--springs

    if state then

        local Speed = 0.22

			_G.Speed1 = true

			local You = game.Players.LocalPlayer.Name

			local UIS = game:GetService("UserInputService")

			while _G.Speed1 do wait()

			if UIS:IsKeyDown(Enum.KeyCode.W) then

				game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(0,0,-Speed)

			end;

			if UIS:IsKeyDown(Enum.KeyCode.A) then

				game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(-Speed,0,0)

			end;

			if UIS:IsKeyDown(Enum.KeyCode.S) then

				game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(0,0,Speed)

			end;

			if UIS:IsKeyDown(Enum.KeyCode.D) then

				game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(Speed,0,0)

			end;

		end

    else

		_G.Speed1 = false

    end

end)

Tab1Section:NewToggle("AcSpeed", "HeatSeeker lol", function(state)--springs

    if state then

        _G.HeatSeeker = true

        while _G.HeatSeeker do

            lplr.Character.Humanoid.WalkSpeed = 120

            wait(0.05)

            lplr.Character.Humanoid.WalkSpeed = 0

            wait()

            lplr.Character.Humanoid.WalkSpeed = 16

            wait(0.8)

        end

    else

        _G.HeatSeeker = false

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
