local sexyrooms = SRMod


local music = MusicManager()
local sfx = SFXManager()

local shot = Isaac.GetSoundIdByName("Glasses_Bullet")

sexyrooms.AMA_DA_ONE = Isaac.GetItemIdByName("Ama da one")

Music.AMA_DA_ONE = Isaac.GetMusicIdByName("AMA DA ONE")
Music.AMA_DA_ONE_2 = Isaac.GetMusicIdByName("AMA DA ONE 2")
Music.AMA_DA_ONE_3 = Isaac.GetMusicIdByName("AMA DA ONE 3")
Music.AMA_DA_ONE_4 = Isaac.GetMusicIdByName("AMA DA ONE 4")
Music.AMA_DA_ONE_BOSS = Isaac.GetMusicIdByName("AMA DA ONE BOSS")

--tearflag_AMA_DA_ONE = false



--
--------------------------------------------------------AMA DA ONE--------------------------------------------------------
--
function sexyrooms:onPickup(player, cacheFlag)
	if player:HasCollectible(sexyrooms.AMA_DA_ONE) then
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = 1
		end
		if cacheFlag == CacheFlag.CACHE_SPEED then
			player.MoveSpeed = 1
		end
		if player:HasCollectible(CollectibleType.COLLECTIBLE_DR_FETUS) or 
		player:HasCollectible(CollectibleType.COLLECTIBLE_TECHNOLOGY) or 
		player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) or 
		player:HasCollectible(CollectibleType.COLLECTIBLE_EPIC_FETUS) or 
		player:HasCollectible(CollectibleType.COLLECTIBLE_TECH_X) or 
		player:HasCollectible(CollectibleType.COLLECTIBLE_SPIRIT_SWORD) then
			if cacheFlag == CacheFlag.CACHE_DAMAGE then
				player.Damage = 666
			end
		end
	end
end

sexyrooms:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, sexyrooms.onPickup)

function sexyrooms:postFireTear(tear)
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(sexyrooms.AMA_DA_ONE) then
			sfx:Play(shot, 1, 2, false, 1, 0)
			tear.TearFlags = tear.TearFlags | TearFlags.TEAR_SPECTRAL
			tear:ChangeVariant(TearVariant.SWORD_BEAM)
			tear:SetColor(Color(0, 0, 0, 1, 0, 0, 0), 10000, 0, true, false)
			tear.CollisionDamage = 200000

			
	end
end

sexyrooms:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, sexyrooms.postFireTear)

AMA_DA_ONE_Spawned = false

function sexyrooms:onUpdate(player)
	player = Isaac.GetPlayer(0)
	local rng = player:GetCollectibleRNG(sexyrooms.AMA_DA_ONE)
	local roll = rng:RandomInt(102)
	
		if player:HasCollectible(sexyrooms.AMA_DA_ONE) and music:GetCurrentMusicID() == Music.MUSIC_BOSS_RUSH or music:GetCurrentMusicID() == Music.MUSIC_BOSS or music:GetCurrentMusicID() == Music.MUSIC_BOSS2 or music:GetCurrentMusicID() == Music.MUSIC_BOSS3 or music:GetCurrentMusicID() == Music.MUSIC_VOID_BOSS or music:GetCurrentMusicID() == Music.MUSIC_HUSH_BOSS or music:GetCurrentMusicID() == Music.MUSIC_ISAAC_BOSS or music:GetCurrentMusicID() == Music.MUSIC_SATAN_BOSS then
			if music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_4 and player:HasCollectible(sexyrooms.AMA_DA_ONE) then
				--roll = 80
				music:Play(Music.AMA_DA_ONE_4, 0.4)
			end
			
		
		elseif player:HasCollectible(sexyrooms.AMA_DA_ONE) and roll < 24 and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_2 and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_3 and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_4 and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_BOSS then
			if music:GetCurrentMusicID() ~= Music.AMA_DA_ONE then
				roll = 10
				music:Play(Music.AMA_DA_ONE, 0.2)
			end
			
		elseif player:HasCollectible(sexyrooms.AMA_DA_ONE) and roll >= 24 and 58 > roll and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_3 and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_4 and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_BOSS then
			if music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_2 then
				roll = 30
				music:Play(Music.AMA_DA_ONE_2, 0.2)
			end
			
		elseif player:HasCollectible(sexyrooms.AMA_DA_ONE) and roll >= 58 and 92 > roll and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_2 and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_4 and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_BOSS then
			if music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_3 then
				roll = 60
				music:Play(Music.AMA_DA_ONE_3, 0.2)
			end
			
		elseif player:HasCollectible(sexyrooms.AMA_DA_ONE) and roll >= 92 and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_2 and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_3 and music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_BOSS then
			if music:GetCurrentMusicID() ~= Music.AMA_DA_ONE_4 then
				roll = 102
				music:Play(Music.AMA_DA_ONE_4, 0.2)
			end
		
		end
		
	if cheat_mode == true then
		if Game():GetFrameCount() == 15 and AMA_DA_ONE_Spawned == false then
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, sexyrooms.AMA_DA_ONE, Vector(320,220), Vector(0,0), nil)
			AMA_DA_ONE_Spawned = true
		end
	end
end

sexyrooms:AddCallback(ModCallbacks.MC_POST_RENDER, sexyrooms.onUpdate)


--music:GetCurrentMusicID() ~= Music.AMA_DA_ONE and