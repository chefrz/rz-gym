local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("gamz-skillsystem:update")
AddEventHandler("gamz-skillsystem:update", function(data, key)
     local src = source
     local xPlayer = QBCore.Functions.GetPlayer(src)
     if xPlayer then
          xPlayer.Functions.SetMetaData("skill", data)
     end
end)