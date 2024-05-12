local CUSTOM_TARGET_TEXT = "NINJA"
print('Mi nickname es ' .. UnitName("player"))
local function SetCustomName(unit, fontString)
	local text
	if UnitInParty("target") then
		print('has clickeado a ' .. UnitName("target"))
		local playerEnParty = UnitName("target")
		local i = 1
		local players = load("Ninjas.Lua")
		for i, players in ipairs(players) do
				print("Elemento " .. i .. ": " .. players)
			end 
		    --print(players.players[1])
			--while a[i]
			--if playerEnParty == 
			--text = CUSTOM_TARGET_TEXT
			--print("Este player es Ninja!", unit, text)
	end
	fontString:SetText(text)
end
--hooksecurefunc("UnitFrame_Update", function(frame, isParty)
	--if frame.name then
		--local unit = frame.overrideName or frame.unit
		--print("UnitFrame_Update", unit, UnitPlayerControlled(unit), UnitIsFriend(unit, "target"))
		--if UnitPlayerControlled(unit) and UnitIsFriend(unit, "target") and UnitInParty("target") then
			--SetCustomName(unit, frame.name)
		--end
	--end
--end)
