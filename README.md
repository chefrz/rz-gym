![image](https://cdn.discordapp.com/attachments/352733374235803648/1089285157711773848/relase.png)

# rz-gym
- Buff And Skill System GYM [QBCORE]
- New QBCore

## Video Showcase
- https://youtu.be/8b8hPhdv8SM
## Discord
- https://discord.gg/zertxMj7Y

## Features
-  If you eat redbull and chocolate and do sports, you will gain more stamina and strength. (2x)
-  If you drive your vehicle at the speed you set, your driving ability will skill
-  If you front-lift on the motorcycle,  your Wheelie ability will skill
-  You need to rest after exercising
-  Sports area and shops can be duplicate
-  You can see the progress of your character with the help of the UI
- Easy configurable Config (everything is adjustable)
- Script using full qb-target


## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [ps-buffs](https://github.com/Project-Sloth/ps-buffs)

## Installation


### Items
- Add the following code to your `qb-core/shared/ıtems.lua`
```
['redbull'] 				 	 = {['name'] = 'redbull', 			  	  		['label'] = 'Redbull', 				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'redbull.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Redbull'},

['chocolate'] 				 	 = {['name'] = 'chocolate', 			  	  		['label'] = 'Chocolate', 				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'chocolate.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Chocolate'},
```
### ConsumablesEat
- Add the following code to your `qb-smallresources/config/Config.ConsumablesEat`

```
["chocolate"] = math.random(10, 15),
```

### ConsumablesDrink
- Add the following code to your `qb-smallresources/config/Config.ConsumablesDrink`

```
["redbull"] = math.random(10, 15),
```
## Buffs Setup (Eat)

- Find the `consumables:client:Eat` line and do as follows

```
RegisterNetEvent('consumables:client:Eat', function(itemName)
    local eat = (1000 * 60) * Config.SuperHunger
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    QBCore.Functions.Progressbar("eat_something", Lang:t('consumables.eat_progress'), 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_player_inteat@burger",
        anim = "mp_player_int_eat_burger",
        flags = 49,
    }, {}, {}, function() -- Done

        if itemName == "chocolate" then
            exports['ps-buffs']:AddBuff("gym-stamina", 300000)
        end

        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Config.ConsumablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

```

## Buffs Setup (Drink)

- Find the `consumables:client:Drink` line and do as follows

```
RegisterNetEvent('consumables:client:Drink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    QBCore.Functions.Progressbar("drink_something", Lang:t('consumables.drink_progress'), 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_player_inteat@pnq",
        anim = "loop",
        flags = 49,
    }, {}, {}, function() -- Done

        if itemName == "redbull" then
            exports['ps-buffs']:AddBuff("gym-strength", 300000)
        end

        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + Config.ConsumablesDrink[itemName])
    end)
end)

```

### Items
- Add the following code to your `ps-buffs/shared/config`
```
    ['gym-stamina'] = {
        iconColor = "#ffffff",
        iconName = 'wind',
        maxTime = 300000,
        progressColor = "#FFD700",
        type = 'buff'
    },

    ['gym-strength'] = {
        iconColor = "#ffffff",
        iconName = 'dumbbell',
        maxTime = 300000,
        progressColor = "#FFD700",
        type = 'buff'
    }

```

### Skill System Setup
- Add the following code to your `qb-core/server/player`

```
    PlayerData.metadata["skill"]  = PlayerData.metadata["skill"]  ~= nil and PlayerData.metadata["skill"] or {
		["Stamina"] = {["Current"] = 10.0, ["Stat"] = "MP0_STAMINA", ["RemoveAmount"] = 0}, 
		["Strength"] = {["Current"] = 5.0, ["Stat"] = "MP0_STRENGTH", ["RemoveAmount"] = 0 },
        ["Lung Capacity"] = {["Current"] = 5.0, ["Stat"] = "MP0_LUNG_CAPACITY", ["RemoveAmount"] = 0 },
        ["Driving"] = {["Current"] = 0.0, ["Stat"] = "MP0_DRIVING_ABILITY", ["RemoveAmount"] = 0 },
        ["Wheelie"] = {["Current"] = 0.0, ["Stat"] = "MP0_WHEELIE_ABILITY", ["RemoveAmount"] = 0 }
	}
```




### Item Images
- Download the script and open images folder, put it in the `qb-inventory/html/images` directory.

### Script
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg

```
ensure rz-gym
ensure gamz-skillsystem
ensure ps-buffs
```

## Image Showcase
![image](https://cdn.discordapp.com/attachments/1076880322903416873/1076889513219063848/1.png)
![image](https://cdn.discordapp.com/attachments/1076880322903416873/1076889560803455066/3.png)
![image](https://cdn.discordapp.com/attachments/1076880322903416873/1076889565807263844/2.png)
![image](https://cdn.discordapp.com/attachments/1076880322903416873/1076889585612763187/5.png)
![image](https://cdn.discordapp.com/attachments/1076880322903416873/1076889589593153596/6.png)
![image](https://cdn.discordapp.com/attachments/1076880322903416873/1076889592688558080/4.png)
![image](https://cdn.discordapp.com/attachments/1076880322903416873/1076889596522139689/7.png)
![image](https://cdn.discordapp.com/attachments/1076880322903416873/1076889626196840559/8.png)


