ESX = nil
meow = GetCurrentResourceName()
cfg = Setting

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

-- RegisterNetEvent('esx:playerLoaded')
-- AddEventHandler('esx:playerLoaded', function(playerData)
--     Wait(1000)

-- end)

RegisterFontFile('font4thai')
fontId = RegisterFontId('font4thai')

-- AddEventHandler('onResourceStart', function(resourceName)
--     if GetCurrentResourceName() == resourceName then
--         Wait(1000)

--     end
-- end)

RegisterNetEvent(meow..'ShowAlert')
AddEventHandler(meow..'ShowAlert', function (msg, type, timeout)
    Alert(msg, type, timeout)
end)
function tableContains(tbl, val)
    for i = 1, #tbl do
        if tbl[i] == val then
            return true
        end
    end
    return false
end

function Alert(msg, type, timeout)
    if type == 'error' then
        exports['pNotify']:SendNotification({
            text = '<strong class="red-text"><font face="font4thai">' .. msg .. '</font></strong>',
            type = "error",
            timeout = timeout,
            layout = "topCenter",
            queue = "global"
        })
    elseif type == 'success' then
        exports['pNotify']:SendNotification({
            text = '<strong class="green-text"><font face="font4thai">' .. msg .. '</font></strong>',
            type = "success",
            timeout = timeout,
            layout = "topCenter",
            queue = "global"
        })
    elseif type == 'alert' then
        exports['pNotify']:SendNotification({
            text = '<strong class="yellow-text"><font face="font4thai">' .. msg .. '</font></strong>',
            type = "alert",
            timeout = timeout,
            layout = "topCenter",
            queue = "global"
        })
    end
end

debug = function(...)
    if Debug['Debug-Client-Side'] then
        print(...)
    end
end
function checkemtytable(...)
    for k, v in pairs(...) do
        if v then
            return true
        end
        return false
    end
end

ShowToolTip = function(x, y, z, msg)
    AddTextEntry('MoveToFinal', '<font face="font4thai">' .. msg .. '</font>')
    SetFloatingHelpTextWorldPosition(1, x, y, z)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('MoveToFinal')
    EndTextCommandDisplayHelp(2, false, false, -1)
end


-- function hoursToClock(seconds)
--     local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0
--     if seconds <= 0 then
--         return 0, 0
--     else
--         local hours = string.format("%02.f", math.floor(seconds / 3600))
--         local mins = string.format("%02.f",
--                                    math.floor(seconds / 60 - (hours * 60)))
--         local secs = string.format("%02.f", math.floor(
--                                        seconds - hours * 3600 - mins * 60))
--         return hours
--     end
-- end

-- function minToClock(seconds)
--     local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0
--     if seconds <= 0 then
--         return 0, 0
--     else
--         local hours = string.format("%02.f", math.floor(seconds / 3600))
--         local mins = string.format("%02.f",
--                                    math.floor(seconds / 60 - (hours * 60)))
--         local secs = string.format("%02.f", math.floor(
--                                        seconds - hours * 3600 - mins * 60))
--         return mins
--     end
-- end

-- function secToClock(seconds)
--     local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0
--     if seconds <= 0 then
--         return 0, 0
--     else
--         local hours = string.format("%02.f", math.floor(seconds / 3600))
--         local mins = string.format("%02.f",
--                                    math.floor(seconds / 60 - (hours * 60)))
--         local secs = string.format("%02.f", math.floor(
--                                        seconds - hours * 3600 - mins * 60))
--         return secs
--     end
-- end
