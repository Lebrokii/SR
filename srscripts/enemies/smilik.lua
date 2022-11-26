local mod = SRMod


local Smilik = Isaac.GetEntityTypeByName("Smilik")

SmilikState = {
	APPEAR = 0,
	IDLE = 1,
	WOW = 2

}

SmilikChain = {
	[SmilikState.IDLE] = {0.8, 0.2},
	[SmilikState.WOW] = {1, 0}
}

function SmilikTransition(state)
	local roll = math.random()
	for i = 1, #SmilikChain do
		roll = roll - SmilikChain[state][i]
		if roll <= 0 then
			return i
		end
	end
	return #SmilikChain
end

function playerToNum(player)
	for num = 0, Game():GetNumPlayers()-1 do
		if GetPtrHash(player) == GetPtrHash(Isaac.GetPlayer(num)) then return num end
	end
end




local MaxPlayers = 0
function mod:onSmilik(entity)
	local entity = entity:ToNPC()
	local data = entity:GetData()
	--player = Isaac.GetPlayer(0)
	sprite = entity:GetSprite();
	if data.Position == nil then data.Position = entity.Position end
	entity.Velocity = data.Position - entity.Position
	
	
	local playerCount = Game():GetNumPlayers()
			if playerCount >= MaxPlayers then
				for i = playerCount-1,MaxPlayers,1 do
					local player = Isaac.GetPlayer(i)
						if (entity.Position - player.Position):Length() <= entity.Size + player.Size then
							player:AnimateHappy()
						end
						
						--if entity:HasMortalDamage() then player:AnimateSad() end
				end
			end
	MaxPlayers = playerCount
	           -- if (entity.Position - player.Position):Length() <= entity.Size + player.Size then
				--	player:AnimateHappy()
				--end
	
	
	--local MaxPlayers = 1
    --local playerCount = Game():GetNumPlayers()	
    --if playerCount >= MaxPlayers then		
        ---for h = playerCount-1,MaxPlayers,1 do			
            --local player = Isaac.GetPlayer(h)
            	--if (entity.Position - player.Position):Length() <= entity.Size + player.Size then
					--player:AnimateHappy()
				--end
       -- end
    --end
   -- MaxPlayers = playerCount
end
	-- if (entity.Position - player.Position):Length() <= entity.Size + player.Size then
		-- player:AnimateHappy()
	-- end

mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, mod.onSmilik, Smilik)
 
-- function moveLogic(npc)
    -- angle = math.random(1,360);
    -- direction = Vector.FromAngle(angle);
    
    -- --debugText = direction.X;
    -- if(npc.Velocity.X < 0.001 and npc.Velocity.Y < 0.001) then
        -- npc:AddVelocity(direction:__mul(10));
    -- end
-- end
 
function mod:update(Smilik)
		local data = Smilik:GetData()
		if data.State == nil then data.State = 0 end
		if data.StateFrame == nil then data.StateFrame = 0 end
		local target = Smilik:GetPlayerTarget()
		
		data.StateFrame = data.StateFrame + 1
		
		if data.State == SmilikState.APPEAR and Smilik:GetSprite():IsFinished("Appear") then
			data.State = SmilikState.IDLE
			data.StateFrame = 0
		elseif data.State == SmilikState.IDLE then
			if data.StateFrame == 1 then
				Smilik:GetSprite():Play("Idle", true)
			elseif Smilik:GetSprite():IsFinished("Idle") then
				data.State = SmilikTransition(data.State)
				data.StateFrame = 0
			end
		elseif data.State == SmilikState.WOW then
			if data.StateFrame == 1 then
			Smilik:GetSprite():Play("Wow", true)
			elseif Smilik:GetSprite():IsFinished("Wow") then
				data.State = SmilikTransition(data.State)
				data.StateFrame = 0
			end
		end
end

mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, mod.update, Smilik)



