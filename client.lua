local Neverland = {}
Neverland.Injections = {
	Sprites = {
		{texture = 'deadline', label = 'Dopamine'},
		{texture = 'shopui_title_graphics_franklin', label = 'Franklin Menu'},
		{texture = 'digitaloverlay', label = 'digitaloverlay'},
                {texture = 'mpinventory', label = 'mpinventory'},
		            {texture = 'hunting', label = 'hunting'},
                {texture = 'MenyooExtras', label = 'MenyooExtras'},
                {texture = 'heisthud', label = 'heisthud'},
                {texture = 'fm', label = 'Fallout'},
                {texture = "InfinityMenu", label = "Infinity Menu"},
                {texture = "hugeware", label = "HugeWare"},
                {texture = "dopatest", label = "Dopa Menu" },
                {texture = "helicopterhud", label = "Lua Mod Menu"},
                {texture = "commonmenu", label = "Lua Vanilla Menu"},
                {texture = "Mpmissmarkers256", label = "Lua Mod Menu"},
                {texture = "timerbar_sr", label = "Pasted Menu"},
                {texture = "Fivex", label = "FiveX"},
                {texture = "mpweaponsunusedfornow", label = "Combat Menu"},
                {texture = "mpmissmarkers256", label = "Lua Mod Menu"},
                {texture = "__REAPER1__", label = "Repear Menu"},
                {texture = "__REAPER2__", label = "Repear Menu"},
                {texture = "__REAPER3__", label = "Repear Menu"},
                {texture = "__REAPER8__", label = "Repear Menu"},
                {texture = "__REAPER10__", label = "Repear Menu"},
                {texture = "__REAPER6__", label = "Repear Menu"},
                {texture = "__REAPER7__", label = "Repear Menu"},
                {texture = "__REAPER5__", label = "Repear Menu"},
                {texture = "__REAPER23__", label = "Repear Menu"},
                {texture = "__REAPER24__", label = "Repear Menu"},
                {texture = "__REAPER17__", label = "Repear Menu"},
                {texture = "KentasMenu", label = "Kentas Menu Synapse"},
                {texture = "LoadGifPed", label = "Synapse Menu"},
                {texture = "KentasCheckboxDict", label = "Kentas Menu Synapse"},
                {texture = "mpleaderboard", label = "Custom Lua Mod Menu"},
                {texture = "RATINHOPIKA", label = "Quila Mod Menu"},
                {texture = "Urubu", label = "Urubu Menu"},
                {texture = "Urubu3", label = "Urubu Menu"},
	},
        Emotes = {
                {emote = 'rcmjosh2', label = 'Tiago'}
        },
        FilesReady = {
                "rampage_tr_main.ytd",
                "rampage_tr_animated.ytd",
        },
	Variables = {
		Whitelist = {"exports", "_G", "_ENV", "msgpack", "WarMenu", "NativeUI", "JayMenu", "func"},
		Blacklist = {
                        Keys = {
                                [178] = {label = "DELETE"},
                                [121] = {label = "INSERT"},
								[37] = {label = "TAB"},
                                [169] = {label = "F8"}
                        },
			Tables = {"HoaxMenu", "xseira", "LynxEvo", "SatanIcarusMenu", "ATG", "VladmirAK47", "INFINITY2337", "Ham"},
			Functions = {
				"initiateDragging", 
				"MenuCreateButton", 
				"OnlineCreateButton", 
				"ShowInfoAboutThisGuy", 
				"SlimButton", "nukeserver", 
				"fuckmedaddy", 
				"rE", 
				"AYZNSpawnAllFireVehicle", 
				"AYZNSpawnFireVehicle", 
				"GetActuallyParticul", 
				"tktfrelon", 
				"SharksPed", 
				"maisnon", 
				"NativeExplosionServerLoop", 
				"NativeExplosionLoop"
			}
		}
	}
}

local vars = {}

Citizen.CreateThread(function()
    if Neverland.Injections.Sprites ~= nil and type(Neverland.Injections.Sprites) == "table" then
      if next(Neverland.Injections.Sprites) ~= nil then
        Citizen.Wait(500)
        for fd, fe in next, Neverland.Injections.Sprites do
            -- SetStreamedTextureDictAsNoLongerNeeded(fe.texture or "NULL")
        --     print(fe.texture or "NULL")
            while true do
                for fd, fe in next, Neverland.Injections.Sprites do
                    Citizen.Wait(50)
                    if HasStreamedTextureDictLoaded(fe.texture or "NULL") then
                        print("Attempted to Inject a Lua Menu: " .. (fe.label or "NULL"))
                        TriggerEvent("neverland:punish", "Attempted to Inject a Lua Menu: " .. (fe.label or "NULL"))
                        --       TriggerServerEvent(BanEventName, "Attempted to Inject a Lua Menu: " .. (fe.label or "NULL"), true)
                    end
                --     print(fe.texture or "NULL")
                end
                for a,b in next, Neverland.Injections.Emotes do
                        Citizen.Wait(50)
                        if HasAnimDictLoaded(b.emote or "NULL") then
                                print("Attempted to Inject a Lua Menu: " .. (b.label or "NULL"))
                        end
                end

                for a,b in next, Neverland.Injections.FilesReady do
                        if IsStreamingFileReady(b) then
                                print("Attempted to Inject a Custom Stream Map: " .. (b or "NULL"))
                        end
                end

                Citizen.Wait(2500)
            end
        end
      else
        DebugPrint("Neverland.Injections.Sprites is empty", "Sprite Thread", debug.getinfo(1).currentline)
      end
    else
      DebugPrint("Neverland.Injections.Sprites == nil or type ~= table", "Sprite Thread", debug.getinfo(1).currentline)
    end
end)
