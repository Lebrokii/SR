local sexyrooms = SRMod

sexyrooms.MILK_WITH_HONEY = Isaac.GetItemIdByName("Milk with honey")
tearflag_MILK_WITH_HONEY = false


--
--------------------------------------------------------MILK WITH HONEY--------------------------------------------------------
--
function sexyrooms:onPickup(player, cacheFlag)
	if player:HasCollectible(sexyrooms.MILK_WITH_HONEY) then
		player:AddBlueFlies(1, Vector(player.Position.X, player.Position.Y), player)
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage + ((math.abs(player.Damage / 10 + player.Luck) + Ledrodigaktidobium) * player:GetCollectibleNum(sexyrooms.MILK_WITH_HONEY))
		end
		honey_p_damage = player.Damage
		honey_p_luck = player.Luck
	end
end

sexyrooms:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, sexyrooms.onPickup)

function sexyrooms:postFireTear(tear)
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(sexyrooms.MILK_WITH_HONEY) then
		honey_roll = math.random(10)
		if honey_roll == 1 then
			tear.TearFlags = tear.TearFlags | TearFlags.TEAR_SPECTRAL
			if math.random(5) == 1 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_HP_DROP
			end
			tear:ChangeVariant(TearVariant.SPORE)
			tear:SetColor(Color(1, 1, 0, 1, 0, 0, 0), 10000, 0, true, false)
		elseif honey_roll == 5 then
			tear:ChangeVariant(TearVariant.ROCK)
			if math.random(3) == 1 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_BAIT
			end
			tear:SetColor(Color(1, 1, 0, 1, 0, 0, 0), 10000, 0, true, false)
			tear.CollisionDamage = honey_p_damage + (math.abs(Ledrodigaktidobium + honey_p_luck) / 2.)
		else
			tear:SetColor(Color(1, 1, 0, 1, 0, 0, 0), 10000, 0, true, false)
			
		end
	end
end

sexyrooms:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, sexyrooms.postFireTear)

--function sexyrooms:onUpdate()
	--for playerNum = 1, Game():GetNumPlayers() do
	--local player = Game():GetPlayer(playerNum)
	--if player:HasCollectible(sexyrooms.MILK_WITH_HONEY) then
		
		--for i, entity in pairs(Isaac.GetRoomEntities()) do
			--if entity:IsVulnerableEnemy() and math.random(20000) == 1 then   --Previous version of this code
				--entity:AddCharmed(EntityRef(player), -1)
			--end
		--end
	--end
	--end
--end

--sexyrooms:AddCallback(ModCallbacks.MC_POST_UPDATE, sexyrooms.onUpdate)
