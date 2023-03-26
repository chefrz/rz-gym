config = {}
config.SporCd = 20000
config.SkillSystem = "gamz-skillsystem" -- gamz-skillsystem-- mz-skills -- B1-skillz
config.DrivingLoopTime = 5000
config.SwimmingLoopTime = 30000
config.DrivingMinSpeed = 20
config.lang = "en"

config.Skills = {
    ['Jogging'] = {
        skill = 'Stamina', 
        amount = 0.30,  
        buff = 0.60,
        progress = 'Jogging', 
        progressduration = 10000, 
        animDict = "move_m@jogger",
        anim = "idle",
        event = "rz-gym:jogging",
        icon = "fas fa-person-running",
        label = 'Jogging'
    },
    ['Chinups'] = {
        skill = 'Strength', 
        amount = 0.30, 
        buff = 0.60,
        progress = 'Chinups', 
        progressduration = 10000, 
        animDict = "amb@prop_human_muscle_chin_ups@male@base",
        anim = "base",
        event = 'rz-gym:chinup',
        icon = "fas fa-up",
        label = 'Chinups'
    },
    ['Crunches'] = {
        skill = 'Stamina', 
        amount = 0.30, 
        buff = 0.60,
        progress = 'Crunches', 
        progressduration = 10000, 
        animDict = "amb@world_human_sit_ups@male@idle_a",
        anim = "idle_a",
        event = 'rz-gym:crunches',
        icon = "fas fa-up",
        label = 'Crunches'
    },
    ['ZBAR'] = {
        skill = 'Strength', 
        amount = 0.30, 
        buff = 0.60,
        progress = 'ZBAR', 
        progressduration = 10000, 
        animDict = "amb@world_human_muscle_free_weights@male@barbell@base",
        anim = "base",
        event = 'rz-gym:zbar',
        icon = "fas fa-dumbbell",
        label = 'ZBAR'
    },
    ['Pushups'] = {
        skill = 'Strength', 
        amount = 0.30, 
        buff = 0.60,
        progress = 'Pushups', 
        progressduration = 10000, 
        animDict = "amb@world_human_push_ups@male@idle_a",
        anim = "idle_d",
        event = 'rz-gym:pushups',
        icon = "fas fa-dumbbell",
        label = 'Pushups'
    },
    ['Yoga'] = {
        skill = 'Stamina', 
        amount = 0.30, 
        buff = 0.60,
        progress = 'Yoga', 
        progressduration = 10000, 
        animDict = "rcmfanatic1maryann_stretchidle_b",
        anim = "idle_e",
        event = 'rz-gym:yoga',
        icon = "fas fa-face-smile",
        label = 'Yoga'
    },
    ['Meditation'] = {
        skill = 'Stamina', 
        amount = 0.30, 
        buff = 0.60,
        progress = 'Meditation', 
        progressduration = 10000, 
        animDict = "rcmcollect_paperleadinout@",
        anim = "meditiate_idle",
        event = "rz-gym:meditation",
        icon = "fas fa-face-smile",
        label = 'Meditation',
    },

    ['Swimming'] = {
        skill = 'Lung Capacity', 
        amount = 0.15, 
        skill2 = 'Stamina',
        amount2 = 0.1, 
    },

    ['Driving'] = {
        skill = 'Driving', 
        amount = 0.01, 
    },
    
    ['Wheelie'] = {
        skill = 'Wheelie', 
        amount = 0.5, 
    },
}

config.Locations = { 

    ["jogging"] = {
        [1] = vector3(-1208.73, -1561.56, 4.61),
        [2] = vector3(1779.01, 2494.38, 45.84),
    },

    ["chinup"] = {
        [1] = vector3(-1199.99, -1571.15, 4.61),
    },

    ["crunches"] = {
        [1] = vector3(-1199.65, -1563.75, 4.62),
        [2] = vector3(1777.99, 2499.18, 45.82),
    },

    ["liftweights"] = {
        [1] = vector3(-1202.72,-1565.45, 4.61),
        [2] = vector3(1779.04, 2490.6, 45.82),
    },  

    ["push-ups"] = {
        [1] = vector3(-1207.53, -1566.12, 4.61),
    },

    ["yoga"] = {
        [1] = vector3(-1205.33, -1559.82, 4.6140),
    },

    ["meditation"] = {
        [1] = vector3(-1203.48, -1562.54, 4.61),
        [2] = vector3(1776.37, 2493.19, 45.84),
    },

    ["shop"] = {
        [1] = vector3(-1195.3, -1577.3, 4.61),
    },
}
config.langs = {
    en = {
        finishcd = "Now you can exercise again",
        cd = "You need to rest a little more",
        finishspor = "You Feel Tired",
    }
}

config.Blip = { 
    ["Vecpucci"] = {
        title = "Vespucci Fitness",
        colour=0,
        id=311,
        blipcoords = vector3(-1203.97, -1568.59, 4.61),
        showBlip = true,
    },
    ["Jail"] = {
        title = "Jail",
        colour=2,
        id=311,
        blipcoords = vector3(-2136.16, -150.3, 54.99),
        showBlip = false,
    },
}

config.GymShop = {
    label = "Gym Shop",
    slots = 2,
    items = {
      {
        name = "redbull",
        amount = 1,
        type = "item",
        price = 1,
        slot = 1,
      },
      {
        name = "chocolate",
        amount = 1,
        type = "item",
        price = 1,
        slot = 2,
      },
    }
}