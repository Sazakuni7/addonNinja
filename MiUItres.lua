local CUSTOM_TARGET_TEXT = "NINJA"

print('Mi nickname es ' .. UnitName("player"))



-- Registrar un evento para el clic en un personaje
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_TARGET_CHANGED" then
        local nombre = UnitName("target")
		local isParty = UnitInParty("target")
		local isNinja = false
        if nombre and isParty then
			--print(players[2])
			for i, player in ipairs(players) do
				if player == string.lower(nombre) then
					isNinja = true
				end
			end

			local msgFrame = CreateFrame("FRAME", nil, UIParent)
			msgFrame:SetWidth(1)
			msgFrame:SetHeight(1)
			msgFrame:SetPoint("CENTER")
			msgFrame:SetFrameStrata("TOOLTIP")
			msgFrame.text = msgFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
			msgFrame.text:SetPoint("CENTER")
			

			if isNinja then
				print("ALERTA DE NINJA")
				msgFrame.text:SetText("ALERTA DE NINJA")
			else
				print("TODO PIOLA")
				msgFrame.text:SetText("TODO PIOLA")
			end
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
