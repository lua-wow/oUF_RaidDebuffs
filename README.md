# oUF_RaidDebuffs

Raid Debuffs tracker suport for oUF layouts

```lua
-- health oUF
local Health = self.Health

-- create raid debuff
local RaidDebuffs = CreateFrame("Frame", nil, Health)
RaidDebuffs:SetPoint("CENTER", Health, "CENTER", 0, 0)
RaidDebuffs:SetHeight(32)
RaidDebuffs:SetWidth(32)
RaidDebuffs:SetFrameLevel(Health:GetFrameLevel() + 10)

-- raid debuff icon texture
RaidDebuffs.icon = RaidDebuffs:CreateTexture(nil, "ARTWORK")
RaidDebuffs.icon:SetTexCoord(.1, .9, .1, .9)
RaidDebuffs.icon:SetInside(RaidDebuffs)

-- raid debuff cd
RaidDebuffs.cd = CreateFrame("Cooldown", nil, RaidDebuffs, "CooldownFrameTemplate")
RaidDebuffs.cd:SetInside(RaidDebuffs, 1, 0)
RaidDebuffs.cd:SetReverse(true)
RaidDebuffs.cd:SetHideCountdownNumbers(true)
RaidDebuffs.cd:SetAlpha(.7)
RaidDebuffs.cd.noOCC = true
RaidDebuffs.cd.noCooldownCount = true

-- raid debuffs options
RaidDebuffs.onlyMatchSpellID = true
RaidDebuffs.showDispellableDebuff = true
--RaidDebuffs.forceShow = true

-- raid debuff timer
RaidDebuffs.time = RaidDebuffs:CreateFontString(nil, "OVERLAY")
RaidDebuffs.time:SetFont(C.Medias.Font, 12, "OUTLINE")
RaidDebuffs.time:SetPoint("CENTER", RaidDebuffs, 1, 0)

-- raid debuff stacks
RaidDebuffs.count = RaidDebuffs:CreateFontString(nil, "OVERLAY")
RaidDebuffs.count:SetFont(C.Medias.Font, 12, "OUTLINE")
RaidDebuffs.count:SetPoint("BOTTOMRIGHT", RaidDebuffs, "BOTTOMRIGHT", 2, 0)
RaidDebuffs.count:SetTextColor(1, .9, 0)

-- register with oUF
self.RaidDebuffs = RaidDebuffs
```
