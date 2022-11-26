local mod = SRMod


local pig_oink_1 = Isaac.GetSoundIdByName("pig_oink_1")
local pig_oink_2 = Isaac.GetSoundIdByName("pig_oink_2")
local pig_oink_3 = Isaac.GetSoundIdByName("pig_oink_3")
local pig_oink_4 = Isaac.GetSoundIdByName("pig_oink_4")
local pig_oink_5 = Isaac.GetSoundIdByName("pig_oink_5")
local pig_oink_6 = Isaac.GetSoundIdByName("pig_oink_6")

local pig_hihat_1 = Isaac.GetSoundIdByName("pig_hi-hat_1")
local pig_hihat_2 = Isaac.GetSoundIdByName("pig_hi-hat_2")

local pig_death_1 = Isaac.GetSoundIdByName("pig_death_1")
local pig_death_2 = Isaac.GetSoundIdByName("pig_death_2")
local pig_death_3 = Isaac.GetSoundIdByName("pig_death_3")


local Piggy = Isaac.GetEntityTypeByName("Piggy")

PiggyState = {
	APPEAR = 0,
	IDLE = 1,
	BLINK = 2,
	HAPPY = 3

}

PiggyChain = {
	[PiggyState.IDLE] = {0.6, 0.2, 0.2},
	[PiggyState.BLINK] = {0.5, 0, 0.5},
	[PiggyState.HAPPY] = {0.4, 0.2, 0.4}
}

function PiggyTransition(state)
	local roll = math.random()
	for i = 1, #PiggyChain do
		roll = roll - PiggyChain[state][i]
		if roll <= 0 then
			return i
		end
	end
	return #PiggyChain
end


function mod:onPiggy(entity)
	local entity = entity:ToNPC()
	local data = entity:GetData()
	player = Isaac.GetPlayer(0)
	sprite = entity:GetSprite();
	if data.Position == nil then data.Position = entity.Position end
	entity.Velocity = data.Position - entity.Position

	
end

mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, mod.onPiggy, Piggy)

function mod:update(Piggy)
		local data = Piggy:GetData()
		if data.State == nil then data.State = 0 end
		if data.StateFrame == nil then data.StateFrame = 0 end
		local target = Piggy:GetPlayerTarget()
		
		data.StateFrame = data.StateFrame + 1
		
		if data.State == PiggyState.APPEAR and Piggy:GetSprite():IsFinished("Appear") then
		
			data.State = PiggyState.IDLE
			data.StateFrame = 0
		elseif data.State == PiggyState.IDLE then
			if data.StateFrame == 1 then
				Piggy:GetSprite():Play("Idle", true)
			elseif Piggy:GetSprite():IsFinished("Idle") then
				data.State = PiggyTransition(data.State)
				data.StateFrame = 0
			end
			
		elseif data.State == PiggyState.BLINK then
			if data.StateFrame == 1 then
			Piggy:GetSprite():Play("Blink", true)
			elseif Piggy:GetSprite():IsFinished("Blink") then
				data.State = PiggyTransition(data.State)
				data.StateFrame = 0
			end
			
		elseif data.State == PiggyState.HAPPY then
			if data.StateFrame == 1 then
			Piggy:GetSprite():Play("Happy", true)
			elseif Piggy:GetSprite():IsFinished("Happy") then
				data.State = PiggyTransition(data.State)
				data.StateFrame = 0
			end
		end
		
		if Piggy:HasMortalDamage() then
			local roll = math.random(1, 3)
			if roll == 1 then Piggy:PlaySound(pig_death_1, 1, 0, false, 1)
			elseif roll == 2 then Piggy:PlaySound(pig_death_2, 1, 0, false, 1)
			elseif roll == 3 then Piggy:PlaySound(pig_death_3, 1, 0, false, 1)
			end
			Piggy:Die()
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_GRAB_BAG, 1, Vector(Piggy.Position.X, Piggy.Position.Y), Vector(math.random(-3, 3), math.random(-3, 3)), Piggy)
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, 46, Vector(Piggy.Position.X, Piggy.Position.Y), Vector(math.random(-3, 3), math.random(-3, 3)), Piggy)
		end
		
		local roll = math.random(1000)
		if roll == 1 then Piggy:PlaySound(pig_oink_1, 0.4, 0, false, 1)
		elseif roll == 2 then Piggy:PlaySound(pig_oink_2, 0.4, 0, false, 1)
		elseif roll == 3 then Piggy:PlaySound(pig_oink_3, 0.4, 0, false, 1)
		elseif roll == 4 then Piggy:PlaySound(pig_oink_4, 0.4, 0, false, 1)
		elseif roll == 5 then Piggy:PlaySound(pig_oink_5, 0.4, 0, false, 1)
		elseif roll == 6 then Piggy:PlaySound(pig_oink_6, 0.4, 0, false, 1)
		elseif roll == 11 then Piggy:PlaySound(pig_hihat_1, 0.4, 0, false, 1)
		elseif roll == 12 then Piggy:PlaySound(pig_hihat_2, 0.4, 0, false, 1)
		end
end

mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, mod.update, Piggy)