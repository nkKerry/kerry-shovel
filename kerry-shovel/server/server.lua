local RSGCore = exports['rsg-core']:GetCoreObject()


RSGCore.Functions.CreateUseableItem("shovel", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
        TriggerClientEvent("kerry-shovel:client:start", source)
end)


RegisterServerEvent('kerry-shovel:server:givereward')
AddEventHandler('kerry-shovel:server:givereward', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local chance = math.random(1, 100)
    local rewardMoneys = math.random(1, 2) 
	local baitworm = "p_baitworm01x"
	local item1 = Config.CommonItems[math.random(1, #Config.CommonItems)]
	
    if chance <= 60 then 
		Player.Functions.AddItem(baitworm, 1)
		TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[baitworm], "add")
		TriggerClientEvent('RSGCore:Notify', src, 'You found something!', 'success')
		
	elseif chance > 60 and chance <= 85 then
		Player.Functions.AddItem(item1, 1)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item1], "add")
		TriggerClientEvent('RSGCore:Notify', src, 'You found something!', 'success')
		
    elseif chance > 85 then 
        local moneyReward = rewardMoneys / 100 
        Player.Functions.AddMoney('cash', moneyReward)
		TriggerClientEvent('RSGCore:Notify', src, 'You found a coin!', 'success')
    end 
end)
