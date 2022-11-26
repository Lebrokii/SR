local sexyrooms = SRMod
local json = require("json")


local Lily = Isaac.GetEntityVariantByName("Harlot Beggar")
local Love = Isaac.GetEntityVariantByName("Love Effect")

local REPLACE_CHANCE = 20 -- as a percent
local BASE_CONCEPTION_CHANCE = 0.1   -- these make the expected cost for
local STEP_CONCEPTION_CHANCE = 0.035 -- a prize equal to 5 cents
local KEEPER_BONUS = 0.5
local KILL_ITEM_CHANCE = 0.03
local REWARD_TABLE = {Clots=3, Manual=1}

local function SaveConfig()
    if ModConfigMenu then
		local config = {}
		config.ReplaceChance = REPLACE_CHANCE
        sexyrooms:SaveData(json.encode(config))
    end
end

if ModConfigMenu then
	ModConfigMenu.AddSetting("Harlot Beggar", "Config", {
		Type = ModConfigMenu.OptionType.NUMBER,
		Default = 20,
		CurrentSetting = function()
			return REPLACE_CHANCE
		end,
		Minimum = 0,
		Maximum = 100,
		Display = function()
			return "Beggar Replacement Chance: " .. tostring(REPLACE_CHANCE) .. "%"
		end,
		OnChange = function(newvalue)
			REPLACE_CHANCE = newvalue
			SaveConfig()
		end
	})
end

function sexyrooms:LoadStorage()
	if ModConfigMenu and sexyrooms:HasData() then
		local config = json.decode(sexyrooms:LoadData())
		REPLACE_CHANCE = config.ReplaceChance
	end
end

local function randomDemonFam(seed)
	return Game():GetItemPool():GetCollectible(ItemPoolType.POOL_BABY_SHOP, true, seed)
end

local function itemObtainable(collectible)
	-- things like the small rock won't show if you've seen it before.
	return true
end

local function preggoLevel(harlot)
	return harlot.SubType
	--if harlot:GetData()["Pregnancy Term"] then return harlot:GetData()["Pregnancy Term"] end
	--return 0
end

local function pityLevel(harlot)
	if harlot:GetData()["Pity Counter"] then return harlot:GetData()["Pity Counter"] end
	return 0
end

local function clotvariant(rand)
	-- 0 is normal, 1 is soul, 2 is demon, 3 is eternal, 4 is gold, 5 is bone, 6 is rotten
	local pool = {Red=20, Soul=5, Demon=2, Eternal=1, Gold=2, Bone=2, Rotten=1}
	local totalWeight = 0
	for k,v in pairs(pool) do
		totalWeight = totalWeight + v
	end
	if rand % totalWeight < pool.Red then
		return 0
	elseif rand % totalWeight < pool.Red + pool.Soul then
		return 1
	elseif rand % totalWeight < pool.Red + pool.Soul + pool.Demon then
		return 2
	elseif rand % totalWeight < pool.Red + pool.Soul + pool.Demon + pool.Eternal then
		return 3
	elseif rand % totalWeight < pool.Red + pool.Soul + pool.Demon + pool.Eternal + pool.Gold then
		return 4
	elseif rand % totalWeight < pool.Red + pool.Soul + pool.Demon + pool.Eternal + pool.Gold + pool.Bone then -- is there a better way?
		return 5
	else
		return 6
	end
end

local function playerToNum(player)
	for num = 0, Game():GetNumPlayers()-1 do
		if GetPtrHash(player) == GetPtrHash(Isaac.GetPlayer(num)) then return num end
	end
end

local function lesserReward(rand, playernum)
	if not playernum then player = Isaac.GetPlayer(0)
	else player = Isaac.GetPlayer(playernum) end
	local totalWeight = 0
	for k,v in pairs(REWARD_TABLE) do
		totalWeight = totalWeight + v
	end
	if rand % totalWeight < REWARD_TABLE.Clots then
		-- clots
		local clotnum = (rand % 3) + 1
		local randm = RNG()
		randm:SetSeed(rand, 35)
		for i=1, clotnum do
			local spawnpos = player.Position + Vector.FromAngle(math.random(360)):Resized(5)
			Isaac.Spawn(EntityType.ENTITY_FAMILIAR, FamiliarVariant.BLOOD_BABY, clotvariant(randm:Next()), spawnpos, Vector.Zero, player)
		end
	else
		-- manual
		player:UseActiveItem(CollectibleType.COLLECTIBLE_MONSTER_MANUAL, UseFlag.USE_NOANIM)
	end
