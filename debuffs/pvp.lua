local _, ns = ...
local oUF = ns.oUF
local RD = ns.oUF_RaidDebuffs

-- Blizzard
local LE_EXPANSION_LEVEL_CURRENT = _G.LE_EXPANSION_LEVEL_CURRENT
local LE_EXPANSION_CLASSIC = _G.LE_EXPANSION_CLASSIC or 0
local LE_EXPANSION_BURNING_CRUSADE = _G.LE_EXPANSION_BURNING_CRUSADE or 1
local LE_EXPANSION_WRATH_OF_THE_LICH_KING = _G.LE_EXPANSION_WRATH_OF_THE_LICH_KING or 2
local LE_EXPANSION_CATACLYSM = _G.LE_EXPANSION_CATACLYSM or 3
local LE_EXPANSION_MISTS_OF_PANDARIA = _G.LE_EXPANSION_MISTS_OF_PANDARIA or 4
local LE_EXPANSION_WARLORDS_OF_DRAENOR = _G.LE_EXPANSION_WARLORDS_OF_DRAENOR or 5
local LE_EXPANSION_LEGION = _G.LE_EXPANSION_LEGION or 6
local LE_EXPANSION_BATTLE_FOR_AZEROTH = _G.LE_EXPANSION_BATTLE_FOR_AZEROTH or 7
local LE_EXPANSION_SHADOWLANDS = _G.LE_EXPANSION_SHADOWLANDS or 8
local LE_EXPANSION_DRAGONFLIGHT = _G.LE_EXPANSION_DRAGONFLIGHT or 9
local LE_EXPANSION_WAR_WITHIN = _G.LE_EXPANSION_WAR_WITHIN or 10

-- Mine
local spells = {}

