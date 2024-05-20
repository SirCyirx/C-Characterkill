Config = Config or {}

Config.NotifyType = "ox" -- [qb] or [Okok] or [ox] or [mythic]

Config.UsePlayerServerID = true
Config.UsePlayerCitizen = true
Config.CommandNames = {
    ID = "ck",
    CitizenID = "ckcitizen"
}
Config.UseWebHook = true -- If set true then a meesage will be sent to the below webhook when a player is deleted
Config.Webhook = ""

Config.Lang = {
    ["header"] = "Notification.",
    ["header2"] = "Character Kill.",
    ["dropped"] = "Character wiping process has started.",
    ["not_dropped"] = "There has been a issue and this player is still in the server. Please try again!.",
    ["canceled"] = "Canceled.",
    ["kicked_alert"] = "Your character is being killed please wait to rejoin back."
}

function NotifyServerAlert(src, titletext, msgtext, type)
    if Config.NotifyType == "qb" then
        if type == 'inform' then
           local info = 'primary'
        TriggerClientEvent('QBCore:Notify', src, msgtext, info)
        end
    elseif Config.NotifyType == "ox" then
        TriggerClientEvent('ox_lib:notify', src, { title = titletext, description = msgtext, type = type })
    elseif Config.NotifyType == "okok" then
        if type == 'inform' then
            local info = 'info'
        TriggerClientEvent('okokNotify:Alert', src, titletext, msgtext, 5000, info)
        end
    elseif Config.NotifyType == "mythic" then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = type, text = msgtext, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
    elseif Config.NotifyType == "custom" then
   end
end