end

local function preggoBoost(harlot)
	--if not harlot:GetData()["Pregnancy Term"] then harlot:GetData()["Pregnancy Term"] = 0 end
	--harlot:GetData()["Pregnancy Term"] = harlot:GetData()["Pregnancy Term"] + 1
	harlot.SubType = harlot.SubType + 1
	--[[if preggoLevel(harlot) == 0 then
		harlot:GetSprite():ReplaceSpritesheet(0, "gfx/items/slots/gets.png")
	elseif preggoLevel(harlot) == 1 then
		harlot:GetSprite():ReplaceSpritesheet(0, "gfx/items/slots/more.png")
	else
		harlot:GetSprite():ReplaceSpritesheet(0, "gfx/items/slots/pregnant.png")
	end]]
end

local function pityBoost(harlot)
	if not harlot:GetData()["Pity Counter"] then harlot:GetData()["Pity Counter"] = 0 end
	harlot:GetData()["Pity Counter"] = harlot:GetData()["Pity Counter"] + 1
end

local function pityReset(harlot)
	harlot:GetData()["Pity Counter"] = nil
end

local function rewardSpawnPosition(pos, beneath)
	local room = Game():GetRoom()
	if beneath then
		local harlotGrid = room:GetGridIndex(pos)
		local beneath = harlotGrid + room:GetGridWidth()
		return Game():GetRoom():FindFreePickupSpawnPosition(room:GetGridPosition(beneath))
	else
		local gridpos = room:GetGridIndex(pos)
		return room:GetGridPosition(gridpos)
	end
end

local function spawnItem(collectible, pos)
	Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, collectible, pos, Vector.Zero, nil)
end

local function killLill(ent)
	if ent.Type == EntityType.ENTITY_SLOT and ent.Variant == Lily then
		-- make the splotchy sound effect
		local rand = ent:GetDropRNG():RandomFloat()
		local spawnpos = rewardSpawnPosition(ent.Position, false)
		ent:Kill()
		ent:Remove()
		if itemObtainable(CollectibleType.COLLECTIBLE_CAMBION_CONCEPTION) and rand < KILL_ITEM_CHANCE then
			spawnItem(CollectibleType.COLLECTIBLE_CAMBION_CONCEPTION, spawnpos)
		end
		Game():GetLevel():SetStateFlag(LevelStateFlag.STATE_BUM_KILLED, true)
	end
end

function sexyrooms:convertSomesexyrooms(entype, var, subtype, grindex, seed)
	--[[if entype == EntityType.ENTITY_SLOT and var == Lily then
		-- Lily is spawning!
	end]]
	if entype == EntityType.ENTITY_SLOT and var == 4 then -- 4 is beggar; rip enums
		local rand = RNG()
		rand:SetSeed(seed, 35)
		local ran = rand:RandomFloat()
		if ran < REPLACE_CHANCE/100 then
			-- turn it to a lily!
			return {EntityType.ENTITY_SLOT, Lily, 0}
		end
	end
end

function sexyrooms:initialisesexyrooms()
	local harlots = Isaac.FindByType(EntityType.ENTITY_SLOT, Lily)
	for _,harlot in pairs(harlots) do
		harlot:GetSprite():Play("Idle")
	end
end

function beggarDropOdds(beggar, isKeeper)
	local rand = beggar:GetDropRNG():RandomFloat()
	local success = false
	-- if Game().Difficulty == Difficulty.DIFFICULTY_HARD then ticks = ticks - 6 end
	if isKeeper then
		success = rand < (BASE_CONCEPTION_CHANCE + pityLevel(beggar) * STEP_CONCEPTION_CHANCE) * (1+KEEPER_BONUS)
	else
		success = rand < BASE_CONCEPTION_CHANCE + pityLevel(beggar) * STEP_CONCEPTION_CHANCE
	end
	if success then
		pityReset(beggar)
		return true
	else
		pityBoost(beggar)
		return false
	end
end

