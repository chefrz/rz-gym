local QBCore = exports['qb-core']:GetCoreObject()
local training = false


CreateThread(function()
  for k, v in pairs(config.Locations["jogging"]) do
    exports['qb-target']:AddBoxZone("Jogging".. k, vector3(v.x, v.y, v.z), 2, 2, {
      name = "Jogging" .. k,
      heading = 300.0,
      debugPoly = false,
      minZ = v.z - 2,
      maxZ = v.z + 2,
    }, {
      options = {
        {
          type = "client",
          event = config.Skills.Jogging.event,
          icon = config.Skills.Jogging.icon,
          label = config.Skills.Jogging.label
          },
      },
      distance = 2.0
    })
  end

  for k, v in pairs(config.Locations["chinup"]) do
    exports['qb-target']:AddBoxZone("chinup" .. k, vector3(v.x, v.y, v.z), 2, 2, {
      name = "chinup" .. k,
      heading = 300.0,
      debugPoly = false,
      minZ = v.z - 2,
      maxZ = v.z + 2,
    }, {
      options = {
        {
          type = "client",
          event = config.Skills.Chinups.event,
          icon = config.Skills.Chinups.icon,
          label = config.Skills.Chinups.label
          },
      },
      distance = 2.0
    })
  end

  for k, v in pairs(config.Locations["crunches"]) do
    exports['qb-target']:AddBoxZone("crunches" .. k, vector3(v.x, v.y, v.z), 2, 2, {
      name = "crunches" .. k,
      heading = 34.43,
      debugPoly = false,
      minZ = v.z - 2,
      maxZ = v.z + 2,
    }, {
      options = {
        {
          type = "client",
          event = config.Skills.Crunches.event,
          icon = config.Skills.Crunches.icon,
          label = config.Skills.Crunches.label
          },
      },
      distance = 2.0
    })
  end

  for k, v in pairs(config.Locations["liftweights"]) do
    exports['qb-target']:AddBoxZone("liftweights" .. k, vector3(v.x, v.y, v.z), 2, 2, {
      name = "liftweights" .. k,
      heading = 300.0,
      debugPoly = false,
      minZ = v.z - 2,
      maxZ = v.z + 2,
    }, {
      options = {
        {
          type = "client",
          event = config.Skills.ZBAR.event,
          icon = config.Skills.ZBAR.icon,
          label = config.Skills.ZBAR.label
          },
      },
      distance = 2.0
    })
  end

  for k, v in pairs(config.Locations["push-ups"]) do
    exports['qb-target']:AddBoxZone("push-ups" .. k, vector3(v.x, v.y, v.z), 2, 2, {
      name = "push-ups" .. k,
      heading = 300.0,
      debugPoly = false,
      minZ = v.z - 2,
      maxZ = v.z + 2,
    }, {
      options = {
        {
          type = "client",
          event = config.Skills.Pushups.event,
          icon = config.Skills.Pushups.icon,
          label = config.Skills.Pushups.label
          },
      },
      distance = 2.0
    })
  end

  for k, v in pairs(config.Locations["yoga"]) do
    exports['qb-target']:AddBoxZone("yoga" .. k, vector3(v.x, v.y, v.z), 3, 2, {
      name = "yoga" .. k,
      heading = 300.0,
      debugPoly = false,
      minZ = v.z - 2,
      maxZ = v.z + 2,
    }, {
      options = {
        {
          type = "client",
          event = config.Skills.Yoga.event,
          icon = config.Skills.Yoga.icon,
          label = config.Skills.Yoga.label
          },
      },
      distance = 2.0
    })
  end

  for k, v in pairs(config.Locations["meditation"]) do
    exports['qb-target']:AddBoxZone("meditation" .. k, vector3(v.x, v.y, v.z), 2, 2, {
      name = "meditation" .. k,
      heading = 39.69,
      debugPoly = false,
      minZ = v.z - 2,
      maxZ = v.z + 2,
    }, {
      options = {
        {
          type = "client",
          event = config.Skills.Meditation.event,
          icon = config.Skills.Meditation.icon,
          label = config.Skills.Meditation.label
          },
      },
      distance = 2.0
    })
  end

  for k, v in pairs(config.Locations["shop"]) do
    exports['qb-target']:AddBoxZone("gymshop" .. k, vector3(v.x, v.y, v.z), 2, 2, {
      name = "gymshop" .. k,
      heading = 39.69,
      debugPoly = false,
      minZ = v.z - 2,
      maxZ = v.z + 2,
    }, {
      options = {
        {
          type = "client",
          event = "rz-gym:shop",
          icon = "fa-solid fa-shop",
          label = "Gym Shop"
          },
      },
      distance = 2.0
    })
  end
  
end)


local function loadAnimDict(dict)
  while (not HasAnimDictLoaded(dict)) do
      RequestAnimDict(dict)
      Wait(3)
  end
