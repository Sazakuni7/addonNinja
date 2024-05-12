local CUSTOM_TARGET_TEXT = "NINJA"

print('Mi nickname es ' .. UnitName("player"))


local function VerListaPlayers(unit)
	print('has clickeado a ' .. UnitName("target"))
	local playerEnParty = UnitName("target")

	local ninjasFile = loadfile("Ninjas.lua")

	if ninjasFile then
		ninjasFile()
	else
		print("No se puede cargar NInjas.lua!")
	end
end


hooksecurefunc("UnitFrame_Update", function(frame, isParty)
	if frame.name then
		local unit = frame.overrideName or frame.unit
		if UnitPlayerControlled(unit) and UnitIsFriend(unit, "target") and UnitInParty("target") then
			VerListaPlayers(unit)
		end
	end
end)
