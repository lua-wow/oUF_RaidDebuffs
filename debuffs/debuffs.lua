local _, ns = ...
local oUF = ns.oUF
local RD = ns.oUF_RaidDebuffs

-- Blizzard
local GetSpellName = C_Spell and C_Spell.GetSpellName or _G.GetSpellInfo

-- Mine
local debuffs = {
    ----------------------------------------------------------
    -- Classic
    ----------------------------------------------------------
    -- Blackfathom Deeps
    [48] = {
        [8733] = RD:CreatePriority(false), -- Blessing of Blackfathom
    },

    -- Onyxia's Lair
    [249] = {
        [18431] = RD:CreatePriority(2), -- Bellowing Roar
    },
    -- Molten Core
    [409] = {
        [19703] = RD:CreatePriority(2), -- Lucifron's Curse
        [19408] = RD:CreatePriority(2), -- Panic
        [19716] = RD:CreatePriority(2), -- Gehennas' Curse
        [20277] = RD:CreatePriority(2), -- Fist of Ragnaros
        [20475] = RD:CreatePriority(6), -- Living Bomb
        [19695] = RD:CreatePriority(6), -- Inferno
        [19659] = RD:CreatePriority(2), -- Ignite Mana
        [19714] = RD:CreatePriority(2), -- Deaden Magic
        [19713] = RD:CreatePriority(2), -- Shazzrah's Curse
    },
    -- Blackwing's Lair
    [469] = {
        [23023] = RD:CreatePriority(2), -- Conflagration
        [18173] = RD:CreatePriority(2), -- Burning Adrenaline
        [24573] = RD:CreatePriority(2), -- Mortal Strike
        [23340] = RD:CreatePriority(2), -- Shadow of Ebonroc
        [23170] = RD:CreatePriority(2), -- Brood Affliction: Bronze
        [22687] = RD:CreatePriority(2), -- Veil of Shadow
    },
    -- Zul'Gurub
    [309] = {
        [23860] = RD:CreatePriority(2), -- Holy Fire
        [22884] = RD:CreatePriority(2), -- Psychic Scream
        [23918] = RD:CreatePriority(2), -- Sonic Burst
        [24111] = RD:CreatePriority(2), -- Corrosive Poison
        [21060] = RD:CreatePriority(2), -- Blind
        [24328] = RD:CreatePriority(2), -- Corrupted Blood
        [16856] = RD:CreatePriority(2), -- Mortal Strike
        [24664] = RD:CreatePriority(2), -- Sleep
        [17172] = RD:CreatePriority(2), -- Hex
        [24306] = RD:CreatePriority(2), -- Delusions of Jin'do
        [24099] = RD:CreatePriority(2), -- Poison Bolt Volley
    },
    -- Ruins of Ahn'Qiraj
    [509] = {
        [25646] = RD:CreatePriority(2), -- Mortal Wound
        [25471] = RD:CreatePriority(2), -- Attack Order
        [96] = RD:CreatePriority(2), -- Dismember
        [25725] = RD:CreatePriority(2), -- Paralyze
        [25189] = RD:CreatePriority(2), -- Enveloping Winds
    },
    -- Ahn'Qiraj Temple
    [531] = {
        [785] = RD:CreatePriority(2), -- True Fulfillment
        [26580] = RD:CreatePriority(2), -- Fear
        [26050] = RD:CreatePriority(2), -- Acid Spit
        [26180] = RD:CreatePriority(2), -- Wyvern Sting
        [26053] = RD:CreatePriority(2), -- Noxious Poison
        [26613] = RD:CreatePriority(2), -- Unbalancing Strike
        [26029] = RD:CreatePriority(2), -- Dark Glare
    },
    -- Naxxramas
    [3456] = {
        [28732] = RD:CreatePriority(2), -- Widow's Embrace
        [28622] = RD:CreatePriority(2), -- Web Wrap
        [28169] = RD:CreatePriority(2), -- Mutating Injection
        [29213] = RD:CreatePriority(2), -- Curse of the Plaguebringer
        [28835] = RD:CreatePriority(2), -- Mark of Zeliek
        [27808] = RD:CreatePriority(2), -- Frost Blast
        [28410] = RD:CreatePriority(2), -- Chains of Kel'Thuzad
        [27819] = RD:CreatePriority(2), -- Detonate Mana
    },

    ----------------------------------------------------------
    -- The Burning Crusade
    ----------------------------------------------------------
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
    
    ----------------------------------------------------------
    -- Wrath of the Lich King
    ----------------------------------------------------------
    -- Ulduar
    [603] = {
        -- Flame Leviathan
        -- Ignis the Furnace Master
        -- Razorscale
        -- XT-002 Decontructor
        -- The Assembly of Iron
        -- Kologarn
        -- Auriaya
        -- Hodir
        -- Thorim
        -- Freya
        -- Mimiron
        -- General Vezax

        -- Yogg-Saron
        [63050] = RD:CreatePriority(false), -- Sanity

        -- Algalon the Observer
    },

    ----------------------------------------------------------
    -- Cataclysm
    ----------------------------------------------------------
    -- [657] The Vortex Pinnacle
    -- Grim Batol
    [670] = {
        -- Trash
        [451395] = RD:CreatePriority(10), -- Corrupt
    },

    ----------------------------------------------------------
    -- Mists of Pandaria
    ----------------------------------------------------------
    -- Shado-pan Monastery
    [959] = {
        [106774] = RD:CreatePriority(false), -- Honarable Combat
    },
    -- Temple of the Jade Serpent
    [960] = {
        [106113] = RD:CreatePriority(), -- Touch of Nothingness
        [106823] = RD:CreatePriority(), -- Serpent Strike
        [110125] = RD:CreatePriority(), -- Shattered Resolve
        [118714] = RD:CreatePriority(false), -- Purified Water
        [374037] = oUF.isRetail and RD:CreatePriority() or nil, -- Overwhelming Rage
        [395859] = oUF.isRetail and RD:CreatePriority() or nil, -- Haunting Scream
        [396093] = oUF.isRetail and RD:CreatePriority() or nil, -- Savage Leap
        [396150] = oUF.isRetail and RD:CreatePriority() or nil, -- Feeling of Superiority
        [396152] = oUF.isRetail and RD:CreatePriority() or nil, -- Feeling of Inferiority
        [397878] = oUF.isRetail and RD:CreatePriority() or nil, -- Tainted Ripple
        [397904] = oUF.isRetail and RD:CreatePriority() or nil, -- Setting Sun Kick
        [397911] = oUF.isRetail and RD:CreatePriority() or nil, -- Touch of Ruin
        [397914] = oUF.isRetail and RD:CreatePriority() or nil, -- Defiling Mist
    },
    -- Stormstout Brewery
    [961] = {},
    -- Gate of the Setting Sun
    [962] = {},
    -- Mogu'shan Palace
    [994 ] = {},
    -- Scarlet Halls
    [1001] = {},
    -- Scarlet Monastery
    [1004] = {},
    -- Scholomance
    [1007] = {},
    -- Siege of Niuzao Temple
    [1011] = {
        -- Vizier Jin'bak
        [119941] = RD:CreatePriority(), -- Sap Residue

        -- Commander Vo'jak
        -- General Pa'valak
        [119354] = RD:CreatePriority(), -- Sik'thik Strike
        [119703] = RD:CreatePriority(), -- Detonate
        [119840] = RD:CreatePriority(), -- Serrated Blade
        [119875] = RD:CreatePriority(10), -- Tempest
        [131971] = RD:CreatePriority(), -- Wind's Grace

        -- Wing Leader Ner'onok
        [121443] = RD:CreatePriority(), -- Caustic Pitch
        [121447] = RD:CreatePriority(), -- Quick-Dry Resin
    },

    -- Terrace of Endless Spring
    [996] = {},
    -- Mogu'shan Vaults
    [1008] = {
        -- Trash
        [125091] = RD:CreatePriority(), -- Fully Petrified
        [125092] = RD:CreatePriority(), -- Petrification
        [116990] = RD:CreatePriority(8), -- Focused Assault (Fixate)

        -- The Stone Guard
        [116008] = RD:CreatePriority(), -- Jade Petrification
        [116038] = RD:CreatePriority(), -- Jasper Petrification
        [116281] = RD:CreatePriority(), -- Cobalt Mine Blast
        [125206] = RD:CreatePriority(), -- Rend Flesh
        [130774] = RD:CreatePriority(), -- Amethyst Pool

        -- Feng the Accursed
        [116942] = RD:CreatePriority(8), -- Flaming Spear (Tank)
        [116784] = RD:CreatePriority(), -- Wildfire Spark

        -- Gara'jal the Spiritbinder
        [122151] = RD:CreatePriority(), -- Voodoo Doll

        -- The Spirit Kings
        [117708] = RD:CreatePriority(), -- Maddening Shout
        [118135] = RD:CreatePriority(10), -- Pinned Down
        [118303] = RD:CreatePriority(8), -- Fixate

        -- Elegon
        [117878] = RD:CreatePriority(), -- Overcharged
        [117949] = RD:CreatePriority(8), -- Closed Circuit
        [132275] = RD:CreatePriority(), -- Obliteration

        -- Will of the Emperor
        [116779] = RD:CreatePriority(false), -- Titan Gas
        [116782] = RD:CreatePriority(false), -- Titan Gas
        [116803] = RD:CreatePriority(false), -- Titan Gas
        [116525] = RD:CreatePriority(), -- Focused Assault
        [116550] = RD:CreatePriority(), -- Energizing Smash
        [116778] = RD:CreatePriority(), -- Focused Defense
        [116829] = RD:CreatePriority(), -- Focused Energy
    },
    -- Heart of Fear
    [1009] = {
        -- Trash
        -- Imperial Vizier Zor'lok
        [123812] = RD:CreatePriority(), -- Pheromones of Zeal
        -- [123790] = RD:CreatePriority(), -- Song of the Empress

        -- Blade Lord Ta'yak
        [123017] = RD:CreatePriority(8), -- Unseen Strike
        [123180] = RD:CreatePriority(5), -- Wind Step
        [123474] = RD:CreatePriority(10), -- Overwhelming Assault (Tank)

        -- Garalon
        [123235] = RD:CreatePriority(false), -- Weak Points
        [123423] = RD:CreatePriority(false), -- Weak Points
        [123426] = RD:CreatePriority(false), -- Weak Points
        [123428] = RD:CreatePriority(false), -- Weak Points
        [122774] = RD:CreatePriority(), -- Crush
        [122835] = RD:CreatePriority(8), -- Pheromones
        [123081] = RD:CreatePriority(8), -- Pungency
        [123092] = RD:CreatePriority(8), -- Pheromones
        [123120] = RD:CreatePriority(), -- Pheromone Trail

        -- Wind Lord Mel'jarak
        [122064] = RD:CreatePriority(), -- Corrosive Resin

        -- Amber-Shaper Un'sok
        [121949] = RD:CreatePriority(), -- Parasitic Growth
        [122370] = RD:CreatePriority(), -- Reshape Life
        [122784] = RD:CreatePriority(), -- Reshape Life
        [125502] = RD:CreatePriority(), -- Amber Beacon

        -- Grand Empress Shek'zeer
        [123184] = RD:CreatePriority(), -- Dissonance Field
        [123707] = RD:CreatePriority(), -- Eyes of the Empress
        [123788] = RD:CreatePriority(8), -- Cry of Terror
        [126122] = RD:CreatePriority(), -- Corrupted Dissonance Field
    },
    -- Throne of Thunder
    [1098] = {
        -- Trash
        [139485] = RD:CreatePriority(false), -- Dark Winds
        [140618] = RD:CreatePriority(), -- Crush Armor
        [134415] = RD:CreatePriority(), -- Devoured

        -- Jin'rokh the Breaker
        [137162] = RD:CreatePriority(), -- Static Burst
        [137371] = RD:CreatePriority(10), -- Thundering Throw
        [137422] = RD:CreatePriority(8), -- Focused Lightning (Fixate)
        [138349] = RD:CreatePriority(), -- Static Wound

        -- Horridon
        [136767] = RD:CreatePriority(8), -- Triple Puncture (Tank)
        [140946] = RD:CreatePriority(10), -- Dire Fixation

        -- Council of Elders
        [136857] = RD:CreatePriority(8), -- Entrapped (Magic)
        [136860] = RD:CreatePriority(), -- Quicksand
        [136878] = RD:CreatePriority(), -- Ensnared
        [136903] = RD:CreatePriority(10), -- Frigid Assault (Stun)
        [136922] = RD:CreatePriority(), -- Frostbite
        [136937] = RD:CreatePriority(), -- Frostbite

        -- Tortos
        [134030] = RD:CreatePriority(), -- Kick Shell
        [134920] = RD:CreatePriority(), -- Quake Stomp (Stunned)

        -- Megaera
        [139840] = RD:CreatePriority(), -- Rot Armor
        [139843] = RD:CreatePriority(), -- Arctic Freeze
        [139822] = RD:CreatePriority(), -- Cinders
        [139993] = RD:CreatePriority(), -- Diffusion
        [137731] = RD:CreatePriority(), -- Ignite Flesh

        -- Ji-Kun
        [112879] = RD:CreatePriority(), -- Primal Nutriment
        [134366] = RD:CreatePriority(10), -- Talon Rake (Tank)
        [138309] = RD:CreatePriority(), -- Slimed
        [138319] = RD:CreatePriority(), -- Feed Pool
        [140092] = RD:CreatePriority(), -- Infected Talons
        [140741] = RD:CreatePriority(), -- Primal Nutriment

        -- Durumu the Forgotten
        [133675] = RD:CreatePriority(), -- Blue Rays
        [133677] = RD:CreatePriority(), -- Blue Rays
        [133732] = RD:CreatePriority(), -- Infrared Light
        [133737] = RD:CreatePriority(), -- Bright Light
        [133738] = RD:CreatePriority(), -- Bright Light
        [133767] = RD:CreatePriority(10), -- Serious Wound (Tank)
        [133768] = RD:CreatePriority(5), -- Arterial Cut
        [134626] = RD:CreatePriority(), -- Lingering Gaze

        -- Primordius
        [136050] = RD:CreatePriority(8), -- Malformed Blood (Tank)
        [140546] = RD:CreatePriority(), -- Fully Mutated

        [136180] = RD:CreatePriority(false), -- Keen Eyesight (Magic)
        [136181] = RD:CreatePriority(false), -- Impaired Eyesight (Magic)
        [136182] = RD:CreatePriority(false), -- Improved Synapses (Magic)
        [136183] = RD:CreatePriority(false), -- Dulled Synapses (Magic)
        [136184] = RD:CreatePriority(false), -- Thick Bones (Magic)
        [136185] = RD:CreatePriority(false), -- Fragile Bones (Magic)
        [136186] = RD:CreatePriority(false), -- Clear Mind (Magic)
        [136187] = RD:CreatePriority(false), -- Clouded Mind (Magic)

        -- Dark Animus
        [136962] = RD:CreatePriority(10), -- Anima Ring
        [138659] = RD:CreatePriority(), -- Touch of the Animus
        [138691] = RD:CreatePriority(), -- Anima Font

        -- Iron Qon
        [134691] = RD:CreatePriority(8), -- Impale
        [136192] = RD:CreatePriority(10), -- Lightning Storm
        [137669] = RD:CreatePriority(), -- Storm Cloud
        [135145] = RD:CreatePriority(), -- Freeze
        [136615] = RD:CreatePriority(), -- Electrified (Magic + Stun)
        [137664] = RD:CreatePriority(), -- Frozen Blood
        [134647] = RD:CreatePriority(), -- Scorched
        [135147] = RD:CreatePriority(), -- Dead Zone

        -- Twin Empyreans
        [138264] = RD:CreatePriority(), -- Invoke Tiger Spirit

        -- Lei Shen
        [134821] = RD:CreatePriority(), -- Discharged Energy
        [137446] = RD:CreatePriority(), -- Discharged Energy
        [135153] = RD:CreatePriority(), -- Crashing Thunder
        [134912] = RD:CreatePriority(), -- Decapitate
        [134916] = RD:CreatePriority(), -- Decapitate
        [139011] = RD:CreatePriority(), -- Helm of Command
        [137176] = RD:CreatePriority(), -- Overloaded Circuits
        [136914] = RD:CreatePriority(), -- Electrical Shock

        -- Ra-den
        [138329] = RD:CreatePriority(), -- Unleashed Anima
        [138288] = RD:CreatePriority(), -- Unstable Anima
    },
    -- Siege of Orgrimmar
    [1136] = {
        -- Immerseus
        [143437] = RD:CreatePriority(), -- Corrosive Blast (Tank)
        [143436] = RD:CreatePriority() -- Corrosive Blast (Tank)

        -- The Fallen Protectors
        -- Norushen
        -- Sha of Pride
        -- Galakras
        -- Iron Juggernaut
        -- Kor'kron Dark Shaman
        -- General Nazgrim
        -- Malkorok
        -- Spoils of Pandaria
        -- Thok the Bloodthirsty
        -- Siegecrafter Blackfuse
        -- Paragons of the Klaxxi
        -- Garrosh Hellscreen
    },

    ----------------------------------------------------------
    -- Warlords of Draenor
    ----------------------------------------------------------
    -- Shadowmoon Burial Grounds
    [1176] = {
        [152979] = RD:CreatePriority(), -- Soul Shred
        [153501] = RD:CreatePriority(), -- Void Blast
        [153524] = RD:CreatePriority(), -- Plague Spit
        [153692] = RD:CreatePriority(), -- Necrotic Pitch
        [154442] = RD:CreatePriority(), -- Malevolence
        [154469] = RD:CreatePriority(), -- Ritual of Bones
        [156776] = RD:CreatePriority(), -- Rending Voidlash
        [158061] = RD:CreatePriority(), -- Blessed Waters of Purity
        [162652] = RD:CreatePriority(), -- Lunar Purity
        [164907] = RD:CreatePriority(), -- Void Cleave
    },
    -- Iron Docks
    [1195] = {
        [163276] = RD:CreatePriority(), -- Shredded Tendons
        [162415] = RD:CreatePriority(), -- Time to Feed
        [168398] = RD:CreatePriority(), -- Rapid Fire Targeting
        [172889] = RD:CreatePriority(), -- Charging Slash
        [164504] = RD:CreatePriority(), -- Intimidated
        [172631] = RD:CreatePriority(), -- Knocked Down
        [172636] = RD:CreatePriority(), -- Slippery Grease
        [158341] = RD:CreatePriority(), -- Gushing Wounds
        [167240] = RD:CreatePriority(), -- Leg Shot
        [173105] = RD:CreatePriority(), -- Whirling Chains
        [173324] = RD:CreatePriority(), -- Jagged Caltrops
        [172771] = RD:CreatePriority(), -- Incendiary Slug
        [173307] = RD:CreatePriority(), -- Serrated Spear
        [169341] = RD:CreatePriority(), -- Demoralizing Roar
    },
    -- Grimrail Depot
    [1208] = {
        [162057] = RD:CreatePriority(), -- Spinning Spear
        [156357] = RD:CreatePriority(), -- Blackrock Shrapnel
        [160702] = RD:CreatePriority(), -- Blackrock Mortar Shells
        [160681] = RD:CreatePriority(), -- Suppressive Fire
        [166570] = RD:CreatePriority(), -- Slag Blast (Stacking)
        [164218] = RD:CreatePriority(), -- Double Slash
        [162491] = RD:CreatePriority(), -- Acquiring Targets 1
        [162507] = RD:CreatePriority(), -- Acquiring Targets 2
        [161588] = RD:CreatePriority(), -- Diffused Energy
        [162065] = RD:CreatePriority(), -- Freezing Snare
    },

    ----------------------------------------------------------
    -- Legion
    ----------------------------------------------------------
    -- Neltharion's Lair
    [1458] = {
        [183465] = RD:CreatePriority(), -- Viscid Bile
        [188494] = RD:CreatePriority(), -- Rancid Maw
        [193585] = RD:CreatePriority(), -- Bound
        [193639] = RD:CreatePriority(), -- Bone Chomp
        [193941] = RD:CreatePriority(), -- Impaling Shard
        [199178] = RD:CreatePriority(), -- Spiked Tongue
        [199705] = RD:CreatePriority(), -- Devouring
        [200154] = RD:CreatePriority(), -- Burning Hatred
        [202181] = RD:CreatePriority(), -- Stone Gaze
        [210166] = RD:CreatePriority(), -- Toxic Retch
        [217851] = RD:CreatePriority(), -- Toxic Retch
        [226296] = RD:CreatePriority(), -- Piercing Shards
    },
    -- Halls of Valor
    [1477] = {
        [193260] = RD:CreatePriority(), -- Static Field
        [193743] = RD:CreatePriority(), -- Aegis of Aggramar Wielder
        [193783] = RD:CreatePriority(), -- Aegis of Aggramar Up
        [196838] = RD:CreatePriority(), -- Scent of Blood
        [197963] = RD:CreatePriority(), -- Runic Brand Purple
        [197964] = RD:CreatePriority(), -- Runic Brand Orange
        [197965] = RD:CreatePriority(), -- Runic Brand Yellow
        [197966] = RD:CreatePriority(), -- Runic Brand Blue
        [197967] = RD:CreatePriority(), -- Runic Brand Green
        [198944] = RD:CreatePriority(), -- Breach Armor
        [199652] = RD:CreatePriority(), -- Sever
        [199674] = RD:CreatePriority(), -- Wicked Dagger
        [203963] = RD:CreatePriority(), -- Eye of the Storm
        [215429] = RD:CreatePriority(), -- Thunderstrike 2
        [215430] = RD:CreatePriority(), -- Thunderstrike 1
    },
    -- Court of Stars
    [1571] = {
        [207278] = RD:CreatePriority(), -- Arcane Lockdown
        [207979] = RD:CreatePriority(), -- Shockwave
        [207980] = RD:CreatePriority(), -- Disintegration Beam 1
        [207981] = RD:CreatePriority(), -- Disintegration Beam 2
        [208165] = RD:CreatePriority(), -- Withering Soul
        [209027] = RD:CreatePriority(), -- Quelling Strike
        [209413] = RD:CreatePriority(), -- Suppress
        [209512] = RD:CreatePriority(), -- Disrupting Energy
        [209516] = RD:CreatePriority(), -- Mana Fang
        [211464] = RD:CreatePriority(), -- Fel Detonation
        [211473] = RD:CreatePriority(), -- Shadow Slash
    },
    [1651] = {
        -- Return to Karazhan: Upper
        [227465] = RD:CreatePriority(), -- Power Discharge
        [227502] = RD:CreatePriority(), -- Unstable Mana
        [227592] = RD:CreatePriority(6), -- Frostbite
        [228249] = RD:CreatePriority(5), -- Inferno Bolt 1
        [228252] = RD:CreatePriority(), -- Shadow Rend
        [228261] = RD:CreatePriority(6), -- Flame Wreath
        [228958] = RD:CreatePriority(5), -- Inferno Bolt 2
        [229083] = RD:CreatePriority(), -- Burning Blast (Stacking)
        [229159] = RD:CreatePriority(), -- Chaotic Shadows
        [229241] = RD:CreatePriority(), -- Acquiring Target
        [229248] = RD:CreatePriority(), -- Fel Beam
        [230083] = RD:CreatePriority(6), -- Nullification
        [230221] = RD:CreatePriority(), -- Absorbed Mana
        
        -- Return to Karazhan: Lower
        [29574] = RD:CreatePriority(), -- Rend
        [29690] = RD:CreatePriority(), -- Drunken Skull Crack
        [32752] = RD:CreatePriority(), -- Summoning Disorientation
        [227404] = RD:CreatePriority(6), -- Intangible Presence
        [227493] = RD:CreatePriority(), -- Mortal Strike
        [227508] = RD:CreatePriority(), -- Mass Repentance
        [227742] = RD:CreatePriority(), -- Garrote (Stacking)
        [227832] = RD:CreatePriority(), -- Coat Check 2
        [227848] = RD:CreatePriority(), -- Sacred Ground (Stacking)
        [227851] = RD:CreatePriority(), -- Coat Check 1
        [227917] = RD:CreatePriority(), -- Poetry Slam
        [228164] = RD:CreatePriority(), -- Hammer Down
        [228215] = RD:CreatePriority(), -- Severe Dusting 1
        [228221] = RD:CreatePriority(), -- Severe Dusting 2
        [228280] = RD:CreatePriority(), -- Oath of Fealty
        [228526] = RD:CreatePriority(), -- Flirt
        [228559] = RD:CreatePriority(), -- Charming Perfume
        [228576] = RD:CreatePriority(), -- Allured
        [228610] = RD:CreatePriority(), -- Burning Brand
        [230297] = RD:CreatePriority(), -- Brittle Bones
        [238606] = RD:CreatePriority(), -- Arcane Eruption
        [241774] = RD:CreatePriority(), -- Shield Smash
    },

    ----------------------------------------------------------
    -- Battle for Azeroth
    ----------------------------------------------------------
    -- The MOTHERLODE!!
    [1594] = {
        [263215] = RD:CreatePriority(), -- Tectonic Barrier
    },
    -- Freehold
    [1754] = {
        [256106] = RD:CreatePriority(), -- Azerite Powder Shot
        [256363] = RD:CreatePriority(), -- Ripper Punch
        [257305] = RD:CreatePriority(), -- Cannon Barrage
        [257314] = RD:CreatePriority(), -- Black Powder Bomb
        [257460] = RD:CreatePriority(), -- Fiery Debris
        [257478] = RD:CreatePriority(), -- Crippling Bite
        [257739] = RD:CreatePriority(), -- Blind Rage
        [257784] = RD:CreatePriority(), -- Frost Blast
        [257908] = RD:CreatePriority(5), -- Oiled Blade
        [258323] = RD:CreatePriority(), -- Infected Wound
        [258352] = RD:CreatePriority(), -- Grapeshot
        [258875] = RD:CreatePriority(), -- Blackout Barrel
        [265056] = RD:CreatePriority(), -- Invigorating Freehold Brew
        [265085] = RD:CreatePriority(), -- Confidence-Boosting Freehold Brew
        [274400] = RD:CreatePriority(), -- Duelist Dash
        [274507] = RD:CreatePriority(), -- Slippery Suds
        [274555] = RD:CreatePriority(), -- Scabrous Bite
        [276061] = RD:CreatePriority(), -- Boulder Throw
        [413131] = RD:CreatePriority(), -- Whirling Dagger
        [413136] = RD:CreatePriority(), -- Whirling Dagger
        
        [410870] = RD:CreatePriority(), -- Cyclone
        [410997] = RD:CreatePriority(), -- Rushing Wind
        [411003] = RD:CreatePriority(), -- Turbulence
        [411770] = RD:CreatePriority(), -- Charge
        [411911] = RD:CreatePriority(), -- Healing Well
        [413296] = RD:CreatePriority(), -- Downburst
        [86292] = RD:CreatePriority(), -- Cyclone Shield
        [87474] = RD:CreatePriority(), -- Grounding Field
        [87618] = RD:CreatePriority(), -- Static Cling
        [87726] = RD:CreatePriority(), -- Grounding Field
        [87762] = RD:CreatePriority(), -- Lightning Lash
        [88194] = RD:CreatePriority(), -- Icy Buffet
        -- [88282] = RD:CreatePriority(), -- Upwind of Altairus
        -- [88286] = RD:CreatePriority(), -- Downwind of Altairus
        [88314] = RD:CreatePriority(), -- Twisting Winds
    },
    -- Siege of Boralus
    [1822] = {
        -- Trash
        [275835] = RD:CreatePriority(0, 2), -- Stinging Venom Coating (Poison)

        -- Chopper Redhook
        -- Dread Captain Lockwood
        -- Hadal Darkfathom

        -- Viq'Goth
        [274991] = RD:CreatePriority(10), -- Putrid Waters
    },
    -- The Underrot
    [1841] = {
        [259718] = RD:CreatePriority(), -- Upheaval
        [260455] = RD:CreatePriority(), -- Serrated Fangs
        [260455] = RD:CreatePriority(), -- Serrated Fangs
        [260685] = RD:CreatePriority(), -- Taint of G'huun
        [265019] = RD:CreatePriority(), -- Savage Cleave
        [265377] = RD:CreatePriority(), -- Hooked Snare
        [265468] = RD:CreatePriority(), -- Withering Curse
        [265533] = RD:CreatePriority(), -- Blood Maw
        [265568] = RD:CreatePriority(), -- Dark Omen
        [266107] = RD:CreatePriority(), -- Thirst For Blood
        [266265] = RD:CreatePriority(), -- Wicked Embrace
        -- [269301] = RD:CreatePriority(), -- Putrid Blood
        [272609] = RD:CreatePriority(), -- Maddening Gaze
    },
    -- Operation: Mechagon
    [2097] = {
        [302274] = RD:CreatePriority(), -- Fulminating Zap
        [298669] = RD:CreatePriority(), -- Taze
        [295445] = RD:CreatePriority(), -- Wreck
        [297257] = RD:CreatePriority(), -- Electrical Charge
        [294855] = RD:CreatePriority(), -- Blossom Blast
        [291972] = RD:CreatePriority(), -- Explosive Leap
        [285443] = RD:CreatePriority(), -- 'Hidden' Flame Cannon
        [291974] = RD:CreatePriority(), -- Obnoxious Monologue
        [296150] = RD:CreatePriority(), -- Vent Blast
        [298602] = RD:CreatePriority(), -- Smoke Cloud
        [296560] = RD:CreatePriority(), -- Clinging Static
        [297283] = RD:CreatePriority(), -- Cave In
        [291914] = RD:CreatePriority(), -- Cutting Beam
        [302384] = RD:CreatePriority(), -- Static Discharge
        [294195] = RD:CreatePriority(), -- Arcing Zap (Magic)
        [299572] = RD:CreatePriority(), -- Shrink
        [300659] = RD:CreatePriority(), -- Consuming Slime
        [300650] = RD:CreatePriority(), -- Suffocating Smog
        [301712] = RD:CreatePriority(), -- Pounce
        [299475] = RD:CreatePriority(), -- B.O.R.K
        [293670] = RD:CreatePriority(), -- Chain Blade

        [1215415] = RD:CreatePriority(), -- Sticky Sludge (Disease)
        [1217821] = RD:CreatePriority(), -- Fiery Jaws (Magic)
        
        -- Tussle Tonk
        -- K.U.-J.0.
        [294929] = RD:CreatePriority(), -- Blazing Chomp (Magic)

        -- Mechanist's Garden
        [285460] = RD:CreatePriority(10), -- Discom-BOMB-ulator (Magic)

        -- King Mechagon
        [291928] = RD:CreatePriority(), -- Giga-Zap
        [292267] = RD:CreatePriority(), -- Giga-Zap
    },

    ----------------------------------------------------------
    -- Shadowlands
    ----------------------------------------------------------
    -- Sanguine Depths
    [2284] = {
        [326827] = RD:CreatePriority(), -- Dread Bindings
        [326836] = RD:CreatePriority(), -- Curse of Suppression
        [322554] = RD:CreatePriority(), -- Castigate
        [321038] = RD:CreatePriority(), -- Burden Soul
        [328593] = RD:CreatePriority(), -- Agonize
        [325254] = RD:CreatePriority(), -- Iron Spikes
        [335306] = RD:CreatePriority(), -- Barbed Shackles
        [322429] = RD:CreatePriority(), -- Severing Slice
        [334653] = RD:CreatePriority(), -- Engorge
    },
    -- Spires of Ascension
    [2285] = {
        [338729] = RD:CreatePriority(), -- Charged Stomp
        [323195] = RD:CreatePriority(), -- Purifying Blast
        [327481] = RD:CreatePriority(), -- Dark Lance
        [322818] = RD:CreatePriority(), -- Lost Confidence
        [322817] = RD:CreatePriority(), -- Lingering Doubt
        [324205] = RD:CreatePriority(), -- Blinding Flash
        [331251] = RD:CreatePriority(), -- Deep Connection
        [328331] = RD:CreatePriority(), -- Forced Confession
        [341215] = RD:CreatePriority(), -- Volatile Anima
        [323792] = RD:CreatePriority(), -- Anima Field
        [317661] = RD:CreatePriority(), -- Insidious Venom
        [330683] = RD:CreatePriority(), -- Raw Anima
        [328434] = RD:CreatePriority(), -- Intimidated
    },
    -- The Necrotic Wake
    [2286] = {
        -- Trash
        [320462] = RD:CreatePriority(), -- Necrotic Bolt
        [320573] = RD:CreatePriority(), -- Shadow Well
        [321807] = RD:CreatePriority(), -- Bonelfay
        [321821] = RD:CreatePriority(), -- Disgusting Guts (Disease)
        [323365] = RD:CreatePriority(), -- Clinging Darkness (Magic)
        [323471] = RD:CreatePriority(), -- Throw Cleaver
        [324293] = RD:CreatePriority(), -- Rasping Scream (Magic / Fear)
        [324381] = RD:CreatePriority(), -- Chill Scythe
        [327396] = RD:CreatePriority(), -- Grim Fate
        [328181] = RD:CreatePriority(), -- Frigid Cold
        [328664] = RD:CreatePriority(), -- Chilled (Magic)
        [333485] = RD:CreatePriority(), -- Disease Cloud
        [333485] = RD:CreatePriority(false), -- Disease Cloud
        [334748] = RD:CreatePriority(), -- Drain Fluids
        [338353] = RD:CreatePriority(), -- Goresplatter (Disease)
        [338357] = RD:CreatePriority(8), -- Tenderize (Tank)
        [338606] = RD:CreatePriority(5), -- Morbid Fixation 2
        [343504] = RD:CreatePriority(), -- Dark Grasp
        [343556] = RD:CreatePriority(5), -- Morbid Fixation 1
        [345625] = RD:CreatePriority(), -- Death Burst
        
        -- Blightbone
        [320717] = RD:CreatePriority(), -- Blood Hunger
        [320646] = RD:CreatePriority(), -- Fetid Gas (Silence)
        
        -- Amarth <The Harvester>
        [320170] = RD:CreatePriority(), -- Necrotic Bolt
        [333489] = RD:CreatePriority(), -- Necrotic Breath
        [333492] = RD:CreatePriority(), -- Necrotic Ichor
        
        -- Surgeon Stitchflesh
        [320200] = RD:CreatePriority(1), -- Stitchneedle
        [320366] = RD:CreatePriority(), -- Embalming Ichor
        [322681] = RD:CreatePriority(3), -- Meat Hook
        
        -- Nalthor the Rimebinder
        [320784] = RD:CreatePriority(), -- Comet Storm
        [320788] = RD:CreatePriority(5), -- Frozen Binds (Magic)
    },
    -- Halls of Atonement
    [2287] = {
        [335338] = RD:CreatePriority(), -- Ritual of Woe
        [326891] = RD:CreatePriority(), -- Anguish
        [329321] = RD:CreatePriority(), -- Jagged Swipe 1
        [344993] = RD:CreatePriority(), -- Jagged Swipe 2
        [319603] = RD:CreatePriority(), -- Curse of Stone
        [326632] = RD:CreatePriority(), -- Stony Veins
        [323650] = RD:CreatePriority(), -- Haunting Fixation
        [326874] = RD:CreatePriority(), -- Ankle Bites
        [340446] = RD:CreatePriority(), -- Mark of Envy
        
        -- Trash
        [1235766] = RD:CreatePriority(10), -- Mortal Strike (Healing Reduced 50%)
        [1235245] = RD:CreatePriority(), -- Ankle Bite (Bleed)
        [1235060] = RD:CreatePriority(), -- Anima Tainted Armor
        [319611] = RD:CreatePriority(), -- Turned to Stone (Magic)
        [325876] = RD:CreatePriority(), -- Mark of Obliteration (Magic)
        [325701] = RD:CreatePriority(), -- Siphon Life (Magic)

        -- Halkias
        [322977] = RD:CreatePriority(8), -- Sinlight Visions (Fear)
        [339235] = RD:CreatePriority(5), -- Light of Atonement

        -- Echelon
        [319703] = RD:CreatePriority(7), -- Blood Torrent

        -- High Adjudicator Aleez
        [1236513] = RD:CreatePriority(8), -- Unstable Anime (Magic)
        [1236514] = RD:CreatePriority(8), -- Unstable Anime (Magic)

        -- Lord Chamberlain
    },
    -- Plaguefall
    [2289] = {
        [336258] = RD:CreatePriority(), -- Solitary Prey
        [331818] = RD:CreatePriority(), -- Shadow Ambush
        [329110] = RD:CreatePriority(), -- Slime Injection
        [325552] = RD:CreatePriority(), -- Cytotoxic Slash
        [336301] = RD:CreatePriority(), -- Web Wrap
        [322358] = RD:CreatePriority(), -- Burning Strain
        [322410] = RD:CreatePriority(), -- Withering Filth
        [328180] = RD:CreatePriority(), -- Gripping Infection
        [320542] = RD:CreatePriority(), -- Wasting Blight
        [340355] = RD:CreatePriority(), -- Rapid Infection
        [328395] = RD:CreatePriority(), -- Venompiercer
        [320512] = RD:CreatePriority(), -- Corroded Claws
        [333406] = RD:CreatePriority(), -- Assassinate
        [332397] = RD:CreatePriority(), -- Shroudweb
        [330069] = RD:CreatePriority(), -- Concentrated Plague
    },
    -- Mists of Tirna Scithe
    [2290] = {
        [325027] = RD:CreatePriority(), -- Bramble Burst
        [323043] = RD:CreatePriority(), -- Bloodletting
        [322557] = RD:CreatePriority(), -- Soul Split
        [331172] = RD:CreatePriority(), -- Mind Link
        [322563] = RD:CreatePriority(), -- Marked Prey
        [322487] = RD:CreatePriority(), -- Overgrowth 1
        [322486] = RD:CreatePriority(), -- Overgrowth 2
        [328756] = RD:CreatePriority(), -- Repulsive Visage
        [325021] = RD:CreatePriority(), -- Mistveil Tear
        [321891] = RD:CreatePriority(), -- Freeze Tag Fixation
        [325224] = RD:CreatePriority(), -- Anima Injection
        [326092] = RD:CreatePriority(), -- Debilitating Poison
        [325418] = RD:CreatePriority(), -- Volatile Acid
    },
    -- De Other Side
    [2291] = {
        [320786] = RD:CreatePriority(), -- Power Overwhelming
        [334913] = RD:CreatePriority(), -- Master of Death
        [325725] = RD:CreatePriority(), -- Cosmic Artifice
        [328987] = RD:CreatePriority(), -- Zealous
        [334496] = RD:CreatePriority(), -- Soporific Shimmerdust
        [339978] = RD:CreatePriority(), -- Pacifying Mists
        [323692] = RD:CreatePriority(), -- Arcane Vulnerability
        [333250] = RD:CreatePriority(), -- Reaver
        [330434] = RD:CreatePriority(), -- Buzz-Saw 1
        [320144] = RD:CreatePriority(), -- Buzz-Saw 2
        [331847] = RD:CreatePriority(), -- W-00F
        [327649] = RD:CreatePriority(), -- Crushed Soul
        [331379] = RD:CreatePriority(), -- Lubricate
        [332678] = RD:CreatePriority(), -- Gushing Wound
        [322746] = RD:CreatePriority(), -- Corrupted Blood
        [323687] = RD:CreatePriority(), -- Arcane Lightning
        [323877] = RD:CreatePriority(), -- Echo Finger Laser X-treme
        [334535] = RD:CreatePriority(), -- Beak Slice
    },
    -- Theater of Pain
    [2293] = {
        [333299] = RD:CreatePriority(), -- Curse of Desolation 1
        [333301] = RD:CreatePriority(), -- Curse of Desolation 2
        [319539] = RD:CreatePriority(), -- Soulless
        [326892] = RD:CreatePriority(), -- Fixate
        [321768] = RD:CreatePriority(), -- On the Hook
        [323825] = RD:CreatePriority(), -- Grasping Rift
        [342675] = RD:CreatePriority(), -- Bone Spear
        [323831] = RD:CreatePriority(), -- Death Grasp
        [330608] = RD:CreatePriority(), -- Vile Eruption
        [330868] = RD:CreatePriority(), -- Necrotic Bolt Volley
        [323750] = RD:CreatePriority(), -- Vile Gas
        [323406] = RD:CreatePriority(), -- Jagged Gash
        [330700] = RD:CreatePriority(), -- Decaying Blight
        [319626] = RD:CreatePriority(), -- Phantasmal Parasite
        [324449] = RD:CreatePriority(), -- Manifest Death
        [341949] = RD:CreatePriority(), -- Withering Blight

        -- Trash

        -- Boss 1
        [1215600] = RD:CreatePriority(10), -- Withering Touch (Magic)

        -- Boss
    },
    -- Tazavesh, the Veiled Market
    [2441] = {
        -- Streets of Wonder
            [346297] = RD:CreatePriority(), -- Unstable Explosion
            [347728] = RD:CreatePriority(10), -- Flock! (Stun)
            [347744] = RD:CreatePriority(), -- Quickblade
            [351956] = RD:CreatePriority(), -- High-Value Target
            [355641] = RD:CreatePriority(), -- Sintillate (Magic)
            [355832] = RD:CreatePriority(), -- Quickblade (Bleed)
            [355915] = RD:CreatePriority(), -- Glyph of Restraint (Magic)
            [356407] = RD:CreatePriority(7), -- Ancient Dread (Curse)
            [356408] = RD:CreatePriority(), -- Ground Stomp (Stun)
            [356943] = RD:CreatePriority(10), -- Lockdown (Magic)
            [357029] = RD:CreatePriority(), -- Hyperlight Bomb (Magic)
            
            -- Zo'phex the Sentinel
            
            -- The Grand Menagerie
            [349954] = RD:CreatePriority(8), -- Purification Protocol
            [349999] = RD:CreatePriority(), -- Anima Detonation
            [350013] = RD:CreatePriority(), -- Gluttonous Feast
            
            -- Mailroom Mayhem
            [346844] = RD:CreatePriority(8), -- Alchemical Residue (Magic)
            
            -- Myza's Oasis
            
            -- So'azmi
            [347481] = RD:CreatePriority(), -- Shuri
            [1245669] = RD:CreatePriority(10), -- Double Technique (Magic)
            
        -- So'leah's Gambit
            [347149] = RD:CreatePriority(10), -- Infinite Breath (Magic / Stun)
            [355451] = RD:CreatePriority(), -- Undertow
            [355465] = RD:CreatePriority(), -- Boulder Throw
            [355581] = RD:CreatePriority(), -- Crackle
            [356011] = RD:CreatePriority(), -- Beam Splicer
            [1240097] = RD:CreatePriority(8), -- Time Bomb (Magic)
            
            -- Hylbrande
            [346116] = RD:CreatePriority(), -- Shearing Swings
            [346828] = RD:CreatePriority(), -- Sanitizing Field
            [346961] = RD:CreatePriority(), -- Purging Field

            -- Timecap'n Hooktail
            [350134] = RD:CreatePriority(10), -- Infinite Breath

            -- So'leah
            [350804] = RD:CreatePriority(), -- Collapsing Energy
            [350885] = RD:CreatePriority(), -- Hyperlight Jolt
            [351101] = RD:CreatePriority(), -- Energy Fragmentation
    },

    -- Castle Nathria
    [2296] = {
        -- Shriekwing
        [328897] = RD:CreatePriority(), -- Exsanguinated
        [330713] = RD:CreatePriority(), -- Reverberating Pain
        -- [329370] = RD:CreatePriority(), -- Deadly Descent
        -- [336494] = RD:CreatePriority(), -- Echo Screech
        [346301] = RD:CreatePriority(), -- Bloodlight
        [342077] = RD:CreatePriority(), -- Echolocation
        
        -- Huntsman Altimor
        [335304] = RD:CreatePriority(), -- Sinseeker
        [334971] = RD:CreatePriority(), -- Jagged Claws
        [335111] = RD:CreatePriority(), -- Huntsman's Mark 3
        [335112] = RD:CreatePriority(), -- Huntsman's Mark 2
        [335113] = RD:CreatePriority(), -- Huntsman's Mark 1
        [334945] = RD:CreatePriority(), -- Vicious Lunge
        [334852] = RD:CreatePriority(), -- Petrifying Howl
        [334695] = RD:CreatePriority(), -- Destabilize
        
        -- Hungering Destroyer
        [334228] = RD:CreatePriority(), -- Volatile Ejection
        [329298] = RD:CreatePriority(), -- Gluttonous Miasma
        
        -- Lady Inerva Darkvein
        [325936] = RD:CreatePriority(), -- Shared Cognition
        [335396] = RD:CreatePriority(), -- Hidden Desire
        [324983] = RD:CreatePriority(), -- Shared Suffering
        [324982] = RD:CreatePriority(), -- Shared Suffering (Partner)
        [332664] = RD:CreatePriority(), -- Concentrate Anima
        [325382] = RD:CreatePriority(), -- Warped Desires
        
        -- Sun King's Salvation
        [333002] = RD:CreatePriority(), -- Vulgar Brand
        [326078] = RD:CreatePriority(), -- Infuser's Boon
        [325251] = RD:CreatePriority(), -- Sin of Pride
        [341475] = RD:CreatePriority(), -- Crimson Flurry
        [341473] = RD:CreatePriority(), -- Crimson Flurry Teleport
        [328479] = RD:CreatePriority(), -- Eyes on Target
        [328889] = RD:CreatePriority(), -- Greater Castigation
        
        -- Artificer Xy'mox
        [327902] = RD:CreatePriority(), -- Fixate
        [326302] = RD:CreatePriority(), -- Stasis Trap
        [325236] = RD:CreatePriority(), -- Glyph of Destruction
        [327414] = RD:CreatePriority(), -- Possession
        [328468] = RD:CreatePriority(), -- Dimensional Tear 1
        [328448] = RD:CreatePriority(), -- Dimensional Tear 2
        [340860] = RD:CreatePriority(), -- Withering Touch
        
        -- The Council of Blood
        [327052] = RD:CreatePriority(), -- Drain Essence 1
        [327773] = RD:CreatePriority(), -- Drain Essence 2
        [346651] = RD:CreatePriority(), -- Drain Essence Mythic
        [328334] = RD:CreatePriority(), -- Tactical Advance
        [330848] = RD:CreatePriority(), -- Wrong Moves
        [331706] = RD:CreatePriority(), -- Scarlet Letter
        [331636] = RD:CreatePriority(), -- Dark Recital 1
        [331637] = RD:CreatePriority(), -- Dark Recital 2
        
        -- Sludgefist
        [335470] = RD:CreatePriority(), -- Chain Slam
        [339181] = RD:CreatePriority(), -- Chain Slam (Root)
        [331209] = RD:CreatePriority(), -- Hateful Gaze
        [335293] = RD:CreatePriority(), -- Chain Link
        -- [335270] = RD:CreatePriority(), -- Chain This One!
        [342419] = RD:CreatePriority(), -- Chain Them! 1
        [342420] = RD:CreatePriority(), -- Chain Them! 2
        [335295] = RD:CreatePriority(), -- Shattering Chain
        [332572] = RD:CreatePriority(), -- Falling Rubble
        
        -- Stone Legion Generals
        [334498] = RD:CreatePriority(), -- Seismic Upheaval
        [337643] = RD:CreatePriority(), -- Unstable Footing
        [334765] = RD:CreatePriority(), -- Heart Rend
        [334771] = RD:CreatePriority(), -- Heart Hemorrhage
        [333377] = RD:CreatePriority(), -- Wicked Mark
        [334616] = RD:CreatePriority(), -- Petrified
        [334541] = RD:CreatePriority(), -- Curse of Petrification
        [339690] = RD:CreatePriority(), -- Crystalize
        [342655] = RD:CreatePriority(), -- Volatile Anima Infusion
        [342698] = RD:CreatePriority(), -- Volatile Anima Infection
        [343881] = RD:CreatePriority(), -- Serrated Tear
        
        -- Sire Denathrius
        [326851] = RD:CreatePriority(), -- Blood Price
        [327796] = RD:CreatePriority(), -- Night Hunter
        [327992] = RD:CreatePriority(), -- Desolation
        [328276] = RD:CreatePriority(), -- March of the Penitent
        [326699] = RD:CreatePriority(), -- Burden of Sin
        [329181] = RD:CreatePriority(), -- Wracking Pain
        [335873] = RD:CreatePriority(), -- Rancor
        [329951] = RD:CreatePriority(), -- Impale
        [327039] = RD:CreatePriority(), -- Feeding Time
        [332794] = RD:CreatePriority(), -- Fatal Finesse
        [334016] = RD:CreatePriority(), -- Unworthy
    },
    -- Sanctum of Domination
    [2450] = {
        -- The Tarragrue
        [347283] = RD:CreatePriority(5), -- Predator's Howl
        [347286] = RD:CreatePriority(5), -- Unshakeable Dread
        [346986] = RD:CreatePriority(3), -- Crushed Armor
        [347269] = RD:CreatePriority(6), -- Chains of Eternity
        [346985] = RD:CreatePriority(3), -- Overpower
        
        -- Eye of the Jailer
        [350606] = RD:CreatePriority(4), -- Hopeless Lethargy
        [355240] = RD:CreatePriority(5), -- Scorn
        [355245] = RD:CreatePriority(5), -- Ire
        [349979] = RD:CreatePriority(2), -- Dragging Chains
        [348074] = RD:CreatePriority(3), -- Assailing Lance
        [351827] = RD:CreatePriority(6), -- Spreading Misery
        [355143] = RD:CreatePriority(6), -- Deathlink
        [350763] = RD:CreatePriority(6), -- Annihilating Glare
        
        -- The Nine
        [350287] = RD:CreatePriority(2), -- Song of Dissolution
        [350542] = RD:CreatePriority(6), -- Fragments of Destiny
        [350202] = RD:CreatePriority(3), -- Unending Strike
        [350475] = RD:CreatePriority(5), -- Pierce Soul
        [350555] = RD:CreatePriority(3), -- Shard of Destiny
        [350109] = RD:CreatePriority(5), -- Brynja's Mournful Dirge
        [350483] = RD:CreatePriority(6), -- Link Essence
        [350039] = RD:CreatePriority(5), -- Arthura's Crushing Gaze
        [350184] = RD:CreatePriority(5), -- Daschla's Mighty Impact
        [350374] = RD:CreatePriority(5), -- Wings of Rage
        
        -- Remnant of Ner'zhul
        [350073] = RD:CreatePriority(2), -- Torment
        [349890] = RD:CreatePriority(5), -- Suffering
        [350469] = RD:CreatePriority(6), -- Malevolence
        [354634] = RD:CreatePriority(6), -- Spite 1
        [354479] = RD:CreatePriority(6), -- Spite 2
        [354534] = RD:CreatePriority(6), -- Spite 3
        
        -- Soulrender Dormazain
        [353429] = RD:CreatePriority(2), -- Tormented
        [353023] = RD:CreatePriority(3), -- Torment
        [351787] = RD:CreatePriority(5), -- Agonizing Spike
        [350647] = RD:CreatePriority(5), -- Brand of Torment
        [350422] = RD:CreatePriority(6), -- Ruinblade
        [350851] = RD:CreatePriority(6), -- Vessel of Torment
        [354231] = RD:CreatePriority(6), -- Soul Manacles
        [348987] = RD:CreatePriority(6), -- Warmonger Shackle 1
        [350927] = RD:CreatePriority(6), -- Warmonger Shackle 2
        
        -- Painsmith Raznal
        [356472] = RD:CreatePriority(5), -- Lingering Flames
        [355505] = RD:CreatePriority(6), -- Shadowsteel Chains 1
        [355506] = RD:CreatePriority(6), -- Shadowsteel Chains 2
        [348456] = RD:CreatePriority(6), -- Flameclasp Trap
        [356870] = RD:CreatePriority(2), -- Flameclasp Eruption
        [355568] = RD:CreatePriority(6), -- Cruciform Axe
        [355786] = RD:CreatePriority(5), -- Blackened Armor
        [355526] = RD:CreatePriority(6), -- Spiked
        
        -- Guardian of the First Ones
        [352394] = RD:CreatePriority(5), -- Radiant Energy
        [350496] = RD:CreatePriority(6), -- Threat Neutralization
        [347359] = RD:CreatePriority(6), -- Suppression Field
        [355357] = RD:CreatePriority(6), -- Obliterate
        [350732] = RD:CreatePriority(5), -- Sunder
        [352833] = RD:CreatePriority(6), -- Disintegration
        
        -- Fatescribe Roh-Kalo
        [354365] = RD:CreatePriority(5), -- Grim Portent
        [350568] = RD:CreatePriority(5), -- Call of Eternity
        [353435] = RD:CreatePriority(6), -- Overwhelming Burden
        [351680] = RD:CreatePriority(6), -- Invoke Destiny
        [353432] = RD:CreatePriority(6), -- Burden of Destiny
        [353693] = RD:CreatePriority(6), -- Unstable Accretion
        [350355] = RD:CreatePriority(6), -- Fated Conjunction
        [353931] = RD:CreatePriority(2), -- Twist Fate
        
        -- Kel'Thuzad
        [346530] = RD:CreatePriority(2), -- Frozen Destruction
        [354289] = RD:CreatePriority(2), -- Sinister Miasma
        [347454] = RD:CreatePriority(6), -- Oblivion's Echo 1
        [347518] = RD:CreatePriority(6), -- Oblivion's Echo 2
        [347292] = RD:CreatePriority(6), -- Oblivion's Echo 3
        [348978] = RD:CreatePriority(6), -- Soul Exhaustion
        [355389] = RD:CreatePriority(6), -- Relentless Haunt (Fixate)
        [357298] = RD:CreatePriority(6), -- Frozen Binds
        [355137] = RD:CreatePriority(5), -- Shadow Pool
        [348638] = RD:CreatePriority(4), -- Return of the Damned
        [348760] = RD:CreatePriority(6), -- Frost Blast
        
        -- Sylvanas Windrunner
        [349458] = RD:CreatePriority(2), -- Domination Chains
        [347704] = RD:CreatePriority(2), -- Veil of Darkness
        [347607] = RD:CreatePriority(5), -- Banshee's Mark
        [347670] = RD:CreatePriority(5), -- Shadow Dagger
        [351117] = RD:CreatePriority(5), -- Crushing Dread
        [351870] = RD:CreatePriority(5), -- Haunting Wave
        [351253] = RD:CreatePriority(5), -- Banshee Wail
        [351451] = RD:CreatePriority(6), -- Curse of Lethargy
        [351092] = RD:CreatePriority(6), -- Destabilize 1
        [351091] = RD:CreatePriority(6), -- Destabilize 2
        [348064] = RD:CreatePriority(6), -- Wailing Arrow
    },
    -- Sepulcher of the First Ones
    [2481] = {
        -- Vigilant Guardian
        [364447] = RD:CreatePriority(3), -- Dissonance
        [364904] = RD:CreatePriority(6), -- Anti-Matter
        [364881] = RD:CreatePriority(5), -- Matter Disolution
        [360415] = RD:CreatePriority(5), -- Defenseless
        [360412] = RD:CreatePriority(4), -- Exposed Core
        [366393] = RD:CreatePriority(5), -- Searing Ablation
        
        -- Skolex, the Insatiable Ravener
        [364522] = RD:CreatePriority(2), -- Devouring Blood
        [359976] = RD:CreatePriority(2), -- Riftmaw
        [359981] = RD:CreatePriority(2), -- Rend
        [360098] = RD:CreatePriority(3), -- Warp Sickness
        [366070] = RD:CreatePriority(3), -- Volatile Residue
        
        -- Artificer Xy'mox
        [364030] = RD:CreatePriority(3), -- Debilitating Ray
        [365681] = RD:CreatePriority(2), -- System Shock
        [363413] = RD:CreatePriority(4), -- Forerunner Rings A
        [364604] = RD:CreatePriority(4), -- Forerunner Rings B
        [362615] = RD:CreatePriority(6), -- Interdimensional Wormhole Player 1
        [362614] = RD:CreatePriority(6), -- Interdimensional Wormhole Player 2
        [362803] = RD:CreatePriority(5), -- Glyph of Relocation
        
        -- Dausegne, The Fallen Oracle
        [361751] = RD:CreatePriority(2), -- Disintegration Halo
        [364289] = RD:CreatePriority(2), -- Staggering Barrage
        [361018] = RD:CreatePriority(2), -- Staggering Barrage Mythic 1
        [360960] = RD:CreatePriority(2), -- Staggering Barrage Mythic 2
        [361225] = RD:CreatePriority(2), -- Encroaching Dominion
        [361966] = RD:CreatePriority(2), -- Infused Strikes
        
        -- Prototype Pantheon
        [365306] = RD:CreatePriority(2), -- Invigorating Bloom
        [361689] = RD:CreatePriority(3), -- Wracking Pain
        [366232] = RD:CreatePriority(4), -- Animastorm
        [364839] = RD:CreatePriority(2), -- Sinful Projection
        [360259] = RD:CreatePriority(5), -- Gloom Bolt
        [362383] = RD:CreatePriority(5), -- Anima Bolt
        [362352] = RD:CreatePriority(6), -- Pinned
        
        -- Lihuvim, Principle Architect
        [360159] = RD:CreatePriority(5), -- Unstable Protoform Energy
        [363681] = RD:CreatePriority(3), -- Deconstructing Blast
        [363676] = RD:CreatePriority(4), -- Deconstructing Energy Player 1
        [363795] = RD:CreatePriority(4), -- Deconstructing Energy Player 2
        -- [464312] = RD:CreatePriority(5), -- Ephemeral Barrier

        -- Halondrus the Reclaimer
        [361309] = RD:CreatePriority(3), -- Lightshatter Beam
        [361002] = RD:CreatePriority(4), -- Ephemeral Fissure
        [360114] = RD:CreatePriority(4), -- Ephemeral Fissure II
        
        -- Anduin Wrynn
        [365293] = RD:CreatePriority(2), -- Befouled Barrier
        [363020] = RD:CreatePriority(3), -- Necrotic Claws
        [365021] = RD:CreatePriority(5), -- Wicked Star (marked)
        [365024] = RD:CreatePriority(6), -- Wicked Star (hit)
        [365445] = RD:CreatePriority(3), -- Scarred Soul
        [365008] = RD:CreatePriority(4), -- Psychic Terror
        [366849] = RD:CreatePriority(6), -- Domination Word: Pain
        
        -- Lords of Dread
        [360148] = RD:CreatePriority(5), -- Bursting Dread
        [360012] = RD:CreatePriority(4), -- Cloud of Carrion
        [360146] = RD:CreatePriority(4), -- Fearful Trepidation
        [360241] = RD:CreatePriority(6), -- Unsettling Dreams
        
        -- Rygelon
        [362206] = RD:CreatePriority(6), -- Event Horizon
        [362137] = RD:CreatePriority(4), -- Corrupted Wound
        [362172] = RD:CreatePriority(4), -- Corrupted Wound
        [361548] = RD:CreatePriority(5), -- Dark Eclipse

        -- The Jailer
        [362075] = RD:CreatePriority(6), -- Domination
        [365150] = RD:CreatePriority(6), -- Rune of Domination
        [363893] = RD:CreatePriority(5), -- Martyrdom
        [363886] = RD:CreatePriority(5), -- Imprisonment
        [365219] = RD:CreatePriority(5), -- Chains of Anguish
        [366285] = RD:CreatePriority(6), -- Rune of Compulsion
        [363332] = RD:CreatePriority(5), -- Unbreaking Grasp
    },

    ----------------------------------------------------------
    -- Dragonflight
    ----------------------------------------------------------
    -- The Azure Vault
    [2515] = {
        -- Trash
        [370764] = RD:CreatePriority(1), -- Piercing Shards
        [375596] = RD:CreatePriority(2), -- Erratic Growth (Channel)
        [375602] = RD:CreatePriority(3), -- Erratic Growth
        [377488] = RD:CreatePriority(5), -- Icy Bindings
        [387564] = RD:CreatePriority(2), -- Mystic Vapors
        -- [371007] = RD:CreatePriority(), -- Splintering Shards
        -- [374523] = RD:CreatePriority(), -- Arcane Roots
        -- [375591] = RD:CreatePriority(), -- Sappy Burst
        -- [375649] = RD:CreatePriority(), -- Infused Ground
        -- [385267] = RD:CreatePriority(), -- Crackling Vortex
        -- [385409] = RD:CreatePriority(), -- Ouch, ouch, ouch!
        -- [386640] = RD:CreatePriority(), -- Tear Flesh
        -- [388777] = RD:CreatePriority(), -- Oppressive Miasma
        
        -- Leymor
        [374567] = RD:CreatePriority(false), -- Explosive Brand
        [374789] = RD:CreatePriority(5), -- Infused Strike
        
        -- Azureblade
        
        -- Telash Greywing
        [386881] = RD:CreatePriority(1), -- Frost Bomb
        -- [387150] = RD:CreatePriority(), -- Frozen Ground
        -- [387151] = RD:CreatePriority(), -- Icy Devastator
        
        -- Umbrelskul
        [384978] = RD:CreatePriority(1), -- Dragon Strike
        [385331] = RD:CreatePriority(), -- Fracture
    },
    -- The Nokhud Offensive
    [2516] = {
        -- Trash
        [386025] = RD:CreatePriority(3), -- Tempest
        [387629] = RD:CreatePriority(2), -- Rotting Wind
        -- [381692] = RD:CreatePriority(), -- Swift Stab
        -- [384134] = RD:CreatePriority(), -- Pierce
        -- [384492] = RD:CreatePriority(), -- Hunter's Mark
        -- [386912] = RD:CreatePriority(), -- Stormsurge Cloud
        -- [387615] = RD:CreatePriority(), -- Grasp of the Dead
        -- [388446] = RD:CreatePriority(), -- Stormcaller's Fury 2
        -- [388451] = RD:CreatePriority(), -- Stormcaller's Fury 1
        -- [388801] = RD:CreatePriority(), -- Mortal Strike
        -- [395035] = RD:CreatePriority(), -- Shatter Soul
        -- [395669] = RD:CreatePriority(), -- Aftershock
        -- [376634] = RD:CreatePriority(), -- Iron Spear
        
        -- Granyth
        
        -- The Raging Tempest
        [382628] = RD:CreatePriority(false), -- Surge of Power
        -- [376899] = RD:CreatePriority(), -- Crackling Cloud
        
        -- Teera and Maruuk
        [386063] = RD:CreatePriority(2), -- Frightful Roar
        
        -- Balakar Khan
        [375937] = RD:CreatePriority(1), -- Rending Strike
        [376730] = RD:CreatePriority(false), -- Stormwinds
        [376864] = RD:CreatePriority(3), -- Static Spear
        [376827] = RD:CreatePriority(3), -- Conductive Strike
        [376894] = RD:CreatePriority(1), -- Crackling Upheaval
    },
    -- Neltharus
    [2519] = {
        -- Trash
        [372461] = RD:CreatePriority(1), -- Imbued Magma
        [372971] = RD:CreatePriority(5), -- Reverberating Slam
        [373540] = RD:CreatePriority(5), -- Binding Spear
        [378221] = RD:CreatePriority(), -- Molten Vulnerability
        [378818] = RD:CreatePriority(1), -- Magma Conflagration
        -- [372224] = RD:CreatePriority(), -- Dragonbone Axe
        -- [372570] = RD:CreatePriority(), -- Bold Ambush
        -- [372570] = RD:CreatePriority(), -- Bold Ambush
        -- [373089] = RD:CreatePriority(), -- Scorching Fusillade
        -- [373540] = RD:CreatePriority(), -- Binding Spear
        -- [373735] = RD:CreatePriority(), -- Dragon Strike
        -- [374451] = RD:CreatePriority(), -- Burning Chain
        -- [374482] = RD:CreatePriority(), -- Grounding Chain
        -- [374534] = RD:CreatePriority(), -- Heated Swings
        -- [374842] = RD:CreatePriority(), -- Blazing Aegis
        -- [374854] = RD:CreatePriority(), -- Erupted Ground
        -- [375204] = RD:CreatePriority(), -- Liquid Hot Magma
        -- [376784] = RD:CreatePriority(), -- Flame Vulnerability
        -- [377018] = RD:CreatePriority(), -- Molten Gold
        -- [377522] = RD:CreatePriority(), -- Burning Pursuit
        -- [381482] = RD:CreatePriority(), -- Forgefire
        -- [384161] = RD:CreatePriority(), -- Mote of Combustion
        -- [387059] = RD:CreatePriority(), -- Burning Chain
        -- [389059] = RD:CreatePriority(), -- Slag Eruption
        -- [396332] = RD:CreatePriority(), -- Fiery Focus
        
        -- Chargath, Bane of Scales
        
        -- Forgemaster Gorek
        
        -- Magmatusk
        [375890] = RD:CreatePriority(), -- Magma Eruption

        -- Warlord Sargha
        [377018] = RD:CreatePriority(), -- Molten Gold
    },
    -- Brackenhide Hollow
    [2520] = {
        -- Trash
        [367481] = RD:CreatePriority(5), -- Bloody Bite
        -- [367521] = RD:CreatePriority(), -- Bone Bolt
        -- [368081] = RD:CreatePriority(), -- Withering
        -- [368091] = RD:CreatePriority(), -- Infected Bite
        -- [368299] = RD:CreatePriority(), -- Toxic Trap
        -- [373872] = RD:CreatePriority(), -- Gushing Ooze
        -- [373896] = RD:CreatePriority(), -- Withering Rot
        -- [373899] = RD:CreatePriority(), -- Decaying Roots
        -- [373912] = RD:CreatePriority(), -- Decaystrike
        -- [373917] = RD:CreatePriority(), -- Decaystrike
        -- [375416] = RD:CreatePriority(), -- Bleeding
        -- [376149] = RD:CreatePriority(), -- Choking Rotcloud
        -- [377844] = RD:CreatePriority(), -- Bladestorm
        -- [381461] = RD:CreatePriority(), -- Savage Charge
        -- [381835] = RD:CreatePriority(), -- Bladestorm
        -- [382723] = RD:CreatePriority(), -- Crushing Smash
        -- [382787] = RD:CreatePriority(), -- Decay Claws
        -- [382808] = RD:CreatePriority(), -- Withering Contagion
        -- [383087] = RD:CreatePriority(), -- Withering Contagion
        -- [383875] = RD:CreatePriority(), -- Partially Digested
        -- [384425] = RD:CreatePriority(), -- Smell Like Meat
        -- [384575] = RD:CreatePriority(), -- Crippling Bite
        -- [384725] = RD:CreatePriority(), -- Feeding Frenzy
        -- [384970] = RD:CreatePriority(), -- Scented Meat
        -- [384974] = RD:CreatePriority(), -- Scented Meat
        -- [385185] = RD:CreatePriority(), -- Disoriented
        -- [385356] = RD:CreatePriority(), -- Ensnaring Trap

        -- Hackclaw's War-Band
        [381379] = RD:CreatePriority(10), -- Decayed Senses
        [378020] = RD:CreatePriority(2), -- Gash Frenzy
        [378229] = RD:CreatePriority(1), -- Marked for Butchery
        
        -- Treemouth
        [377222] = RD:CreatePriority(1), -- Consume

        -- Gutshot

        -- Decatriarch Wratheye
    },
    -- Ruby Life Pools
    [2521] = {
        -- Trash
        [373589] = RD:CreatePriority(), -- Primal Chill
        -- [372047] = RD:CreatePriority(), -- Flurry
        -- [372697] = RD:CreatePriority(), -- Jagged Earth
        -- [372820] = RD:CreatePriority(), -- Scorched Earth
        -- [372858] = RD:CreatePriority(), -- Searing Blows
        -- [372963] = RD:CreatePriority(), -- Chillstorm
        -- [373692] = RD:CreatePriority(), -- Inferno 2
        -- [373693] = RD:CreatePriority(), -- Living Bomb
        -- [373869] = RD:CreatePriority(), -- Burning Touch
        -- [381515] = RD:CreatePriority(), -- Stormslam
        -- [381518] = RD:CreatePriority(), -- Winds of Change
        -- [384773] = RD:CreatePriority(), -- Flaming Embers
        -- [384823] = RD:CreatePriority(), -- Inferno 1
        -- [385536] = RD:CreatePriority(), -- Flame Dance
        -- [392406] = RD:CreatePriority(), -- Thunderclap
        -- [392451] = RD:CreatePriority(), -- Flashfire
        -- [392924] = RD:CreatePriority(), -- Shock Blast
        -- [396411] = RD:CreatePriority(), -- Primal Overload

        -- Melidrussa Chillworn
        [372682] = RD:CreatePriority(3), -- Primal Chill
        
        -- Kokia Blazehoof
        [372811] = RD:CreatePriority(4), -- Molten Bolder
        [372860] = RD:CreatePriority(3), -- Searing Wounds
        
        -- Kyrakka and Erkhart Stormvein
        [381862] = RD:CreatePriority(5), -- Infernocore
    },
    -- Algeth'ar Academy
    [2526] = {
        -- Trash
        -- [376997] = RD:CreatePriority(), -- Savage Peck
        -- [377344] = RD:CreatePriority(), -- Peck
        -- [386181] = RD:CreatePriority(), -- Mana Bomb
        -- [386201] = RD:CreatePriority(), -- Corrupted Mana
        -- [387932] = RD:CreatePriority(), -- Astral Whirlwind
        -- [388544] = RD:CreatePriority(), -- Barkbreaker
        -- [388866] = RD:CreatePriority(), -- Mana Void
        -- [388912] = RD:CreatePriority(), -- Severing Slash
        -- [388984] = RD:CreatePriority(), -- Vicious Ambush
        -- [391977] = RD:CreatePriority(), -- Oversurge
        -- [396716] = RD:CreatePriority(), -- Splinterbark

        -- Vexamus

        -- Overgrown Ancient
        [389033] = RD:CreatePriority(5), -- Lasher Toxin
        
        -- Crawth
        [377008] = RD:CreatePriority(5), -- Deafening Screech
        [397210] = RD:CreatePriority(0, 3), -- Sonic Vulnerability
        
        -- Echo of Doragosa
        [389011] = RD:CreatePriority(0, 2), -- Overwhelming Power
    },
    -- Halls of Infusion
    [2527] = {
        -- Trash
        [374610] = RD:CreatePriority(2), -- Fixate
        [374724] = RD:CreatePriority(1), -- Molten Subduction
        [375384] = RD:CreatePriority(1), -- Rumbling Earth
        [391634] = RD:CreatePriority(5), -- Deep Chill
        -- [374339] = RD:CreatePriority(), -- Demoralizing Shout
        -- [374615] = RD:CreatePriority(), -- Cheap Shot
        -- [374706] = RD:CreatePriority(), -- Pyretic Burst
        -- [383935] = RD:CreatePriority(), -- Spark Volley
        -- [385168] = RD:CreatePriority(), -- Thunderstorm
        
        -- Watcher Irideous
        [384524] = RD:CreatePriority(1), -- Titanic Fist
        [389179] = RD:CreatePriority(2), -- Power Overload
        [389443] = RD:CreatePriority(), -- Purifying Blast
        [389446] = RD:CreatePriority(1), -- Nullifying Pulse
        -- [389181] = RD:CreatePriority(), -- Power Field
        
        -- Gulping Goliath
        [385555] = RD:CreatePriority(5), -- Gulp
        [374389] = RD:CreatePriority(10), -- Gulp Swog Toxin
        
        -- Khajin the Unyielding
        [386743] = RD:CreatePriority(false), -- Polar Winds
        -- [385963] = RD:CreatePriority(), -- Frost Shock
        
        -- Primal Tsunami
        [383204] = RD:CreatePriority(), -- Crashing Tsunami
        -- [387571] = RD:CreatePriority(), -- Focused Deluge
    },
    -- Uldaman: Legacy of Tyr
    [2451] = {
        -- Trash
        [369365] = RD:CreatePriority(3), -- Curse of Stone
        [369366] = RD:CreatePriority(5), -- Trapped in Stone
        [369411] = RD:CreatePriority(3), -- Sonic Burst
        [369811] = RD:CreatePriority(4), -- Brutal Slam
        [369828] = RD:CreatePriority(5), -- Chomp
        -- [369337] = RD:CreatePriority(), -- Difficult Terrain
        -- [369419] = RD:CreatePriority(), -- Venomous Fangs
        -- [369818] = RD:CreatePriority(), -- Diseased Bite
        -- [375286] = RD:CreatePriority(), -- Searing Cannonfire
        -- [377486] = RD:CreatePriority(), -- Time Blade
        -- [377510] = RD:CreatePriority(), -- Stolen Time
        -- [377732] = RD:CreatePriority(), -- Jagged Bite
        -- [377825] = RD:CreatePriority(), -- Burning Pitch
        -- [382071] = RD:CreatePriority(), -- Resonating Orb
        -- [382576] = RD:CreatePriority(), -- Scorn of Tyr
        
        -- The Lost Dwarves
        
        -- Bromach
        
        -- Sentinel Talondas
        [372718] = RD:CreatePriority(3), -- Earthen Shards
        
        -- Emberon
        [369006] = RD:CreatePriority(1), -- Burning Heat
        -- [369110] = RD:CreatePriority(), -- Unstable Embers
        
        -- Chrono-Lord Deios
        [377405] = RD:CreatePriority(2), -- Time Sink
        -- [376333] = RD:CreatePriority(false), -- Temporal Zone
        -- [376209] = RD:CreatePriority(1), -- Rewind Timeflow
        -- [376325] = RD:CreatePriority(), -- Eternity Zone
    },

    -- Vault of the Incarnates
    [2522] = {
        -- Eranog
        [370648] = RD:CreatePriority(5), -- Primal Flow
        [390715] = RD:CreatePriority(6), -- Primal Rifts
        [370597] = RD:CreatePriority(6), -- Kill Order
        
        -- Terros
        [382776] = RD:CreatePriority(5), -- Awakened Earth 1
        [381253] = RD:CreatePriority(5), -- Awakened Earth 2
        [386352] = RD:CreatePriority(3), -- Rock Blast
        [382458] = RD:CreatePriority(6), -- Resonant Aftermath

        -- The Primal Council
        [371624] = RD:CreatePriority(5), -- Conductive Mark
        [372027] = RD:CreatePriority(4), -- Slashing Blaze
        [374039] = RD:CreatePriority(4), -- Meteor Axe
        
        -- Sennarth, the Cold Breath
        [371976] = RD:CreatePriority(4), -- Chilling Blast
        [372082] = RD:CreatePriority(5), -- Enveloping Webs
        [374659] = RD:CreatePriority(4), -- Rush
        [374104] = RD:CreatePriority(5), -- Wrapped in Webs Slow
        [374503] = RD:CreatePriority(6), -- Wrapped in Webs Stun
        [373048] = RD:CreatePriority(3), -- Suffocating Webs

        -- Dathea, Ascended
        [391686] = RD:CreatePriority(5), -- Conductive Mark
        
        -- [378277] = RD:CreatePriority(2), -- Elemental Equilbrium
        [388290] = RD:CreatePriority(4), -- Cyclone
        
        -- Kurog Grimtotem
        [377780] = RD:CreatePriority(5), -- Skeletal Fractures
        [372514] = RD:CreatePriority(5), -- Frost Bite
        [374554] = RD:CreatePriority(4), -- Lava Pool
        [374704] = RD:CreatePriority(4), -- Seismic Rupture
        [374023] = RD:CreatePriority(6), -- Searing Carnage
        [374427] = RD:CreatePriority(6), -- Ground Shatter
        [390920] = RD:CreatePriority(5), -- Shocking Burst
        [372458] = RD:CreatePriority(6), -- Below Zero
        
        -- Broodkeeper Diurna
        [390569] = RD:CreatePriority(false),
        [388920] = RD:CreatePriority(6), -- Frozen Shroud
        [378782] = RD:CreatePriority(5), -- Mortal Wounds
        [378787] = RD:CreatePriority(5), -- Crushing Stoneclaws
        [375620] = RD:CreatePriority(6), -- Ionizing Charge
        [375578] = RD:CreatePriority(4), -- Flame Sentry
        [390561] = RD:CreatePriority(false), -- Diurna's Gaze
        
        -- Raszageth the Storm-Eater
        [381251] = RD:CreatePriority(false), -- Electric Lash
    },
    -- Aberrus, the Shadowed Crucible
    [2569] = {
        -- Trash
        [406183] = RD:CreatePriority(), -- Time Slash
        [406288] = RD:CreatePriority(1), -- Dream Burst
        [220540] = RD:CreatePriority(), -- Fear
        [411437] = RD:CreatePriority(), -- Brutal Lacerations
        [411439] = RD:CreatePriority(), -- Sundering Strike
        
        -- Kazzara, the Hellforged
        -- [403655] = RD:CreatePriority(), -- Wings of Extinction
        [402253] = RD:CreatePriority(), -- Ray of Anguish
        [402299] = RD:CreatePriority(), -- Ray of Anguish
        [402420] = RD:CreatePriority(), -- Molten Scar
        [404743] = RD:CreatePriority(), -- Terror Claws
        [406288] = RD:CreatePriority(), -- Dream Burst
        [406525] = RD:CreatePriority(), -- Dread Rift
        [406530] = RD:CreatePriority(), -- Riftburn
        [406728] = RD:CreatePriority(), -- Blazing Heat
        [406729] = RD:CreatePriority(), -- Corrupting Shadow
        [412625] = RD:CreatePriority(), -- Shadowflame Spill
        
        -- The Amalgamation Chamber
        -- [401809] = RD:CreatePriority(), -- Corrupting Shadow
        -- [401854] = RD:CreatePriority(), -- Corrupting Shadow
        -- [401862] = RD:CreatePriority(), -- Blazing Heat
        -- [402617] = RD:CreatePriority(), -- Blazing Heat
        -- [405394] = RD:CreatePriority(), -- Shadowflame Contamination
        -- [406780] = RD:CreatePriority(), -- Shadowflame Contamination
        [405036] = RD:CreatePriority(), -- Umbral Detonation
        [405084] = RD:CreatePriority(), -- Lingering Umbra
        [405642] = RD:CreatePriority(), -- Blistering Twilight
        [405645] = RD:CreatePriority(), -- Engulfing Heat
        [409018] = RD:CreatePriority(), -- Infected Slop
        [409041] = RD:CreatePriority(), -- Congealed Mass
        [411799] = RD:CreatePriority(), -- Creeping Ooze
        [411808] = RD:CreatePriority(), -- Slime Ejection
        [411862] = RD:CreatePriority(), -- Acidic Bile
        [411892] = RD:CreatePriority(), -- Viscous Bile
        [412488] = RD:CreatePriority(), -- Arcane Burst
        [412498] = RD:CreatePriority(), -- Stagnating Pool
        [413597] = RD:CreatePriority(), -- Withering Vulnerability
        
        -- The Forgotten Experiments
        [405392] = RD:CreatePriority(), -- Disintegrate
        [405423] = RD:CreatePriority(), -- Disintegrate
        [405850] = RD:CreatePriority(), -- Devastation
        [406233] = RD:CreatePriority(), -- Deep Breath
        [406313] = RD:CreatePriority(), -- Infused Strikes
        [406365] = RD:CreatePriority(), -- Rending Charge
        [406898] = RD:CreatePriority(), -- Molten Rain
        [407212] = RD:CreatePriority(), -- Talon's Grip
        -- [407302] = RD:CreatePriority(), -- Infused Explosion
        [407327] = RD:CreatePriority(), -- Unstable Essence
        [409307] = RD:CreatePriority(), -- Blazing Beak
        [409757] = RD:CreatePriority(), -- Shattering Attack
        [409921] = RD:CreatePriority(), -- Stunning Attack
        [410981] = RD:CreatePriority(), -- Iron Jaws
        [411223] = RD:CreatePriority(), -- Molten Cinders
        [411730] = RD:CreatePriority(), -- Searing Fangs
        
        -- Assault of the Zaqali
        [401407] = RD:CreatePriority(), -- Blazing Spear
        [401452] = RD:CreatePriority(), -- Blazing Spear
        [404616] = RD:CreatePriority(), -- Weakened Vitality
        [408873] = RD:CreatePriority(), -- Heavy Cudgel
        [409275] = RD:CreatePriority(), -- Magma Flow
        [410353] = RD:CreatePriority(), -- Flaming Cudgel
        
        -- Rashok, the Elder
        [403543] = RD:CreatePriority(), -- Lava Wave
        [405819] = RD:CreatePriority(), -- Searing Slam
        -- [405827] = RD:CreatePriority(), -- Overcharged
        [406321] = RD:CreatePriority(), -- Lava Vortex
        [407547] = RD:CreatePriority(), -- Flaming Slash
        [407597] = RD:CreatePriority(), -- Earthen Crush
        [408204] = RD:CreatePriority(), -- Scorched Flesh
        [408857] = RD:CreatePriority(), -- Doom Flames
        
        -- The Vigilant Steward, Zskarn
        [371313] = RD:CreatePriority(), -- Fireball
        [403978] = RD:CreatePriority(), -- Blast Wave
        [404010] = RD:CreatePriority(), -- Unstable Embers
        [404942] = RD:CreatePriority(), -- Searing Claws
        [404955] = RD:CreatePriority(), -- Shrapnel Bomb
        [404959] = RD:CreatePriority(), -- Shrapnel Bomb
        [405462] = RD:CreatePriority(), -- Dragonfire Traps
        [405592] = RD:CreatePriority(), -- Salvage Parts
        [409437] = RD:CreatePriority(), -- Searing Ichor
        [417229] = RD:CreatePriority(), -- Dragonfire Traps
        
        -- Magmorax
        -- [403747] = RD:CreatePriority(), -- Igniting Roar
        [402994] = RD:CreatePriority(), -- Molten Spittle
        [405850] = RD:CreatePriority(), -- Devastation
        [406183] = RD:CreatePriority(), -- Time Slash
        [406288] = RD:CreatePriority(), -- Dream Burst
        [408839] = RD:CreatePriority(), -- Searing Heat
        [408955] = RD:CreatePriority(5), -- Incinerating Maws
        [409724] = RD:CreatePriority(), -- Earthen Grasp
        [413367] = RD:CreatePriority(), -- Lava Ejection
        
        -- Echo of Neltharion
        [132951] = RD:CreatePriority(), -- Flare
        [401998] = RD:CreatePriority(5), -- Calamitous Strike
        [402120] = RD:CreatePriority(), -- Collapsed Earth
        [405484] = RD:CreatePriority(), -- Surrendering to Corruption
        [407220] = RD:CreatePriority(), -- Rushing Darkness
        [407329] = RD:CreatePriority(), -- Shatter
        [407728] = RD:CreatePriority(5), -- Sundered Shadow
        [407917] = RD:CreatePriority(), -- Ebon Destruction
        [407919] = RD:CreatePriority(), -- Sundered Reality
        [408160] = RD:CreatePriority(), -- Shadow Strike
        [409058] = RD:CreatePriority(), -- Seeping Lava
        [410972] = RD:CreatePriority(1), -- Corruption
        
        -- Scalecommander Sarkareth
        [401330] = RD:CreatePriority(), -- Burning Claws
        [401383] = RD:CreatePriority(), -- Oppressing Howl
        [401525] = RD:CreatePriority(), -- Scorching Detonation
        [401905] = RD:CreatePriority(), -- Dazzled
        [401951] = RD:CreatePriority(false), -- Oblivion
        [402051] = RD:CreatePriority(), -- Searing Breath
        [403520] = RD:CreatePriority(), -- Embrace of Nothingness
        [404154] = RD:CreatePriority(), -- Void Surge
        [404499] = RD:CreatePriority(), -- Abyssal Breath
        [406989] = RD:CreatePriority(), -- Burning Ground
        [407496] = RD:CreatePriority(), -- Infinite Duress
        [408429] = RD:CreatePriority(), -- Void Slash
        [410642] = RD:CreatePriority(), -- Void Fracture
        [411241] = RD:CreatePriority(), -- Void Claws
    },
    -- Amirdrassil, the Dream's Hope
    [2549] = {
        -- Gnarlroot
        -- Igira the Cruel
        -- Volcoross
        -- Council of Dreams
        -- Larodar, Keeper of the Flame
        [421463] = RD:CreatePriority(1), -- Encased in Ash

        -- Nymue, Weaver of the Cycle
        [429785] = RD:CreatePriority(1), -- Impending Loom

        -- Smolderon
        [417807] = RD:CreatePriority(1), -- Aflame

        -- Tildral Sageswift, Seer of the Flame
        [424495] = RD:CreatePriority(false), -- Mass Entanglement
        [424581] = RD:CreatePriority(2), -- Fiery Growth

        -- Fyrakk the Blazing
    },
    
    ----------------------------------------------------------
    -- The War Within
    ----------------------------------------------------------
    -- The Rookery
    [2648] = {
        -- Trash
        [430179] = RD:CreatePriority(2), -- Seeping Corruption (Curse)

        -- Kyrioss
        -- Stormguard Gorren
        [426160] = RD:CreatePriority(false), -- Dark Gravity
        [424739] = RD:CreatePriority(10), -- Chaotic Corruption
        [424797] = RD:CreatePriority(10), -- Chaotic Vulnerability

        -- Voidstone Monstosity
        [429493] = RD:CreatePriority(10), -- Unstable Corruption (Magic)
    },
    -- Priory of the Sacred Frame
    [2649] = {
        -- Trash
        [451764] = RD:CreatePriority(false), -- Radiant Flame
        [435148] = RD:CreatePriority(2), -- Blazing Stike (Magic)
        [453461] = RD:CreatePriority(0), -- Caltrops (Bleed)
        [427635] = RD:CreatePriority(0), -- Griveous Rip (Bleed)
        
        -- Captain Dailcry
        [447272] = RD:CreatePriority(0), -- Hurl Spear

        -- Baron Braunpyke
        -- Prioress Murrpray
    },
    -- Darkflame Cleft
    [2651] = {
        -- Trash
        [423501] = RD:CreatePriority(0), -- Wild Wallop
        [424322] = RD:CreatePriority(false), -- Explosive Flame
        [426277] = RD:CreatePriority(8), -- One-Hand Headlock (Immobilize)
        [426295] = RD:CreatePriority(10), -- Flaming Tether
        [427929] = RD:CreatePriority(0), -- Nasty Nibble (Disease)
        [428019] = RD:CreatePriority(0), -- Flashpoint (Magic)

        -- Ol'Waxbeard
        [423693] = RD:CreatePriority(0, 5), -- Luring Candleflame

        -- Blazikon
        [422648] = RD:CreatePriority(0), -- Wicklighter Barrage

        -- The Candle King
        [422648] = RD:CreatePriority(5), -- Darkflame Pickaxe
        [426145] = RD:CreatePriority(10), -- Paranoid Mind (Magic + Fear)

        -- The Darkness
        [422806] = RD:CreatePriority(false), -- Smothering Shadows
        [422807] = RD:CreatePriority(false), -- Candlelight
        [426943] = RD:CreatePriority(false), -- Rising Gloom
        [427015] = RD:CreatePriority(0), -- Shadowblast
    },
    -- The Stonevault
    [2652] = {
        -- Trash
        [426308] = RD:CreatePriority(0), -- Void Infection (Curse)
        [426771] = RD:CreatePriority(), -- Void Outburst
        [427382] = RD:CreatePriority(0), -- Concussive Smash (Magic / Slow)
        [428887] = RD:CreatePriority(0, 5), -- Smashed
        [429545] = RD:CreatePriority(10), -- Censoring Gear (Magic / Silence)
        [445207] = RD:CreatePriority(5), -- Piercing Wail (Magic or Enrage ??)
        [449129] = RD:CreatePriority(5), -- Lava Canon
        [449154] = RD:CreatePriority(0), -- Molten Mortar
        [449455] = RD:CreatePriority(10), -- Howling Fear (Magic / Fear)
        
        -- E.D.N.A
        [424889] = RD:CreatePriority(10), -- Seismic Reverberation (Magic)
        [424893] = RD:CreatePriority(5), -- Stone Shield
        [443494] = RD:CreatePriority(0), -- Crystalline Eruption

        -- Skarmorak
        [443494] = RD:CreatePriority(0), -- Crystalline Eruption
        
        -- Master Machinists
        [428161] = RD:CreatePriority(false), -- Molten Metal (Slow)

        -- Void Speaker Eirich
        [427329] = RD:CreatePriority(0), -- Void Corruption
    },
    -- Ara-Kara, City of Echoes
    [2660] = {
        -- Trash
        [438599] = RD:CreatePriority(1), -- Bleeding Jab

        -- Avanoxx
        [439070] = RD:CreatePriority(0), -- Hunger (Fixate)
        
        -- Anub'zekt
        -- Ki'katal the Harvest
    },
    -- Cinderbrew Meadery
    [2661] = {
        -- Trash
        [441179] = RD:CreatePriority(0), -- Oozing Honey
        [435810] = RD:CreatePriority(1), -- Explosive Brew
        [437956] = RD:CreatePriority(3), -- Erupting Inferno
        [442589] = RD:CreatePriority(10), -- Beeswax
        [441397] = RD:CreatePriority(8, 3), -- Bee Venom
        
        -- Brew Master Aldryr
        [431897] = RD:CreatePriority(false), -- Rowdy Yell
        
        -- I'pa
        [439325] = RD:CreatePriority(1), -- Burning Fermentation (Magic)
        
        -- Benk Buzzbee
        [438975] = RD:CreatePriority(2), -- Shredding Sting
        [442995] = RD:CreatePriority(0), -- Swarming Surprise

        -- Goldie Baronbottom
        [436640] = RD:CreatePriority(0), -- Burning Ricochet (Magic)
        [439468] = RD:CreatePriority(0), -- Downward Trend
    },
    -- The Dawnbreaker
    [2662] = {
        -- Trash
        [431491] = RD:CreatePriority(0), -- Tainted Slash
        [432448] = RD:CreatePriority(2), -- Stygian Seed (Magic)
        [449042] = RD:CreatePriority(false), -- Radiant Light

        -- Speaker Shadowcrown
        [426735] = RD:CreatePriority(0), -- Burning Shadows (Magic)
        
        -- Anub'ikkaj
        -- Rasha'nan
    },
    -- City of Threads
    [2669] = {
        -- Trash
        [443509] = RD:CreatePriority(), -- Ravenous Swarm
        [443437] = RD:CreatePriority(), -- Shadows of Doubt (Magic)
        [448305] = RD:CreatePriority(false), -- Stolen Power

        -- Orator Krix'vizk
        -- Fangs of the Queen
        [440238] = RD:CreatePriority(2), -- Ice Sickles (Magic)

        -- The Coaglamation

        -- Izo, the Grand Splicer
        [439341] = RD:CreatePriority(), -- Splice
    },
    -- Operation: Floodgate
    [2773] = {
        -- Trash
        [462737] = RD:CreatePriority(), -- Black Blood Wound (Magic)        
        [465813] = RD:CreatePriority(), -- Lethargic Venom (Poison)
        [465820] = RD:CreatePriority(), -- Vicious Chomp (Blood + Reduce Healing)
        [469799] = RD:CreatePriority(), -- Overcharge (Magic)

        -- Big M.O.M.M.A
        
        -- Demolition Duo
        [473690] = RD:CreatePriority(10), -- Kinetic Explosive Gel (Magic)

        -- Swampface
        [469478] = RD:CreatePriority(10), -- Sludge Claws

        -- Geezle Gigazap
    },
    -- Eco'Dome Al'dani
    [2830] = {
        -- Azhicaar
        [1217241] = RD:CreatePriority(8), -- Feast
        [1217247] = RD:CreatePriority(8), -- Feast
        
        -- Taah'bat and A'wazj
        [1220384] = RD:CreatePriority(7), -- Wrap Strike
        [1219482] = RD:CreatePriority(7), -- Rift Claws

        -- Soul-Scribe
        [1225218] = RD:CreatePriority(7), -- Dread of the Unknown
        [1226444] = RD:CreatePriority(), -- Wounded Fate
    },

    -- Nerub-ar Palace
    [2657] = {
        -- Ulgrax the Devourer

        -- The Bloodbound Horror
        [443305] = RD:CreatePriority(), -- Crimson Rain
        [442604] = RD:CreatePriority(), -- Goresplatter
        [443612] = RD:CreatePriority(), -- Gruesome Disgorge
        [445570] = RD:CreatePriority(false), -- Unseeming Blight
        
        -- Sikran, Captain of the Sureki
        [434860] = RD:CreatePriority(), -- Phase Blade

        -- Rasha'nan
        [458067] = RD:CreatePriority(), -- Savage Wound
        [440193] = RD:CreatePriority(1, 7), -- Lingering Erosion

        -- Broodtwister Ovi'nax
        [441362] = RD:CreatePriority(8), -- Volatile Concoction (Tank)
        [441368] = RD:CreatePriority(6), -- Volatile Concoction (Tank)
        [442250] = RD:CreatePriority(), -- Fixate
        [442257] = RD:CreatePriority(1), -- Infest
        [442260] = RD:CreatePriority(1), -- Experimental Dosage
        [442437] = RD:CreatePriority(false), -- Ingest Black Blood
        [443274] = RD:CreatePriority(false), -- Unstable Infusion
        [450661] = RD:CreatePriority(false), -- Caustic Reaction
        
        -- Nexus-Princess Ky'veza
        [437343] = RD:CreatePriority(0), -- Queensbane
        
        -- The Silken Court
        [438200] = RD:CreatePriority(), -- Poison Bold
        [438218] = RD:CreatePriority(), -- Piercing Strike
        [438656] = RD:CreatePriority(false), -- Venomous Rain
        [438749] = RD:CreatePriority(1), -- Scarab Fixation
        [438773] = RD:CreatePriority(1, 3), -- Shattered Shell (5% each)
        [460600] = RD:CreatePriority(false), -- Entropic Barrage
        [451086] = RD:CreatePriority(), -- Entropic Web
        [463461] = RD:CreatePriority(1), -- Entropic Vulnerability
        
        [438708] = RD:CreatePriority(10), -- Stinging Swarm
        [441772] = RD:CreatePriority(8), -- Void Bolt

        -- Queen Ansurek
            -- Stage One
            [436800] = RD:CreatePriority(8), -- Liquefy (Tank)
            [437078] = RD:CreatePriority(false), -- Acid
            [437586] = RD:CreatePriority(5), -- Reactive Toxin
            [438804] = RD:CreatePriority(false), -- Venom Nova
            [439825] = RD:CreatePriority(), -- Silken Tomb
            [439829] = RD:CreatePriority(), -- Silken Tomb
            [441958] = RD:CreatePriority(), -- Grasping Silk
            [447532] = RD:CreatePriority(false), -- Paralyzing Venom
            [449236] = RD:CreatePriority(), -- Caustic Fangs
            [451278] = RD:CreatePriority(1), -- Concentrated Toxin
            [455404] = RD:CreatePriority(1), -- Feast
            [464628] = RD:CreatePriority(), -- Reaction Trauma
            [464638] = RD:CreatePriority(1, 3), -- Frothy Toxin
            [464643] = RD:CreatePriority(false), -- Lingering Toxin (Mythic)
            -- [??????] = RD:CreatePriority(false), -- Toxin Reaction (Mythic)
            
            -- Intermission
            [447170] = RD:CreatePriority(false), -- Predation Threads
            
            -- Stage Two
            [443403] = RD:CreatePriority(), -- Gloom
            [447967] = RD:CreatePriority(), -- Gloom Touch
            [448660] = RD:CreatePriority(), -- Acid Bolt
            
            -- Stage Three
            [438974] = RD:CreatePriority(), -- Royal Condemnation
            [439536] = RD:CreatePriority(), -- Web Blades
            [441865] = RD:CreatePriority(), -- Royal Shackles
            [443342] = RD:CreatePriority(8), -- Gorge
            [443656] = RD:CreatePriority(6), -- Infest
            [443903] = RD:CreatePriority(), -- Abyssal Infusion
            [445152] = RD:CreatePriority(), -- Acolyte's Essence
            [445623] = RD:CreatePriority(false), -- Glutton Threads
            [445818] = RD:CreatePriority(), -- Frothing Gluttony
            [446012] = RD:CreatePriority(), -- Essence Scarred
            [455387] = RD:CreatePriority(), -- Abyssal Reverberation
    },
    -- Operation: Undermine
    [2769] = {

    },
}

