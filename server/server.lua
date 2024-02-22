local QBCore = exports['qb-core']:GetCoreObject()

if Config.UsePlayerId == true then
QBCore.Commands.Add(Config.CommandNames.ID, "Character Kill", {  { name = 'id', help = "Id of the player you want to CK"} }, true, function(source, args)
    local src = source
    local playerid = args[1]
    local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local citizenid = SearchedPlayer.PlayerData.citizenid
    DropPlayer(playerid, "Your character is being killed please wait to rejoin back.")
    Wait(10)
    MySQL.query('DELETE FROM players WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM apartments WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM bank_accounts WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM crypto_transactions WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM phone_invoices WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM phone_messages WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM playerskins WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_contacts WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_houses WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_mails WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_outfits WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_vehicles WHERE citizenid = ?', {citizenid})
    print("Character with server ID:"..playerid.." is now deleted")
    print("Could not delete character")
   end, 'admin')
end

if Config.UsePlayerCID == true then
QBCore.Commands.Add(Config.CommandNames.CID, "Character Kill", {  { name = 'id', help = "citizenid:Z12GQ47"} }, true, function(source, args)
    local src = source
    local citizenid = args[1]
    MySQL.query('DELETE FROM players WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM apartments WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM bank_accounts WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM crypto_transactions WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM phone_invoices WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM phone_messages WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM playerskins WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_contacts WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_houses WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_mails WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_outfits WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_vehicles WHERE citizenid = ?', {citizenid})
    print("Character with CitizenID:"..citizenid.." is now deleted")
   end, 'admin')
end