--[[
	# Element: RaidDebuffs

	Handles the visibility and updating of an icon based on raid units debuffs.

	## Widgets
	
	RaidDebuffs		- A `Frame` to hold a `Button`s representing debuffs.
	
	## Sub-Widgets

	Icon			- A `Texture` to represent spell icon.
	Cooldown		- A `Cooldown` to represent spell duration. 
	Time			- A `FontString` to represent spell duration.
	Count			- A `FontString` to represent spell duration.
	
	## Example

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
--]]

local _, ns = ...
local oUF = ns.oUF or oUF
assert(oUF, "oUF RaidDebuffs was unable to locate oUF install.")

local RD = ns.oUF_RaidDebuffs
local Debuffs = {}
local Blacklist = RD.Blacklist or {}

-- Constants
local class = select(2, UnitClass("player"))

-- Lua
local format, floor = format, floor
local type, pairs, wipe = type, pairs, wipe

-- Blizzard
local GetActiveSpecGroup = _G.GetActiveSpecGroup
local GetSpecialization = _G.GetSpecialization
local GetSpellInfo = _G.GetSpellInfo
local IsSpellKnown = _G.IsSpellKnown
local GetTime = _G.GetTime
local UnitAura = _G.UnitAura
local UnitCanAttack = _G.UnitCanAttack
local UnitIsCharmed = _G.UnitIsCharmed

--------------------------------------------------
-- Loader
--------------------------------------------------
local function CopyTable(src, dest)
	if (type(dest) ~= "table") then
		dest = {}
	end
	for k, v in next, src do
		dest[k] = v
	end
	return dest
end

local loader = CreateFrame("Frame")
loader:SetScript("OnEvent", function (self, event, ...)
	self[event](self, ...)
end)

function loader:PLAYER_ENTERING_WORLD(...)
	Debuffs = table.wipe(Debuffs or {})
	local isInInstance, instanceType = IsInInstance()
	local flag = (instanceType == "raid" or instanceType == "party") and "PvE" or "PvP"
	CopyTable(RD.Debuffs[flag] or {}, Debuffs)
end

--------------------------------------------------
-- Dispel
--------------------------------------------------
local DispelPriority = {
	["Magic"] = 4,
	["Curse"] = 3,
	["Disease"]	= 2,
	["Poison"] = 1,
	["none"] = 0
}

local DispelFilterClasses = {
	["DRUID"] = {
		["Magic"] = false,
		["Curse"] = true,
		["Poison"] = true,
		["Disease"] = false
	},
	["EVOKER"] = {
		["Magic"] = true,
		["Curse"] = true,
		["Poison"] = true,
		["Disease"] = true
	},
	["MAGE"] = {
		["Curse"] = true
	},
	["MONK"] = {
		["Magic"] = false,
		["Poison"] = true,
		["Disease"] = true
	},
	["PALADIN"] = {
		["Magic"] = true,
		["Poison"] = true,
		["Disease"] = true
	},
	["PRIEST"] = {
		["Magic"] = true,
		["Disease"] = true
	},
	["SHAMAN"] = {
		["Magic"] = false,
		["Curse"] = (oUF.isRetail and true) or (oUF.isClassic and true) or false,
		["Poison"] = true,
		["Disease"] = true
	}
}

local DispelFilter = DispelFilterClasses[class] or {}

--------------------------------------------------
-- Talents
--------------------------------------------------
local function CheckTalentTree(tree)
	local activeSpecGroup = GetActiveSpecGroup(false)
	local currentSpec = GetSpecialization(false, false, activeSpecGroup)
	return (currentSpec == tree)
end

local function CheckSpecialization()
	if (class == "DRUID") then
		local isRestoration = CheckTalentTree(4)
		DispelFilter.Magic = isRestoration
	elseif (class == "EVOKER") then
		local isPreservation = CheckTalentTree(2)
		DispelFilter.Magic = isPreservation
		DispelFilter.Curse = isPreservation
		DispelFilter.Poison = isPreservation
		DispelFilter.Disease = isPreservation
	elseif (class == "MONK") then
		local isMistweaver = CheckTalentTree(2)
		DispelFilter.Magic = isMistweaver
	elseif (class == "PALADIN") then
		local isHoly = CheckTalentTree(1)
		DispelFilter.Magic = isHoly
	elseif (class == "PRIEST") then
		-- do nothing
	elseif (class == "SHAMAN") then
		local isRestoration = CheckTalentTree(3)
		DispelFilter.Magic = isRestoration
	end
end

local function UpdateDispelFilter(self, event, ...)
	if (event == "CHARACTER_POINTS_CHANGED") then
		local levels = ...
		-- Not interested in gained points from leveling
		if (levels > 0) then return end
	elseif (event == "UNIT_SPELLCAST_SUCCEEDED") then
		local unit, _, spellID = ...
		-- watch if player change spec
		if (unit ~= "player") then return end
		-- 200749 = 'Activating Specialization'
		-- 384255 = 'Changing Talents'
		if (spellID ~= 200749 and spellID ~= 384255) then return end
	end

	CheckSpecialization()
