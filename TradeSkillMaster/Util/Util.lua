-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--          http://www.curse.com/addons/wow/tradeskillmaster_warehousing          --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- This file contains various utility APIs

local TSM = select(2, ...)
local private = {}
TSMAPI:RegisterForTracing(private, "TradeSkillMaster.Util_private")


-- Locals to speed up function access.
local CopyTable = CopyTable
local error = error
local floor = floor
local format = format
local GetRealmName = GetRealmName
local gsub = gsub
local ipairs = ipairs
local select = select
local StaticPopup_Show = StaticPopup_Show
local strfind = strfind
local strlower = strlower
local strsub = strsub
local tinsert = tinsert
local tremove = tremove
local type = type
local UnitName = UnitName


--- Shows a popup dialog with the given name and ensures it's visible over the TSM frame by setting the frame strata to TOOLTIP.
-- @param name The name of the static popup dialog to be shown.
function TSMAPI:ShowStaticPopupDialog(name)
	StaticPopupDialogs[name].preferredIndex = 3
	StaticPopup_Show(name)
	for i=1, 100 do
		if _G["StaticPopup" .. i] and _G["StaticPopup" .. i].which == name then
			_G["StaticPopup" .. i]:SetFrameStrata("TOOLTIP")
			break
		end
	end
end

function TSMAPI:GetCharacters()
	return CopyTable(TSM.db.realm.characters)
end


local orig = ChatFrame_OnEvent
function ChatFrame_OnEvent(self, event, ...)
	local msg = select(1, ...)
	if (event == "CHAT_MSG_SYSTEM") then
		if (msg == ERR_AUCTION_STARTED) then -- absorb the Auction Created message
			return
		end
		if (msg == ERR_AUCTION_REMOVED) then -- absorb the Auction Cancelled message
			return
		end
	end
	return orig(self, event, ...)
end


-- A more versitile replacement for lua's select() function
-- If a list of indices is passed as the first parameter, only
-- those values will be returned, otherwise, the default select()
-- behavior will be followed.
function private:SelectHelper(positions, ...)
	if #positions == 0 then return end
	return select(tremove(positions), ...), private:SelectHelper(positions, ...)
end
function TSMAPI:Select(positions, ...)
	if type(positions) == "number" then
		return select(positions, ...)
	elseif type(positions) == "table" then
		-- reverse the list and make a copy of it
		local newPositions = {}
		for i=#positions, 1, -1 do
			tinsert(newPositions, positions[i])
		end
		return private:SelectHelper(newPositions, ...)
	else
		error(format("Bad argument #1. Expected number or table, got %s", type(positions)))
	end
end

-- custom string splitting function that doesn't stack overflow
function TSMAPI:SafeStrSplit(str, sep)
	local parts = {}
	local s = 1
	while true do
		local e = strfind(str, sep, s)
		if not e then
			tinsert(parts, strsub(str, s))
			break
		end
		tinsert(parts, strsub(str, s, e-1))
		s = e + 1
	end
	return parts
end

local MAGIC_CHARACTERS = {'[', ']', '(', ')', '.', '+', '-', '*', '?', '^', '$'}
function TSMAPI:StrEscape(str)
	str = gsub(str, "%%", "\001")
	for _, char in ipairs(MAGIC_CHARACTERS) do
		str = gsub(str, "%"..char, "%%"..char)
	end
	str = gsub(str, "\001", "%%%%")
	return str
end

function TSMAPI:IsPlayer(target)
	return strlower(target) == strlower(UnitName("player")) or (strfind(target, "-") and strlower(target) == strlower(UnitName("player").."-"..GetRealmName()))
end

--- Converts seconds into hours, minutes and seconds.
-- @param seconds Number of seconds. Can be a float (will automatically be rounded down to whole seconds).
-- NOTE: The return values of this function can be wrapped directly by a call to "TSMAPI:FormatHMS()".
function TSMAPI:SecondsToHMS(seconds)
	-- NOTE: This code can be shorter, but was written this way for efficiency.
	local hours = floor(seconds / 3600)
	seconds = seconds - (hours * 3600)
	local minutes = floor(seconds / 60)
	seconds = floor(seconds - (minutes * 60))

	return hours, minutes, seconds
end

--- Converts hours, minutes and seconds into a human-readable string.
-- @param hours Hours. Must be a whole number without decimals.
-- @param minutes Minutes. Must be a whole number without decimals.
-- @param seconds Seconds. Must be a whole number without decimals.
function TSMAPI:FormatHMS(hours, minutes, seconds)
	return format("%d:%02d:%02d", hours, minutes, seconds)
end