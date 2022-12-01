--StartDebug()

Ledrodigaktidobium = 1.313131313131313131313
local game = Game()
local sexyrooms = RegisterMod("sexyrooms",1)

SRMod = sexyrooms





-- Example code for your Tears, 
--if you thinking about change tears,
--and use my mod for cheats, yo :p

--local function tearsUp(firedelay, val)
  --local currentTears = 30 / (firedelay + 1)
  --local newTears = currentTears + val
  --return math.max((30 / newTears) - 1, -0.99)
--end


require("OPTIONS")



print("TBOI LUA v2.")

--Room Finder
require("srscripts.room_name_hud.room_finder")

-- Items
require("srscripts.items.milk_with_honey")
require("srscripts.items.item_pi")
require("srscripts.items.16_euro")
require("srscripts.items.bruskett")
require("srscripts.items.wildfire_camera")
require("srscripts.items.pixel_glasses")

-- Enemies
--require("srscripts.enemies.mouse")
require("srscripts.enemies.screamer")
require("srscripts.enemies.smilik")
require("srscripts.enemies.piggy")
require("srscripts.enemies.bob_the_destroyer")

-- Other
require("srscripts.beggar_lilly")
require("srscripts.giant_props.giant_props")

--require("srscripts.fiend_grids.apollo")


if Fiend_Grids == true then
	require("srscripts.fiend_grids.apollo")
end


local json = require("json")
    print("mlevel.WFA is ok")


print("WARNING: If you start the game with another mod that adds new items, it will cause minor problems")