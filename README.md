# oUF_RaidDebuffs

Display aura icon on raid frame unit if the aura is dispelable by the player.

## Requiments

-   [LibDispel](https://github.com/lua-wow/LibDispel)

## Element: RaidDebuffs

Handles the visibility and updating of an icon based on raid units debuffs.

### Widgets

RaidDebuffs		- A `Frame` to hold a `Button`s representing debuffs.

### Sub-Widgets

Icon			- A `Texture` to represent spell icon.
Cooldown		- A `Cooldown` to represent spell duration. 
Time			- A `FontString` to represent spell duration.
Count			- A `FontString` to represent spell duration.

### Example

```lua
-- Position and size
local RaidDebuffs = CreateFrame("Frame", nil, Health)
RaidDebuffs:SetPoint("CENTER", Health, "CENTER", 0, 0)
RaidDebuffs:SetHeight(32)
RaidDebuffs:SetWidth(32)
RaidDebuffs:SetFrameLevel(Health:GetFrameLevel() + 10)

-- Options
RaidDebuffs.showOnlyDispelableDebuffs = true

-- Add an icon texture
local Icon = RaidDebuffs:CreateTexture(nil, "ARTWORK")
Icon:SetAllPoints()

-- Add a cooldown
local Cooldown = CreateFrame("Cooldown", nil, RaidDebuffs, "CooldownFrameTemplate")
Cooldown:()
Cooldown:SetReverse(true)
Cooldown:SetHideCountdownNumbers(true)

-- Add a timer
local Time = RaidDebuffs:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
Time:SetPoint("CENTER", RaidDebuffs, 1, 0)

-- Add a stack count
local Count = RaidDebuffs:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
Count:SetPoint("BOTTOMRIGHT", RaidDebuffs, "BOTTOMRIGHT", 2, 0)

-- register with oUF
RaidDebuffs.Icon = Icon
RaidDebuffs.Cooldown = Cooldown
RaidDebuffs.Time = Time
RaidDebuffs.Count = Count
self.RaidDebuffs = RaidDebuffs
```
