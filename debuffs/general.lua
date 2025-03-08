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
local debuffs = RD.debuffs

local general = {}
local affixes = {}
local delves = {}

if oUF.isRetail then
    general = {
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

        ----------------------------------------------------------
        -- The War Within: Khaz Algar
        ----------------------------------------------------------
        -- World Bosses
            -- Kordac, the Dormant Protector
            [458695] = RD:CreatePriority(1), -- Overcharged Lasers
            [458799] = RD:CreatePriority(), -- Overcharged Earth
            [458844] = RD:CreatePriority(2), -- Supression Burst (Magic)
            [458838] = RD:CreatePriority(), -- Supression Burst
            [459281] = RD:CreatePriority(0, 3), -- Empowering Coalescence

            -- Aggregation of Horrors

            -- Shurrai, Atrocity of the Undersea

            -- Orta, the Broken Mountain
            [450454] = RD:CreatePriority(false), -- Tectonic Roar
            [450863] = RD:CreatePriority(8), -- Rupturing Runes (Magic / Stun)
    }

    affixes = {
        ----------------------------------------------------------
        -- Mythic+ Affixes
        ----------------------------------------------------------
        [206151] = RD:CreatePriority(false), -- Challenger's Burden

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

        -- The War Within: Season 1
        [440313] = RD:CreatePriority(3), -- Void Rift
        [461910] = RD:CreatePriority(false), -- Cosmic Ascension
        [462661] = RD:CreatePriority(false), -- Blessing from Beyond (Xal'atath Bargain: Voidbound)
        [463767] = RD:CreatePriority(false), -- Void Essence
        [465136] = RD:CreatePriority(false), -- Lingering Void
    }

    delves = {
        -- The War Within: Delves
        [433622] = RD:CreatePriority(false), -- Emergency Supplies
    }
end

RD.debuffs["General"] = Mixin(RD.debuffs["General"], general)
RD.debuffs["Affixes"] = Mixin(RD.debuffs["Affixes"], affixes)
RD.debuffs["Delves"] = Mixin(RD.debuffs["Delves"], delves)
