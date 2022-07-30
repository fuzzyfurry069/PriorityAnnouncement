RegisterCommand("pa", function(source, args)
    TriggerServerEvent("pa", table.concat(args, " "))
end)

-- This interacts with the server script (as the chat message if only for the client ONLY)
RegisterNetEvent("no-perms")
AddEventHandler("no-perms", function()
    TriggerEvent("chatMessage", "[Error]", {255,0,0}, "Sorry, but you don't have permission to do this." )
end)
-- This is what do to if someone doesn't provide a priority reason.
RegisterNetEvent("no-args")
AddEventHandler("no-args", function()
    TriggerEvent("chatMessage", "[Error]", {255,0,0}, "You are required to provide a reason for the priority script.")
end)