Config = {}

Config.UpdateFrequency = 300 -- seconds interval between removing values 

Config.Skills = {
    ["Stamina"] = {
        ["Menu"] = true,
        ["Current"] = 10, -- Default value 
        ["RemoveAmount"] = 0, -- % to remove when updating,
        ["Stat"] = "MP0_STAMINA" -- GTA stat hashname
    },

    ["Strength"] = {
        ["Menu"] = true,
        ["Current"] = 5,
        ["RemoveAmount"] = 0,
        ["Stat"] = "MP0_STRENGTH"
    },

   ["Lung Capacity"] = {
        ["Menu"] = true,
        ["Current"] = 5,
        ["RemoveAmount"] = 0,
        ["Stat"] = "MP0_LUNG_CAPACITY"
    },

    ["Driving"] = {
        ["Menu"] = true,
        ["Current"] = 0,
        ["RemoveAmount"] = 0,
        ["Stat"] = "MP0_DRIVING_ABILITY"
    },

    ["Wheelie"] = {
        ["Menu"] = true,
        ["Current"] = 0,
        ["RemoveAmount"] = 0,
        ["Stat"] = "MP0_WHEELIE_ABILITY"
    }
}
