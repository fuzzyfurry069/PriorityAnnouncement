local discord_webhook = {
    url = "Webhook Goes Here",
    avatar_url = "https://www.dreamstime.com/illustration/ps-logo.html"
}

local config = {
    -- Leave False
    InsertIntoDB = false,
    -- True or False
    PostToDiscord = false
}

-- Please do not change anything below this. You can/will fuck shit up if you don't know what you're doing.
-- Edit the configs only.

RegisterServerEvent("pa")
AddEventHandler("pa", function(param)
    if (string.len(param) == 0) then
        if IsPlayerAceAllowed(source, "fw.psit")
        TriggerClientEvent("no-args", source)
        else
            TriggerClientEvent("no-perms", source)
        end
    elseif IsPlayerAceAllowed(source, "fw.psit") then
        print("^1[Active Priority Situation]:^7" .. param)
        TriggerClientEvent("chatMessage", -1, "^1[Active Priority Situation]", {0,0,0}, param)
        -- Get the Identifiers. Curtosy of Badger.
        function ExtractIdentifiers(src)
            local identifiers = {
                steam = "",
                discord = "",
                license = "",
            }
        
            --Loop over all identifiers
            for i = 0, GetNumPlayerIdentifiers(src) - 1 do
                local id = GetPlayerIdentifier(src, i)
        
                --Convert it to a nice table.
                if string.find(id, "steam") then
                    identifiers.steam = id
                elseif string.find(id, "discord") then
                    identifiers.discord = id
                elseif string.find(id, "license") then
                    identifiers.license = id
                end
            end
        
            return identifiers
        end
        -- This does not work! The script will not work if set to true.
        if config.InsertIntoDB == true then
            MySQL.Async.execute("INSERT INTO PriorityLog (PlayerID, SteamName, Identifier, PlayerName, PriorityType) VALUES (@discord, @steamid, @identifier, @playername, @param)", {["@discord"] = identifiers.discord, ["@steamid"] = identifiers.steam, ["@identifier"] = identifiers.license, ["@playername"] = player_name, ["@param"] = param})
            print("^7========================================")
            print("^1[Priority Script]: Logged to Database!")
            print("^7========================================")
        end
        if config.PostToDiscord == true then
            PerformHttpRequest(discord_webhook.url, 
                function(err, text, header) end, 
                'POST', 
                json.encode({username = player_name, content = "A priority has happened in the server. Here is the priority announcement: " .. param, avatar_url=discord_webhook.avatar_url }), {['Content-Type'] = 'application/json'})
            print("^7========================================")
            print("^1[Priority Script]: Priority Logged in Discord!")
            print("^7========================================")
        end
    else
        TriggerClientEvent('no-perms', source)
    end
end)