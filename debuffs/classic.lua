local _, ns = ...
local oUF = ns.oUF
local RD = ns.oUF_RaidDebuffs

if not oUF.isClassic then return end

local debuffs = {
    -- Onyxia's Lair
    [249] = {
        [18431] = RD:CreatePriority(2), --Bellowing Roar
    },
    -- Molten Core
    [409] = {
        [19703] = RD:CreatePriority(2), --Lucifron's Curse
        [19408] = RD:CreatePriority(2), --Panic
        [19716] = RD:CreatePriority(2), --Gehennas' Curse
        [20277] = RD:CreatePriority(2), --Fist of Ragnaros
        [20475] = RD:CreatePriority(6), --Living Bomb
        [19695] = RD:CreatePriority(6), --Inferno
        [19659] = RD:CreatePriority(2), --Ignite Mana
        [19714] = RD:CreatePriority(2), --Deaden Magic
        [19713] = RD:CreatePriority(2), --Shazzrah's Curse
    },
    -- Blackwing's Lair
    [469] = {
        [23023] = RD:CreatePriority(2), --Conflagration
        [18173] = RD:CreatePriority(2), --Burning Adrenaline
        [24573] = RD:CreatePriority(2), --Mortal Strike
        [23340] = RD:CreatePriority(2), --Shadow of Ebonroc
        [23170] = RD:CreatePriority(2), --Brood Affliction: Bronze
        [22687] = RD:CreatePriority(2), --Veil of Shadow
    },
    -- Zul'Gurub
    [309] = {
        [23860] = RD:CreatePriority(2), --Holy Fire
        [22884] = RD:CreatePriority(2), --Psychic Scream
        [23918] = RD:CreatePriority(2), --Sonic Burst
        [24111] = RD:CreatePriority(2), --Corrosive Poison
        [21060] = RD:CreatePriority(2), --Blind
        [24328] = RD:CreatePriority(2), --Corrupted Blood
        [16856] = RD:CreatePriority(2), --Mortal Strike
        [24664] = RD:CreatePriority(2), --Sleep
        [17172] = RD:CreatePriority(2), --Hex
        [24306] = RD:CreatePriority(2), --Delusions of Jin'do
        [24099] = RD:CreatePriority(2), --Poison Bolt Volley
    },
    -- Ruins of Ahn'Qiraj
    [509] = {
        [25646] = RD:CreatePriority(2), --Mortal Wound
        [25471] = RD:CreatePriority(2), --Attack Order
        [96] = RD:CreatePriority(2), --Dismember
        [25725] = RD:CreatePriority(2), --Paralyze
        [25189] = RD:CreatePriority(2), --Enveloping Winds
    },
    -- Ahn'Qiraj Temple
    [531] = {
        [785] = RD:CreatePriority(2), --True Fulfillment
        [26580] = RD:CreatePriority(2), --Fear
        [26050] = RD:CreatePriority(2), --Acid Spit
        [26180] = RD:CreatePriority(2), --Wyvern Sting
        [26053] = RD:CreatePriority(2), --Noxious Poison
        [26613] = RD:CreatePriority(2), --Unbalancing Strike
        [26029] = RD:CreatePriority(2), --Dark Glare
    },
    -- Naxxramas
    [3456] = {
        [28732] = RD:CreatePriority(2), --Widow's Embrace
        [28622] = RD:CreatePriority(2), --Web Wrap
        [28169] = RD:CreatePriority(2), --Mutating Injection
        [29213] = RD:CreatePriority(2), --Curse of the Plaguebringer
        [28835] = RD:CreatePriority(2), --Mark of Zeliek
        [27808] = RD:CreatePriority(2), --Frost Blast
        [28410] = RD:CreatePriority(2), --Chains of Kel'Thuzad
        [27819] = RD:CreatePriority(2), --Detonate Mana
    },

    -- Karazhan
    [532] = {
        -- Trash
        [29679] = RD:CreatePriority(4), -- Bad Poetry
        [29505] = RD:CreatePriority(3), -- Banshee Shriek
        [32441] = RD:CreatePriority(4), -- Brittle Bones
        [29690] = RD:CreatePriority(5), -- Drunken Skull Crack
        [29321] = RD:CreatePriority(4), -- Fear
        [29935] = RD:CreatePriority(4), -- Gaping Maw
        [29670] = RD:CreatePriority(5), -- Ice Tomb
        [29491] = RD:CreatePriority(4), -- Impending Betrayal
        [41580] = RD:CreatePriority(3), -- Net
        [29676] = RD:CreatePriority(5), -- Rolling Pin
        [29490] = RD:CreatePriority(5), -- Seduction
        [29684] = RD:CreatePriority(5), -- Shield Slam
        [29300] = RD:CreatePriority(5), -- Sonic Blast
        [29900] = RD:CreatePriority(5), -- Unstable Magic (Good Debuff)
        
        -- Attumen the Huntsman
        [29833] = RD:CreatePriority(3), -- Intangible Presence
        [29711] = RD:CreatePriority(4), -- Knockdown
        
        -- Moroes
        [34694] = RD:CreatePriority(4), -- Blind
        [37066] = RD:CreatePriority(5), -- Garrote
        [29425] = RD:CreatePriority(4), -- Gouge
        [13005] = RD:CreatePriority(3), -- Hammer of Justice (Baron Rafe Dreuger)
        [29572] = RD:CreatePriority(3), -- Mortal Strike (Lord Robin Daris)
        
        -- Maiden of Virtue
        [29522] = RD:CreatePriority(3), -- Holy Fire
        [29511] = RD:CreatePriority(4), -- Repentance
        
        -- Animal Bosses
        
        -- Hyakiss the Lurker
        [29901] = RD:CreatePriority(3), -- Acidic Fang
        [29896] = RD:CreatePriority(4), -- Hyakiss' Web
        
        -- Rokad the Ravager
        [29906] = RD:CreatePriority(3), -- Ravage
        
        -- Shadikith the Glider
        [29903] = RD:CreatePriority(4), -- Dive
        [29904] = RD:CreatePriority(3), -- Sonic Burst
        
        -- Opera Event (Wizard of Oz)
        [31042] = RD:CreatePriority(5), -- Shred Armor
        [31046] = RD:CreatePriority(4), -- Brain Bash

        -- Opera Event (The Big Bad Wolf)
        [30753] = RD:CreatePriority(5), -- Red Riding Hood
        [30752] = RD:CreatePriority(3), -- Terrifying Howl
        [30761] = RD:CreatePriority(4), -- Wide Swipe

        -- Opera Event (Romulo and Julianne)
        [30890] = RD:CreatePriority(3), -- Blinding Passion
        [30822] = RD:CreatePriority(4), -- Poisoned Thrust
        [30889] = RD:CreatePriority(5), -- Powerful Attraction

        -- The Curator
        
        -- Shade of Aran
        [29991] = RD:CreatePriority(5), -- Chains of Ice
        [29954] = RD:CreatePriority(3), -- Frostbolt
        [30035] = RD:CreatePriority(4), -- Mass Slow
        [29990] = RD:CreatePriority(5), -- Slow
        
        -- Terestian Illhoof
        [30053] = RD:CreatePriority(3), -- Amplify Flames
        [30115] = RD:CreatePriority(4), -- Sacrifice
        
        -- Netherspite
        [37063] = RD:CreatePriority(3), -- Void Zone
        
        -- Chess Event
        
        -- Prince Malchezaar
        [39095] = RD:CreatePriority(3), -- Amplify Damage
        [30843] = RD:CreatePriority(5), -- Enfeeble
        [30854] = RD:CreatePriority(4), -- Shadow Word: Pain (Tank)
        [30898] = RD:CreatePriority(4), -- Shadow Word: Pain (Raid)
        [30901] = RD:CreatePriority(3), -- Sunder Armor

        -- Nightbane
        [36922] = RD:CreatePriority(5), -- Bellowing Roar
        [30129] = RD:CreatePriority(6), -- Charred Earth
        [30130] = RD:CreatePriority(3), -- Distracting Ash
        [37098] = RD:CreatePriority(5), -- Rain of Bones
        [30127] = RD:CreatePriority(4), -- Searing Cinders
        [30210] = RD:CreatePriority(3), -- Smoldering Breath
        [25653] = RD:CreatePriority(3), -- Tail Sweep
    },
    -- Magtheridon's Lair
    [544] = {
        -- Trash
        [34437] = RD:CreatePriority(4), -- Death Coil
        [34435] = RD:CreatePriority(3), -- Rain of Fire
        [34439] = RD:CreatePriority(5), -- Unstable Affliction
        
        -- Magtheridon
        [30410] = RD:CreatePriority(3), -- Shadow Grasp
    },
    -- Gruul's Lair
    [565] = {
        -- High King Maulgar
        
        -- Blindeye the Seer
        
        -- Kiggler the Crazed
        [33175] = RD:CreatePriority(3), -- Arcane Shock
        [33173] = RD:CreatePriority(5), -- Greater Polymorph
        
        -- Krosh Firehand
        [33061] = RD:CreatePriority(3), -- Blast Wave
        
        -- Olm the Summoner
        [33129] = RD:CreatePriority(4), -- Dark Decay
        [33130] = RD:CreatePriority(5), -- Death Coil
        
        -- High King Maulgar
        [16508] = RD:CreatePriority(5), -- Intimidating Roar
        
        -- Gruul the Dragonkiller
        [36240] = RD:CreatePriority(4), -- Cave In
    },
    -- Serpentshrine Cavern
    [548] = {
        -- Trash
        [38634] = RD:CreatePriority(3), -- Arcane Lightning
        [39032] = RD:CreatePriority(4), -- Initial Infection
        [38572] = RD:CreatePriority(3), -- Mortal Cleave
        [38635] = RD:CreatePriority(3), -- Rain of Fire
        [39042] = RD:CreatePriority(5), -- Rampent Infection
        [39044] = RD:CreatePriority(4), -- Serpentshrine Parasite
        [38591] = RD:CreatePriority(4), -- Shatter Armor
        [38491] = RD:CreatePriority(3), -- Silence
        
        -- Hydross the Unstable
        [38246] = RD:CreatePriority(3), -- Vile Sludge
        [38235] = RD:CreatePriority(4), -- Water Tomb
        
        -- The Lurker Below
        
        -- Morogrim Tidewalker
        [38049] = RD:CreatePriority(4), -- Watery Grave
        [37850] = RD:CreatePriority(4), -- Watery Grave
        
        -- Fathom-Lord Karathress
        [39261] = RD:CreatePriority(3), -- Gusting Winds
        [29436] = RD:CreatePriority(4), -- Leeching Throw
        
        -- Leotheras the Blind
        [37675] = RD:CreatePriority(3), -- Chaos Blast
        [37749] = RD:CreatePriority(5), -- Consuming Madness
        [37676] = RD:CreatePriority(4), -- Insidious Whisper
        [37641] = RD:CreatePriority(3), -- Whirlwind
        
        -- Lady Vashj
        [38316] = RD:CreatePriority(3), -- Entangle
        [38280] = RD:CreatePriority(5), -- Static Charge
    },
    -- Tempest Keep: The Eye
    [550] = {
        -- Trash
        [37133] = RD:CreatePriority(4), -- Arcane Buffet
        [37132] = RD:CreatePriority(3), -- Arcane Shock
        [37122] = RD:CreatePriority(5), -- Domination
        [37135] = RD:CreatePriority(5), -- Domination
        [37120] = RD:CreatePriority(4), -- Fragmentation Bomb
        [39077] = RD:CreatePriority(3), -- Hammer of Justice
        [37279] = RD:CreatePriority(3), -- Rain of Fire
        [37123] = RD:CreatePriority(4), -- Saw Blade
        [37118] = RD:CreatePriority(5), -- Shell Shock
        [37160] = RD:CreatePriority(3), -- Silence
        
        -- Al'ar
        [35410] = RD:CreatePriority(4), -- Melt Armor
        
        -- Void Reaver
        
        -- High Astromancer Solarian
        [34322] = RD:CreatePriority(4), -- Psychic Scream
        [42783] = RD:CreatePriority(5), -- Wrath of the Astromancer (Patch 2.2.0)
       
        -- Kael'thas Sunstrider
        [36965] = RD:CreatePriority(4), -- Rend
        [30225] = RD:CreatePriority(4), -- Silence
        [44863] = RD:CreatePriority(5), -- Bellowing Roar
        [37018] = RD:CreatePriority(4), -- Conflagration
        [37027] = RD:CreatePriority(5), -- Remote Toy
        [36991] = RD:CreatePriority(4), -- Rend
        [36797] = RD:CreatePriority(5), -- Mind Control
    },
    -- The Battle for Mount Hyjal
    [534] = {
        -- Rage Winterchill
        -- Anetheron
        -- Kaz'rogal
        -- Azgalor
        -- Archimonde
    },
    -- Black Temple
    [564] = {
        -- High Warlord Naj'entus
        -- Supremus
        -- Shade of Akama
        -- Teron Gorefiend
        -- Gurtogg Bloodboil
        -- Reliquary of Souls
        -- Mother Shahraz
        -- Illidari Council
        -- Illidan Stormrage
    },
    -- Zul'Aman
    [568] = {     
        -- Nalorakk
        -- Jan'alai
        -- Akil'zon
        -- Halazzi
        -- Hexxlord Jin'Zakk
        -- Zul'jin
    },
    -- Sunwell Plateau
    [580] = {
        -- Kalecgos
        -- Sathrovarr
        -- Brutallus
        -- Felmyst
        -- Alythess
        -- Sacrolash
        -- M'uru
        -- Kil'Jaeden
    },
    ["PvP"] = {
        -- DRUID
        [5211] = RD:CreatePriority(3), -- Bash
        [16922] = RD:CreatePriority(3), -- Celestial Focus
        [33786] = RD:CreatePriority(3), -- Cyclone
        [339] = RD:CreatePriority(2), -- Entangling Roots
        [19975] = RD:CreatePriority(2), -- Entangling Roots (Nature's Grasp)
        [45334] = RD:CreatePriority(2), -- Feral Charge Effect
        [2637] = RD:CreatePriority(3), -- Hibernate
        [22570] = RD:CreatePriority(3), -- Maim
        [9005] = RD:CreatePriority(3), -- Pounce
        
        -- HUNTER
        [19306] = RD:CreatePriority(2), -- Counterattack
        [19185] = RD:CreatePriority(2), -- Entrapment
        [3355] = RD:CreatePriority(3), -- Freezing Trap
        [19410] = RD:CreatePriority(3), -- Improved Concussive Shot
        [19229] = RD:CreatePriority(2), -- Improved Wing Clip
        [24394] = RD:CreatePriority(3), -- Intimidation
        [19503] = RD:CreatePriority(3), -- Scatter Shot
        [34490] = RD:CreatePriority(3), -- Silencing Shot
        [4167] = RD:CreatePriority(2), -- Web (Pet)
        [19386] = RD:CreatePriority(3), -- Wyvern Sting

        -- MAGE
        [31661] = RD:CreatePriority(3), -- Dragon's Breath
        [33395] = RD:CreatePriority(2), -- Freeze (Water Elemental)
        [12494] = RD:CreatePriority(2), -- Frostbite
        [122] = RD:CreatePriority(2), -- Frost Nova
        [12355] = RD:CreatePriority(3), -- Impact
        [118] = RD:CreatePriority(3), -- Polymorph
        [28272] = RD:CreatePriority(3), -- Polymorph: Pig
        [28271] = RD:CreatePriority(3), -- Polymorph: Turtle
        [18469] = RD:CreatePriority(3), -- Silenced - Improved Counterspell
        
        -- PALADIN
        [853] = RD:CreatePriority(3), -- Hammer of Justice
        [20066] = RD:CreatePriority(3), -- Repentance
        [20170] = RD:CreatePriority(3), -- Stun (Seal of Justice Proc)
        [10326] = RD:CreatePriority(3), -- Turn Evil
        [2878] = RD:CreatePriority(3), -- Turn Undead
        
        -- PRIEST
        [15269] = RD:CreatePriority(3), -- Blackout
        [44041] = RD:CreatePriority(3), -- Chastise
        [605] = RD:CreatePriority(3), -- Mind Control
        [8122] = RD:CreatePriority(3), -- Psychic Scream
        [9484] = RD:CreatePriority(3), -- Shackle Undead
        [15487] = RD:CreatePriority(3), -- Silence
        
        -- ROGUE
        [2094] = RD:CreatePriority(3), -- Blind
        [1833] = RD:CreatePriority(3), -- Cheap Shot
        [32747] = RD:CreatePriority(3), -- Deadly Throw Interrupt
        [1330] = RD:CreatePriority(3), -- Garrote - Silence
        [1776] = RD:CreatePriority(3), -- Gouge
        [408] = RD:CreatePriority(3), -- Kidney Shot
        [14251] = RD:CreatePriority(3), -- Riposte
        [6770] = RD:CreatePriority(3), -- Sap
        [18425] = RD:CreatePriority(3), -- Silenced - Improved Kick
        
        -- WARLOCK
        [6789] = RD:CreatePriority(3), -- Death Coil
        [5782] = RD:CreatePriority(3), -- Fear
        [5484] = RD:CreatePriority(3), -- Howl of Terror
        [30153] = RD:CreatePriority(3), -- Intercept Stun (Felguard)
        [18093] = RD:CreatePriority(3), -- Pyroclasm
        [6358] = RD:CreatePriority(3), -- Seduction (Succubus)
        [30283] = RD:CreatePriority(3), -- Shadowfury
        [24259] = RD:CreatePriority(3), -- Spell Lock (Felhunter)
        
        -- WARRIOR
        [7922] = RD:CreatePriority(3), -- Charge Stun
        [12809] = RD:CreatePriority(3), -- Concussion Blow
        [676] = RD:CreatePriority(3), -- Disarm
        [23694] = RD:CreatePriority(2), -- Improved Hamstring
        [5246] = RD:CreatePriority(3), -- Intimidating Shout
        [20253] = RD:CreatePriority(3), -- Intercept Stun
        [12798] = RD:CreatePriority(3), -- Revenge Stun
        [18498] = RD:CreatePriority(3), -- Shield Bash - Silenced
        
        -- RACIAL
        [28730]  = RD:CreatePriority(3), -- Arcane Torrent
        [20549] = RD:CreatePriority(3), -- War Stomp
        
        -- OTHERS
        [5530] = RD:CreatePriority(3), -- Mace Specialization
    }
}

RD.debuffs = debuffs
RD.blacklist = blacklist
