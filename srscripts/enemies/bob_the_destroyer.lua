local mod = SRMod


local Bob = Isaac.GetEntityTypeByName("Bob The Destroyer")

BobState = {
	APPEAR = 0,
	IDLE = 1,
	DEATH = 2

}



function mod:onBob(entity)
	local entity = entity:ToNPC()
	local data = entity:GetData()
	
	sprite = entity:GetSprite();
	if data.Position == nil then data.Position = entity.Position end
	entity.Velocity = data.Position - entity.Position
end

mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, mod.onBob, Bob)


function mod:Update(Bob)
	local data = Bob:GetData()
	if data.State == nil then data.State = 0 end
	if data.StateFrame == nil then data.StateFrame = 0 end
	local target = Bob:GetPlayerTarget()
	
	data.StateFrame = data.StateFrame + 1
	
	if Bob:GetSprite():IsFinished("Appear") then
		bomb_abuse = math.random(35)
		if bomb_abuse == 1 then
			local pos = Isaac.GetFreeNearPosition(Bob.Position, -80)
			Isaac.Spawn(EntityType.ENTITY_BOOMFLY, 0, 0, Vector((Bob.Position.X + math.random(-50, 50)), Bob.Position.Y), Vector(0, 0), Bob)
			--Isaac.Spawn(EntityType.ENTITY_BOMB, BombVariant.BOMB_TROLL, BombSubType.BOMB_TROLL, Vector(Bob.Position.X, Bob.Position.Y), Vector(math.random(-6, 6), 4), Bob)
		end
	end
	-- if data.State == BobState.APPEAR and Bob:GetSprite():IsFinished("Appear") then
		
			-- data.State = BobState.IDLE
			-- data.StateFrame = 0
		-- elseif data.State == BobState.IDLE then
			-- if data.StateFrame == 1 then
				-- Bob:GetSprite():Play("Idle", true)
			-- elseif Bob:GetSprite():IsFinished("Idle") then
				--data.State = BobTransition(data.State)
				-- data.StateFrame = 0
			-- end
	-- end

end

mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, mod.Update, Bob)