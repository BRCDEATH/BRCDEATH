local player = game.Players.LocalPlayer
			local chr = player.Character
			repeat wait() until player and player.Character and player.Character:FindFirstChild("Humanoid")
			if player.Character:FindFirstChild("Torso") then
				torso = player.Character.Torso
			else
				torso = player.Character.UpperTorso
			end
			local p = Instance.new("Part",torso.Parent)
			p.Name = "AstraCape"
			p.Anchored = false
			p.CanCollide = false
			p.TopSurface = 0
			p.BottomSurface = 0
			p.Color = Color3.fromRGB(100,40,200)
			p.FormFactor = "Custom"
			p.Size = Vector3.new(0.2,0.2,0.2)
			local msh = Instance.new('BlockMesh',p)
			msh.Scale = Vector3.new(9,16.7,0.5)
			local motor = Instance.new("Motor",p)
			local fakepart = Instance.new("Part",p)
			local decal = Instance.new("Decal",fakepart)
			fakepart.Size = Vector3.new(2.2, 3.4, 0.375)
			p.Material = "Neon"
			decal.Face = "Back"
			local weld = Instance.new("WeldConstraint",p)
			fakepart.CFrame = msh.Parent.CFrame
			fakepart.Transparency = 1
			fakepart.CanCollide = false
			weld.Part0 = msh.Parent
			weld.Part1 = fakepart
			motor.Part0 = p
			motor.Part1 = torso
			motor.MaxVelocity = 0.01
			motor.C0 = CFrame.new(0,1.9,0) * CFrame.Angles(0,math.rad(90),0)
			motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
			local wave = false
			local id2 = "9087127577"
			local part = Instance.new("Part",p)
			part.Size = Vector3.new(2.009, 2.8, 0.374)
			part.CFrame = p.CFrame
			part.Transparency = 1
			part.CanCollide = false
			part.Massless = true
			repeat wait(1/44)
				--decal.Texture = "rbxassetid://8668851598"
				local ang = 0.1
				local oldmag = torso.Velocity.magnitude
				local mv = 0.002
				if wave then
					ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
					wave = false
				else
					wave = true
				end
				ang = ang + math.min(torso.Velocity.magnitude/11,0.5)
				motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) + mv
				motor.DesiredAngle = -ang
				if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
					motor.MaxVelocity = 0.04
				end
				repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
				if torso.Velocity.magnitude < 0.1 then
					wait(0.1)
				end
			until not p or p.Parent ~= torso.Parent