if oUF.isRetail then
    Mixin(spells, {
        -- EVOKER
        [355689] = RD:CreatePriority(2), -- Landslide
        [360806] = RD:CreatePriority(3), -- Sleep Walk
        [370898] = RD:CreatePriority(1), -- Permeating Chill

        -- DEATH KNIGHT
        [47476] = RD:CreatePriority(2), -- Strangulate
        [91797] = RD:CreatePriority(4), -- Monstrous Blow (Pet)
        [91800] = RD:CreatePriority(4), -- Gnaw (Pet)
        [91807] = RD:CreatePriority(1), -- Shambling Rush (Pet)
        [108194] = RD:CreatePriority(4), -- Asphyxiate UH
        [204085] = RD:CreatePriority(1), -- Deathchill
        [206961] = RD:CreatePriority(3), -- Tremble Before Me
        [207167] = RD:CreatePriority(4), -- Blinding Sleet
        [207171] = RD:CreatePriority(4), -- Winter is Coming
        [210141] = RD:CreatePriority(3), -- Zombie Explosion
        [212332] = RD:CreatePriority(4), -- Smash (Pet)
        [212337] = RD:CreatePriority(4), -- Powerful Smash (Pet)
        [212540] = RD:CreatePriority(1), -- Flesh Hook (Pet)
        [221562] = RD:CreatePriority(4), -- Asphyxiate Blood
        [233395] = RD:CreatePriority(1), -- Frozen Center

        -- DEMON HUNTER
        [207685] = RD:CreatePriority(4), -- Sigil of Misery
        [217832] = RD:CreatePriority(3), -- Imprison
        [221527] = RD:CreatePriority(5), -- Imprison (Banished version)
        [204490] = RD:CreatePriority(2), -- Sigil of Silence
        [179057] = RD:CreatePriority(3), -- Chaos Nova
        [211881] = RD:CreatePriority(4), -- Fel Eruption
        [205630] = RD:CreatePriority(3), -- Illidan's Grasp
        [208618] = RD:CreatePriority(3), -- Illidan's Grasp (Afterward)
        [213491] = RD:CreatePriority(4), -- Demonic Trample 1
        [208645] = RD:CreatePriority(4), -- Demonic Trample 2

        -- DRUID
        [99] = RD:CreatePriority(4), -- Incapacitating Roar
        [339] = RD:CreatePriority(1), -- Entangling Roots
        [2637] = RD:CreatePriority(1), -- Hibernate
        [5211] = RD:CreatePriority(4), -- Mighty Bash
        [33786] = RD:CreatePriority(5), -- Cyclone
        [45334] = RD:CreatePriority(1), -- Immobilized
        [81261] = RD:CreatePriority(2), -- Solar Beam
        [102359] = RD:CreatePriority(1), -- Mass Entanglement
        [102793] = RD:CreatePriority(1), -- Ursol's Vortex
        [163505] = RD:CreatePriority(4), -- Rake
        [202244] = RD:CreatePriority(4), -- Overrun
        [203123] = RD:CreatePriority(4), -- Maim

        -- HUNTER
        [3355] = RD:CreatePriority(3), -- Freezing Trap
        [19386] = RD:CreatePriority(3), -- Wyvern Sting
        [24394] = RD:CreatePriority(4), -- Intimidation
        [202933] = RD:CreatePriority(2), -- Spider Sting 1
        [233022] = RD:CreatePriority(2), -- Spider Sting 2
        [213691] = RD:CreatePriority(4), -- Scatter Shot
        [203337] = RD:CreatePriority(5), -- Freezing Trap (PvP Talent)
        [209790] = RD:CreatePriority(3), -- Freezing Arrow
        [117526] = RD:CreatePriority(4), -- Binding Shot
        [190927] = RD:CreatePriority(1), -- Harpoon
        [201158] = RD:CreatePriority(1), -- Super Sticky Tar
        [162480] = RD:CreatePriority(1), -- Steel Trap
        [212638] = RD:CreatePriority(1), -- Tracker's Net
        [200108] = RD:CreatePriority(1), -- Ranger's Net

        -- MAGE
        [118] = RD:CreatePriority(3), -- Polymorph
        [122] = RD:CreatePriority(1), -- Frost Nova
        [28271] = RD:CreatePriority(3), -- Turtle
        [28272] = RD:CreatePriority(3), -- Pig
        [31661] = RD:CreatePriority(3), -- Dragon's Breath
        [33395] = RD:CreatePriority(1), -- Freeze
        [61305] = RD:CreatePriority(3), -- Black Cat
        [61721] = RD:CreatePriority(3), -- Rabbit
        [61780] = RD:CreatePriority(3), -- Turkey
        [82691] = RD:CreatePriority(3), -- Ring of Frost
        [126819] = RD:CreatePriority(3), -- Porcupine
        [157997] = RD:CreatePriority(1), -- Ice Nova
        [161353] = RD:CreatePriority(3), -- Polar Bear
        [161354] = RD:CreatePriority(3), -- Monkey
        [161355] = RD:CreatePriority(3), -- Penguin
        [161372] = RD:CreatePriority(3), -- Peacock
        [198121] = RD:CreatePriority(1), -- Frostbite
        [228600] = RD:CreatePriority(1), -- Glacial Spike
        [277787] = RD:CreatePriority(3), -- Direhorn
        [277792] = RD:CreatePriority(3), -- Bumblebee

        -- MONK
        [119381] = RD:CreatePriority(4), -- Leg Sweep
        [202346] = RD:CreatePriority(4), -- Double Barrel
        [115078] = RD:CreatePriority(4), -- Paralysis
        [198909] = RD:CreatePriority(3), -- Song of Chi-Ji
        [202274] = RD:CreatePriority(3), -- Incendiary Brew
        [233759] = RD:CreatePriority(2), -- Grapple Weapon
        [123407] = RD:CreatePriority(1), -- Spinning Fire Blossom
        [116706] = RD:CreatePriority(1), -- Disable
        [232055] = RD:CreatePriority(4), -- Fists of Fury

        -- PALADIN
        [853] = RD:CreatePriority(3), -- Hammer of Justice
        [20066] = RD:CreatePriority(3), -- Repentance
        [31935] = RD:CreatePriority(2), -- Avenger's Shield
        [105421] = RD:CreatePriority(3), -- Blinding Light
        [205290] = RD:CreatePriority(3), -- Wake of Ashes
        [217824] = RD:CreatePriority(2), -- Shield of Virtue

        -- PRIEST
        [453] = RD:CreatePriority(5), -- Mind Soothe
        [605] = RD:CreatePriority(5), -- Mind Control
        [8122] = RD:CreatePriority(3), -- Psychic Scream
        [9484] = RD:CreatePriority(3), -- Shackle Undead
        [15487] = RD:CreatePriority(2), -- Silence
        [64044] = RD:CreatePriority(1), -- Psychic Horror
        [200196] = RD:CreatePriority(4), -- Holy Word: Chastise
        [200200] = RD:CreatePriority(4), -- Holy Word: Chastise

        -- ROGUE
        [408] = RD:CreatePriority(4), -- Kidney Shot
        [1330] = RD:CreatePriority(2), -- Garrote - Silence
        [1776] = RD:CreatePriority(4), -- Gouge
        [1833] = RD:CreatePriority(4), -- Cheap Shot
        [2094] = RD:CreatePriority(4), -- Blind
        [6770] = RD:CreatePriority(4), -- Sap
        [207736] = RD:CreatePriority(5), -- Shadowy Duel (Smoke effect)
        [207777] = RD:CreatePriority(2), -- Dismantle
        [212182] = RD:CreatePriority(5), -- Smoke Bomb

        -- SHAMAN
        [51514] = RD:CreatePriority(3), -- Hex
        [64695] = RD:CreatePriority(1), -- Earthgrab
        [77505] = RD:CreatePriority(4), -- Earthquake (Knocking down)
        [118345] = RD:CreatePriority(4), -- Pulverize (Pet)
        [118905] = RD:CreatePriority(3), -- Static Charge
        [157375] = RD:CreatePriority(4), -- Gale Force
        [196942] = RD:CreatePriority(3), -- Hex (Voodoo Totem)
        [204399] = RD:CreatePriority(3), -- Earthfury
        [204437] = RD:CreatePriority(3), -- Lightning Lasso
        [210873] = RD:CreatePriority(3), -- Hex (Compy)
        [211004] = RD:CreatePriority(3), -- Hex (Spider)
        [211010] = RD:CreatePriority(3), -- Hex (Snake)
        [211015] = RD:CreatePriority(3), -- Hex (Cockroach)
        [269352] = RD:CreatePriority(3), -- Hex (Skeletal Hatchling)
        [277778] = RD:CreatePriority(3), -- Hex (Zandalari Tendonripper)
        [277784] = RD:CreatePriority(3), -- Hex (Wicker Mongrel)

        -- WARLOCK
        [710] = RD:CreatePriority(5), -- Banish
        [6358] = RD:CreatePriority(3), -- Seduction (Succub)
        [6789] = RD:CreatePriority(3), -- Mortal Coil
        [22703] = RD:CreatePriority(4), -- Infernal Awakening (Infernal CD)
        [30283] = RD:CreatePriority(3), -- Shadowfury
        [89766] = RD:CreatePriority(4), -- Axe Toss
        [118699] = RD:CreatePriority(3), -- Fear
        [171017] = RD:CreatePriority(4), -- Meteor Strike (Infernal)
        [233582] = RD:CreatePriority(1), -- Entrenched in Flame

        -- WARRIOR
        [5246] = RD:CreatePriority(4), -- Intimidating Shout
        [105771] = RD:CreatePriority(1), -- Charge
        [132168] = RD:CreatePriority(4), -- Shockwave
        [132169] = RD:CreatePriority(4), -- Storm Bolt
        [199042] = RD:CreatePriority(1), -- Thunderstruck
        [199085] = RD:CreatePriority(4), -- Warpath
        [236077] = RD:CreatePriority(2), -- Disarm

        -- RACIAL
        [20549] = RD:CreatePriority(4), -- War Stomp
        [107079] = RD:CreatePriority(4), -- Quaking Palm
    })

