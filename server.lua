RegisterServerEvent("pa")
AddEventHandler("pa", function(param)
    if IsPlayerAceAllowed(source, "fw.psit") then
        print("^1[Active Priority Situation]:^7" .. param)
        TriggerClientEvent("chatMessage", -1, "^1[Active Priority Situation]", {0,0,0}, param)
    else
        TriggerClientEvent('no-perms', source)
    end
end)