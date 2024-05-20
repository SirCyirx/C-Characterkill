lib.callback.register('c-characterkill:client:check1', function(playerid)
    local alert = lib.alertDialog({ header = Config.Lang["header2"], content = "Are you sure you want to wipe player with ServerID:"..playerid.." This player will be kicked from the server and can rejoin once completed.", centered = true, cancel = true })
  if alert == "confirm" then
       return "confirm"
  elseif "cancel"then
       return "cancel"
    end
end)

lib.callback.register('c-characterkill:client:check2', function(citizenid)
    local alert = lib.alertDialog({ header = Config.Lang["header2"], content = "Are you sure you want to wipe player with CitizenID:"..citizenid..". If the player is in the server this might not work.", centered = true, cancel = true })
  if alert == "confirm" then
       return "confirm"
  elseif "cancel"then
       return "cancel"
    end
end)