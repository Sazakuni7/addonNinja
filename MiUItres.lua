local CUSTOM_TARGET_TEXT = "NINJA"

print('Mi nickname es ' .. UnitName("player"))

-- Cargar la lista externa
local lista = {}
local listaLoaded = false

local function cargarLista()
    if not listaLoaded then
        local file = assert(io.open("lista.lua", "r")) -- Abrir el archivo en modo lectura
        local content = file:read("*all") -- Leer todo el contenido del archivo
        file:close() -- Cerrar el archivo

        -- Ejecutar el contenido del archivo como código Lua
        local chunk = assert(loadstring(content))
        local listaData = chunk()

        for _, nombre in ipairs(listaData) do
            table.insert(lista, nombre)
        end
        listaLoaded = true
    end
end

-- Función para verificar si un nombre está en la lista
local function verificarNombre(nombre)
    cargarLista() -- Asegúrate de que la lista esté cargada
    for _, v in ipairs(lista) do
        if v == nombre then
            return true
        end
    end
    return false
end
-- Registrar un evento para el clic en un personaje
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_TARGET_CHANGED" then
        local nombre = UnitName("target")
        if nombre then
            local encontrado = verificarNombre(nombre)
            if encontrado then
                print(nombre .. " está en la lista.")
            else
                print(nombre .. " no está en la lista.")
            end
        end
    end
end)


hooksecurefunc("UnitFrame_Update", function(frame, isParty)
	if frame.name then
		local unit = frame.overrideName or frame.unit
		if UnitPlayerControlled(unit) and UnitIsFriend(unit, "target") and UnitInParty("target") then
			VerListaPlayers(unit)
		end
	end
end)