-- Classic Era
elseif LE_EXPANSION_LEVEL_CURRENT >= LE_EXPANSION_CLASSIC then
    Mixin(spells, {
        -- DRUID
        [339] = RD:CreatePriority(2), -- Entangling Roots
        [2637] = RD:CreatePriority(3), -- Hibernate
        [5211] = RD:CreatePriority(3), -- Bash
        [9005] = RD:CreatePriority(3), -- Pounce
        [16922] = RD:CreatePriority(3), -- Celestial Focus
        [19975] = RD:CreatePriority(2), -- Entangling Roots (Nature's Grasp)
        [22570] = RD:CreatePriority(3), -- Maim
        
        -- HUNTER
        [3355] = RD:CreatePriority(3), -- Freezing Trap
        [4167] = RD:CreatePriority(2), -- Web (Pet)
        [19185] = RD:CreatePriority(2), -- Entrapment
        [19229] = RD:CreatePriority(2), -- Improved Wing Clip
        [19306] = RD:CreatePriority(2), -- Counterattack
        [19386] = RD:CreatePriority(3), -- Wyvern Sting
        [19410] = RD:CreatePriority(3), -- Improved Concussive Shot
        [19503] = RD:CreatePriority(3), -- Scatter Shot
        [24394] = RD:CreatePriority(3), -- Intimidation

        -- MAGE
        [118] = RD:CreatePriority(3), -- Polymorph
        [122] = RD:CreatePriority(2), -- Frost Nova
        [12355] = RD:CreatePriority(3), -- Impact
        [12494] = RD:CreatePriority(2), -- Frostbite
        [18469] = RD:CreatePriority(3), -- Silenced - Improved Counterspell
        [28271] = RD:CreatePriority(3), -- Polymorph: Turtle
        [28272] = RD:CreatePriority(3), -- Polymorph: Pig
        
        -- PALADIN
        [853] = RD:CreatePriority(3), -- Hammer of Justice
        [2878] = RD:CreatePriority(3), -- Turn Undead
        [10326] = RD:CreatePriority(3), -- Turn Evil
        [20066] = RD:CreatePriority(3), -- Repentance
        [20170] = RD:CreatePriority(3), -- Stun (Seal of Justice Proc)
        
        -- PRIEST
        [605] = RD:CreatePriority(3), -- Mind Control
        [8122] = RD:CreatePriority(3), -- Psychic Scream
        [9484] = RD:CreatePriority(3), -- Shackle Undead
        [15269] = RD:CreatePriority(3), -- Blackout
        [15487] = RD:CreatePriority(3), -- Silence
        
        -- ROGUE
        [408] = RD:CreatePriority(3), -- Kidney Shot
        [1330] = RD:CreatePriority(3), -- Garrote - Silence
        [1776] = RD:CreatePriority(3), -- Gouge
        [1833] = RD:CreatePriority(3), -- Cheap Shot
        [2094] = RD:CreatePriority(3), -- Blind
        [6770] = RD:CreatePriority(3), -- Sap
        [14251] = RD:CreatePriority(3), -- Riposte
        [18425] = RD:CreatePriority(3), -- Silenced - Improved Kick
        
        -- WARLOCK
        [5484] = RD:CreatePriority(3), -- Howl of Terror
        [5782] = RD:CreatePriority(3), -- Fear
        [6358] = RD:CreatePriority(3), -- Seduction (Succubus)
        [6789] = RD:CreatePriority(3), -- Death Coil
        [18093] = RD:CreatePriority(3), -- Pyroclasm
        [24259] = RD:CreatePriority(3), -- Spell Lock (Felhunter)
        
        -- WARRIOR
        [676] = RD:CreatePriority(3), -- Disarm
        [5246] = RD:CreatePriority(3), -- Intimidating Shout
        [7922] = RD:CreatePriority(3), -- Charge Stun
        [12798] = RD:CreatePriority(3), -- Revenge Stun
        [12809] = RD:CreatePriority(3), -- Concussion Blow
        [18498] = RD:CreatePriority(3), -- Shield Bash - Silenced
        [20253] = RD:CreatePriority(3), -- Intercept Stun
        [23694] = RD:CreatePriority(2), -- Improved Hamstring
        
        -- RACIAL
        [20549] = RD:CreatePriority(3), -- War Stomp
        
        -- OTHERS
        [5530] = RD:CreatePriority(3), -- Mace Specialization
    })

-- The Burning Crusade
elseif LE_EXPANSION_LEVEL_CURRENT >= LE_EXPANSION_BURNING_CRUSADE then
    Mixin(spells, {
        -- DRUID
        [33786] = RD:CreatePriority(3), -- Cyclone
        [45334] = RD:CreatePriority(2), -- Feral Charge Effect
        
        -- HUNTER
        [34490] = RD:CreatePriority(3), -- Silencing Shot

        -- MAGE
        [31661] = RD:CreatePriority(3), -- Dragon's Breath
        [33395] = RD:CreatePriority(2), -- Freeze (Water Elemental)
        
        -- PRIEST
        [44041] = RD:CreatePriority(3), -- Chastise
        
        -- ROGUE
        [32747] = RD:CreatePriority(3), -- Deadly Throw Interrupt
        
        -- WARLOCK
        [30153] = RD:CreatePriority(3), -- Intercept Stun (Felguard)
        [30283] = RD:CreatePriority(3), -- Shadowfury
        
        -- WARRIOR

        -- RACIAL
        [28730]  = RD:CreatePriority(3), -- Arcane Torrent
    })
end

RD.debuffs["PvP"] = spells