end


local function ChinupsAnim()
  RequestAnimDict("amb@prop_human_muscle_chin_ups@male@base")
  while not HasAnimDictLoaded("amb@prop_human_muscle_chin_ups@male@base") do Wait(50) end
  local ped = PlayerPedId()
  local pos2 = vector4(-1199.99, -1571.15, 4.61,212.52)
  SetEntityHeading(ped, pos2.w)
  Wait(100)
  local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
  local netscene = NetworkCreateSynchronisedScene(pos2.x, pos2.y, pos2.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
  local x, y, z = table.unpack(GetEntityCoords(ped))
  NetworkAddPedToSynchronisedScene(ped, netscene, "amb@prop_human_muscle_chin_ups@male@base", "base", 1.5, -4.0, 1, 16, 1148846080, 0)
  SetPedComponentVariation(ped, 5, 0, 0, 0)
  NetworkStartSynchronisedScene(netscene)
end

RegisterNetEvent('rz-gym:jogging')
AddEventHandler('rz-gym:jogging',function() 
  local player = PlayerPedId()
  if not training then
    QBCore.Functions.Progressbar('jogging', config.Skills.Jogging.progress, config.Skills.Jogging.progressduration, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {
        animDict = config.Skills.Jogging.animDict,
        anim = config.Skills.Jogging.anim,
      }, {}, {}, function() 
        
        if exports['ps-buffs']:HasBuff("gym-stamina") then
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Jogging.skill, config.Skills.Jogging.buff)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.Jogging.skill, config.Skills.Jogging.buff)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.Jogging.skill, config.Skills.Jogging.buff)
          end
        else
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Jogging.skill, config.Skills.Jogging.amount)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.Jogging.skill, config.Skills.Jogging.amount)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.Jogging.skill, config.Skills.Jogging.amount)
          end
        end
        ClearPedSecondaryTask(player)
        StopAnimTask(player, config.Skills.Jogging.animDict, config.Skills.Jogging.anim, 1.0)
        local oob = math.random(1,100)
        if oob >= 85 then
          QBCore.Functions.Notify(config.langs[config.lang].finishspor)
          training = true
          Citizen.Wait(config.SporCd)
          training = false
          QBCore.Functions.Notify(config.langs[config.lang].finishcd)
        end
    end)
  else
    QBCore.Functions.Notify(config.langs[config.lang].cd)
  end
end)

RegisterNetEvent('rz-gym:chinup')
AddEventHandler('rz-gym:chinup',function() 
  local player = PlayerPedId()
  if not training then
    ChinupsAnim()
    QBCore.Functions.Progressbar('chinup', config.Skills.Chinups.progress, config.Skills.Chinups.progressduration, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {
        animDict = config.Skills.Chinups.animDict,
        anim = config.Skills.Chinups.anim,
      }, {}, {}, function() 	
        if exports['ps-buffs']:HasBuff("gym-strength") then
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.buff)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.buff)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.buff)
          end
        else
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.amount)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.amount)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.Chinups.skill, config.Skills.Chinups.amount)
          end
        end
        ClearPedSecondaryTask(player)
        StopAnimTask(player, config.Skills.Chinups.animDict, config.Skills.Chinups.anim, 1.0)
        local oob = math.random(1,100)
        if oob >= 85 then
          QBCore.Functions.Notify(config.langs[config.lang].finishspor)
          training = true
          Citizen.Wait(config.SporCd)
          training = false
          QBCore.Functions.Notify(config.langs[config.lang].finishcd)
        end
    end)
  else
      QBCore.Functions.Notify(config.langs[config.lang].cd)
  end
end)

RegisterNetEvent('rz-gym:crunches')
AddEventHandler('rz-gym:crunches',function() 
  local player = PlayerPedId()
  if not training then
    QBCore.Functions.Progressbar('crunches', config.Skills.Crunches.progress, config.Skills.Crunches.progressduration, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {
        animDict = config.Skills.Crunches.animDict,
        anim = config.Skills.Crunches.anim,
      }, {}, {}, function() 	
        if exports['ps-buffs']:HasBuff("gym-stamina") then
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Crunches.skill, config.Skills.Crunches.buff)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.Crunches.skill, config.Skills.Crunches.buff)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.Crunches.skill, config.Skills.Crunches.buff)
          end
        else
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Crunches.skill, config.Skills.Crunches.amount)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.Crunches.skill, config.Skills.Crunches.amount)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.Crunches.skill, config.Skills.Crunches.amount)
          end
        end
        ClearPedSecondaryTask(player)
        StopAnimTask(player, config.Skills.Crunches.animDict, config.Skills.Crunches.anim, 1.0)
        local oob = math.random(1,100)
        if oob >= 85 then
          QBCore.Functions.Notify(config.langs[config.lang].finishspor)
          training = true
          Citizen.Wait(config.SporCd)
          training = false
          QBCore.Functions.Notify(config.langs[config.lang].finishcd)
        end
    end)
  else
    QBCore.Functions.Notify(config.langs[config.lang].cd)
  end
