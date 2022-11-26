local mod = SRMod
local game = Game()

BarabaraBerebere = {
	DoCameraFlash = true, --CHANGE TO FALSE IF PHOTOSENSITIVE
	FlashVolume = 5,
	FishHookWormEffect = false, --Gives the Fish Hook projectile the effect of Hook Worm
	AntiLag = false --Disables the scheduler that runs every frame, but causes the Fish Hook pickup sound to be the card pickup sound effect. Change if lots of mods enabled stresses your poor computer
}

mod.TribeTable = { --1st number is type, 2nd is subtype, 3rd is variant, 4th is rarity from spawning out of cards (Higher number = higher rarity, 0 means they can't spawn at all)
  [1] = { --Sapients
    {EntityType.ENTITY_GAPER, -1, -1, 1},
    {EntityType.ENTITY_GAPER, 1, -1, 1},
    {EntityType.ENTITY_GAPER, 2, -1, 0},
    {EntityType.ENTITY_GAPER, 3, -1, 3},
    {EntityType.ENTITY_GURGLE, -1, -1, 1},
    {EntityType.ENTITY_GURGLE, 1, -1, 0},
    {EntityType.ENTITY_NULLS, -1, -1, 3},
    {EntityType.ENTITY_CYCLOPIA, -1, -1, 1},
    {EntityType.ENTITY_HUSH_GAPER, -1, -1, 0},
    {EntityType.ENTITY_GREED_GAPER, -1, -1, 3},
    {EntityType.ENTITY_WRAITH, -1, -1, 0},
    {EntityType.ENTITY_DEEP_GAPER, -1, -1, 0},
    {EntityType.ENTITY_BLURB, -1, -1, 1},
    {EntityType.ENTITY_GAPER_L2, -1, -1, 0},
    {EntityType.ENTITY_HORF_L2, -1, -1, 0},
    {EntityType.ENTITY_GUSHER_L2, -1, -1, 0},
    {EntityType.ENTITY_MOTHER, 20, -1, 0}, -- Dead Isaac
    {EntityType.ENTITY_FACELESS, -1, -1, 1},
    {EntityType.ENTITY_EXORCIST, -1, -1, 0},
    {EntityType.ENTITY_EXORCIST, 1, -1, 0},
    {EntityType.ENTITY_GUSHER, -1, -1, 1},
    {EntityType.ENTITY_GUSHER, 1, -1, 0},
    {EntityType.ENTITY_SPLASHER, -1, -1, 1},
    {EntityType.ENTITY_BLACK_GLOBIN_BODY, -1, -1, 0},
    {EntityType.ENTITY_HORF, -1, -1, 1},
    {EntityType.ENTITY_PSY_HORF, -1, -1, 2},
    {EntityType.ENTITY_SUB_HORF, -1, -1, 3},
    {EntityType.ENTITY_SUB_HORF, 1, -1, 0},
    {EntityType.ENTITY_MULLIGAN, -1, -1, 1},
    {EntityType.ENTITY_MULLIGAN, 1, -1, 0},
    {EntityType.ENTITY_MULLIGAN, 2, -1, 3},
    {EntityType.ENTITY_HIVE, -1, -1, 1},
    {EntityType.ENTITY_HIVE, 1, -1, 3},
    {EntityType.ENTITY_HIVE, 2, -1, 4},
    {EntityType.ENTITY_HIVE, 3, -1, 0},
    {EntityType.ENTITY_NEST, -1, -1, 1},
    {EntityType.ENTITY_LEPER, -1, -1, 0},
    {EntityType.ENTITY_PREY, -1, -1, 0},
    {EntityType.ENTITY_PREY, 1, -1, 0},
    {EntityType.ENTITY_BOUNCER, -1, -1, 2},
    {EntityType.ENTITY_FARTIGAN, -1, -1, 0},
    {EntityType.ENTITY_DANNY, -1, -1, 2},
    {EntityType.ENTITY_DANNY, 1, -1, 0},
    {EntityType.ENTITY_BLASTER, -1, -1, 3},
    {EntityType.ENTITY_MAW, -1, -1, 1},
    {EntityType.ENTITY_MAW, 1, -1, 0},
    {EntityType.ENTITY_MAW, 2, -1, 2},
    {EntityType.ENTITY_HOPPER, -1, -1, 1},
    {EntityType.ENTITY_HOPPER, 2, -1, 0},
    {EntityType.ENTITY_HOPPER, 3, -1, 0},
    {EntityType.ENTITY_LEAPER, -1, -1, 1},
    {EntityType.ENTITY_LEAPER, -1, -1, 2},
    {EntityType.ENTITY_FLAMINGHOPPER, -1, -1, 0},
    {EntityType.ENTITY_MRMAW, 0, -1, 0},
    {EntityType.ENTITY_MRMAW, 2, -1, 0},
    {EntityType.ENTITY_BABY, -1, -1, 1},
    {EntityType.ENTITY_BABY, 1, -1, 2},
    {EntityType.ENTITY_BABY, 1, 1, 0},
    {EntityType.ENTITY_BABY, 3, -1, 2},
    {EntityType.ENTITY_UNBORN, -1, -1, 0},
    {EntityType.ENTITY_BABY_BEGOTTEN, -1, -1, 3},
    {EntityType.ENTITY_DOPLE, -1, -1, 0},
    {EntityType.ENTITY_EVIL_TWIN, -1, -1, 0},
    {EntityType.ENTITY_FRED, -1, -1, 2},
    {EntityType.ENTITY_KEEPER, -1, -1, 2},
    {EntityType.ENTITY_BUTTLICKER, -1, -1, 0},
    {EntityType.ENTITY_BUTT_SLICKER, -1, -1, 0},
    {EntityType.ENTITY_HANGER, -1, -1, 2},
    {EntityType.ENTITY_FATTY, -1, -1, 1},
    {EntityType.ENTITY_FATTY, 1, -1, 1},
    {EntityType.ENTITY_FATTY, 2, -1, 0},
    {EntityType.ENTITY_FAT_SACK, -1, -1, 2},
    {EntityType.ENTITY_CONJOINED_FATTY, -1, -1, 1},
    {EntityType.ENTITY_CONJOINED_FATTY, -1, -1, 0},
    {EntityType.ENTITY_BUBBLES, -1, -1, 1},
    {EntityType.ENTITY_QUAKEY, -1, -1, 2},
    {EntityType.ENTITY_GUTTED_FATTY, 0, -1, 0},
    {EntityType.ENTITY_PEEPING_FATTY, -1, -1, 0},
    {EntityType.ENTITY_BLOATY, -1, -1, 2},
    {EntityType.ENTITY_SKINNY, -1, -1, 1},
    {EntityType.ENTITY_SKINNY, 1, -1, 1},
    {EntityType.ENTITY_SKINNY, 2, -1, 0},
    {EntityType.ENTITY_MAZE_ROAMER, -1, -1, 0},
    {EntityType.ENTITY_HOMUNCULUS, 0, -1, 0},
    {EntityType.ENTITY_BEGOTTEN, 0, -1, 0},
    {EntityType.ENTITY_GOAT, -1, -1, 2},
    {EntityType.ENTITY_GOAT, 1, -1, 4},
    {EntityType.ENTITY_MOLE, -1, -1, 1},
    {EntityType.ENTITY_MOLE, 1, -1, 0},
    {EntityType.ENTITY_FLY_TRAP, -1, -1, 3},
    {EntityType.ENTITY_FLESH_MAIDEN, -1, -1, 2},
    {EntityType.ENTITY_SHOPKEEPER, -1, -1, 0},
	{EntityType.ENTITY_MINISTRO, -1, -1, 0},
    {EntityType.ENTITY_FAMILIAR, 220, -1, 0} -- Siren Minion
  },
  [2] = { --Flies
	{EntityType.ENTITY_FLY, -1, -1, 4},
	{EntityType.ENTITY_ATTACKFLY, -1, -1, 1},
	{EntityType.ENTITY_MOTER, -1, -1, 1},
	{EntityType.ENTITY_ETERNALFLY, -1, -1, 0},
	{EntityType.ENTITY_RING_OF_FLIES, -1, -1, 0},
	{EntityType.ENTITY_DART_FLY, -1, -1, 0},
	{EntityType.ENTITY_SWARM, -1, -1, 1},
	{EntityType.ENTITY_HUSH_FLY, -1, -1, 0},
	{EntityType.ENTITY_WILLO, -1, -1, 3},
	{EntityType.ENTITY_ARMYFLY, -1, -1, 0},
	{EntityType.ENTITY_BEAST, 11, -1, 0}, -- Ultra Famine fly
	{EntityType.ENTITY_BEAST, 21, -1, 0}, -- Ultra Pestilence fly
	{EntityType.ENTITY_FLY_BOMB, -1, -1, 2},
	{EntityType.ENTITY_FLY_BOMB, 1, -1, 0},
	{EntityType.ENTITY_SUCKER, -1, -1, 1},
	{EntityType.ENTITY_SUCKER, 1, -1, 2},
	{EntityType.ENTITY_SUCKER, 2, -1, 0},
	{EntityType.ENTITY_SUCKER, 3, -1, 4},
	{EntityType.ENTITY_SUCKER, 4, -1, 0},
	{EntityType.ENTITY_SUCKER, 5, -1, 0},
	{EntityType.ENTITY_SUCKER, 6, -1, 0},
	{EntityType.ENTITY_SUCKER, 7, -1, 0},
	{EntityType.ENTITY_POOTER, -1, -1, 1},
	{EntityType.ENTITY_POOTER, 1, -1, 1},
	{EntityType.ENTITY_BOOMFLY, -1, -1, 0},
	{EntityType.ENTITY_BOOMFLY, 1, -1, 1},
	{EntityType.ENTITY_BOOMFLY, 2, -1, 2},
	{EntityType.ENTITY_BOOMFLY, 3, -1, 2},
	{EntityType.ENTITY_BOOMFLY, 3, 1, 0},
	{EntityType.ENTITY_BOOMFLY, 4, -1, 2},
	{EntityType.ENTITY_BOOMFLY, 5, -1, 0},
	{EntityType.ENTITY_BOOMFLY, 6, -1, 0},
	{EntityType.ENTITY_SWARMER, -1, -1, 2},
	{EntityType.ENTITY_FLY_L2, -1, -1, 1},
	{EntityType.ENTITY_FULL_FLY, -1, -1, 1},
	{EntityType.ENTITY_WILLO_L2, -1, -1, 3},
	{EntityType.ENTITY_DUKIE, -1, -1, 0}
  },
  [3] = { --Spiders
	{EntityType.ENTITY_TWITCHY, -1, -1, 3},
	{EntityType.ENTITY_RAGLING, -1, -1, 2},
	{EntityType.ENTITY_RAGLING, 1, -1, 0},
	{EntityType.ENTITY_BLISTER, -1, -1, 2},
	{EntityType.ENTITY_SPIDER, -1, -1, 1},
	{EntityType.ENTITY_BIGSPIDER, -1, -1, 1},
	{EntityType.ENTITY_STRIDER, -1, -1, 0},
	{EntityType.ENTITY_ROCK_SPIDER, -1, -1, 1},
	{EntityType.ENTITY_ROCK_SPIDER, 1, -1, 4},
	{EntityType.ENTITY_ROCK_SPIDER, 2, -1, 0},
	{EntityType.ENTITY_SWARM_SPIDER, -1, -1, 1},
	{EntityType.ENTITY_BABY_LONG_LEGS, -1, -1, 1},
	{EntityType.ENTITY_BABY_LONG_LEGS, 1, -1, 3},
	{EntityType.ENTITY_CRAZY_LONG_LEGS, -1, -1, 1},
	{EntityType.ENTITY_CRAZY_LONG_LEGS, -1, -1, 1},
	{EntityType.ENTITY_SPIDER_L2, -1, -1, 1},
	{EntityType.ENTITY_TICKING_SPIDER, -1, -1, 2},
	{EntityType.ENTITY_MIGRAINE, -1, -1, 0},
	{EntityType.ENTITY_WALL_CREEP, -1, -1, 1},
	{EntityType.ENTITY_WALL_CREEP, 1, -1, 2},
	{EntityType.ENTITY_WALL_CREEP, 3, -1, 0},
	{EntityType.ENTITY_RAGE_CREEP, -1, -1, 4},
	{EntityType.ENTITY_BLIND_CREEP, -1, -1, 1},
	{EntityType.ENTITY_THE_THING, -1, -1, 0},
	{EntityType.ENTITY_BOIL, 2, -1, 0},
	{EntityType.ENTITY_WALKINGBOIL, 2, -1, 0}
  },
  [4] = { --Poops
	{EntityType.ENTITY_DINGA, -1, -1, 1},
	{EntityType.ENTITY_DIP, -1, -1, 1},
	{EntityType.ENTITY_DIP, 1, -1, 1},
	{EntityType.ENTITY_DIP, 2, -1, 0},
	{EntityType.ENTITY_DIP, -1, -1, 2},
	{EntityType.ENTITY_DRIP, -1, -1, 2},
	{EntityType.ENTITY_SQUIRT, -1, -1, 1},
	{EntityType.ENTITY_SQUIRT, 1, -1, 0},
	{EntityType.ENTITY_HARDY, -1, -1, 2},
	{EntityType.ENTITY_SPLURT, -1, -1, 2},
	{EntityType.ENTITY_DUMP, -1, -1, 2},
    {EntityType.ENTITY_DUMP, 1, -1, 0},
	{EntityType.ENTITY_CLOGGY, -1, -1, 2}
  },
  [5] = { --Organs
	{EntityType.ENTITY_CLOTTY, -1, -1, 1},
	{EntityType.ENTITY_CLOTTY, 1, -1, 3},
	{EntityType.ENTITY_CLOTTY, 2, -1, 3},
	{EntityType.ENTITY_GLOBIN, -1, -1, 1},
	{EntityType.ENTITY_GLOBIN, 1, -1, 1},
	{EntityType.ENTITY_GLOBIN, 2, -1, 2},
	{EntityType.ENTITY_GLOBIN, 3, -1, 5},
	{EntityType.ENTITY_BLACK_GLOBIN, -1, -1, 2},
	{EntityType.ENTITY_GASBAG, -1, -1, 0},
	{EntityType.ENTITY_COHORT, -1, -1, 3},
	{EntityType.ENTITY_MUSHROOM, -1, -1, 0},
	{EntityType.ENTITY_BOIL, 0, -1, 1},
	{EntityType.ENTITY_BOIL, 1, -1, 2},
	{EntityType.ENTITY_HUSH_BOIL, -1, -1, 0},
	{EntityType.ENTITY_GUSH, -1, -1, 0},
	{EntityType.ENTITY_WALKINGBOIL, -1, -1, 1},
	{EntityType.ENTITY_WALKINGBOIL, 1, -1, 2},
	{EntityType.ENTITY_BRAIN, -1, -1, 1},
	{EntityType.ENTITY_BLACK_GLOBIN_HEAD, -1, -1, 0},
	{EntityType.ENTITY_POISON_MIND, -1, -1, 2},
	{EntityType.ENTITY_PON, -1, -1, 1},
	{EntityType.ENTITY_GYRO, -1, -1, 1},
	{EntityType.ENTITY_GYRO, 1, -1, 2},
	{EntityType.ENTITY_SWINGER, -1, -1, 0},
	{EntityType.ENTITY_GUTS, -1, -1, 1},
	{EntityType.ENTITY_GUTS, 1, -1, 2},
	{EntityType.ENTITY_GUTS, 2, -1, 2},
	{EntityType.ENTITY_CYST, -1, -1, 2},
	{EntityType.ENTITY_LUMP, -1, -1, 1},
	{EntityType.ENTITY_TARBOY, -1, -1, 2},
	{EntityType.ENTITY_MEMBRAIN, -1, -1, 2},
	{EntityType.ENTITY_MEMBRAIN, 1, -1, 2},
	{EntityType.ENTITY_MEMBRAIN, 2, -1, 2},
	{EntityType.ENTITY_MEGA_CLOTTY, -1, -1, 2},
	{EntityType.ENTITY_EYE, -1, -1, 0},
	{EntityType.ENTITY_EYE, 1, -1, 4},
	{EntityType.ENTITY_EYE, 2, -1, 3},
	{EntityType.ENTITY_EMBRYO, -1, -1, 2},
	{EntityType.ENTITY_MASK, -1, -1, 0},
	{EntityType.ENTITY_MASK, 1, -1, 0},
	{EntityType.ENTITY_TUMOR, -1, -1, 1},
	{EntityType.ENTITY_TUMOR, 1, -1, 2},
	{EntityType.ENTITY_CAMILLO_JR, -1, -1, 2},
	{EntityType.ENTITY_PSY_TUMOR, -1, -1, 2},
	{EntityType.ENTITY_NERVE_ENDING, -1, -1, 0},
	{EntityType.ENTITY_NERVE_ENDING, 1, -1, 2},
	{EntityType.ENTITY_ULCER, -1, -1, 2},
	{EntityType.ENTITY_POOT_MINE, -1, -1, 0},
	{EntityType.ENTITY_GUTTED_FATTY, 20, -1, 0} -- Festering Guts
  },
  [6] = { --Maggots
	{EntityType.ENTITY_MAGGOT, -1, -1, 1},
	{EntityType.ENTITY_CHARGER, -1, -1, 1},
	{EntityType.ENTITY_CHARGER, 1, -1, 2},
	{EntityType.ENTITY_CHARGER, 3, -1, 2},
	{EntityType.ENTITY_SMALL_LEECH, -1, -1, 1},
	{EntityType.ENTITY_SMALL_MAGGOT, -1, -1, 1},
	{EntityType.ENTITY_CHARGER_L2, -1, -1, 1},
	{EntityType.ENTITY_CHARGER_L2, -1, -1, 0},
	{EntityType.ENTITY_SPITTY, -1, -1, 1},
	{EntityType.ENTITY_SPITTY, 1, -1, 0},
	{EntityType.ENTITY_CONJOINED_SPITTY, -1, -1, 1},
	{EntityType.ENTITY_PUSTULE, -1, -1, 0},
	{EntityType.ENTITY_LEECH, -1, -1, 1},
	{EntityType.ENTITY_LEECH, 1, -1, 2},
	{EntityType.ENTITY_LEECH, 2, -1, 2},
	{EntityType.ENTITY_ADULT_LEECH, -1, -1, 3},
	{EntityType.ENTITY_FISTULOID, -1, -1, 2},
  },
  [7] = { --Worms
	{EntityType.ENTITY_PARA_BITE, -1, -1, 1},
	{EntityType.ENTITY_PARA_BITE, 1, -1, 2},
	{EntityType.ENTITY_COD_WORM, -1, -1, 2},
	{EntityType.ENTITY_ROUND_WORM, -1, -1, 1},
	{EntityType.ENTITY_ROUND_WORM, 1, -1, 1},
	{EntityType.ENTITY_ROUND_WORM, 2, -1, 0},
	{EntityType.ENTITY_ROUND_WORM, 3, -1, 0},
	{EntityType.ENTITY_NIGHT_CRAWLER, -1, -1, 1},
	{EntityType.ENTITY_ROUNDY, -1, -1, 1},
	{EntityType.ENTITY_FIRE_WORM, -1, -1, 0},
	{EntityType.ENTITY_NEEDLE, -1, -1, 1}
  },
  [8] = { --Ghosts
	{EntityType.ENTITY_IMP, -1, -1, 1},
	{EntityType.ENTITY_WIZOOB, -1, -1, 1},
	{EntityType.ENTITY_RED_GHOST, -1, -1, 3},
	{EntityType.ENTITY_BLACK_MAW, -1, -1, 2},
	{EntityType.ENTITY_CULTIST, -1, -1, 5},
	{EntityType.ENTITY_CULTIST, 1, -1, 2},
	{EntityType.ENTITY_THE_HAUNT, 10, -1, 1}, -- Lil Haunt
	{EntityType.ENTITY_POLTY, -1, -1, 2},
	{EntityType.ENTITY_POLTY, 1, -1, 2},
	{EntityType.ENTITY_POOFER, -1, -1, 3},
	{EntityType.ENTITY_DUST, -1, -1, 2}
  },
  [9] = { --Skeletons
	{EntityType.ENTITY_NECRO, -1, -1, 2},
	{EntityType.ENTITY_HOST, -1, -1, 1},
	{EntityType.ENTITY_HOST, 1, -1, 1},
	{EntityType.ENTITY_HOST, 3, -1, 1},
	{EntityType.ENTITY_MOBILE_HOST, -1, -1, 1},
	{EntityType.ENTITY_MOBILE_HOST, 1, -1, 0},
	{EntityType.ENTITY_FLOATING_HOST, -1, -1, 2},
	{EntityType.ENTITY_BONY, -1, -1, 1},
	{EntityType.ENTITY_BONY, 1, -1, 2},
	{EntityType.ENTITY_BLACK_BONY, -1, -1, 2},
	{EntityType.ENTITY_REVENANT, -1, -1, 2},
	{EntityType.ENTITY_REVENANT, 1, -1, 3},
	{EntityType.ENTITY_CLICKETY_CLACK, -1, -1, 3},
	{EntityType.ENTITY_BIG_BONY, -1, -1, 0}
  },
  [10] = { --Vises
	{EntityType.ENTITY_VIS, -1, -1, 1},
	{EntityType.ENTITY_VIS, 1, -1, 1},
	{EntityType.ENTITY_VIS, 2, -1, 1},
	{EntityType.ENTITY_VIS, 3, -1, 2},
	{EntityType.ENTITY_VIS_VERSA, -1, -1, 2},
	{EntityType.ENTITY_EVIS, -1, -1, 0},
	{EntityType.ENTITY_VIS_FATTY, -1, -1, 0}
  },
  [11] = { --Knights
	{EntityType.ENTITY_KNIGHT, -1, -1, 1},
	{EntityType.ENTITY_KNIGHT, 1, -1, 1},
	{EntityType.ENTITY_KNIGHT, 2, -1, 0},
	{EntityType.ENTITY_KINGHT, 3, -1, 0},
	{EntityType.ENTITY_KNIGHT, 4, -1, 3},
	{EntityType.ENTITY_FLOATING_KNIGHT, -1, -1, 1},
	{EntityType.ENTITY_BONE_KNIGHT, -1, -1, 2},
	{EntityType.ENTITY_WHIPPER, -1, -1, 1},
	{EntityType.ENTITY_WHIPPER, 1, -1, 2},
	{EntityType.ENTITY_WHIPPER, 2, -1, 0}
  },
  [12] = { --Portals
	{EntityType.ENTITY_PORTAL, -1, -1, 1},
	{EntityType.ENTITY_PORTAL, 1, -1, 1}
  },
  [13] = { --Shadies
	{EntityType.ENTITY_SHADY, -1, -1, 1}
  },
  [14] = { --Bishops
	{EntityType.ENTITY_BISHOP, -1, -1, 1}
  },
  [15] = { --Bombgaggers
	{EntityType.ENTITY_BOMBGAGGER, -1, -1, 1}
  },
  [16] = { --Henries
	{EntityType.ENTITY_HENRY, -1, -1, 1}
  }
}

EnemyTribes = {
	TRIBE_SAPIENTS = SRMod.TribeTable[1],
	TRIBE_FLIES = SRMod.TribeTable[2],
	TRIBE_SPIDERS = SRMod.TribeTable[3],
	TRIBE_POOPS = SRMod.TribeTable[4],
	TRIBE_ORGANS = SRMod.TribeTable[5],
	TRIBE_MAGGOTS = SRMod.TribeTable[6],
	TRIBE_WORMS = SRMod.TribeTable[7],
	TRIBE_GHOSTS = SRMod.TribeTable[8],
	TRIBE_SKELETONS = SRMod.TribeTable[9],
	TRIBE_VISES = SRMod.TribeTable[10],
	TRIBE_KNIGHTS = SRMod.TribeTable[11],
	TRIBE_PORTALS = SRMod.TribeTable[12],
	TRIBE_SHADIES = SRMod.TribeTable[13],
	TRIBE_BISHOPS = SRMod.TribeTable[14],
	TRIBE_BOMBGAGGERS = SRMod.TribeTable[15],
	TRIBE_HENRIES = SRMod.TribeTable[16]
}

SR_Cards = {
	CARD_SAPIENT = Isaac.GetCardIdByName("Sapient Card"),
	CARD_FLY = Isaac.GetCardIdByName("Fly Card"),
	CARD_SPIDER = Isaac.GetCardIdByName("Spider Card"),
	CARD_POOP = Isaac.GetCardIdByName("Poop Card"),
	CARD_ORGAN = Isaac.GetCardIdByName("Organ Card"),
	CARD_MAGGOT = Isaac.GetCardIdByName("Maggot Card"),
	CARD_WORM = Isaac.GetCardIdByName("Worm Card"),
	CARD_GHOST = Isaac.GetCardIdByName("Ghost Card"),
	CARD_SKELETON = Isaac.GetCardIdByName("Skeleton Card"),
	CARD_VIS = Isaac.GetCardIdByName("Vis Card"),
	CARD_KNIGHT = Isaac.GetCardIdByName("Knight Card"),
	CARD_PORTAL = Isaac.GetCardIdByName("Portal Card"),
	CARD_SHADY = Isaac.GetCardIdByName("Shady Card"),
	CARD_BISHOP = Isaac.GetCardIdByName("Bishop Card"),
	CARD_BOMBGAGGER = Isaac.GetCardIdByName("Bombgagger Card"),
	CARD_HENRY = Isaac.GetCardIdByName("Henry Card"),
	CARD_FISH_HOOK = Isaac.GetCardIdByName("Fish Hook")
}

WildFireCamera = {
	COLLECTIBLE_WILDLIFE_CAMERA = Isaac.GetItemIdByName("Wildlife Camera")
}

Flashbang = {
	SOUND_CAMERA_FLASH = Isaac.GetSoundIdByName("CameraFlash")
}

FadeOut = {
	EFFECT_CAMERA = Isaac.GetEntityVariantByName("Fade Out")
}

TearHook = {
	HOOK = Isaac.GetEntityVariantByName("Hook Tear")
}


if GuwahGreatures then
	table.insert(EnemyTribes.TRIBE_SAPIENTS, {551, 6, 0, 2}) --Calsiketic

	table.insert(EnemyTribes.TRIBE_FLIES, {551, 5, 0, 0}) --Potluck
	table.insert(EnemyTribes.TRIBE_FLIES, {551, 4, 0, 3}) --Promoter

	table.insert(EnemyTribes.TRIBE_SPIDERS, {240, 51, 0, 3}) --Arcane Creep
	table.insert(EnemyTribes.TRIBE_SPIDERS, {240, 1, 51, 0}) --Almond Creep
	table.insert(EnemyTribes.TRIBE_SPIDERS, {241, 1, 51, 0}) --Carve Creep

	table.insert(EnemyTribes.TRIBE_POOPS, {220, 51, 0, 2}) --Chili

	table.insert(EnemyTribes.TRIBE_ORGANS, {551, 1, 0, 2}) --Chunky
	table.insert(EnemyTribes.TRIBE_ORGANS, {551, 1, 1, 0}) --Grilled Chunky
	table.insert(EnemyTribes.TRIBE_ORGANS, {551, 1, 2, 0}) --Tainted Chunky
	table.insert(EnemyTribes.TRIBE_ORGANS, {15, 51, 0, 2}) --Drumstick

	table.insert(EnemyTribes.TRIBE_MAGGOTS, {288, 51, 0, 0}) --Blubbie

	table.insert(EnemyTribes.TRIBE_GHOSTS, {551, 3, 0, 2}) --Whizzie
	table.insert(EnemyTribes.TRIBE_GHOSTS, {551, 2, 0, 3}) --Cabalist
end


local rng = RNG() --Used for ->

function mod:RandomInt(min, max, customRNG)
    local rand = customRNG or rng 
    if not max then
        max = min
        min = 0
    end  
    if min > max then 
        local temp = min
        min = max
        max = temp
    end
    return min + (rand:RandomInt(max - min + 1))
end

function mod:GetRandomElem(table)
    if table and #table > 0 then
        return table[mod:RandomInt(1, #table)]
    else
        return nil
    end
end

function mod:CheckIDInTable(entity, table)
    for _, entry in pairs(table) do
        if mod:CheckID(entity, entry) then
            return true
        end
    end
    return false
end

function mod:CheckID(entity, entry)
    if entity.Type == entry[1] then
        if entry[2] then
            if entry[2] == -1 or entity.Variant == entry[2] then
                if entry[3] then
                    if entry[3] == -1 or entity.SubType == entry[3] then
                        return true
                    end
                else
                    return true
                end
            end
        else
            return true
        end
    end
end




if not BarabaraBerebere.AntiLag then
	mod.ScheduleData = {}
	function mod.Schedule(delay, func, args)
		table.insert(mod.ScheduleData, {
		Time = game:GetFrameCount(),
		Delay = delay,
		Call = func,
		Args = args
		})
	end

	mod:AddCallback(ModCallbacks.MC_POST_UPDATE, function()
		local time = game:GetFrameCount()
		for i = #mod.ScheduleData, 1, -1 do
			local data = mod.ScheduleData[i]
				if data.Time + data.Delay <= time then
					data.Call(table.unpack(data.Args))    
					table.remove(mod.ScheduleData, i)
				end
			end
	end)
end


mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_SAPIENTS, 1, -1 do
		local sapiententry = EnemyTribes.TRIBE_SAPIENTS[i]
		if sapiententry[4] ~= 0 then
			if mod:RandomInt(1, sapiententry[4]) == 1 then
				table.insert(spawntable, sapiententry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randomsapient = mod:GetRandomElem(spawntable)
	local sapient = Isaac.Spawn(randomsapient[1], randomsapient[2], 0, pos, Vector(0, 0), player)
	sapient:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_SAPIENT)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_FLIES, 1, -1 do
		local flyentry = EnemyTribes.TRIBE_FLIES[i]
		if flyentry[4] ~= 0 then
			if mod:RandomInt(1, flyentry[4]) == 1 then
				table.insert(spawntable, flyentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randomfly = mod:GetRandomElem(spawntable)
	local fly = Isaac.Spawn(randomfly[1], randomfly[2], 0, pos, Vector(0, 0), player)
	fly:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_FLY)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_SPIDERS, 1, -1 do
		local spiderentry = EnemyTribes.TRIBE_SPIDERS[i]
		if spiderentry[4] ~= 0 then
			if mod:RandomInt(1, spiderentry[4]) == 1 then
				table.insert(spawntable, spiderentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randomspider = mod:GetRandomElem(spawntable)
	local spider = Isaac.Spawn(randomspider[1], randomspider[2], 0, pos, Vector(0, 0), player)
	spider:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_SPIDER)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_POOPS, 1, -1 do
		local poopentry = EnemyTribes.TRIBE_POOPS[i]
		if poopentry[4] ~= 0 then
			if mod:RandomInt(1, poopentry[4]) == 1 then
				table.insert(spawntable, poopentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randompoop = mod:GetRandomElem(spawntable)
	local poop = Isaac.Spawn(randompoop[1], randompoop[2], 0, pos, Vector(0, 0), player)
	poop:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_POOP)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_ORGANS, 1, -1 do
		local organentry = EnemyTribes.TRIBE_ORGANS[i]
		if organentry[4] ~= 0 then
			if mod:RandomInt(1, organentry[4]) == 1 then
				table.insert(spawntable, organentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randomorgan = mod:GetRandomElem(spawntable)
	local organ = Isaac.Spawn(randomorgan[1], randomorgan[2], 0, pos, Vector(0, 0), player)
	organ:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_ORGAN)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_MAGGOTS, 1, -1 do
		local maggotentry = EnemyTribes.TRIBE_MAGGOTS[i]
		if maggotentry[4] ~= 0 then
			if mod:RandomInt(1, maggotentry[4]) == 1 then
				table.insert(spawntable, maggotentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randommaggot = mod:GetRandomElem(spawntable)
	local maggot = Isaac.Spawn(randommaggot[1], randommaggot[2], 0, pos, Vector(0, 0), player)
	maggot:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_MAGGOT)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_WORMS, 1, -1 do
		local wormentry = EnemyTribes.TRIBE_WORMS[i]
		if wormentry[4] ~= 0 then
			if mod:RandomInt(1, wormentry[4]) == 1 then
				table.insert(spawntable, wormentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randomworm = mod:GetRandomElem(spawntable)
	local worm = Isaac.Spawn(randomworm[1], randomworm[2], 0, pos, Vector(0, 0), player)
	worm:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_WORM)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_GHOSTS, 1, -1 do
		local ghostentry = EnemyTribes.TRIBE_GHOSTS[i]
		if ghostentry[4] ~= 0 then
			if mod:RandomInt(1, ghostentry[4]) == 1 then
				table.insert(spawntable, ghostentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randomghost = mod:GetRandomElem(spawntable)
	local ghost = Isaac.Spawn(randomghost[1], randomghost[2], 0, pos, Vector(0, 0), player)
	ghost:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_GHOST)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_SKELETONS, 1, -1 do
		local skeletonentry = EnemyTribes.TRIBE_SKELETONS[i]
		if skeletonentry[4] ~= 0 then
			if mod:RandomInt(1, skeletonentry[4]) == 1 then
				table.insert(spawntable, skeletonentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randomskeleton = mod:GetRandomElem(spawntable)
	local skeleton = Isaac.Spawn(randomskeleton[1], randomskeleton[2], 0, pos, Vector(0, 0), player)
	skeleton:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_SKELETON)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_VISES, 1, -1 do
		local visentry = EnemyTribes.TRIBE_VISES[i]
		if visentry[4] ~= 0 then
			if mod:RandomInt(1, visentry[4]) == 1 then
				table.insert(spawntable, visentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randomvis = mod:GetRandomElem(spawntable)
	local vis = Isaac.Spawn(randomvis[1], randomvis[2], 0, pos, Vector(0, 0), player)
	vis:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_VIS)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_KNIGHTS, 1, -1 do
		local knightentry = EnemyTribes.TRIBE_KNIGHTS[i]
		if knightentry[4] ~= 0 then
			if mod:RandomInt(1, knightentry[4]) == 1 then
				table.insert(spawntable, knightentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randomknight = mod:GetRandomElem(spawntable)
	local knight = Isaac.Spawn(randomknight[1], randomknight[2], 0, pos, Vector(0, 0), player)
	knight:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_KNIGHT)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_PORTALS, 1, -1 do
		local portalentry = EnemyTribes.TRIBE_PORTALS[i]
		if portalentry[4] ~= 0 then
			if mod:RandomInt(1, portalentry[4]) == 1 then
				table.insert(spawntable, portalentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randomportal = mod:GetRandomElem(spawntable)
	local portal = Isaac.Spawn(randomportal[1], randomportal[2], 0, pos, Vector(0, 0), player)
	portal:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_PORTAL)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_SHADIES, 1, -1 do
		local shadyentry = EnemyTribes.TRIBE_SHADIES[i]
		if shadyentry[4] ~= 0 then
			if mod:RandomInt(1, shadyentry[4]) == 1 then
				table.insert(spawntable, shadyentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randomshady = mod:GetRandomElem(spawntable)
	local shady = Isaac.Spawn(randomshady[1], randomshady[2], 0, pos, Vector(0, 0), player)
	shady:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_SHADY)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_BISHOPS, 1, -1 do
		local bishopentry = EnemyTribes.TRIBE_BISHOPS[i]
		if bishopentry[4] ~= 0 then
			if mod:RandomInt(1, bishopentry[4]) == 1 then
				table.insert(spawntable, bishopentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randombishop = mod:GetRandomElem(spawntable)
	local bishop = Isaac.Spawn(randombishop[1], randombishop[2], 0, pos, Vector(0, 0), player)
	bishop:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_BISHOP)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_BOMBGAGGERS, 1, -1 do
		local bombgaggerentry = EnemyTribes.TRIBE_BOMBGAGGERS[i]
		if bombgaggerentry[4] ~= 0 then
			if mod:RandomInt(1, bombgaggerentry[4]) == 1 then
				table.insert(spawntable, bombgaggerentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randombombgagger = mod:GetRandomElem(spawntable)
	local bombgagger = Isaac.Spawn(randombombgagger[1], randombombgagger[2], 0, pos, Vector(0, 0), player)
	bombgagger:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_BOMBGAGGER)

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local player = Isaac.GetPlayer(playernumber)
	local spawntable = {}
	for i = #EnemyTribes.TRIBE_HENRIES, 1, -1 do
		local henryentry = EnemyTribes.TRIBE_HENRIES[i]
		if henryentry[4] ~= 0 then
			if mod:RandomInt(1, henryentry[4]) == 1 then
				table.insert(spawntable, henryentry)
			end
		end
	end
	local pos = Isaac.GetFreeNearPosition(player.Position, 5)
	local randomhenry = mod:GetRandomElem(spawntable)
	local henry = Isaac.Spawn(randomhenry[1], randomhenry[2], 0, pos, Vector(0, 0), player)
	henry:AddCharmed(EntityRef(player), -1)
end, SR_Cards.CARD_HENRY)

function mod:SpawnCard(entity, tribe, player)
	if tribe == 1 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_SAPIENT, entity.Position, Vector(0, 0), player)
	elseif tribe == 2 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_FLY, entity.Position, Vector(0, 0), player)
	elseif tribe == 3 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_SPIDER, entity.Position, Vector(0, 0), player)
	elseif tribe == 4 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_POOP, entity.Position, Vector(0, 0), player)
	elseif tribe == 5 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_ORGAN, entity.Position, Vector(0, 0), player)
	elseif tribe == 6 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_MAGGOT, entity.Position, Vector(0, 0), player)
	elseif tribe == 7 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_WORM, entity.Position, Vector(0, 0), player)
	elseif tribe == 8 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_GHOST, entity.Position, Vector(0, 0), player)
	elseif tribe == 9 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_SKELETON, entity.Position, Vector(0, 0), player)
	elseif tribe == 10 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_VIS, entity.Position, Vector(0, 0), player)
	elseif tribe == 11 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_KNIGHT, entity.Position, Vector(0, 0), player)
	elseif tribe == 12 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_PORTAL, entity.Position, Vector(0, 0), player)
	elseif tribe == 13 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_SHADY, entity.Position, Vector(0, 0), player)
	elseif tribe == 14 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_BISHOP, entity.Position, Vector(0, 0), player)
	elseif tribe == 15 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_BOMBGAGGER, entity.Position, Vector(0, 0), player)
	elseif tribe == 16 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, SR_Cards.CARD_HENRY, entity.Position, Vector(0, 0), player)
	end
