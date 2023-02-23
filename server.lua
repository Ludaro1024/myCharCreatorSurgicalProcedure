if (GetResourceState("es_extended") == "started") then
    if (exports["es_extended"] and exports["es_extended"].getSharedObject) then
        ESX = exports["es_extended"]:getSharedObject()
    else
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end
end

function debug(msg)
    if Config.Debug then
        if type(msg) == "table" then
            print(print(ESX.DumpTable(msg)))
        else
            print("[Ludaro|Debug] : " .. tostring(msg))
        end
    end
end

if (GetResourceState("es_extended") == "started") then
    if (exports["es_extended"] and exports["es_extended"].getSharedObject) then
        ESX = exports["es_extended"]:getSharedObject()
    else
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end
end

function debug(msg)
    if Config.Debug then
        if type(msg) == "table" then
            print(print(ESX.DumpTable(msg)))
        else
            print("[Ludaro-me|Debug] : " .. tostring(msg))
        end
    end
end


lib.callback.register('ludaro:getprice', function(source)
   local xPlayer = ESX.GetPlayerFromId(source)
   if Config.Account ~= "both" or Config.Account == "money" or Config.Account == "bank" then
   local money = xPlayer.getAccount(Config.Account)
   debug(money.money)
   if money.money >= Config.Price then
    xPlayer.removeAccountMoney(Config.Account, Config.Price)
    return true
   else
    return false
   end
end

   if Config.Account == "both" then
    local money = xPlayer.getAccount("money")
    local bank =  xPlayer.getAccount("bank")
    debug(money.money .. " cash")
    debug(bank.money .. " bank")
    if money.money >= Config.Price  then
        
        xPlayer.removeAccountMoney("money", Config.Price)
        return true
    elseif bank.money >= Config.Price then
        xPlayer.removeAccountMoney("bank", Config.Price)
        return true
    else
        return false
    end
   end
   return false

end)
