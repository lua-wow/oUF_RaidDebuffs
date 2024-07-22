local _, ns = ...
local oUF = ns.oUF

local RD = {}

function RD:CreatePriority(arg1, arg2)
    local enable = true
    local priority = 0
    local threshold = 0

    if type(arg1) == "boolean" then
        enable = arg1
    elseif type(arg1) == "number" then
        priority = arg1
    end
    
    if type(arg2) == "number" then
        threshold = arg2
    end

    return {
        enable = enable,
        priority = tonumber(priority) or 0,
        threshold = tonumber(threshold) or 0
    }
end

RD.print = function(...)
    print("|cff4AAB4DoUF_RaidDebuffs:|r", ...)
end

RD.error = function(...)
    print("|cffff0000oUF_RaidDebuffs:|r", ...)
end

ns.oUF_RaidDebuffs = RD