end

function mod:CheckForBOV(player)
	if player:HasCollectible(CollectibleType.COLLECTIBLE_BOOK_OF_VIRTUES) then
		player:AddWisp(WildFireCamera.COLLECTIBLE_WILDLIFE_CAMERA, player.Position, false, false)
	end
end

function mod:SpawnFlash(player)
	if BarabaraBerebere.DoCameraFlash then
		Isaac.Spawn(1000, FadeOut.EFFECT_CAMERA, 0, Vector(320,870), Vector(0, 0), player)
	end
end

mod:AddCallback(ModCallbacks.MC_USE_ITEM, function(_, camera, itemrng, player)
	SFXManager():Play(Flashbang.SOUND_CAMERA_FLASH, BarabaraBerebere.FlashVolume)
	mod:SpawnFlash(player)
	for i, entity in ipairs(Isaac.GetRoomEntities()) do
			for j, entry in pairs(mod.TribeTable) do
				if not entity:HasEntityFlags(EntityFlag.FLAG_FRIENDLY) then
					if mod:CheckIDInTable(entity, entry) then
						entity:Kill()
						mod:SpawnCard(entity, j, player)
						mod:CheckForBOV(player)
					elseif entity:IsEnemy() then
						entity:AddFreeze(EntityRef(player), 150)
						entity:TakeDamage(5, 0, EntityRef(player), 10)
				end
			end
		end
	end
	if not BarabaraBerebere.DoCameraFlash then
		return true
	end
end, WildFireCamera.COLLECTIBLE_WILDLIFE_CAMERA)

