local mod = SRMod

--local npc = Isaac.GetEntityTypeByName("Mouse")

function mod:mouseAI(npc)
	local sprite = npc:GetSprite()
	local data = npc:GetData()
	local target = npc:GetPlayerTarget()
	local rand = npc:GetDropRNG()

	if not data.init then
		if Options.MouseControl == false then
			data.state = "mouse (angry)"
		else
			data.state = "mouse (placated)"
		end
		data.rageTimer = 0
		data.init = true
	else
		npc.StateFrame = npc.StateFrame+1
	end

	if npc.Velocity.X > 0 then
		sprite.FlipX = true
	else
		sprite.FlipX = false
	end

	if data.state == "mouse (angry)" then
		mod:spritePlay(sprite, "Walk")
		npc.Velocity = mod:Lerp(npc.Velocity, (target.Position-npc.Position):Resized(14), 0.3)
		npc:SetColor(Color(1, 1, 1, 1, 200/255, 0, 0), 999, 1, true, false)
	elseif data.state == "mouse (placated)" then
		local mouse = Input.GetMousePosition(true)
		if npc.Position:Distance(mouse) > 50 then
			npc.Velocity = mod:Lerp(npc.Velocity, (mouse-npc.Position):Resized(14), 0.3)
			npc:SetColor(Color(1, 1, 1, 1, data.rageTimer/255, 0, 0), 999, 1, true, false)
			if data.rageTimer > 0 then
				data.rageTimer = data.rageTimer-1
			end
			mod:spritePlay(sprite, "Walk")
		else
			mod:spritePlay(sprite, "Idle")
			npc.Velocity = mod:Lerp(npc.Velocity, Vector.Zero, 0.3)
			npc:SetColor(Color(1, 1, 1, 1, data.rageTimer/255, 0, 0), 999, 1, true, false)
			data.rageTimer = data.rageTimer+1
			if data.rageTimer > 200 then
				data.state = "mouse (angry)"
			elseif data.rageTimer > 50 then
				if npc.StateFrame % 14 == 0 then
					local dir = Vector(0,50):Rotated(rand:RandomInt(360))
					Isaac.Spawn(4, 3, 0, npc.Position+dir, dir:Resized(15), npc)
				end
			end
		end
	end
end

function mod:mouseHurt(npc, damage, flag, source)
	if flag & DamageFlag.DAMAGE_EXPLOSION ~= 0 and source.Entity.SpawnerEntity and source.Entity.SpawnerEntity.Type == 114 and source.Entity.SpawnerEntity.Variant == 1000 then
		return false
	end
end
mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, mod.MouseAI, mod.mouseHurt)

