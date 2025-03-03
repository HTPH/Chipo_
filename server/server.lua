ESX = nil
meow = GetCurrentResourceName()
cfg = Setting
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- RegisterNetEvent('esx:playerLoaded')
-- AddEventHandler('esx:playerLoaded', function(playerData)
--     Wait(1000)
--     local playerData = playerData
--     local xPlayer = ESX.GetPlayerFromId(playerData)
-- end)

-- AddEventHandler('onResourceStart', function(resourceName)
--     if GetCurrentResourceName() == resourceName then

--     end
-- end)
-- AddEventHandler('onResourceStop', function(resource)
--     if resource == GetCurrentResourceName() then

--     end
-- end)

-- AddEventHandler('playerDropped', function(reason)
--     local _source = source

-- end)
pNotify = function(source, message, typex)
    typex = typex and typex or 'success'
    TriggerClientEvent("pNotify:SendNotification", source, {
        text = message,
        type = typex,
        queue = "chipo_job",
        timeout = 5000,
        layout = 'bottomCenter'
    })
end

debug = function(...)
    if Debug['Debug-Server-Side'] then
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
function tableContains(tbl, val)
    for i = 1, #tbl do
        if tbl[i] == val then
            return true
        end
    end
    return false
end
Discord_SendWebhook = function(idplayer, text, link, idtraget)
    Citizen.CreateThread(function()
        Wait(Webhook['Delay'])
        if idtraget ~= nil then
            local datatarget   = GetAllIdents(idplayer)
            local ped          = GetPlayerPed(idplayer)
            local playerCoords = GetEntityCoords(ped)
            local dataxtarget  = GetAllIdents(idtraget)
            local pedtarger    = GetPlayerPed(idtraget)
            local targerCoords = GetEntityCoords(pedtarger)
            local embed        = {
                {
                    ['color'] = 16711680, -- 3407616 7405312
                    ['title'] = text,
                    ['fields'] = {
                        {
                            ['name'] = "**📁 ข้อมูลผู้เล่นหลัก**",
                            ['value'] = "**Name IC : ** " .. datatarget['Name'] ..
                                "\n**ID : ** " .. idplayer ..
                                "\n**SteamHex : ** " .. datatarget['SteamHex'] ..
                                "\n**Discord : ** <@" .. datatarget["Discord"]:gsub("discord:", "") ..
                                ">\n**IP : ** " .. datatarget["IP"]:gsub("ip:", "") ..
                                "\n**Coords : ** " .. playerCoords .. "",
                            ['inline'] = true
                        },
                        {
                            ['name'] = "**📁 ข้อมูลผู้เล่นรอง**",
                            ['value'] = "**Name IC : ** " .. dataxtarget['Name'] ..
                                "\n**ID : ** " .. idtraget ..
                                "\n**SteamHex : ** " .. dataxtarget['SteamHex'] ..
                                "\n**Discord : ** <@" .. dataxtarget["Discord"]:gsub("discord:", "") ..
                                ">\n**IP : ** " .. dataxtarget["IP"]:gsub("ip:", "") ..
                                "\n**Coords : ** " .. targerCoords .. "",
                            ['inline'] = true
                        }
                    },
                    ['timestamp'] = os.date('!%Y-%m-%dT%H:%M:%SZ', os.time()),
                    ['footer'] = {
                        ['text'] = "Chipo Developer",
                        ['icon_url'] =
                        "https://cdn.discordapp.com/attachments/968506457173676082/1053546295391957112/Brown_Modern_Cat_Food_Brand_logo_1.png"
                    },
                    ['thumbnail'] = {
                        ['url'] =
                        "https://cdn.discordapp.com/attachments/968506457173676082/1053546295391957112/Brown_Modern_Cat_Food_Brand_logo_1.png"
                    }
                }
            }
            PerformHttpRequest(
                link,
                function(err, text, headers) end, 'POST', json.encode({
                    username = '🧠',
                    avatar_url =
                    "https://cdn.discordapp.com/attachments/968506457173676082/1053546295391957112/Brown_Modern_Cat_Food_Brand_logo_1.png",
                    embeds = embed
                }), { ['Content-Type'] = 'application/json' })
        else
            local datatarget   = GetAllIdents(idplayer)
            local ped          = GetPlayerPed(idplayer)
            local playerCoords = GetEntityCoords(ped)
            local embed        = {
                {
                    ['color'] = 16711680, -- 3407616 7405312
                    ['title'] = text,
                    ['fields'] = {
                        {
                            ['name'] = "**📁 ข้อมูลผู้เล่นหลัก**",
                            ['value'] = "**Name IC : ** " .. datatarget['Name'] ..
                                "\n**ID : ** " .. idplayer ..
                                "\n**SteamHex : ** " .. datatarget['SteamHex'] ..
                                "\n**Discord : ** <@" .. datatarget["Discord"]:gsub("discord:", "") ..
                                ">\n**IP : ** " .. datatarget["IP"]:gsub("ip:", "") ..
                                "\n**Coords : ** " .. playerCoords .. "",
                            ['inline'] = true
                        }
                    },
                    ['timestamp'] = os.date('!%Y-%m-%dT%H:%M:%SZ', os.time()),
                    ['footer'] = {
                        ['text'] = "Chipo Developer",
                        ['icon_url'] =
                        "https://cdn.discordapp.com/attachments/968506457173676082/1053546295391957112/Brown_Modern_Cat_Food_Brand_logo_1.png"
                    },
                    ['thumbnail'] = {
                        ['url'] =
                        "https://cdn.discordapp.com/attachments/968506457173676082/1053546295391957112/Brown_Modern_Cat_Food_Brand_logo_1.png"
                    }
                }
            }
            PerformHttpRequest(
                link,
                function(err, text, headers) end, 'POST', json.encode({
                    username = '🧠',
                    avatar_url =
                    "https://cdn.discordapp.com/attachments/968506457173676082/1053546295391957112/Brown_Modern_Cat_Food_Brand_logo_1.png",
                    embeds = embed
                }), { ['Content-Type'] = 'application/json' })
        end
    end)
end

function GetAllIdents(playerId)
    local result = {}
    local xPlayer = ESX.GetPlayerFromId(playerId)
    result["Name"] = xPlayer.name
    for k, v in pairs(GetPlayerIdentifiers(playerId)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            result["SteamHex"] = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            result["IP"] = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            result["Discord"] = v
        end
    end
    return result
end