function mod:NumberCap(number)
	if number < 2 then
		number = 2
		return number
	end
	return number
end

function mod:PlayerHoldingTrinket(trinket)
	for i = game:GetNumPlayers(), 1, -1 do
		if Isaac.GetPlayer(i-1):HasTrinket(trinket) then
			return Isaac.GetPlayer(i-1)
		end
		return nil
	end
end
			

mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player)
	local aimdirection = player:GetAimDirection()
	if aimdirection:Length() ~= 0 then
		local hooktear = Isaac.Spawn(EntityType.ENTITY_TEAR, TearHook.HOOK, 0, player.Position, aimdirection*17, player):ToTear()
		hooktear.SpriteRotation = hooktear.Velocity:GetAngleDegrees()
		hooktear:GetSprite():Play("Hook", true)
		hooktear:ResetSpriteScale()
		hooktear.FallingSpeed = 0.3
		hooktear.KnockbackMultiplier = 2
		hooktear.Height = -30.5
		hooktear.CollisionDamage = 100
		hooktear.Parent = player
		hooktear.Scale = 2.2
		hooktear.TearFlags = TearFlags.TEAR_PIERCING | TearFlags.TEAR_EXTRA_GORE
		SFXManager():Play(SoundEffect.SOUND_SUMMON_POOF, 2)
		if BarabaraBerebere.FishHookWormEffect then
			hooktear:AddTearFlags(TearFlags.TEAR_SQUARE)
		end
	end