end)


RegisterNetEvent('rz-gym:zbar')
AddEventHandler('rz-gym:zbar',function() 
  local player = PlayerPedId()
  if not training then
    QBCore.Functions.Progressbar('zbar', config.Skills.ZBAR.progress, config.Skills.ZBAR.progressduration, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {
        animDict = config.Skills.ZBAR.animDict,
        anim = config.Skills.ZBAR.anim,
      }, {
        model = "prop_curl_bar_01",
        bone = 28422,
      }, {}, function() 
        if exports['ps-buffs']:HasBuff("gym-strength") then
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.ZBAR.skill, config.Skills.ZBAR.buff)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.ZBAR.skill, config.Skills.ZBAR.buff)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.ZBAR.skill, config.Skills.ZBAR.buff)
          end
        else
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.ZBAR.skill, config.Skills.ZBAR.amount)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.ZBAR.skill, config.Skills.ZBAR.amount)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.ZBAR.skill, config.Skills.ZBAR.amount)
          end
        end
        ClearPedSecondaryTask(player)
        StopAnimTask(player, config.Skills.ZBAR.animDict, config.Skills.ZBAR.anim, 1.0)
        local oob = math.random(1,100)
        if oob >= 85 then
          QBCore.Functions.Notify(config.langs[config.lang].finishspor)
          training = true
          Citizen.Wait(config.SporCd)
          training = false
          QBCore.Functions.Notify(config.langs[config.lang].finishcd)
        end
    end)
  else
    QBCore.Functions.Notify(config.langs[config.lang].cd)
  end
end)

RegisterNetEvent('rz-gym:pushups')
AddEventHandler('rz-gym:pushups',function() 
  local player = PlayerPedId()
  if not training then
    QBCore.Functions.Progressbar('pushups', config.Skills.Pushups.progress, config.Skills.Pushups.progressduration, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {
        animDict = config.Skills.Pushups.animDict,
        anim = config.Skills.Pushups.anim,
      }, {}, {}, function() 
        if exports['ps-buffs']:HasBuff("gym-strength") then
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Pushups.skill, config.Skills.Pushups.buff)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.Pushups.skill, config.Skills.Pushups.buff)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.Pushups.skill, config.Skills.Pushups.buff)
          end
        else
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Pushups.skill, config.Skills.Pushups.amount)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.Pushups.skill, config.Skills.Pushups.amount)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.Pushups.skill, config.Skills.Pushups.amount)
          end
        end
        ClearPedSecondaryTask(player)
        StopAnimTask(player, config.Skills.Pushups.animDict, config.Skills.Pushups.anim, 1.0)
        local oob = math.random(1,100)
        if oob >= 85 then
          QBCore.Functions.Notify(config.langs[config.lang].finishspor)
          training = true
          Citizen.Wait(config.SporCd)
          training = false
          QBCore.Functions.Notify(config.langs[config.lang].finishcd)
        end	
    end)
  else
    QBCore.Functions.Notify(config.langs[config.lang].cd)
  end
end)

RegisterNetEvent('rz-gym:yoga')
AddEventHandler('rz-gym:yoga',function() 
  local player = PlayerPedId()
  if not training then
    QBCore.Functions.Progressbar('yoga', config.Skills.Yoga.progress, config.Skills.Yoga.progressduration, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {
        animDict = config.Skills.Yoga.animDict,
        anim = config.Skills.Yoga.anim,
      }, {}, {}, function() 
        if exports['ps-buffs']:HasBuff("gym-stamina") then
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Yoga.skill, config.Skills.Yoga.buff)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.Yoga.skill, config.Skills.Yoga.buff)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.Yoga.skill, config.Skills.Yoga.buff)
          end
        else
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Yoga.skill, config.Skills.Yoga.amount)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.Yoga.skill, config.Skills.Yoga.amount)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.Yoga.skill, config.Skills.Yoga.amount)
          end
        end
        ClearPedSecondaryTask(player)
        StopAnimTask(player, config.Skills.Yoga.animDict, config.Skills.Yoga.anim, 1.0)
        local oob = math.random(1,100)
        if oob >= 85 then
          QBCore.Functions.Notify(config.langs[config.lang].finishspor)
          training = true
          Citizen.Wait(config.SporCd)
          training = false
          QBCore.Functions.Notify(config.langs[config.lang].finishcd)
        end	
    end)
  else
    QBCore.Functions.Notify(config.langs[config.lang].cd)
  end
end)

