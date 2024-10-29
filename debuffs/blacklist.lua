local _, ns = ...
local oUF = ns.oUF
local RD = ns.oUF_RaidDebuffs

if not oUF.isRetail then return end

local _, class = UnitClass("player")

local blacklist = {
    -- Events
    [44185] = true,                     -- Jack-o'-Lanterned!

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
    
    [388501] = true,                    -- Riding Along
    [390106] = true,                    -- Riding Along
    [390107] = true,                    -- Riding Along
    [390108] = true,                    -- Riding Along
    [390109] = true,                    -- Riding Along
    [390110] = true,                    -- Riding Along
    [417771] = true,                    -- Riding Along
    [422797] = true,                    -- Riding Along
    [423827] = true,                    -- Riding Along
    [423828] = true,                    -- Riding Along
    [423829] = true,                    -- Riding Along
    [427495] = true,                    -- Riding Along
    [427496] = true,                    -- Riding Along
    [428018] = true,                    -- Riding Along
    [428020] = true,                    -- Riding Along
    [428080] = true,                    -- Riding Along
    [440744] = true,                    -- Riding Along
    [440752] = true,                    -- Riding Along
    [440774] = true,                    -- Riding Along
    [456869] = true,                    -- Riding Along

    

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
