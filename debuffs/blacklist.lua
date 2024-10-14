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

    -- Others
    [306600] = true,                    -- Experience Eliminated
    
    -- Riding Along
    [388501] = true,
    [390106] = true,
    [390107] = true,
    [390108] = true,
    [390109] = true,
    [390110] = true,
    [417771] = true,
    [422797] = true,
    [423827] = true,
    [423828] = true,
    [423829] = true,
    [427495] = true,
    [427496] = true,
    [428018] = true,
    [428020] = true,
    [428080] = true,
    [440744] = true,
    [440752] = true,
    [440774] = true,
    [456869] = true,

    --------------------------------------------------
    -- Classes
    --------------------------------------------------
    -- DEATH KNIGHT
    [97821] = (class ~= "DEATHKNIGHT"), -- Void-Touched

    -- DRUID
    [382912] = true,                    -- Well-Honed Instincts

    -- PALADIN
    [157131] = true,                    -- Recently Saved by the Light

    -- SHAMAN
    [225080] = true,                    -- Reincarnation

    -- WARLOCK
    [387847] = true,                    -- Fel Armor
}

RD.blacklist = blacklist
