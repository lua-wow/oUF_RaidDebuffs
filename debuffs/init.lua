local _, ns = ...
local oUF = ns.oUF

local RD = {}

function RD:CreatePriority(priority, stackThreshold)
    return {
        enable = true,
        priority = tonumber(priority) or 0,
        stackThreshold = tonumber(stackThreshold) or 0
    }
end

ns.oUF_RaidDebuffs = RD