end, SR_Cards.CARD_FISH_HOOK)

mod:AddCallback(ModCallbacks.MC_POST_TEAR_UPDATE, function(_, tear)
	tear.SpriteRotation = tear.Velocity:GetAngleDegrees()
end, TearHook.HOOK)

mod:AddCallback(ModCallbacks.MC_PRE_TEAR_COLLISION, function(_, tear, collider)
	for j, entry in pairs(mod.TribeTable) do
		if mod:CheckIDInTable(collider, entry) then
			if not collider:HasEntityFlags(EntityFlag.FLAG_FRIENDLY) then
				collider:AddEntityFlags(EntityFlag.FLAG_EXTRA_GORE)
				collider:Kill()
				mod:SpawnCard(collider, j, player)
			end
		end
	end
end, TearHook.HOOK)

if not BarabaraBerebere.AntiLag then
	mod:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, function(_, pickup, collider)
		if pickup.SubType == SR_Cards.CARD_FISH_HOOK and collider.Type == EntityType.ENTITY_PLAYER then
			mod.Schedule(0, function(player)
				if SFXManager():IsPlaying(SoundEffect.SOUND_BOOK_PAGE_TURN_12) and player:GetCard(0) == SR_Cards.CARD_FISH_HOOK then
					SFXManager():Stop(SoundEffect.SOUND_BOOK_PAGE_TURN_12)
					SFXManager():Play(SoundEffect.SOUND_SHELLGAME)
				end
			end, {Isaac.GetPlayer(collider.Variant)})
		end
	end, PickupVariant.PICKUP_TAROTCARD)
