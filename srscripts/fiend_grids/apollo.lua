local mod = SRMod	

local game = Game()
local room = game:GetRoom()
local grng = RNG()
local sfx = SFXManager()
local nilvector = Vector(0,0)
local onevector = Vector(1,1)



if StageAPI then
	mod.Backdrop = {
		Hive = StageAPI.BackdropHelper({
			Walls = {"1"},
			NFloors = {"nfloor"},
			LFloors = {"lfloor"},
			Corners = {"corner"}
		}, "gfx/backdrop/hive_", ".png"),

		Debug = StageAPI.BackdropHelper({
			Walls = {"_alt1", "_alt2", "_alt3"},
			NFloors = {"_nfloor"},
			LFloors = {"_lfloor"},
		}, "gfx/backdrop/debug", ".png"),

		Danker = StageAPI.BackdropHelper({
			Walls = {"1", "2", "3", "4", "5"},
			Corners = {"corner"}
		}, "gfx/backdrop/danker_", ".png"),

		Smoky = StageAPI.BackdropHelper(
		{
			{
			Walls = {"1_1", "1_2"},
			--FloorVariants = {{"smoky_1_1", "smoky_1_2"}, {"smoky_2_1", "smoky_2_2"}},
			NFloors = {"nfloor"},
			LFloors = {"lfloor"},
			Corners = {"corner1"}
			},
			{
			Walls = {"2_1", "2_2"},
		--	FloorVariants = {{"smoky_1_1", "smoky_1_2"}, {"smoky_2_1", "smoky_2_2"}},
			NFloors = {"nfloor"},
			LFloors = {"lfloor"},
			Corners = {"corner2"}
			},
		}, "gfx/backdrop/smoky_", ".png"),

		HappyFunTime = StageAPI.BackdropHelper({
			Walls = {"1", "2", "3", "4"},
			NFloors = {"nfloor"},
			LFloors = {"lfloor"},
			Corners = {"corner"}
		}, "gfx/backdrop/happyfuntime_", ".png"),

		Pipes = StageAPI.BackdropHelper({
			Walls = {"1", "2_gunk"},
			NFloors = {"nfloor"},
			LFloors = {"lfloor"},
			Corners = {"corner"}
		}, "gfx/backdrop/pipes_", ".png"),

		HoneyedCellar = StageAPI.BackdropHelper({
			Walls = {"1", "2_hives",},
			Corners = {"corner"}
		}, "gfx/backdrop/honeyedcellar_", ".png"),

		EyeballUtero = StageAPI.BackdropHelper({
			Walls = {"1", "2",},
		}, "gfx/backdrop/eyeballutero_", ".png"),

		Primordial = StageAPI.BackdropHelper({
			Walls = {"blank", "fossils", "paintings"},
			NFloors = {"nroom"},
			LFloors = {"lroom"},
			Corners = {"corner"}
		}, "gfx/backdrop/primitive_cavern_", ".png"),

		Challenge = StageAPI.BackdropHelper({
			Walls = {"default"},
		}, "gfx/backdrop/challenge", ".png"),

		CatacombsNoCaves = StageAPI.BackdropHelper({
			Walls = {"Catacombs2_1"},
            FloorVariants = StageAPI.CatacombsFloors,
            NFloors = {"Catacombs_nfloor"},
            LFloors = {"Catacombs_lfloor"},
            Corners = {"Catacombs2_corner"}
		}, "stageapi/floors/catacombs/", ".png"),
		
		RiskReward = StageAPI.BackdropHelper({
			Walls = {"1", "2", "3",},
		}, "gfx/backdrop/risksreward_", ".png"),
	}

	mod.BBGrid = StageAPI.GridGfx()
	mod.BBGrid:SetPits("gfx/grid/pit_burningbasement.png")
	mod.BBGrid:SetBridges("gfx/grid/rocks_burningbasement.png")

	mod.CellarGrid = StageAPI.GridGfx()
	mod.CellarGrid:SetPits("gfx/grid/pit_cellar.png")
	mod.CellarGrid:SetBridges("gfx/grid/rocks_cellar.png")
	
	mod.ShopGrid = StageAPI.GridGfx()
	--mod.ShopGrid:SetPits("gfx/grid/grid_chest_pit_alt.png")
	mod.ShopGrid:SetPits({
		{File = "gfx/grid/grid_chest_pit_alt.png", HasExtraFrames = true},
		{File = "gfx/grid/grid_chest_pit.png", HasExtraFrames = true}
	})
	mod.ShopGrid:SetRocks("gfx/grid/rocks_shop.png")
	
	mod.LibraryGrid = StageAPI.GridGfx()
		mod.LibraryGrid:SetPits("gfx/grid/pit_cellar.png")
		mod.LibraryGrid:SetRocks("gfx/grid/rocks_library.png")
	
	mod.DarkRoomGrid = StageAPI.GridGfx()
	mod.DarkRoomGrid:SetRocks("gfx/grid/rocks_darkroom.png")

	mod.SecretGrid = StageAPI.GridGfx()
	mod.SecretGrid:SetPits("gfx/grid/grid_secret_pit_large.png", nil, true)
	mod.SecretGrid:SetRocks("gfx/grid/rocks_secret.png")

	mod.SheolGrid = StageAPI.GridGfx()
	mod.SheolGrid:SetPits("gfx/grid/grid_sheol_pit.png")
	mod.SheolGrid:SetBridges("gfx/grid/rocks_sheol.png")

	mod.CathGrid = StageAPI.GridGfx()
	mod.CathGrid:SetPits("gfx/grid/grid_cathedral_pit_large.png", nil, true)
	mod.CathGrid:SetBridges("gfx/grid/rocks_cathedral.png")

	mod.FloodedGrid = StageAPI.GridGfx()
	mod.FloodedGrid:SetPits("gfx/grid/grid_floodedcaves_pit.png")
	mod.FloodedGrid:SetBridges("gfx/grid/rocks_drownedcaves.png")

	mod.DepthsGrid = StageAPI.GridGfx()
	mod.DepthsGrid:SetPits("gfx/grid/grid_depths_pit_large.png", nil, true)
	mod.DepthsGrid:SetBridges("gfx/grid/rocks_depths.png")

    mod.NecropolisGrid = StageAPI.GridGfx()
	--mod.NecropolisGrid:SetRocks("gfx/grid/rocks_necropolis.png")
    mod.NecropolisGrid:SetPits("gfx/grid/grid_necropolis_pit_large.png", nil, true)
	mod.NecropolisGrid:SetBridges("gfx/grid/rocks_necropolis.png")

    mod.DankDepthsGrid = StageAPI.GridGfx()
	mod.DankDepthsGrid:SetPits("gfx/grid/grid_dankdepths_pit_large.png", nil, true)
	mod.DankDepthsGrid:SetBridges("gfx/grid/rocks_dankdepths.png")
	
    mod.UteroGrid = StageAPI.GridGfx()
	mod.UteroGrid:SetPits("gfx/grid/grid_utero_pit_large.png", {
        {File = "gfx/grid/grid_uteroblood_pit_large.png", HasExtraFrames = true},
        {File = "gfx/grid/grid_uteroacid_pit_large.png", HasExtraFrames = true}
    }, true)
	mod.UteroGrid:SetBridges("gfx/grid/rocks_utero.png")

	mod.ChestGrid = StageAPI.GridGfx()
	mod.ChestGrid:SetPits({
		{File = "gfx/grid/grid_chest_pit_alt.png", HasExtraFrames = true},
		{File = "gfx/grid/grid_chest_pit.png", HasExtraFrames = true}
	})
	mod.ChestGrid:SetRocks("gfx/grid/rocks_chest.png", true)

    mod.ScarredWombGrid = StageAPI.GridGfx()
	--mod.ScarredWombGrid:SetRocks("gfx/grid/rocks_scarredwomb.png")
	mod.ScarredWombGrid:SetPits("gfx/grid/grid_scarredwomb_pit.png", nil, true)
	mod.ScarredWombGrid:SetBridges("gfx/grid/rocks_scarredwomb.png")

	mod.BasementGrid = StageAPI.GridGfx()
	mod.BasementGrid:SetPits("gfx/grid/pit_basement.png", nil, true)
	mod.BasementGrid:SetBridges("gfx/grid/rocks_basement.png")

	mod.ChallengeGrid = StageAPI.GridGfx()
	mod.ChallengeGrid:SetPits("gfx/grid/grid_ambush_pit.png", nil, false)
    mod.ChallengeGrid:SetRocks("gfx/grid/rock_challenge_placeholderrecolor.png")
	mod.ChallengeGrid:SetGrid("gfx/grid/pipes_spikes.png", GridEntityType.GRID_SPIKES)
	mod.ChallengeGrid:SetGrid("gfx/grid/pipes_spikes.png", GridEntityType.GRID_SPIKES_ONOFF)

	mod.ErrorGrid = StageAPI.GridGfx()
	mod.ErrorGrid:SetRocks("gfx/grid/rocks_error-1.png.png")
	
    mod.DiceGrid = StageAPI.GridGfx()
	mod.DiceGrid:SetPits("gfx/grid/pit_dice.png", nil, true)
	mod.DiceGrid:SetRocks("gfx/grid/rocks_dice.png")

    mod.D12Grid = StageAPI.GridGfx()
	mod.D12Grid:SetRocks("gfx/grid/rocks_d12.png")

    mod.ArcadeGrid = StageAPI.GridGfx()
	mod.ArcadeGrid:SetRocks("gfx/grid/rocks_arcade.png")

    mod.CrawlspaceGrid = StageAPI.GridGfx()
    mod.CrawlspaceGrid:SetRocks("gfx/grid/rocks_crawlspace.png")
    --mod.CrawlspaceGrid:SetGrid("gfx/grid/spikes_crawlspace.png", GridEntityType.GRID_SPIKES)

    mod.BlueWombGrid = StageAPI.GridGfx()
    mod.BlueWombGrid:SetRocks("gfx/grid/rocks_bluewomb.png")

    mod.CataGrid = StageAPI.GridGfx()
	mod.CataGrid:SetGrid("gfx/grid/catacomb_spikes.png", GridEntityType.GRID_SPIKES)
	mod.CataGrid:SetGrid("gfx/grid/catacomb_spikes.png", GridEntityType.GRID_SPIKES_ONOFF)
    --mod.CataGrid:SetRocks("gfx/grid/rocks_catacombs.png")
	mod.CataGrid:SetBridges("gfx/grid/rocks_catacombs.png")
	
	mod.DownpourGrid = StageAPI.GridGfx()
	mod.DownpourGrid:SetPits("gfx/grid/grid_pit_downpour_large.png", "gfx/grid/grid_pit_downpour_water_large.png", true)
	mod.DownpourGrid:SetBridges("gfx/grid/rocks_downpour.png")
	
	mod.MinesGrid = StageAPI.GridGfx()
	mod.MinesGrid:SetPits("gfx/grid/grid_pit_mines.png", {
		{File = "gfx/grid/grid_pit_mines_cursed.png", HasExtraFrames = false},
		{File = "gfx/grid/grid_pit_mines_water.png", HasExtraFrames = false}
	}, false)
	mod.MinesGrid:SetRocks("gfx/grid/rocks_mines.png")
	
	mod.MausoleumGrid = StageAPI.GridGfx()
	mod.MausoleumGrid:SetPits("gfx/grid/grid_mausoleum_pit_large.png", nil, true)
	mod.MausoleumGrid:SetBridges("gfx/grid/rocks_mausoleum.png")
	
	mod.CorpseGrid = StageAPI.GridGfx()
	mod.CorpseGrid:SetPits("gfx/grid/grid_pit_corpse.png", nil, false)
	mod.CorpseGrid:SetBridges("gfx/grid/rocks_corpse.png")
	
	mod.Corpse2Grid = StageAPI.GridGfx()
	mod.Corpse2Grid:SetPits("gfx/grid/grid_pit_corpse.png", nil, false)
	mod.Corpse2Grid:SetBridges("gfx/grid/rocks_corpse2.png")
	
	mod.DownpourEntranceGrid = StageAPI.GridGfx()
	mod.DownpourEntranceGrid:SetGrid("gfx/grid/pipes_spikes.png", GridEntityType.GRID_SPIKES)
	mod.DownpourEntranceGrid:SetGrid("gfx/grid/pipes_spikes.png", GridEntityType.GRID_SPIKES_ONOFF)
	mod.DownpourEntranceGrid:SetPits({
		{File = "gfx/grid/grid_pipe_pit.png", HasExtraFrames = true},
		{File = "gfx/grid/grid_pipe_pit_alt.png", HasExtraFrames = true}
	})
	mod.DownpourEntranceGrid:SetRocks("gfx/grid/rocks_pipes.png")
	
	mod.MinesEntranceGrid = StageAPI.GridGfx()
	mod.MinesEntranceGrid:SetPits("gfx/grid/grid_primitive_pit.png", "gfx/grid/grid_primordial_pit.png")
	mod.MinesEntranceGrid:SetRocks("gfx/grid/rocks_primitive.png")
	
	mod.MausoleumEntranceGrid = StageAPI.GridGfx()
	mod.MausoleumEntranceGrid:SetPits("gfx/grid/grid_pit_mausoleum.png", nil, false)
	mod.MausoleumEntranceGrid:SetRocks("gfx/grid/rocks_mausoleum.png")
	
	mod.CorpseEntranceGrid = StageAPI.GridGfx()
	mod.CorpseEntranceGrid:SetPits("gfx/grid/grid_depths_pit_large.png", nil, true)
	mod.CorpseEntranceGrid:SetBridges("gfx/grid/rocks_corpseentrance.png")
	
	mod.DrossGrid = StageAPI.GridGfx()
	mod.DrossGrid:SetPits("gfx/grid/grid_dross_pit_large.png", nil, true)
	mod.DrossGrid:SetBridges("gfx/grid/rocks_dross.png")
	
	mod.AshpitGrid = StageAPI.GridGfx()
	mod.AshpitGrid:SetPits("gfx/grid/grid_pit_ashpit.png", nil, false)
	mod.AshpitGrid:SetBridges("gfx/grid/rocks_ashpit.png")
	
	mod.GehennaGrid = StageAPI.GridGfx()
	mod.GehennaGrid:SetPits("gfx/grid/grid_pit_gehenna.png", nil, false)
	mod.GehennaGrid:SetBridges("gfx/grid/rocks_gehenna.png")
	
	mod.BasementBackdrop = StageAPI.RoomGfx(nil, mod.BasementGrid, nil, nil)
	mod.CellarBackdrop = StageAPI.RoomGfx(nil, mod.CellarGrid, "_default", "stageapi/shading/shading")
	mod.BBBackdrop = StageAPI.RoomGfx(nil, mod.BBGrid, "_default", "stageapi/shading/shading")
	--mod.CavesBackdrop = StageAPI.RoomGfx(nil, mod.CavesGrid, nil, nil)
	mod.CataBackdrop = StageAPI.RoomGfx(nil, mod.CataGrid, nil, nil)
	mod.FloodedBackdrop = StageAPI.RoomGfx(nil, mod.FloodedGrid, nil, nil)
	mod.DepthsBackdrop = StageAPI.RoomGfx(nil, mod.DepthsGrid, nil, nil)
	mod.NecropolisBackdrop = StageAPI.RoomGfx(nil, mod.NecropolisGrid, nil, nil)
	--mod.SkullNecroBackdrop = StageAPI.RoomGfx(nil, mod.SkullNecroGrid, "_default", "stageapi/shading/shading")
	mod.DankDepthsBackdrop = StageAPI.RoomGfx(nil, mod.DankDepthsGrid, nil, nil)
	--mod.WombBackdrop = StageAPI.RoomGfx(nil, mod.WombGrid, nil, nil)
	mod.UteroBackdrop = StageAPI.RoomGfx(nil, mod.UteroGrid, nil, nil)
	mod.ScarredWombBackdrop = StageAPI.RoomGfx(nil, mod.ScarredWombGrid, nil, nil)
	mod.CathBackdrop = StageAPI.RoomGfx(nil, mod.CathGrid, nil, nil)
	mod.SheolBackdrop = StageAPI.RoomGfx(nil, mod.SheolGrid, nil, nil)
	mod.ChestBackdrop = StageAPI.RoomGfx(nil, mod.ChestGrid, nil, nil)
    mod.DarkRoomBackdrop = StageAPI.RoomGfx(nil, mod.DarkRoomGrid, nil, nil)

    mod.SecretBackdrop = StageAPI.RoomGfx(nil, mod.SecretGrid, nil, nil)
    mod.ChallengeBackdrop = StageAPI.RoomGfx(mod.Backdrop.Challenge, mod.ChallengeGrid, "_default", "stageapi/shading/shading")
	mod.CrawlspaceBackdrop = StageAPI.RoomGfx(nil, mod.CrawlspaceGrid, nil, nil)
	mod.LibraryBackdrop = StageAPI.RoomGfx(nil, mod.LibraryGrid, nil, nil)
	mod.ShopBackdrop = StageAPI.RoomGfx(nil, mod.ShopGrid, "_default", "stageapi/shading/shading")
	mod.ErrorBackdrop = StageAPI.RoomGfx(nil, mod.ErrorGrid, nil, nil)
	mod.DiceBackdrop = StageAPI.RoomGfx(nil, mod.DiceGrid, nil, nil)
	mod.D12Backdrop = StageAPI.RoomGfx(nil, mod.D12Grid, nil, nil)
	mod.ArcadeBackdrop = StageAPI.RoomGfx(nil, mod.ArcadeGrid, nil, nil)
	
	mod.DownpourBackdrop = StageAPI.RoomGfx(nil, mod.DownpourGrid, nil, nil)
	mod.MinesBackdrop = StageAPI.RoomGfx(nil, mod.MinesGrid, nil, nil)
	mod.MausoleumBackdrop = StageAPI.RoomGfx(nil, mod.MausoleumGrid, nil, nil)
	mod.CorpseBackdrop = StageAPI.RoomGfx(nil, mod.CorpseGrid, nil, nil)
	mod.Corpse2Backdrop = StageAPI.RoomGfx(nil, mod.Corpse2Grid, nil, nil)
	mod.DrossBackdrop = StageAPI.RoomGfx(nil, mod.DrossGrid, nil, nil)
	mod.AshpitBackdrop = StageAPI.RoomGfx(nil, mod.AshpitGrid, nil, nil)
	mod.GehennaBackdrop = StageAPI.RoomGfx(nil, mod.GehennaGrid, nil, nil)
	
	mod.DownpourEntranceBackdrop = StageAPI.RoomGfx(mod.Backdrop.Pipes, mod.DownpourEntranceGrid, "_default", "stageapi/shading/shading")
    mod.MinesEntranceBackdrop = StageAPI.RoomGfx(mod.Backdrop.Primordial, mod.MinesEntranceGrid, "_default", "stageapi/shading/shading")
	mod.MausoleumEntranceBackdrop = StageAPI.RoomGfx(mod.Backdrop.RiskReward, mod.MausoleumEntranceGrid, "_default", "stageapi/shading/shading")


	mod.FloorGrids = {
        mod.BasementGrid,
        mod.CellarGrid,
        mod.BBGrid,
        --mod.CavesGrid,
        mod.CataGrid,
        mod.FloodedGrid,
        mod.DepthsGrid,
        mod.NecropolisGrid,
        mod.DankDepthsGrid,
        --mod.WombGrid,
        mod.UteroGrid,
        mod.ScarredWombGrid,
        mod.BlueWombGrid,
        mod.CathGrid,
        mod.SheolGrid,
        mod.ChestGrid,
        mod.DarkRoomGrid,

        mod.SecretGrid,
        mod.ChallengeGrid,
        mod.CrawlspaceGrid,
        mod.ShopGrid,
        mod.DiceGrid,
        mod.D12Grid,
        mod.ArcadeGrid,
        mod.ErrorGrid,
		
		mod.DownpourGrid,
		mod.MinesGrid,
		mod.MausoleumGrid,
		mod.CorpseGrid,
		mod.Corpse2Grid,
		mod.DrossGrid,
		mod.AshpitGrid,
		mod.GehennaGrid,
		
		mod.DownpourEntranceGrid,
		mod.MinesEntranceGrid,
		mod.MausoleumEntranceGrid,
    }
