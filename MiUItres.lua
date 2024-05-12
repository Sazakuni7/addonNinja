local CUSTOM_TARGET_TEXT = "NINJA"

print('Mi nickname es ' .. UnitName("player"))



-- Registrar un evento para el clic en un personaje
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_TARGET_CHANGED" then
        local nombre = UnitName("target")
		local isParty = UnitInParty("target")
        if nombre and isParty then
			print(players[2])

        end
    end
end)


-- hooksecurefunc("UnitFrame_Update", function(frame, isParty)
-- 	if frame.name then
-- 		local unit = frame.overrideName or frame.unit
-- 		if UnitPlayerControlled(unit) and UnitIsFriend(unit, "target") and UnitInParty("target") then
-- 			VerListaPlayers(unit)
-- 		end
-- 	end
-- end)