end

mod:AddCallback(ModCallbacks.MC_POST_ENTITY_REMOVE, function(_, entity)
	if entity.Variant == TearHook.HOOK then
		SFXManager():Play(SoundEffect.SOUND_POT_BREAK, 0.5, 2, false, 2)
		Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.IMPACT, 0, entity.Position, Vector(0, 0), entity)
		Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.NAIL_PARTICLE, 0, entity.Position, Vector(0, 0), entity)
	end
end, 2)




function mod:spritePlay(sprite, anim)
	if not sprite:IsPlaying(anim) then
		sprite:Play(anim)
	end
end


mod:AddCallback(ModCallbacks.MC_POST_EFFECT_UPDATE, function(_, npc)
	npcdata = npc:GetData()
	if npcdata.parent then
		npc.Position = npcdata.parent.Position + npcdata.parent.Velocity
	end
	mod:spritePlay(npc:GetSprite(), "flash")
	if npc.SubType == 0 then
		npc.DepthOffset = 1000
	end
	if npc:GetSprite():IsFinished("flash") then
		npc:Remove()
	end
	for i, entity in ipairs(Isaac.GetRoomEntities()) do
		if entity:IsEnemy() then 
			if not entity:HasEntityFlags(EntityFlag.FLAG_FRIENDLY) then
				entity:AddFreeze(EntityRef(player), 1)
			end
		end
	end
end, FadeOut.EFFECT_CAMERA)