if oUF.isRetail then
    debuffs["PvP"] = {
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
    }
elseif oUF.isMoP then
    debuffs["PvP"] = {

    }
else
    debuffs["PvP"] = {
        -- DRUID
        [339] = RD:CreatePriority(2), -- Entangling Roots
        [2637] = RD:CreatePriority(3), -- Hibernate
        [5211] = RD:CreatePriority(3), -- Bash
        [9005] = RD:CreatePriority(3), -- Pounce
        [16922] = RD:CreatePriority(3), -- Celestial Focus
        [19975] = RD:CreatePriority(2), -- Entangling Roots (Nature's Grasp)
        [22570] = RD:CreatePriority(3), -- Maim
        [33786] = (not oUF.isClassic) and RD:CreatePriority(3) or nil, -- Cyclone
        [45334] = (not oUF.isClassic) and RD:CreatePriority(2) or nil, -- Feral Charge Effect
        
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
        [34490] = (not oUF.isClassic) and RD:CreatePriority(3) or nil, -- Silencing Shot

        -- MAGE
        [118] = RD:CreatePriority(3), -- Polymorph
        [122] = RD:CreatePriority(2), -- Frost Nova
        [12355] = RD:CreatePriority(3), -- Impact
        [12494] = RD:CreatePriority(2), -- Frostbite
        [18469] = RD:CreatePriority(3), -- Silenced - Improved Counterspell
        [28271] = RD:CreatePriority(3), -- Polymorph: Turtle
        [28272] = RD:CreatePriority(3), -- Polymorph: Pig
        [31661] = (not oUF.isClassic) and RD:CreatePriority(3) or nil, -- Dragon's Breath
        [33395] = (not oUF.isClassic) and RD:CreatePriority(2) or nil, -- Freeze (Water Elemental)
        
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
        [44041] = (not oUF.isClassic) and RD:CreatePriority(3) or nil, -- Chastise
        
        -- ROGUE
        [408] = RD:CreatePriority(3), -- Kidney Shot
        [1330] = RD:CreatePriority(3), -- Garrote - Silence
        [1776] = RD:CreatePriority(3), -- Gouge
        [1833] = RD:CreatePriority(3), -- Cheap Shot
        [2094] = RD:CreatePriority(3), -- Blind
        [6770] = RD:CreatePriority(3), -- Sap
        [14251] = RD:CreatePriority(3), -- Riposte
        [18425] = RD:CreatePriority(3), -- Silenced - Improved Kick
        [32747] = (not oUF.isClassic) and RD:CreatePriority(3) or nil, -- Deadly Throw Interrupt
        
        -- WARLOCK
        [5484] = RD:CreatePriority(3), -- Howl of Terror
        [5782] = RD:CreatePriority(3), -- Fear
        [6358] = RD:CreatePriority(3), -- Seduction (Succubus)
        [6789] = RD:CreatePriority(3), -- Death Coil
        [18093] = RD:CreatePriority(3), -- Pyroclasm
        [24259] = RD:CreatePriority(3), -- Spell Lock (Felhunter)
        [30153] = (not oUF.isClassic) and RD:CreatePriority(3) or nil, -- Intercept Stun (Felguard)
        [30283] = (not oUF.isClassic) and RD:CreatePriority(3) or nil, -- Shadowfury
        
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
        [28730]  = (not oUF.isClassic) and RD:CreatePriority(3) or nil, -- Arcane Torrent
        
        -- OTHERS
        [5530] = RD:CreatePriority(3), -- Mace Specialization
    }
end

if oUF.isClassic then
    debuffs["General"] = {}
end

RD.debuffs = debuffs

local validated = {}

function RD:ValidateDebuffs(instanceID)
    if debuffs[instanceID] and not validated[instanceID] then
		for spellID, value in next, debuffs[instanceID] do
			local name = GetSpellName(spellID)
			if not name then
				self:print("[" .. instanceID .. "] Spell " .. spellID .. " do not exists.")
			end
		end

        validated[instanceID] = true
	end
end
