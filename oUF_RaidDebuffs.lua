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

local LibDispel = LibStub("LibDispel")
assert(LibDispel, "Filger requires LibDispel")

local RD = ns.oUF_RaidDebuffs

-- Lua
local format, floor = format, floor
local type, pairs, wipe = type, pairs, wipe

-- Blizzard
local GetActiveSpecGroup = _G.GetActiveSpecGroup
local GetSpecialization = _G.GetSpecialization
local GetSpellName = C_Spell and C_Spell.GetSpellName or _G.GetSpellInfo
local GetTime = _G.GetTime
local IsSpellKnown = _G.IsSpellKnown
local UnitAura = _G.UnitAura
local UnitCanAssist = _G.UnitCanAssist
local UnitCanAttack = _G.UnitCanAttack
local UnitIsCharmed = _G.UnitIsCharmed
local UnitIsOwnerOrControllerOfUnit = _G.UnitIsOwnerOrControllerOfUnit
local UnitIsUnit = _G.UnitIsUnit
local UnitClass = _G.UnitClass

-- Mine
local debuffs = {}
local blacklist = RD.blacklist or {}

local _, class = UnitClass("player")

--------------------------------------------------
-- Loader
--------------------------------------------------
local loader = CreateFrame("Frame")
loader:RegisterEvent("PLAYER_ENTERING_WORLD")
loader:SetScript("OnEvent", function (self, event, ...)
	if self[event] then
		self[event](self, event, ...)
	end
end)

function loader:PLAYER_ENTERING_WORLD(isLogin, isReload)
	self:Update()
end

function loader:Update()
	debuffs = table.wipe(debuffs or {})

	local isInInstance, instanceType = IsInInstance()
	local instanceName, _, difficultyID, difficultyName, _, _, _, instanceID, _, _ = GetInstanceInfo()
	local isDelve = C_DelvesUI and C_DelvesUI.HasActiveDelve(instanceID) or false
	
	if (isInInstance and (instanceType == "raid" or instanceType == "party" or isDelve)) then
		-- local difficultyName, groupType, isHeroic, isChallengeMode, displayHeroic, displayMythic, _ = GetDifficultyInfo(difficultyID)
		-- local isMythicKey = isHeroic and isChallengeMode
		RD:ValidateDebuffs(instanceID)

		-- insert instance specific debuffs
		debuffs = self:merge(debuffs, RD.debuffs[instanceID] or {})
	
		if oUF.isRetail then
			-- insert affixes debuffs
			debuffs = self:merge(debuffs, RD.debuffs["Affixes"] or {})
		end
	else
		-- insert general debuffs, like world bosses
		RD:ValidateDebuffs("General")
		debuffs = self:merge(debuffs, RD.debuffs["General"] or {})
		
		-- insert classes debuffs
		RD:ValidateDebuffs("PvP")
		debuffs = self:merge(debuffs, RD.debuffs["PvP"] or {})
	end

	if oUF.isRetail then
		-- insert delves auras, because delves do not trigger PLAYER_ENTERING_WORLD
		debuffs = self:merge(debuffs, RD.debuffs["Delves"] or {})
	end
end

function loader:merge(dest, source)
	if not source or not dest then return end
	for k, v in next, source do
		dest[k] = v
	end
	return dest
end

--------------------------------------------------
-- Dispel
--------------------------------------------------
local dispelPriority = {
	["Magic"] = 4,
	["Curse"] = 3,
	["Disease"]	= 2,
	["Poison"] = 1,
	["none"] = 0
}

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
		element.duration = data.duration or 0
		element.expirationTime = data.expirationTime

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
			element.Count:SetText((data.applications and data.applications > 1) and data.applications or '')
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
	if not data.enabled then return false end
	
	-- ignore debuffs applied by the unit itself
	if data.sourceUnit and UnitIsUnit(unit, data.sourceUnit) then return false end
	
	-- store if the unit its charmed, mind controlled units (Imperial Vizier Zor'lok: Convert)
	local isCharmed = UnitIsCharmed(unit)

	-- store if we cand attack that unit, if its so the unit its hostile (Amber-Shaper Un'sok: Reshape Life)
	local canAttack = UnitCanAttack("player", unit)

	-- we can not dispel if unit its charmed or is not friendly
	if (isCharmed or canAttack) then return false end

	-- always display auras applied by the boss
	if (data.isBossAura) then return true end
	
	-- show aura only when stacks are high enough
	if (data.applications < data.stackThreshold) then return false end

	-- ignore spell not dispelable by the player
	if (element.showOnlyDispelableDebuffs and data.dispelName) then
		return data.isDispelable
	end

	-- ignore auras applied by itself
	if (data.sourceUnit == unit and not data.dispelName) then
		return false
	end

	return true
end

local function SortAuras(a, b)
	-- dispelable debuffs needs to be on top of the list
    if a.isDispelable ~= b.isDispelable then
        return a.isDispelable
    end

	-- if both auras are dispelable or both are not, compare their priorities
    if a.priority ~= b.priority then
        return a.priority > b.priority
    end

	return a.auraInstanceID < b.auraInstanceID
end

local function ProcessData(element, unit, data)
	if (not data) then return end

	-- whether or not this aura was applied by you or by your pet
	data.isPlayerAura = data.sourceUnit and (UnitIsUnit("player", data.sourceUnit) or UnitIsOwnerOrControllerOfUnit("player", data.sourceUnit))

	-- whether or not this aura is dispelable by the player class/spec
	data.isDispelable = LibDispel:IsDispelable(unit, data.spellId, data.dispelName, data.isHarmful)
	
	local debuff = debuffs[data.spellId]
	if debuff then
		data.enabled = debuff.enabled or false
		data.priority = debuff.priority or 0
		data.stackThreshold = debuff.stackThreshold or 0
	else
		data.enabled = true
		data.priority = 0
		data.stackThreshold = 0
	end

	if blacklist[data.spellId] or blacklist[data.name] then
		data.enabled = false
	end

	-- increment priority based on dispel type
	data.priority = data.priority + (dispelPriority[data.dispelName or "none"] or 0)

	--[[ Callback: RaidDebuffs:PostProcessAuraData(unit, data)
	Called after the aura data has been processed.

	* self - the RaidDebuffs element
	* unit - the unit for which the update has been triggered (string)
	* data - [AuraData](https://warcraft.wiki.gg/wiki/Struct_AuraData) object (table)

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

		self:RegisterEvent("UNIT_AURA", UpdateAuras)

		return true
	end
end

local function Disable(self)
	local element = self.RaidDebuffs
	if (element) then
		
		self:UnregisterEvent("UNIT_AURA", UpdateAuras)

		element:Hide()
	end
end

oUF:AddElement("RaidDebuffs", Path, Enable, Disable)
