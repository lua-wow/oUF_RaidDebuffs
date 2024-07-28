local _, ns = ...
local oUF = ns.oUF
local RD = ns.oUF_RaidDebuffs

if not oUF.isRetail then return end

local _, class = UnitClass("player")

local Debuffs = {
    ["Affixes"] = {
        ----------------------------------------------------------
        -- Mythic+ Affixes
        ----------------------------------------------------------
        -- General
        [209858] = RD:CreatePriority(), -- Necrotic
        [226512] = RD:CreatePriority(), -- Sanguine
        [240443] = RD:CreatePriority(), -- Bursting
        [240559] = RD:CreatePriority(), -- Grievous

        -- Shadowlands: Season 4
        [373364] = RD:CreatePriority(), -- Vampiric Claws
        [373370] = RD:CreatePriority(), -- Nightmare Cloud
        [373391] = RD:CreatePriority(), -- Nightmare
        [373429] = RD:CreatePriority(), -- Carrion Swarm
        [373509] = RD:CreatePriority(), -- Shadow Claws (Stacking)
        [373570] = RD:CreatePriority(), -- Hypnosis
        [373607] = RD:CreatePriority(), -- Shadowy Barrier (Hypnosis)

        -- Dragonflight: Season 1
        [396364] = RD:CreatePriority(), -- Mark of Wind
        [396369] = RD:CreatePriority(), -- Mark of Lightning

        -- Dragonflight: Season 2
        [408556] = RD:CreatePriority(), -- Entangled
        [408805] = RD:CreatePriority(), -- Destabilize
        [409492] = RD:CreatePriority(1), -- Afflicted Cry (Afflicted)
    },
    ["General"] = {
        ----------------------------------------------------------
        -- Dragonflight
        ----------------------------------------------------------
        -- World Bosses
            -- Strunraan, The Sky's Misery

            -- Basrikron, The Scale Wind

            -- Liskanoth, The Futurebane

            -- Bazual, THe Dreaded Flame

            -- The Zaqali Elders (Vakan & Gholna)
            [402824] = RD:CreatePriority(1), -- Searing Touch
            [403779] = RD:CreatePriority(), -- Burning Shadows
    },

    ----------------------------------------------------------
    -- Mists of Pandaria
    ----------------------------------------------------------
    -- Temple of the Jade Serpent
    [960] = {
        [106113] = RD:CreatePriority(), -- Touch of Nothingness
        [106823] = RD:CreatePriority(), -- Serpent Strike
        [110125] = RD:CreatePriority(), -- Shattered Resolve
        [374037] = RD:CreatePriority(), -- Overwhelming Rage
        [395859] = RD:CreatePriority(), -- Haunting Scream
        [396093] = RD:CreatePriority(), -- Savage Leap
        [396150] = RD:CreatePriority(), -- Feeling of Superiority
        [396152] = RD:CreatePriority(), -- Feeling of Inferiority
        [397878] = RD:CreatePriority(), -- Tainted Ripple
        [397904] = RD:CreatePriority(), -- Setting Sun Kick
        [397911] = RD:CreatePriority(), -- Touch of Ruin
        [397914] = RD:CreatePriority(), -- Defiling Mist
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
        [229248] = RD:CreatePriority(), -- Fel Beam
        [227592] = RD:CreatePriority(6), -- Frostbite
        [228252] = RD:CreatePriority(), -- Shadow Rend
        [227502] = RD:CreatePriority(), -- Unstable Mana
        [228261] = RD:CreatePriority(6), -- Flame Wreath
        [229241] = RD:CreatePriority(), -- Acquiring Target
        [230083] = RD:CreatePriority(6), -- Nullification
        [230221] = RD:CreatePriority(), -- Absorbed Mana
        [228249] = RD:CreatePriority(5), -- Inferno Bolt 1
        [228958] = RD:CreatePriority(5), -- Inferno Bolt 2
        [229159] = RD:CreatePriority(), -- Chaotic Shadows
        [227465] = RD:CreatePriority(), -- Power Discharge
        [229083] = RD:CreatePriority(), -- Burning Blast (Stacking)
        
        -- Return to Karazhan: Lower
        [227917] = RD:CreatePriority(), -- Poetry Slam
        [228164] = RD:CreatePriority(), -- Hammer Down
        [228215] = RD:CreatePriority(), -- Severe Dusting 1
        [228221] = RD:CreatePriority(), -- Severe Dusting 2
        [29690]  = RD:CreatePriority(), -- Drunken Skull Crack
        [227493] = RD:CreatePriority(), -- Mortal Strike
        [228280] = RD:CreatePriority(), -- Oath of Fealty
        [29574]  = RD:CreatePriority(), -- Rend
        [230297] = RD:CreatePriority(), -- Brittle Bones
        [228526] = RD:CreatePriority(), -- Flirt
        [227851] = RD:CreatePriority(), -- Coat Check 1
        [227832] = RD:CreatePriority(), -- Coat Check 2
        [32752]  = RD:CreatePriority(), -- Summoning Disorientation
        [228559] = RD:CreatePriority(), -- Charming Perfume
        [227508] = RD:CreatePriority(), -- Mass Repentance
        [241774] = RD:CreatePriority(), -- Shield Smash
        [227742] = RD:CreatePriority(), -- Garrote (Stacking)
        [238606] = RD:CreatePriority(), -- Arcane Eruption
        [227848] = RD:CreatePriority(), -- Sacred Ground (Stacking)
        [227404] = RD:CreatePriority(6), -- Intangible Presence
        [228610] = RD:CreatePriority(), -- Burning Brand
        [228576] = RD:CreatePriority(), -- Allured
    },

    ----------------------------------------------------------
    -- Battle for Azeroth
    ----------------------------------------------------------
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
        -- [657] The Vortex Pinnacle
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
        [291928] = RD:CreatePriority(), -- Giga-Zap
        [292267] = RD:CreatePriority(), -- Giga-Zap
        [302274] = RD:CreatePriority(), -- Fulminating Zap
        [298669] = RD:CreatePriority(), -- Taze
        [295445] = RD:CreatePriority(), -- Wreck
        [294929] = RD:CreatePriority(), -- Blazing Chomp
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
        [294195] = RD:CreatePriority(), -- Arcing Zap
        [299572] = RD:CreatePriority(), -- Shrink
        [300659] = RD:CreatePriority(), -- Consuming Slime
        [300650] = RD:CreatePriority(), -- Suffocating Smog
        [301712] = RD:CreatePriority(), -- Pounce
        [299475] = RD:CreatePriority(), -- B.O.R.K
        [293670] = RD:CreatePriority(), -- Chain Blade
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
        [321821] = RD:CreatePriority(), -- Disgusting Guts
        [323365] = RD:CreatePriority(), -- Clinging Darkness
        [338353] = RD:CreatePriority(), -- Goresplatter
        [333485] = RD:CreatePriority(), -- Disease Cloud
        [338357] = RD:CreatePriority(), -- Tenderize
        [328181] = RD:CreatePriority(), -- Frigid Cold
        [320170] = RD:CreatePriority(), -- Necrotic Bolt
        [323464] = RD:CreatePriority(), -- Dark Ichor
        [323198] = RD:CreatePriority(), -- Dark Exile
        [343504] = RD:CreatePriority(), -- Dark Grasp
        [343556] = RD:CreatePriority(), -- Morbid Fixation 1
        [338606] = RD:CreatePriority(), -- Morbid Fixation 2
        [324381] = RD:CreatePriority(), -- Chill Scythe
        [320573] = RD:CreatePriority(), -- Shadow Well
        [333492] = RD:CreatePriority(), -- Necrotic Ichor
        [334748] = RD:CreatePriority(), -- Drain Fluids
        [333489] = RD:CreatePriority(), -- Necrotic Breath
        [320717] = RD:CreatePriority(), -- Blood Hunger
    },
    -- Halls of Atonement
    [2287] = {
        [335338] = RD:CreatePriority(), -- Ritual of Woe
        [326891] = RD:CreatePriority(), -- Anguish
        [329321] = RD:CreatePriority(), -- Jagged Swipe 1
        [344993] = RD:CreatePriority(), -- Jagged Swipe 2
        [319603] = RD:CreatePriority(), -- Curse of Stone
        [319611] = RD:CreatePriority(), -- Turned to Stone
        [325876] = RD:CreatePriority(), -- Curse of Obliteration
        [326632] = RD:CreatePriority(), -- Stony Veins
        [323650] = RD:CreatePriority(), -- Haunting Fixation
        [326874] = RD:CreatePriority(), -- Ankle Bites
        [340446] = RD:CreatePriority(), -- Mark of Envy
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
    },
    -- Tazavesh, the Veiled Market
    [2441] = {
        [350804] = RD:CreatePriority(), -- Collapsing Energy
        [350885] = RD:CreatePriority(), -- Hyperlight Jolt
        [351101] = RD:CreatePriority(), -- Energy Fragmentation
        [346828] = RD:CreatePriority(), -- Sanitizing Field
        [355641] = RD:CreatePriority(), -- Scintillate
        [355451] = RD:CreatePriority(), -- Undertow
        [355581] = RD:CreatePriority(), -- Crackle
        [349999] = RD:CreatePriority(), -- Anima Detonation
        [346961] = RD:CreatePriority(), -- Purging Field
        [351956] = RD:CreatePriority(), -- High-Value Target
        [346297] = RD:CreatePriority(), -- Unstable Explosion
        [347728] = RD:CreatePriority(), -- Flock!
        [356408] = RD:CreatePriority(), -- Ground Stomp
        [347744] = RD:CreatePriority(), -- Quickblade
        [347481] = RD:CreatePriority(), -- Shuri
        [355915] = RD:CreatePriority(), -- Glyph of Restraint
        [350134] = RD:CreatePriority(), -- Infinite Breath
        [350013] = RD:CreatePriority(), -- Gluttonous Feast
        [355465] = RD:CreatePriority(), -- Boulder Throw
        [346116] = RD:CreatePriority(), -- Shearing Swings
        [356011] = RD:CreatePriority(), -- Beam Splicer
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
        [397210] = RD:CreatePriority(false), -- Sonic Vulnerability
        
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
    [0] = {
        -- Gnarlroot
        -- Igira the Cruel
        -- Volcoross
        -- Council of Dreams
        -- Larodar, Keeper of the Flame
        -- Nymue, Weaver of the Cycle
        -- Smolderon
        -- Tildral Sageswift, Seer of the Flame
        -- Fyrakk the Blazing
    },
    ["PvP"] = {
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
        [207685]	= RD:CreatePriority(4), -- Sigil of Misery
        [217832]	= RD:CreatePriority(3), -- Imprison
        [221527]	= RD:CreatePriority(5), -- Imprison (Banished version)
        [204490]	= RD:CreatePriority(2), -- Sigil of Silence
        [179057]	= RD:CreatePriority(3), -- Chaos Nova
        [211881]	= RD:CreatePriority(4), -- Fel Eruption
        [205630]	= RD:CreatePriority(3), -- Illidan's Grasp
        [208618]	= RD:CreatePriority(3), -- Illidan's Grasp (Afterward)
        [213491]	= RD:CreatePriority(4), -- Demonic Trample 1
        [208645]	= RD:CreatePriority(4), -- Demonic Trample 2

        -- DRUID
        [99]		= RD:CreatePriority(4), -- Incapacitating Roar
        [339]		= RD:CreatePriority(1), -- Entangling Roots
        [2637]		= RD:CreatePriority(1), -- Hibernate
        [5211]		= RD:CreatePriority(4), -- Mighty Bash
        [33786]		= RD:CreatePriority(5), -- Cyclone
        [45334]		= RD:CreatePriority(1), -- Immobilized
        [81261]		= RD:CreatePriority(2), -- Solar Beam
        [102359]	= RD:CreatePriority(1), -- Mass Entanglement
        [102793]	= RD:CreatePriority(1), -- Ursol's Vortex
        [163505]	= RD:CreatePriority(4), -- Rake
        [202244]	= RD:CreatePriority(4), -- Overrun
        [203123]	= RD:CreatePriority(4), -- Maim

        -- HUNTER
        [3355]		= RD:CreatePriority(3), -- Freezing Trap
        [19386]		= RD:CreatePriority(3), -- Wyvern Sting
        [24394]		= RD:CreatePriority(4), -- Intimidation
        [202933]	= RD:CreatePriority(2), -- Spider Sting 1
        [233022]	= RD:CreatePriority(2), -- Spider Sting 2
        [213691]	= RD:CreatePriority(4), -- Scatter Shot
        [203337]	= RD:CreatePriority(5), -- Freezing Trap (PvP Talent)
        [209790]	= RD:CreatePriority(3), -- Freezing Arrow
        [117526]	= RD:CreatePriority(4), -- Binding Shot
        [190927]	= RD:CreatePriority(1), -- Harpoon
        [201158]	= RD:CreatePriority(1), -- Super Sticky Tar
        [162480]	= RD:CreatePriority(1), -- Steel Trap
        [212638]	= RD:CreatePriority(1), -- Tracker's Net
        [200108]	= RD:CreatePriority(1), -- Ranger's Net

        -- MAGE
        [61721]		= RD:CreatePriority(3), -- Rabbit
        [61305]		= RD:CreatePriority(3), -- Black Cat
        [28272]		= RD:CreatePriority(3), -- Pig
        [28271]		= RD:CreatePriority(3), -- Turtle
        [126819]	= RD:CreatePriority(3), -- Porcupine
        [161354]	= RD:CreatePriority(3), -- Monkey
        [161353]	= RD:CreatePriority(3), -- Polar Bear
        [61780]		= RD:CreatePriority(3), -- Turkey
        [161355]	= RD:CreatePriority(3), -- Penguin
        [161372]	= RD:CreatePriority(3), -- Peacock
        [277787]	= RD:CreatePriority(3), -- Direhorn
        [277792]	= RD:CreatePriority(3), -- Bumblebee
        [118]		= RD:CreatePriority(3), -- Polymorph
        [82691]		= RD:CreatePriority(3), -- Ring of Frost
        [31661]		= RD:CreatePriority(3), -- Dragon's Breath
        [122]		= RD:CreatePriority(1), -- Frost Nova
        [33395]		= RD:CreatePriority(1), -- Freeze
        [157997]	= RD:CreatePriority(1), -- Ice Nova
        [228600]	= RD:CreatePriority(1), -- Glacial Spike
        [198121]	= RD:CreatePriority(1), -- Frostbite

        -- MONK
        [119381]	= RD:CreatePriority(4), -- Leg Sweep
        [202346]	= RD:CreatePriority(4), -- Double Barrel
        [115078]	= RD:CreatePriority(4), -- Paralysis
        [198909]	= RD:CreatePriority(3), -- Song of Chi-Ji
        [202274]	= RD:CreatePriority(3), -- Incendiary Brew
        [233759]	= RD:CreatePriority(2), -- Grapple Weapon
        [123407]	= RD:CreatePriority(1), -- Spinning Fire Blossom
        [116706]	= RD:CreatePriority(1), -- Disable
        [232055]	= RD:CreatePriority(4), -- Fists of Fury
        
        -- PALADIN
        [853]		= RD:CreatePriority(3), -- Hammer of Justice
        [20066]		= RD:CreatePriority(3), -- Repentance
        [105421]	= RD:CreatePriority(3), -- Blinding Light
        [31935]		= RD:CreatePriority(2), -- Avenger's Shield
        [217824]	= RD:CreatePriority(2), -- Shield of Virtue
        [205290]	= RD:CreatePriority(3), -- Wake of Ashes
        
        -- PRIEST
        [9484]		= RD:CreatePriority(3), -- Shackle Undead
        [200196]	= RD:CreatePriority(4), -- Holy Word: Chastise
        [200200]	= RD:CreatePriority(4), -- Holy Word: Chastise
        -- [226943]	= RD:CreatePriority(3), -- Mind Bomb
        [605]		= RD:CreatePriority(5), -- Mind Control
        [8122]		= RD:CreatePriority(3), -- Psychic Scream
        [15487]		= RD:CreatePriority(2), -- Silence
        [64044]		= RD:CreatePriority(1), -- Psychic Horror
        [453]		= RD:CreatePriority(5), -- Mind Soothe
        
        -- ROGUE
        [2094]		= RD:CreatePriority(4), -- Blind
        [6770]		= RD:CreatePriority(4), -- Sap
        [1776]		= RD:CreatePriority(4), -- Gouge
        [1330]		= RD:CreatePriority(2), -- Garrote - Silence
        [207777]	= RD:CreatePriority(2), -- Dismantle
        [408]		= RD:CreatePriority(4), -- Kidney Shot
        [1833]		= RD:CreatePriority(4), -- Cheap Shot
        [207736]	= RD:CreatePriority(5), -- Shadowy Duel (Smoke effect)
        [212182]	= RD:CreatePriority(5), -- Smoke Bomb
        
        -- SHAMAN
        [51514]		= RD:CreatePriority(3), -- Hex
        [211015]	= RD:CreatePriority(3), -- Hex (Cockroach)
        [211010]	= RD:CreatePriority(3), -- Hex (Snake)
        [211004]	= RD:CreatePriority(3), -- Hex (Spider)
        [210873]	= RD:CreatePriority(3), -- Hex (Compy)
        [196942]	= RD:CreatePriority(3), -- Hex (Voodoo Totem)
        [269352]	= RD:CreatePriority(3), -- Hex (Skeletal Hatchling)
        [277778]	= RD:CreatePriority(3), -- Hex (Zandalari Tendonripper)
        [277784]	= RD:CreatePriority(3), -- Hex (Wicker Mongrel)
        [118905]	= RD:CreatePriority(3), -- Static Charge
        [77505]		= RD:CreatePriority(4), -- Earthquake (Knocking down)
        [118345]	= RD:CreatePriority(4), -- Pulverize (Pet)
        [204399]	= RD:CreatePriority(3), -- Earthfury
        [204437]	= RD:CreatePriority(3), -- Lightning Lasso
        [157375]	= RD:CreatePriority(4), -- Gale Force
        [64695]		= RD:CreatePriority(1), -- Earthgrab
        
        -- WARLOCK
        [710]		= RD:CreatePriority(5), -- Banish
        [6789]		= RD:CreatePriority(3), -- Mortal Coil
        [118699]	= RD:CreatePriority(3), -- Fear
        [6358]		= RD:CreatePriority(3), -- Seduction (Succub)
        [171017]	= RD:CreatePriority(4), -- Meteor Strike (Infernal)
        [22703]		= RD:CreatePriority(4), -- Infernal Awakening (Infernal CD)
        [30283]		= RD:CreatePriority(3), -- Shadowfury
        [89766]		= RD:CreatePriority(4), -- Axe Toss
        [233582]	= RD:CreatePriority(1), -- Entrenched in Flame
        
        -- WARRIOR
        [5246]		= RD:CreatePriority(4), -- Intimidating Shout
        [132169]	= RD:CreatePriority(4), -- Storm Bolt
        [132168]	= RD:CreatePriority(4), -- Shockwave
        [199085]	= RD:CreatePriority(4), -- Warpath
        [105771]	= RD:CreatePriority(1), -- Charge
        [199042]	= RD:CreatePriority(1), -- Thunderstruck
        [236077]	= RD:CreatePriority(2), -- Disarm
        
        -- RACIAL
        [20549]		= RD:CreatePriority(4), -- War Stomp
        [107079]	= RD:CreatePriority(4), -- Quaking Palm
    }
}

local Blacklist = {
    -- Mythic+
    [206151] = true,                    -- Challenger's Burden

    -- Lust
    [57723] = true,                     -- Exhaustion
    [57724] = true,                     -- Sated
    [80354] = true,                     -- Temporal Displacement
    [390435] = true,                    -- Exhaustion
    [264689] = true,                    -- Fatigued

    -- General
    [160029] = true,                    -- Resurrecting
    [371070] = true,                    -- Rotting from Within

    -- Items / Trinkets
    [425417] = true,                    -- Solar Maelstrom
    [426897] = true,                    -- Burnout
    [429204] = true,                    -- Blossom of Amirdrassil
    [433759] = true,                    -- Inexorable Resonator

    -- Death Knight
    [97821] = (class ~= "DEATHKNIGHT"), -- Void-Touched

    -- Druid
    [382912] = true,                    -- Well-Honed Instincts

    -- Shaman
    [225080] = true,                    -- Reincarnation

    -- Warlock
    [387847] = true,                    -- Fel Armor
}

RD.Debuffs = Debuffs
RD.Blacklist = Blacklist
