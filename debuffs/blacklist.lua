local _, ns = ...
local oUF = ns.oUF
local RD = ns.oUF_RaidDebuffs

if not oUF.isRetail then return end

local _, class = UnitClass("player")

local blacklist = {
    -- Mythic+
    [206151] = (oUF.isRetail == true),  -- Challenger's Burden

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
    -- [425417] = true,                    -- Solar Maelstrom
    -- [426897] = true,                    -- Burnout
    -- [429204] = true,                    -- Blossom of Amirdrassil
    -- [433759] = true,                    -- Inexorable Resonator

    -- Death Knight
    [97821] = (class ~= "DEATHKNIGHT"), -- Void-Touched

    -- Druid
    [382912] = true,                    -- Well-Honed Instincts

    -- Shaman
    [225080] = true,                    -- Reincarnation

    -- Warlock
    [387847] = true,                    -- Fel Armor
}

RD.blacklist = blacklist
