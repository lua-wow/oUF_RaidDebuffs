local _, ns = ...
local oUF = ns.oUF

local RD = {}

function RD:CreatePriority(arg1, arg2)
    local enabled = true
    local priority = 0
    local stackThreshold = 0

    if type(arg1) == "boolean" then
        enabled = arg1
    elseif type(arg1) == "number" then
        priority = arg1
    end
    
    if type(arg2) == "number" then
        stackThreshold = arg2
    end

    return {
        enabled = enabled,
        priority = tonumber(priority) or 0,
        stackThreshold = tonumber(stackThreshold) or 0
    }
end

function RD:print(...)
    print("|cff4AAB4DoUF_RaidDebuffs:|r", ...)
end

function RD:error(...)
    print("|cffff0000oUF_RaidDebuffs:|r", ...)
end

ns.oUF_RaidDebuffs = RD