function sexyrooms:donation(player, beggar, low)
	if beggar.Type == EntityType.ENTITY_SLOT and beggar.Variant == Lily then
		-- player has touched a lily!
		if beggar:GetSprite():IsPlaying("Idle") and player:GetNumCoins() > 0 then
			--player:ResetDamageCooldown()
			--player:TakeDamage(1, DamageFlag.DAMAGE_RED_HEARTS, EntityRef(beggar), 0)
			player:AddCoins(-1)
			SFXManager():Play(SoundEffect.SOUND_SCAMPER, 1.0, 0, false, 1.0)
			--local splash = Isaac.Spawn(EntityType.ENTITY_TEAR, TearVariant.EGG, 0, beggar.Position, Vector.Zero, beggar)
			--splash:ToTear().Height = 10
			if beggarDropOdds(beggar, player:GetPlayerType() == PlayerType.PLAYER_KEEPER or player:GetPlayerType() == PlayerType.PLAYER_KEEPER_B) then
				beggar:GetSprite():Play("PayPrize")
				beggar:GetData()["Playing Player"] = playerToNum(player)
				if player:GetPlayerType() == PlayerType.PLAYER_THESOUL_B then
					beggar:GetData()["Playing Player"] = playerToNum(player:GetMainTwin())
				end
			else
				beggar:GetSprite():Play("PayNothing")
			end
		end
	end
end

function sexyrooms:youForcedMeToDoThis()
	local harlots = Isaac.FindByType(EntityType.ENTITY_SLOT, Lily)
	for _,harlot in pairs(harlots) do
		if harlot:GetSprite():IsFinished("PayNothing") then harlot:GetSprite():Play("Idle")	end
		if harlot:GetSprite():IsFinished("PayPrize") then harlot:GetSprite():Play("Prize") end
		if harlot:GetSprite():IsFinished("Prize") then
			if preggoLevel(harlot) >= 3 then
				harlot:GetSprite():Play("Teleport")
				--harlot:GetSprite():ReplaceSpritesheet(0, "gfx/items/slots/gets.png")
			else
				harlot:GetSprite():Play("Idle")
				harlot:GetData()["Playing Player"] = nil
			end
		end
		if harlot:GetSprite():IsFinished("Teleport") then
			harlot:Remove()
		end
		if harlot:GetSprite():IsEventTriggered("Prize") then
			preggoBoost(harlot)
			if preggoLevel(harlot) >= 3 then
				local prizepos = rewardSpawnPosition(harlot.Position, true)
				spawnItem(randomDemonFam(harlot.DropSeed), prizepos)
				SFXManager():Play(SoundEffect.SOUND_SLOTSPAWN, 1.0, 0, false, 1.0)
			else
				lesserReward(harlot:GetDropRNG():Next(), harlot:GetData()["Playing Player"])
				SFXManager():Play(SoundEffect.SOUND_SLOTSPAWN, 1.0, 0, false, 1.0)
			end
		end
		if harlot:GetSprite():IsEventTriggered("Disappear") then
			harlot.EntityCollisionClass = EntityCollisionClass.ENTCOLL_NONE
			SFXManager():Play(SoundEffect.SOUND_KISS_LIPS1, 1.0, 0, false, 1.0)
		end
		if harlot:GetSprite():IsEventTriggered("Happy") then
			Isaac.Spawn(EntityType.ENTITY_EFFECT, Love, 0, harlot.Position+Vector(0,1), Vector.Zero, harlot)
		end
	end
	local explosions = Isaac.FindByType(EntityType.ENTITY_EFFECT, EffectVariant.BOMB_EXPLOSION)
	for _,plosion in pairs(explosions) do
		local frame = plosion:GetSprite():GetFrame()
		if frame < 3 then -- I'm afraid of 60 vs 30 breaking an exact check
			local size = plosion.SpriteScale.X -- default is 1, can be increased
			local nearby = Isaac.FindInRadius(plosion.Position, 75*size)
			for _,v in pairs(nearby) do
				killLill(v)
			end
		end
	end
end

function sexyrooms:loveAnimate(effect)
	if effect:GetSprite():IsFinished("Charm") then effect:Remove() end
end

--sexyrooms:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, sexyrooms.LoadStorage)
--sexyrooms:AddCallback(ModCallbacks.MC_PRE_ROOM_ENTITY_SPAWN, sexyrooms.convertSomesexyrooms)
sexyrooms:AddCallback(ModCallbacks.MC_PRE_PLAYER_COLLISION, sexyrooms.donation)
sexyrooms:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, sexyrooms.initialisesexyrooms)
sexyrooms:AddCallback(ModCallbacks.MC_POST_UPDATE, sexyrooms.youForcedMeToDoThis)
sexyrooms:AddCallback(ModCallbacks.MC_POST_EFFECT_UPDATE, sexyrooms.loveAnimate, Love)