RegisterNetEvent('rz-gym:meditation')
AddEventHandler('rz-gym:meditation',function() 
  local player = PlayerPedId()
  if not training then
    QBCore.Functions.Progressbar('meditation', config.Skills.Meditation.progress, config.Skills.Meditation.progressduration, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {
        animDict = config.Skills.Meditation.animDict,
        anim = config.Skills.Meditation.anim,
      }, {}, {}, function() 
        if exports['ps-buffs']:HasBuff("gym-stamina") then
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Meditation.skill, config.Skills.Meditation.buff)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.Meditation.skill, config.Skills.Meditation.buff)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.Meditation.skill, config.Skills.Meditation.buff)
          end
        else
          if config.SkillSystem == 'gamz-skillsystem' then
            exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Meditation.skill, config.Skills.Meditation.amount)
          elseif config.SkillSystem == 'mz-skills' then
            exports["mz-skills"]:UpdateSkill(config.Skills.Meditation.skill, config.Skills.Meditation.amount)
          elseif config.SkillSystem == 'B1-skillz' then
            exports["B1-skillz"]:UpdateSkill(config.Skills.Meditation.skill, config.Skills.Meditation.amount)
          end
        end
        ClearPedSecondaryTask(player)
        StopAnimTask(player, config.Skills.Meditation.animDict, config.Skills.Meditation.anim, 1.0)
        local oob = math.random(1,100)
        if oob >= 85 then
          QBCore.Functions.Notify(config.langs[config.lang].finishspor)
          training = true
          Citizen.Wait(config.SporCd)
          training = false
          QBCore.Functions.Notify(config.langs[config.lang].finishcd)
        end
    end)
  else
    QBCore.Functions.Notify(config.langs[config.lang].cd)
  end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(config.SwimmingLoopTime)
    local playerPed = PlayerPedId()
    if IsPedSwimmingUnderWater(playerPed) then
      if config.SkillSystem == 'gamz-skillsystem' then
        exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Swimming.skill, config.Skills.Swimming.amount)
        exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Swimming.skill2, config.Skills.Swimming.amount2)
      elseif config.SkillSystem == 'mz-skills' then
        exports["mz-skills"]:UpdateSkill(config.Skills.Swimming.skill, config.Skills.Swimming.amount)
        exports["mz-skills"]:UpdateSkill(config.Skills.Swimming.skill2, config.Skills.Swimming.amount2)
      elseif config.SkillSystem == 'B1-skillz' then
        exports["B1-skillz"]:UpdateSkill(config.Skills.Swimming.skill, config.Skills.Swimming.amount)
        exports["B1-skillz"]:UpdateSkill(config.Skills.Swimming.skill2, config.Skills.Swimming.amount2)
      end
    end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(config.DrivingLoopTime)
		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsUsing(ped)
    if DoesEntityExist(vehicle) then
      if GetPedInVehicleSeat(vehicle, -1) == ped then
          local speed = GetEntitySpeed(vehicle) -- * 3.6
          if GetVehicleClass(vehicle) == 8 or GetVehicleClass(vehicle) == 13 and speed >= 5 then
              local rotation = GetEntityRotation(vehicle)
              if IsControlPressed(0, 210) then
                  if rotation.x >= 25.0 then
                    if config.SkillSystem == 'gamz-skillsystem' then
                      exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Wheelie.skill, config.Skills.Wheelie.amount)
                    elseif config.SkillSystem == 'mz-skills' then
                      exports["mz-skills"]:UpdateSkill(config.Skills.Wheelie.skill, config.Skills.Wheelie.amount)
                    elseif config.SkillSystem == 'B1-skillz' then
                      exports["B1-skillz"]:UpdateSkill(config.Skills.Wheelie.skill, config.Skills.Wheelie.amount)
                    end
                  end 
              end
          end
          if speed >= config.DrivingMinSpeed then
            if config.SkillSystem == 'gamz-skillsystem' then
              exports["gamz-skillsystem"]:UpdateSkill(config.Skills.Driving.skill, config.Skills.Driving.amount)
            elseif config.SkillSystem == 'mz-skills' then
              exports["mz-skills"]:UpdateSkill(config.Skills.Driving.skill, config.Skills.Driving.amount)
            elseif config.SkillSystem == 'B1-skillz' then
              exports["B1-skillz"]:UpdateSkill(config.Skills.Driving.skill, config.Skills.Driving.amount)
            end
          end
      end
		end
	end
end)

Citizen.CreateThread(function()
	for _, info in pairs(config.Blip) do
    if info.showBlip then
      info.blip = AddBlipForCoord(info.blipcoords.x, info.blipcoords.y, info.blipcoords.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.6)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
	end
end)

RegisterNetEvent("rz-gym:shop")
AddEventHandler("rz-gym:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "GymShop", config.GymShop)
end)
