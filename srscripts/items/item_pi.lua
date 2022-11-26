local sexyrooms = SRMod

sexyrooms.PI = Isaac.GetItemIdByName("π")
sexyrooms.COSTUME_PI = Isaac.GetCostumeIdByPath("gfx/characters/907_Pi.anm2")

local PiStats = {
	DAMAGE = 3.14,
	TEARS = 3.14
}

local function tearsUp(firedelay, val)
  local currentTears = 30 / (firedelay + 1)
  local newTears = currentTears + val
  return math.max((30 / newTears) - 1, -0.99)
end

--
--------------------------------------------------------PI--------------------------------------------------------
--
function sexyrooms:onPickup(player, cacheFlag)
	if player:HasCollectible(sexyrooms.PI) then
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage + PiStats.DAMAGE * player:GetCollectibleNum(sexyrooms.PI)
			
		elseif cacheFlag == CacheFlag.CACHE_FIREDELAY then
			local newDelay = tearsUp(player.MaxFireDelay, PiStats.TEARS * player:GetCollectibleNum(sexyrooms.PI))
			player.MaxFireDelay = newDelay
		end
	end
end

sexyrooms:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, sexyrooms.onPickup)

--function sexyrooms:OnUpdate(player)
	--if game:GetFrameCount() == 1 then
	--	sexyrooms.HasPi = false
	--end
	--if not sexyrooms.HasPi and player:HasCollectible(sexyrooms.PI) then				--This shitto is so laggy and stinky :(
	--	player:AddNullCostume(sexyrooms.COSTUME_PI)
	--	sexyrooms.HasPi = true
	--end
--end

--sexyrooms:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, sexyrooms.onUpdate)