local sexyrooms = SRMod

local item = Isaac.GetItemIdByName("16 Euro")

--
--------------------------------------------------------16 EURO--------------------------------------------------------
--
function sexyrooms:use_item() --//MC_POST_EFFECT_UPDATE//-- => --//MC_POST_EFFECT_INIT//--
  local player = Isaac.GetPlayer(0)
  player:AddCard(Card.CARD_CHAOS)
  player:AddBlackHearts(2, false)
  return true
end

local itemcharge = 0
local batterycharge = 1

function sexyrooms:update()
    local player = Isaac.GetPlayer(0) --local ISAAC if has get collectible--
    if player:HasCollectible(item) then
        if player:GetActiveCharge() > itemcharge + batterycharge then
            player:SetActiveCharge(itemcharge + batterycharge) --for i = 1, Game():GetNumPlayers() do local player = Isaac.GetPlayer(i - 1)--
        end
        itemcharge = player:GetActiveCharge()
    end
end
sexyrooms:AddCallback(ModCallbacks.MC_POST_UPDATE, sexyrooms.update);
sexyrooms:AddCallback(ModCallbacks.MC_USE_ITEM, sexyrooms.use_item, item) --json--