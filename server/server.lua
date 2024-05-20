local QBCore = exports['qb-core']:GetCoreObject()

if Config.UsePlayerServerID == true then
QBCore.Commands.Add(Config.CommandNames.ID, "Character Kill", {  { name = 'id', help = "Id of the player you want to CK"} }, true, function(source, args)
    local src = source
    local PlayerID = args[1]
    local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local CitizenID = SearchedPlayer.PlayerData.citizenid
    local Check = lib.callback.await('c-characterkill:client:check1', src, PlayerID)
  if Check == "confirm" then
  if DropPlayer(PlayerID, Config.Lang["kicked_alert"]) then
       NotifyServerAlert(src, {Config.Lang["header"]}, Config.Lang["dropped"], 'inform')
       MySQL.query('DELETE FROM players WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM apartments WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM bank_accounts WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM crypto_transactions WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM phone_invoices WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM phone_messages WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM playerskins WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM player_contacts WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM player_houses WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM player_mails WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM player_outfits WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM player_vehicles WHERE citizenid = ?', {CitizenID})
       NotifyServerAlert(src, {Config.Lang["header"]}, "Character with ServerID:"..PlayerID.." should be deleted. If not they couldnt be found in a database table or they didnt have any info in that table.", 'inform')
       DiscordWebHookAlert("CharacterKill Webhook", "Character with ServerID:"..PlayerID.." should be deleted. If not they couldnt be found in a database table or they didnt have any info in that table.")
   else
       NotifyServerAlert(src, {Config.Lang["header"]}, Config.Lang["not_dropped"], 'error')
    end
  elseif Check == "cancel" then
       NotifyServerAlert(src, {Config.Lang["header"]}, Config.Lang["canceled"], 'error')
    end
  end, 'admin')
end

if Config.UsePlayerCitizen == true then
QBCore.Commands.Add(Config.CommandNames.CitizenID, "Character Kill", {  { name = 'id', help = "Put in there citizenid. Example - Z12GQ47."} }, true, function(source, args)
    local src = source
    local CitizenID = args[1]
    local Check = lib.callback.await('c-characterkill:client:check2', src, CitizenID)
  if Check == "confirm" then
       MySQL.query('DELETE FROM players WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM apartments WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM bank_accounts WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM crypto_transactions WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM phone_invoices WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM phone_messages WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM playerskins WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM player_contacts WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM player_houses WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM player_mails WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM player_outfits WHERE citizenid = ?', {CitizenID})
       MySQL.query('DELETE FROM player_vehicles WHERE citizenid = ?', {CitizenID})
       NotifyServerAlert(src, {Config.Lang["header"]}, "Character with CitizenID:"..CitizenID.." should be deleted. If not they couldnt be found in a database table or they didnt have any info in that table.", 'inform')
       DiscordWebHookAlert("CharacterKill Webhook", "Character with CitizenID:"..CitizenID.." should be deleted. If not they couldnt be found in a database table or they didnt have any info in that table.")
  elseif Check == "cancel" then
       NotifyServerAlert(src, {Config.Lang["header"]}, Config.Lang["canceled"], 'error')
    end
  end, 'admin')
end

function DiscordWebHookAlert(title, description)
  if Config.UseWebHook == true then
    local Data = {{ ["color"] = 16753920, ["title"] = "**".. title .."**", ["description"] = description }}
       PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({embeds = Data}), {['Content-Type'] = 'application/json'})
   end
end