local CUSTOM_TARGET_TEXT = "NINJA"

local function SetCustomName(unit, fontString)
    local text
	if UnitIsUnit(unit, "target") then
	    text = CUSTOM_TARGET_TEXT
	elseif UnitIsPlayer(unit) then
		text = strupper(UnitClass(unit) or UNKNOWN)
	end
	print("SetCustomName", unit, text)
	fontString:SetText(text)
end

hooksecurefunc("UnitFrame_Update", function(frame, isParty)
	if frame.name then
		local unit = frame.overrideName or frame.unit
		print("UnitFrame_Update", unit, UnitPlayerControlled(unit), UnitIsFriend(unit, "target"))
		if UnitPlayerControlled(unit) and UnitIsFriend(unit, "target") then
			SetCustomName(unit, frame.name)
		end
	end
end)

hooksecurefunc("UnitFrame_OnEvent", function(frame, event, unit)
	if frame.name and event == "UNIT_NAME_UPDATE" and unit == frame.unit then
	print("UnitFrame_OnEvent", unit, UnitPlayerControlled(unit), UnitIsFriend(unit, "target"))
		if UnitPlayerControlled(unit) and UnitIsFriend(unit, "target") then
			SetCustomName(unit, frame.name)
		end
	end
end)