end

function mod.ReplaceCrawlspaceTileGfx(path)
    local room = game:GetRoom()
    for i = 0, room:GetGridSize()-1 do
        local grid = room:GetGridEntity(i)
        -- metal blocks, which become walls
        -- decorations, i.e. ladders
        -- gravity squares where the floor is, with the anm2 loaded
        if grid then
            local type = grid:GetType()
            if type == GridEntityType.GRID_WALL
            or type == GridEntityType.GRID_DECORATION
            or (type == GridEntityType.GRID_GRAVITY and grid.Sprite:GetFilename() ~= "") then
                local sprite = grid.Sprite
                sprite:ReplaceSpritesheet(0, path)
                sprite:LoadGraphics()
                grid.Sprite = sprite
            end
        end
    end
end

function mod:getCurrentRoomGfx()
	local level = game:GetLevel()
	local room = game:GetRoom()
	if level:GetStage() == LevelStage.STAGE7 then
		-- on void go fucking CRAZY
		grng:SetSeed(room:GetDecorationSeed(), 0)
		local gridgfx = StageAPI.GridGfx()
		gridgfx.Rocks = mod.FloorGrids[grng:RandomInt(#mod.FloorGrids) + 1].Rocks
		gridgfx.PitFiles = mod.FloorGrids[grng:RandomInt(#mod.FloorGrids) + 1].PitFiles
		gridgfx.AltPitFiles = mod.FloorGrids[grng:RandomInt(#mod.FloorGrids) + 1].AltPitFiles
		return StageAPI.RoomGfx(nil, gridgfx, nil, nil)
	end

	local roomType = room:GetType()
	if roomType == RoomType.ROOM_SECRET then
		return mod.SecretBackdrop
	elseif roomType == RoomType.ROOM_DUNGEON then
		return mod.CrawlspaceBackdrop
	elseif (roomType == RoomType.ROOM_CHALLENGE or roomType == RoomType.ROOM_BOSSRUSH and eternalarenacanappear ~= 1) and not (Backpacksmod or StageAPI.InNewStage()) then
		return mod.ChallengeBackdrop
	elseif not StageAPI.InNewStage() then
		local backdropType = game:GetRoom():GetBackdropType()
		if backdropType == 1 then
			return mod.BasementBackdrop
		elseif backdropType == 2 then
			return mod.CellarBackdrop
		elseif backdropType == 3 then
			return mod.BBBackdrop
		elseif backdropType == 5 then
			return mod.CataBackdrop
		elseif backdropType == 6 then
			return mod.FloodedBackdrop
		elseif backdropType == 7 and roomType ~= RoomType.ROOM_SACRIFICE then
			return mod.DepthsBackdrop
		elseif backdropType == 8 then
			return mod.NecropolisBackdrop
		elseif backdropType == 9 then
			return mod.DankDepthsBackdrop
		elseif backdropType == 11 then
			return mod.UteroBackdrop
		elseif backdropType == 12 then
			return mod.ScarredWombBackdrop
		elseif backdropType == 14 and roomType ~= RoomType.ROOM_CHALLENGE and roomType ~= RoomType.ROOM_BOSSRUSH then
			return mod.SheolBackdrop
		elseif backdropType == 15 then
			return mod.CathBackdrop
		elseif backdropType == 16 then
			return mod.DarkRoomBackdrop
		elseif backdropType == 17 then
			return mod.ChestBackdrop
		elseif backdropType == 19 then
			return mod.LibraryBackdrop
		elseif backdropType == 21 or backdropType == 22 then
			return mod.CellarBackdrop
		elseif backdropType == 20 then
			return mod.ShopBackdrop
		elseif backdropType == 23 and roomType ~= RoomType.ROOM_SECRET then
			return mod.MinesEntranceBackdrop
		elseif backdropType == 24 then
			return mod.DiceBackdrop
		elseif backdropType == 25 then
			return mod.ArcadeBackdrop
		elseif backdropType == 26 then
			return mod.ErrorBackdrop
		elseif backdropType == 31 then
			return mod.DownpourBackdrop
		elseif backdropType == 32 or backdropType == 58 or backdropType == 59 then
			return mod.MinesBackdrop
		elseif backdropType == 33 then
			return mod.MausoleumBackdrop
		elseif backdropType == 34 then
			return mod.CorpseBackdrop
		elseif backdropType == 36 then
			return mod.DownpourEntranceBackdrop
		elseif backdropType == 37 then
			return mod.MinesEntranceBackdrop
		elseif backdropType == 38 then
			return mod.MausoleumEntranceBackdrop
		elseif backdropType == 39 then
			return mod.CorpseEntranceBackdrop
		elseif backdropType == 43 then
			return mod.Corpse2Backdrop
		elseif backdropType == 45 then
			return mod.DrossBackdrop
		elseif backdropType == 46 then
			return mod.AshpitBackdrop
		elseif backdropType == 47 then
			return mod.GehennaBackdrop
		--elseif backdropType == 48 then //lol
			--return mod.MortisBackdrop
        end
    end
end

function mod:backdropReplacer()
	if StageAPI then
		if mod.roomBackdrop and mod.roomBackdropFrom then
			if game:GetLevel():GetCurrentRoomIndex() ~= mod.roomBackdropFrom then
				mod.roomBackdrop = nil
				mod.roomBackdropFrom = nil
			end
		end
		local roomGfx = mod:getCurrentRoomGfx()

		if roomGfx then
			StageAPI.ChangeRoomGfx(roomGfx)
		end
	end
end

function mod:OnNewRoom()
	mod:backdropReplacer()
end
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.OnNewRoom)

mod:AddCallback(ModCallbacks.MC_USE_ITEM, function()
	StageAPI.ChangeRoomGfx(mod.D12Backdrop)
end, CollectibleType.COLLECTIBLE_D12)


function mod:UpdatePits()
local size = room:GetGridSize()
	for i=0, size do
		local gridEntity = room:GetGridEntity(i)
		if gridEntity then
			if gridEntity.Desc.Type == GridEntityType.GRID_PIT then
				gridEntity:PostInit()
			end
		end
	end

    local roomGfx = mod:getCurrentRoomGfx()
    if roomGfx then
        StageAPI.ChangeGrids(roomGfx.Grids)
    end
	--room = game:GetRoom()
end