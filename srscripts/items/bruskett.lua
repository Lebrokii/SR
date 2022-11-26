local sexyrooms = SRMod

sexyrooms.BRUSKETT = Isaac.GetItemIdByName("bruskett")

--
--------------------------------------------------------BRUSKETT--------------------------------------------------------
--
function sexyrooms:onUpdate()
  if Game():GetFrameCount() == 1 then
    sexyrooms.HasoneBruskett = false --bruskett effect to zero--
    sexyrooms.HastwoBruskett = false --two bruskett's effect to zero--
    sexyrooms.HasthreeBruskett = false --three bruskett's effect to zero--
  end
  
  for playerNum = 1, Game():GetNumPlayers() do
		local player = Game():GetPlayer(playerNum)
    
    if player:HasCollectible(sexyrooms.BRUSKETT) then
      if not sexyrooms.HasoneBruskett then
        if not sexyrooms.HastwoBruskett then
          if not sexyrooms.HasthreeBruskett then
            sexyrooms.HasoneBruskett = true
            sexyrooms.HastwoBruskett = false
            sexyrooms.HasthreeBruskett = false
          end
        end
      end
    end
    
    if player:HasCollectible(sexyrooms.BRUSKETT) and sexyrooms.HasoneBruskett then
      if not sexyrooms.HastwoBruskett then
        if not sexyrooms.HasthreeBruskett then
          sexyrooms.HasoneBruskett = true
          sexyrooms.HastwoBruskett = true
          sexyrooms.HasthreeBruskett = false
        end
      end
    end
    
    if player:HasCollectible(sexyrooms.BRUSKETT) and sexyrooms.HasoneBruskett then
      if sexyrooms.HastwoBruskett then
        if not sexyrooms.HasthreeBruskett then
          sexyrooms.HasoneBruskett = true
          sexyrooms.HastwoBruskett = true
          sexyrooms.HasthreeBruskett = true
        end
      end
    end
  end
end

sexyrooms:AddCallback(ModCallbacks.MC_POST_UPDATE,sexyrooms.onUpdate)

function sexyrooms:onCache(player, cacheFlag) --//MC_EVALUATE_CACHE//-- => on.Cache
  
  if cacheFlag == CacheFlag.CACHE_DAMAGE then
    if player:HasCollectible(sexyrooms.BRUSKETT) and not sexyrooms.HasoneBruskett then
      player.Damage = player.Damage + 3.63
    end
    
    if player:HasCollectible(sexyrooms.BRUSKETT) and sexyrooms.HasoneBruskett then
      if sexyrooms.HastwoBruskett then
        if sexyrooms.HasthreeBruskett then
          player.Damage = player.Damage + 3.63 * 1.5
        end
      end
    end
    
    --if player:HasCollectible(sexyrooms.BRUSKETT) and sexyrooms.HasoneBruskett then		--not working correctly
      --if sexyrooms.HastwoBruskett then
        --if sexyrooms.HasthreeBruskett then
          --player.Damage = player.Damage + 10
        --end
      --end
    --end
    
  end
  
  if cacheFlag == CacheFlag.CACHE_LUCK then
    if player:HasCollectible(sexyrooms.BRUSKETT) and not sexyrooms.HasoneBruskett then
      if player.Luck < 1 then
      player.Luck = player.Luck + 3.63
      end
    end
    --if player:HasCollectible(sexyrooms.BRUSKETT) and sexyrooms.HasoneBruskett then
      --player.Luck = player.Luck + 3.63
    --end
  end
  
end

sexyrooms:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, sexyrooms.onCache)