end

--------------------------------------------------
-- Raid Debuffs
--------------------------------------------------
local function FormatTime(s)
	if (s == Infinity) then return end

	local day, hour, minute = 86400, 3600, 60

	if (s >= day) then
		return format("%dd", ceil(s / day))
	elseif (s >= hour) then
		return format("%dh", ceil(s / hour))
	elseif (s >= minute) then
		return format("%dm", ceil(s / minute))
	elseif (s >= minute / 12) then
		return ceil(s)
	end
	return format("%.1f", s)
end

local function OnUpdate(self, elapsed)
	self.elapsed = (self.elapsed or 0) + elapsed
	if (self.elapsed >= 0.1) then
		local remaining = (self.expirationTime or 0) - GetTime()
		if (remaining > 0) then
			self.Time:SetText(FormatTime(remaining))
		else
			self:SetScript("OnUpdate", nil)
			self.Time:Hide()
		end
		self.elapsed = 0
	end
end

local function Update(element, unit, data)
	if (data) then
		local color = oUF.colors.debuff[data.dispelName or "none"]
		if (element.Backdrop) then
			if (color) then
				element.Backdrop:SetBackdropBorderColor(color.r, color.g, color.b)
			else
				element.Backdrop:SetBackdropBorderColor(0, 0, 0)
			end
		end

		if (element.Icon) then
			element.Icon:SetTexture(data.icon)
		end

		if (element.Count) then
			element.Count:SetText((data.applications > 1) and data.applications or '')
		end

		if (element.Cooldown) then
			if (data.duration > 0) then
				element.Cooldown:SetCooldown(data.expirationTime - data.duration, data.duration, data.timeMod)
				element.Cooldown:Show()
			else
				element.Cooldown:Hide()
			end
		end

		if (element.Time) then
			if (data.duration > 0) then
				element.expirationTime = data.expirationTime
				element.Time:Show()
				element:SetScript("OnUpdate", element.OnUpdate or OnUpdate)
			else
				element:SetScript("OnUpdate", nil)
				element.Time:Hide()
			end
		end

		element:Show()
	else
		element:Hide()
	end

	--[[ Callback: RaidDebuffs:PostUpdate(unit, button, data, position)
	Called after the element has been updated.

	* self - the RaidDebuffs element
	* unit - the unit for which the update has been triggered (string)
	* data - the [UnitAuraInfo](https://wowpedia.fandom.com/wiki/Struct_UnitAuraInfo) object (table)
	--]]
	if (element.PostUpdate) then
		element:PostUpdate(unit, data)
	end
end

local function FilterAura(element, unit, data)
	if (Blacklist[data.spellId]) then return false end
	
	-- store if the unit its charmed, mind controlled units (Imperial Vizier Zor'lok: Convert)
	local isCharmed = UnitIsCharmed(unit)
	
	-- store if we cand attack that unit, if its so the unit its hostile (Amber-Shaper Un'sok: Reshape Life)
	local canAttack = UnitCanAttack("player", unit)
	
	-- we can not dispel if unit its charmed or is not friendly
	if (isCharmed or canAttack) then return false end

	-- show aura only when stacks are high enough
	if (data.applications < data.stackThreshold) then return false end

	if (element.showOnlyDispelableDebuffs) then
		return data.isDispelable
	end
	return true
end

local function SortAuras(a, b)
	-- check if one aura is dispelable and the other is not
    if a.isDispelable ~= b.isDispelable then
        return a.isDispelable
    end

	if a.dispelName ~= b.dispelName then
		return a.dispelPriority > b.dispelPriority
	end

	-- if both auras are dispelable or both are not, compare their priorities
    if a.priority ~= b.priority then
        return a.priority > b.priority
    end

	return a.auraInstanceID < b.auraInstanceID
end

local function ProcessData(element, unit, data)
	if (not data) then return end

	local debuff = RD.Debuffs[data.spellId]
	data.enable = debuff and debuff.enable or false
	data.priority = debuff and debuff.priority or 0
	data.stackThreshold = debuff and debuff.stackThreshold or 0
	data.isDispelable = DispelFilter[data.dispelName]
	data.dispelPriority = DispelPriority[data.dispelName] or 0

	--[[ Callback: RaidDebuffs:PostProcessAuraData(unit, data)
	Called after the aura data has been processed.

	* self - the RaidDebuffs element
	* unit - the unit for which the update has been triggered (string)
	* data - [UnitAuraInfo](https://wowpedia.fandom.com/wiki/Struct_UnitAuraInfo) object (table)

	## Returns

	* data - the processed aura data (table)
	--]]
	if (element.PostProcessAuraData) then
		data = element:PostProcessAuraData(unit, data)
	end

	return data
end

local function UpdateAuras(self, event, unit, updateInfo)
	if (self.unit ~= unit) then return end

	local element = self.RaidDebuffs
	if (not element) then return end

	local changed = false
	local filter = element.filter or "HARMFUL"

	local isFullUpdate = (not updateInfo) or updateInfo.isFullUpdate
	if (isFullUpdate) then
		element.all = table.wipe(element.all or {})
		element.active = table.wipe(element.active or {})
		changed = true

		local slots = { C_UnitAuras.GetAuraSlots(unit, filter) }
		for i = 2, #slots do
			local data = ProcessData(element, unit, C_UnitAuras.GetAuraDataBySlot(unit, slots[i]))
			element.all[data.auraInstanceID] = data

			if ((element.FilterAura or FilterAura) (element, unit, data)) then
				element.active[data.auraInstanceID] = true
			end
		end
	else
		if (updateInfo.addedAuras) then
			for _, data in next, updateInfo.addedAuras do
				if (data.isHarmful and not C_UnitAuras.IsAuraFilteredOutByInstanceID(unit, data.auraInstanceID, filter)) then
					element.all[data.auraInstanceID] = ProcessData(element, unit, data)

					if ((element.FilterAura or FilterAura) (element, unit, data)) then
						element.active[data.auraInstanceID] = true
						changed = true
					end
				end
			end
		end

		if (updateInfo.updatedAuraInstanceIDs) then
			for _, auraInstanceID in next, updateInfo.updatedAuraInstanceIDs do
				if (element.all[auraInstanceID]) then
					element.all[auraInstanceID] = ProcessData(element, unit, C_UnitAuras.GetAuraDataByAuraInstanceID(unit, auraInstanceID))

					if (element.active[auraInstanceID]) then
						element.active[auraInstanceID] = true
						changed = true
					end
				end
			end
		end

		if (updateInfo.removedAuraInstanceIDs) then
			for _, auraInstanceID in next, updateInfo.removedAuraInstanceIDs do
				if (element.all[auraInstanceID]) then
					element.all[auraInstanceID] = nil

					if (element.active[auraInstanceID]) then
						element.active[auraInstanceID] = nil
						changed = true
					end
				end
			end
		end
	end

	if (changed) then
		element.sorted = table.wipe(element.sorted or {})

		for auraInstanceID in next, element.active do
			table.insert(element.sorted, element.all[auraInstanceID])
		end

		table.sort(element.sorted, element.SortDebuffs or element.SortAuras or SortAuras)

		Update(element, unit, element.sorted[1])

		if (element.PostUpdate) then element:PostUpdate(unit) end
	end
end

local function Path(self, event, unit, info)
	if (self.unit ~= unit) then return end

	UpdateAuras(self, event, unit, info)

	-- Assume no event means someone wants to re-anchor things. This is usually
	-- done by UpdateAllElements and :ForceUpdate.
	if (not event or event == "ForceUpdate") then
		local element = self.RaidDebuffs
		if (element) then
			(element.SetPosition or SetPosition)(element, 1, element.createdButtons)
		end
	end
end

local function ForceUpdate(element)
	return Path(element.__owner, "ForceUpdate", element.__owner.unit)
end



local function Enable(self)
	local element = self.RaidDebuffs
	if (element) then
		element.__owner = self
		element.ForceUpdate = ForceUpdate

		if (loader and not loader:IsEventRegistered("PLAYER_ENTERING_WORLD")) then
			loader:RegisterEvent("PLAYER_ENTERING_WORLD", UpdateDebuffsTable)
		end

		if (oUF.isRetail) then
			self:RegisterEvent("PLAYER_TALENT_UPDATE", UpdateDispelFilter, true)
			self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED", UpdateDispelFilter, true)
		end

		if (oUF.isClassic) then
			self:RegisterEvent("CHARACTER_POINTS_CHANGED", UpdateDispelFilter, true)
		end

		CheckSpecialization(element)

		self:RegisterEvent("UNIT_AURA", UpdateAuras)

		return true
	end
end

local function Disable(self)
	local element = self.RaidDebuffs
	if (element) then
		
		if (loader and loader:IsEventRegistered("PLAYER_ENTERING_WORLD")) then
			loader:UnregisterEvent("PLAYER_ENTERING_WORLD")
		end

		if (oUF.isRetail) then
			self:UnregisterEvent("PLAYER_TALENT_UPDATE", UpdateDispelFilter)
			self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED", UpdateDispelFilter)
		end

		if (oUF.isClassic) then
			self:UnregisterEvent("CHARACTER_POINTS_CHANGED", UpdateDispelFilter)
		end

		self:UnregisterEvent("UNIT_AURA", UpdateAuras)

		element:Hide()
	end
end

oUF:AddElement("RaidDebuffs", Path, Enable, Disable)
