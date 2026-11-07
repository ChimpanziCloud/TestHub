--[[
    ╔═══════════════════════════════════════════════════════════╗
    ║                                                           ║
    ║      ██████╗  █████╗  ██████╗                             ║
    ║      ██╔══██╗██╔══██╗██╔═══██╗                            ║
    ║      ██████╔╝███████║██║   ██║                            ║
    ║      ██╔══██╗██╔══██║██║   ██║                            ║
    ║      ██████╔╝██║  ██║╚██████╔╝                            ║
    ║      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝                             ║
    ║                                                           ║
    ║      BAO                                                  ║
    ║      Made by bao                                          ║
    ║                                                           ║
    ╚═══════════════════════════════════════════════════════════╝
]]repeat task.wait() until game:IsLoaded()

hookfunction(require(game:GetService('ReplicatedStorage').Effect.Container.Death), function() end)
hookfunction(require(game:GetService('ReplicatedStorage').Effect.Container.Respawn), function() end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local CommF = ReplicatedStorage:WaitForChild("Remotes").CommF_

local World1 = game.PlaceId == 2753915549 or game.PlaceId == 85211729168715
local World2 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
local World3 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089

LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

_G.AutoFarm = true
_G.AutoFarmLevelNew = false
_G.AutoNear = false
_G.AutoBoss = false
_G.AutoFarmMaterial = false
_G.AutoRaidPirate = false
_G.AutoElitehunter = false
_G.AutoRengoku = false
_G.AutoGetTushita = false
_G.AutoHolyTorch = false
_G.AutoYama = false
_G.GetAllSword = false
_G.AutoSecondSea = false
_G.ThirdSea = false
_G.AutoBartilo = false
_G.AutoFactory = false
_G.AutoDarkBoss = false
_G.CursedCaptain = false
_G.Trident = false
_G.Longsword = false
_G.GravityBlade = false
_G.SwodsFlail = false
_G.SwodsDRTrident = false
_G.SwodTwinHooks = false
_G.SwodCanvander = false
_G.SwodsBuddy = false
_G.RipIndraKill = false
_G.KillGolem = false
_G.FarmBlazeEM = false
_G.AutoFishing = true
_G.AutoFindPrehistoric = false
_G.TweenVolcano = false
_G.DefendVolcano = false
_G.CollectBerry = false
_G.FarmChest = false
_G.FarmBone = false
_G.Hallow = false
_G.Rdbone = false
_G.Pray = false
_G.Trylux = false
_G.FarmCake = false
_G.Fullykatakuri = false
_G.KillShark = false
_G.KillPiranha = false
_G.KillFishCrew = false
_G.Autoterrorshark = false
_G.AutoMysticIsland = false
_G.TweenToKitsune = false
_G.AutoAzuerEmber = false
_G.AutoDooHee = false
_G.TweenMGear = false
_G.SailBoat = false
_G.AutoQuestRace = false
_G.AutoKillV4 = false
_G.Kill_Aura = false
_G.SafeMode = true
_G.SelectWeapon = "Melee"
_G.FastAttackDelay = 0.1

local function GetCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function GetHRP()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart")
end

local function GetHumanoid()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChildOfClass("Humanoid")
end

local function CheckQuest()
    MyLevel = LocalPlayer.Data.Level.Value

    if World1 then
        if MyLevel <= 9 then
            Mon = "Bandit"; LevelQuest = 1; NameQuest = "BanditQuest1"; NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, -0, 1, -0, 0.341998369, -0, 0.939700544)
            CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
        elseif MyLevel <= 14 then
            Mon = "Monkey"; LevelQuest = 1; NameQuest = "JungleQuest"; NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, -0, -0, 1, -0, 1, -0, -1, -0, -0)
            CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif MyLevel <= 29 then
            Mon = "Gorilla"; LevelQuest = 2; NameQuest = "JungleQuest"; NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, -0, -0, 1, -0, 1, -0, -1, -0, -0)
            CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif MyLevel <= 39 then
            Mon = "Pirate"; LevelQuest = 1; NameQuest = "BuggyQuest1"; NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, -0, 1, -0, 0.258804798, -0, 0.965929627)
            CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif MyLevel <= 59 then
            Mon = "Brute"; LevelQuest = 2; NameQuest = "BuggyQuest1"; NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, -0, 1, -0, 0.258804798, -0, 0.965929627)
            CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif MyLevel <= 74 then
            Mon = "Desert Bandit"; LevelQuest = 1; NameQuest = "DesertQuest"; NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, -0, 1, -0, 0.573571265, -0, 0.819155693)
            CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif MyLevel <= 89 then
            Mon = "Desert Officer"; LevelQuest = 2; NameQuest = "DesertQuest"; NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, -0, 1, -0, 0.573571265, -0, 0.819155693)
            CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif MyLevel <= 99 then
            Mon = "Snow Bandit"; LevelQuest = 1; NameQuest = "SnowQuest"; NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, -0, 0.939684391, -0, 1, -0, -0.939684391, -0, -0.342042685)
            CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
        elseif MyLevel <= 119 then
            Mon = "Snowman"; LevelQuest = 2; NameQuest = "SnowQuest"; NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, -0, 0.939684391, -0, 1, -0, -0.939684391, -0, -0.342042685)
            CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif MyLevel <= 149 then
            Mon = "Chief Petty Officer"; LevelQuest = 1; NameQuest = "MarineQuest2"; NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif MyLevel <= 174 then
            Mon = "Sky Bandit"; LevelQuest = 1; NameQuest = "SkyQuest"; NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, -0, 0.500031412, -0, 1, -0, -0.500031412, -0, 0.866007268)
            CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif MyLevel <= 189 then
            Mon = "Dark Master"; LevelQuest = 2; NameQuest = "SkyQuest"; NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, -0, 0.500031412, -0, 1, -0, -0.500031412, -0, 0.866007268)
            CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif MyLevel <= 209 then
            Mon = "Prisoner"; LevelQuest = 1; NameQuest = "PrisonerQuest"; NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-9, -0.995993316, 1.60817859e-9, 1, -5.16744869e-9, 0.995993316, -2.06384709e-9, -0.0894274712)
            CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif MyLevel <= 249 then
            Mon = "Dangerous Prisoner"; LevelQuest = 2; NameQuest = "PrisonerQuest"; NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-9, -0.995993316, 1.60817859e-9, 1, -5.16744869e-9, 0.995993316, -2.06384709e-9, -0.0894274712)
            CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif MyLevel <= 274 then
            Mon = "Toga Warrior"; LevelQuest = 1; NameQuest = "ColosseumQuest"; NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, -0, -0.857167721, -0, 1, -0, 0.857167721, -0, -0.515037298)
            CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif MyLevel <= 299 then
            Mon = "Gladiator"; LevelQuest = 2; NameQuest = "ColosseumQuest"; NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, -0, -0.857167721, -0, 1, -0, 0.857167721, -0, -0.515037298)
            CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif MyLevel <= 324 then
            Mon = "Military Soldier"; LevelQuest = 1; NameQuest = "MagmaQuest"; NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, -0, 0.866048813, -0, 1, -0, -0.866048813, -0, -0.499959469)
            CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif MyLevel <= 374 then
            Mon = "Military Spy"; LevelQuest = 2; NameQuest = "MagmaQuest"; NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, -0, 0.866048813, -0, 1, -0, -0.866048813, -0, -0.499959469)
            CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif MyLevel <= 399 then
            Mon = "Fishman Warrior"; LevelQuest = 1; NameQuest = "FishmanQuest"; NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
        elseif MyLevel <= 449 then
            Mon = "Fishman Commando"; LevelQuest = 2; NameQuest = "FishmanQuest"; NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
        elseif MyLevel <= 474 then
            Mon = "God's Guard"; LevelQuest = 1; NameQuest = "SkyExp1Quest"; NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, -0, 1, -0, 0.0871884301, -0, 0.996191859)
            CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
        elseif MyLevel <= 524 then
            Mon = "Shanda"; LevelQuest = 2; NameQuest = "SkyExp1Quest"; NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, -0, 0.906319618, -0, 1, -0, -0.906319618, -0, -0.422592998)
            CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
        elseif MyLevel <= 549 then
            Mon = "Royal Squad"; LevelQuest = 1; NameQuest = "SkyExp2Quest"; NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif MyLevel <= 624 then
            Mon = "Royal Soldier"; LevelQuest = 2; NameQuest = "SkyExp2Quest"; NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif MyLevel <= 649 then
            Mon = "Galley Pirate"; LevelQuest = 1; NameQuest = "FountainQuest"; NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, -0, 0.996196866, -0, 1, -0, -0.996196866, -0, 0.087131381)
            CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        else
            Mon = "Galley Captain"; LevelQuest = 2; NameQuest = "FountainQuest"; NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, -0, 0.996196866, -0, 1, -0, -0.996196866, -0, 0.087131381)
            CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif World2 then
        if MyLevel <= 724 then
            Mon = "Raider"; LevelQuest = 1; NameQuest = "Area1Quest"; NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, -0, -0.974368095, -0, 1, -0, 0.974368095, -0, -0.22495985)
            CFrameMon = CFrame.new(-728.3267211914063, 52.779319763183594, 2345.7705078125)
        elseif MyLevel <= 774 then
            Mon = "Mercenary"; LevelQuest = 2; NameQuest = "Area1Quest"; NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, -0, -0.974368095, -0, 1, -0, 0.974368095, -0, -0.22495985)
            CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif MyLevel <= 799 then
            Mon = "Swan Pirate"; LevelQuest = 1; NameQuest = "Area2Quest"; NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, -0, 0.99026376, -0, 1, -0, -0.99026376, -0, 0.139203906)
            CFrameMon = CFrame.new(1068.664306640625, 137.61428833007813, 1322.1060791015625)
        elseif MyLevel <= 874 then
            Mon = "Factory Staff"; LevelQuest = 2; NameQuest = "Area2Quest"; NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.0773208699999999e-10, -0.0319722369)
            CFrameMon = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
        elseif MyLevel <= 899 then
            Mon = "Marine Lieutenant"; LevelQuest = 1; NameQuest = "MarineQuest3"; NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, -0, 0.500031412, -0, 1, -0, -0.500031412, -0, 0.866007268)
            CFrameMon = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
        elseif MyLevel <= 949 then
            Mon = "Marine Captain"; LevelQuest = 2; NameQuest = "MarineQuest3"; NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, -0, 0.500031412, -0, 1, -0, -0.500031412, -0, 0.866007268)
            CFrameMon = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
        elseif MyLevel <= 974 then
            Mon = "Zombie"; LevelQuest = 1; NameQuest = "ZombieQuest"; NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, -0, -0.95628953, -0, 1, -0, 0.95628953, -0, -0.29242146)
            CFrameMon = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
        elseif MyLevel <= 999 then
            Mon = "Vampire"; LevelQuest = 2; NameQuest = "ZombieQuest"; NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, -0, -0.95628953, -0, 1, -0, 0.95628953, -0, -0.29242146)
            CFrameMon = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
        else
            Mon = "Snow Trooper"; LevelQuest = 1; NameQuest = "SnowMountainQuest"; NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, -0, 0.92718488, -0, 1, -0, -0.92718488, -0, -0.374604106)
            CFrameMon = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
        end
    elseif World3 then
        if MyLevel <= 1524 then
            Mon = "Pirate Millionaire"; LevelQuest = 1; NameQuest = "PiratePortQuest"; NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-450.104645, 107.681458, 5950.72607, 0.957107544, -0, -0.289732844, -0, 1, -0, 0.289732844, -0, 0.957107544)
            CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        elseif MyLevel <= 1574 then
            Mon = "Pistol Billionaire"; LevelQuest = 2; NameQuest = "PiratePortQuest"; NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-450.104645, 107.681458, 5950.72607, 0.957107544, -0, -0.289732844, -0, 1, -0, 0.289732844, -0, 0.957107544)
            CFrameMon = CFrame.new(-54.8110352, 83.7698746, 5947.84082, -0.965929747, -0, 0.258804798, -0, 1, -0, -0.258804798, -0, -0.965929747)
        elseif MyLevel <= 1599 then
            Mon = "Dragon Crew Warrior"; LevelQuest = 1; NameQuest = "DragonCrewQuest"; NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(6750.4931640625, 127.44916534423828, -711.0308837890625)
            CFrameMon = CFrame.new(6709.76367, 52.3442993, -1139.02966, -0.763515472, -0, 0.645789504, -0, 1, -0, -0.645789504, -0, -0.763515472)
        elseif MyLevel <= 1624 then
            Mon = "Dragon Crew Archer"; LevelQuest = 2; NameQuest = "DragonCrewQuest"; NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(6750.4931640625, 127.44916534423828, -711.0308837890625)
            CFrameMon = CFrame.new(6668.76172, 481.376923, 329.12207, -0.121787429, -0, -0.992556155, -0, 1, -0, 0.992556155, -0, -0.121787429)
        elseif MyLevel <= 1649 then
            Mon = "Hydra Enforcer"; LevelQuest = 1; NameQuest = "VenomCrewQuest"; NameMon = "Hydra Enforcer"
            CFrameQuest = CFrame.new(5206.40185546875, 1004.10498046875, 748.3504638671875)
            CFrameMon = CFrame.new(4547.11523, 1003.10217, 334.194824, 0.388810456, -0, -0.921317935, -0, 1, -0, 0.921317935, -0, 0.388810456)
        elseif MyLevel <= 1699 then
            Mon = "Venomous Assailant"; LevelQuest = 2; NameQuest = "VenomCrewQuest"; NameMon = "Venomous Assailant"
            CFrameQuest = CFrame.new(5206.40185546875, 1004.10498046875, 748.3504638671875)
            CFrameMon = CFrame.new(4674.92676, 1134.82654, 996.308838, 0.731321394, -0, -0.682033002, -0, 1, -0, 0.682033002, -0, 0.731321394)
        elseif MyLevel <= 1724 then
            Mon = "Marine Commodore"; LevelQuest = 1; NameQuest = "MarineTreeIsland"; NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2481.09228515625, 74.27049255371094, -6779.640625)
            CFrameMon = CFrame.new(2577.25391, 75.6100006, -7739.87207, 0.499959469, -0, 0.866048813, -0, 1, -0, -0.866048813, -0, 0.499959469)
        elseif MyLevel <= 1774 then
            Mon = "Marine Rear Admiral"; LevelQuest = 2; NameQuest = "MarineTreeIsland"; NameMon = "Marine Rear Admiral"
            CFrameQuest = CFrame.new(2481.09228515625, 74.27049255371094, -6779.640625)
            CFrameMon = CFrame.new(3761.81006, 123.912003, -6823.52197, 0.961273968, -0, 0.275594592, -0, 1, -0, -0.275594592, -0, 0.961273968)
        elseif MyLevel <= 1799 then
            Mon = "Fishman Raider"; LevelQuest = 1; NameQuest = "DeepForestIsland3"; NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, -0, 0.469463557, -0, 1, -0, -0.469463557, -0, -0.882952213)
            CFrameMon = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
        elseif MyLevel <= 1824 then
            Mon = "Fishman Captain"; LevelQuest = 2; NameQuest = "DeepForestIsland3"; NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, -0, 0.469463557, -0, 1, -0, -0.469463557, -0, -0.882952213)
            CFrameMon = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625)
        elseif MyLevel <= 1849 then
            Mon = "Forest Pirate"; LevelQuest = 1; NameQuest = "DeepForestIsland"; NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, -0, 1, -0, 0.707079291, -0, 0.707134247)
            CFrameMon = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
        elseif MyLevel <= 1899 then
            Mon = "Mythological Pirate"; LevelQuest = 2; NameQuest = "DeepForestIsland"; NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, -0, 1, -0, 0.707079291, -0, 0.707134247)
            CFrameMon = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
        elseif MyLevel <= 1924 then
            Mon = "Jungle Pirate"; LevelQuest = 1; NameQuest = "DeepForestIsland2"; NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, -0, 0.996196866, -0, 1, -0, -0.996196866, -0, -0.0871315002)
            CFrameMon = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
        elseif MyLevel <= 1974 then
            Mon = "Musketeer Pirate"; LevelQuest = 2; NameQuest = "DeepForestIsland2"; NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, -0, 0.996196866, -0, 1, -0, -0.996196866, -0, -0.0871315002)
            CFrameMon = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
        elseif MyLevel <= 1999 then
            Mon = "Reborn Skeleton"; LevelQuest = 1; NameQuest = "HauntedQuest1"; NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, -0, -0, 1, -0, 1, -0, -1, -0, -0)
            CFrameMon = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
        elseif MyLevel <= 2024 then
            Mon = "Living Zombie"; LevelQuest = 2; NameQuest = "HauntedQuest1"; NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, -0, -0, 1, -0, 1, -0, -1, -0, -0)
            CFrameMon = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
        elseif MyLevel <= 2049 then
            Mon = "Demonic Soul"; LevelQuest = 1; NameQuest = "HauntedQuest2"; NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            CFrameMon = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
        elseif MyLevel <= 2074 then
            Mon = "Posessed Mummy"; LevelQuest = 2; NameQuest = "HauntedQuest2"; NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            CFrameMon = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
        elseif MyLevel <= 2099 then
            Mon = "Peanut Scout"; LevelQuest = 1; NameQuest = "NutsIslandQuest"; NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            CFrameMon = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
        elseif MyLevel <= 2124 then
            Mon = "Peanut President"; LevelQuest = 2; NameQuest = "NutsIslandQuest"; NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            CFrameMon = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
        elseif MyLevel <= 2149 then
            Mon = "Ice Cream Chef"; LevelQuest = 1; NameQuest = "IceCreamIslandQuest"; NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            CFrameMon = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
        elseif MyLevel <= 2199 then
            Mon = "Ice Cream Commander"; LevelQuest = 2; NameQuest = "IceCreamIslandQuest"; NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            CFrameMon = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
        elseif MyLevel <= 2224 then
            Mon = "Cookie Crafter"; LevelQuest = 1; NameQuest = "CakeQuest1"; NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-8, 0.288177818, 6.9301186999999995e-8, 1, 7.5193121099999995e-8, -0.288177818, -5.2032135e-8, 0.957576931)
            CFrameMon = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
        elseif MyLevel <= 2249 then
            Mon = "Cake Guard"; LevelQuest = 2; NameQuest = "CakeQuest1"; NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-8, 0.288177818, 6.9301186999999995e-8, 1, 7.5193121099999995e-8, -0.288177818, -5.2032135e-8, 0.957576931)
            CFrameMon = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
        elseif MyLevel <= 2274 then
            Mon = "Baking Staff"; LevelQuest = 1; NameQuest = "CakeQuest2"; NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.2214214299999995e-8, 0.250778586, 4.74911062e-8, 1, 1.49904711e-8, -0.250778586, 2.64211941e-8, -0.96804446)
            CFrameMon = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
        elseif MyLevel <= 2299 then
            Mon = "Head Baker"; LevelQuest = 2; NameQuest = "CakeQuest2"; NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.2214214299999995e-8, 0.250778586, 4.74911062e-8, 1, 1.49904711e-8, -0.250778586, 2.64211941e-8, -0.96804446)
            CFrameMon = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
        elseif MyLevel <= 2324 then
            Mon = "Cocoa Warrior"; LevelQuest = 1; NameQuest = "ChocQuest1"; NameMon = "Cocoa Warrior"
            CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
            CFrameMon = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
        elseif MyLevel <= 2349 then
            Mon = "Chocolate Bar Battler"; LevelQuest = 2; NameQuest = "ChocQuest1"; NameMon = "Chocolate Bar Battler"
            CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
            CFrameMon = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
        elseif MyLevel <= 2374 then
            Mon = "Sweet Thief"; LevelQuest = 1; NameQuest = "ChocQuest2"; NameMon = "Sweet Thief"
            CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
            CFrameMon = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
        elseif MyLevel <= 2399 then
            Mon = "Candy Rebel"; LevelQuest = 2; NameQuest = "ChocQuest2"; NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
            CFrameMon = CFrame.new(134.86563110351563, 77.2476806640625, -12876.5478515625)
        elseif MyLevel <= 2424 then
            Mon = "Candy Pirate"; LevelQuest = 1; NameQuest = "CandyQuest1"; NameMon = "Candy Pirate"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
        elseif MyLevel <= 2449 then
            Mon = "Snow Demon"; LevelQuest = 2; NameQuest = "CandyQuest1"; NameMon = "Snow Demon"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375)
        elseif MyLevel <= 2474 then
            Mon = "Isle Outlaw"; LevelQuest = 1; NameQuest = "TikiQuest1"; NameMon = "Isle Outlaw"
            CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632813)
            CFrameMon = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656)
        elseif MyLevel <= 2524 then
            Mon = "Island Boy"; LevelQuest = 2; NameQuest = "TikiQuest1"; NameMon = "Island Boy"
            CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632813)
            CFrameMon = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351563)
        elseif MyLevel <= 2550 then
            Mon = "Isle Champion"; LevelQuest = 2; NameQuest = "TikiQuest2"; NameMon = "Isle Champion"
            CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
            CFrameMon = CFrame.new(-16641.6796875, 235.7825469970703, 1031.282958984375)
        elseif MyLevel <= 2574 then
            Mon = "Serpent Hunter"; LevelQuest = 1; NameQuest = "TikiQuest3"; NameMon = "Serpent Hunter"
            CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, -0, 1, -0, 0.308980465, -0, 0.951068401)
            CFrameMon = CFrame.new(-16521.0625, 106.09285, 1488.78467, 0.469467044, -0, 0.882950008, -0, 1, -0, -0.882950008, -0, 0.469467044)
        else
            Mon = "Skull Slayer"; LevelQuest = 2; NameQuest = "TikiQuest3"; NameMon = "Skull Slayer"
            CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, -0, 1, -0, 0.308980465, -0, 0.951068401)
            CFrameMon = CFrame.new(-16855.043, 122.457253, 1478.15308, -0.999392271, -0, -0.0348687991, -0, 1, -0, 0.0348687991, -0, -0.999392271)
        end
    end
end

_G.StopTween = false
function TP1(cf)
    local hrp = GetHRP()
    if not hrp then return end
    local dist = (cf.Position - hrp.Position).Magnitude
    local tween = game:GetService("TweenService"):Create(hrp, TweenInfo.new(dist / 300, Enum.EasingStyle.Linear), {CFrame = cf})
    tween:Play()
    _G.TweenConn = tween
end

function StopTween(enabled)
    if not enabled then
        _G.StopTween = true
        if _G.TweenConn then pcall(function() _G.TweenConn:Cancel() end) end
        _G.StopTween = false
    end
end

function AutoHaki()
    local char = LocalPlayer.Character
    if char and not char:FindFirstChild("HasBuso") then
        CommF:InvokeServer("Buso")
    end
end

function EquipWeapon(name)
    if not name then return end
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if not bp then return end
    local tool = bp:FindFirstChild(name)
    if tool then
        local hum = GetHumanoid()
        if hum then hum:EquipTool(tool) end
    end
end

function UnEquipWeapon(name)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild(name) then
        _G.NotAutoEquip = true
        task.wait(0.5)
        char:FindFirstChild(name).Parent = LocalPlayer.Backpack
        task.wait(0.1)
        _G.NotAutoEquip = false
    end
end

_G.BringMonster = true
PosMon = nil
MonFarm = nil
StartBring = false

function BringMob(name)
    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
        if mob.Name == name and mob.Parent and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
            local hrp = GetHRP()
            if hrp and (mob.HumanoidRootPart.Position - hrp.Position).Magnitude <= 350 then
                mob.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, 0, 3)
                mob.Humanoid.JumpPower = 0
                mob.Humanoid.WalkSpeed = 0
                mob.HumanoidRootPart.Transparency = 1
                mob.HumanoidRootPart.CanCollide = false
                mob.Head.CanCollide = false
                if mob.Humanoid:FindFirstChild("Animator") then
                    mob.Humanoid.Animator:Destroy()
                end
                if not mob.HumanoidRootPart:FindFirstChild("Lock") then
                    local bv = Instance.new("BodyVelocity")
                    bv.Parent = mob.HumanoidRootPart
                    bv.Name = "Lock"
                    bv.MaxForce = Vector3.new(100000, 100000, 100000)
                    bv.Velocity = Vector3.new(0, 0, 0)
                end
                sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                mob.Humanoid:ChangeState(11)
            end
        end
    end
end

task.spawn(function()
    while task.wait() do
        if _G.AutoFarm then
            pcall(function()
                CheckQuest()
                local quest = LocalPlayer.PlayerGui.Main.Quest
                local title = quest.Container.QuestTitle.Title.Text

                if not string.find(title, NameMon) then
                    StartBring = false
                    CommF:InvokeServer("AbandonQuest")
                end

                if quest.Visible == false then
                    StartBring = false
                    TP1(CFrameQuest)
                    if (CFrameQuest.Position - GetHRP().Position).Magnitude <= 20 then
                        CommF:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                elseif quest.Visible == true then
                    local found = false
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob.Name == Mon and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                            if string.find(title, NameMon) then
                                found = true
                                repeat
                                    task.wait(_G.FastAttackDelay or 0.1)
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    PosMon = mob.HumanoidRootPart.CFrame
                                    TP1(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    mob.HumanoidRootPart.CanCollide = false
                                    mob.Humanoid.WalkSpeed = 0
                                    mob.Head.CanCollide = false
                                    mob.HumanoidRootPart.Size = Vector3.new(70, 70, 70)
                                    StartBring = true
                                    MonFarm = mob.Name
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                until not _G.AutoFarm or mob.Humanoid.Health <= 0 or not mob.Parent or quest.Visible == false
                            else
                                StartBring = false
                                CommF:InvokeServer("AbandonQuest")
                            end
                            break
                        end
                    end
                    if not found then
                        TP1(CFrameMon)
                        StartBring = false
                        local enemy = Workspace.Enemies:FindFirstChild(Mon)
                        if enemy then
                            TP1(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            CheckQuest()
            for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                if _G.BringMonster and (StartBring and mob.Name == MonFarm or mob.Name == Mon) and mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                    local hrp = GetHRP()
                    if hrp and (mob.HumanoidRootPart.Position - hrp.Position).Magnitude <= 320 then
                        if PosMon and (mob.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 320 then
                            mob.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            mob.HumanoidRootPart.CFrame = PosMon
                            mob.HumanoidRootPart.CanCollide = false
                            mob.Head.CanCollide = false
                            if mob.Humanoid:FindFirstChild("Animator") then
                                mob.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if _G.SafeMode then
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart") then
                    local hum = char.Humanoid
                    local hrp = char.HumanoidRootPart
                    if hum.Health < hum.MaxHealth * 0.5 then
                        hrp.CFrame = hrp.CFrame + Vector3.new(0, 100, 0)
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.AutoSecondSea and World1 then
            pcall(function()
                if LocalPlayer.Data.Level.Value >= 700 then
                    _G.AutoFarm = false
                    if Workspace.Map.Ice.Door.CanCollide ~= true or Workspace.Map.Ice.Door.Transparency ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                    else
                        repeat task.wait()
                            TP1(CFrame.new(4851.872, 5.651, 718.470))
                        until (CFrame.new(4851.872, 5.651, 718.470).Position - GetHRP().Position).Magnitude <= 3
                        task.wait(1)
                        CommF:InvokeServer("DressrosaQuestProgress", "Detective")
                        EquipWeapon("Key")
                        repeat task.wait()
                            TP1(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        until (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position - GetHRP().Position).Magnitude <= 3
                        task.wait(3)
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.ThirdSea and World2 then
            pcall(function()
                if LocalPlayer.Data.Level.Value >= 1500 then
                    _G.AutoFarm = false
                    if CommF:InvokeServer("ZQuestProgress", "General") == 0 then
                        TP1(CFrame.new(-1926.322, 12.819, 1738.309))
                        if (CFrame.new(-1926.322, 12.819, 1738.309).Position - GetHRP().Position).Magnitude <= 10 then
                            task.wait(1.5)
                            CommF:InvokeServer("ZQuestProgress", "Begin")
                        end
                        task.wait(1.8)
                        if Workspace.Enemies:FindFirstChild("rip_indra") then
                            for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                                if mob.Name == "rip_indra" then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        TP1(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                        mob.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        mob.HumanoidRootPart.CanCollide = false
                                        mob.Humanoid.WalkSpeed = 0
                                        CommF:InvokeServer("TravelZou")
                                    until mob.Humanoid.Health <= 0 or not mob.Parent
                                end
                            end
                        elseif (CFrame.new(-26880.933, 22.848, 473.189).Position - GetHRP().Position).Magnitude <= 1000 then
                            TP1(CFrame.new(-26880.933, 22.848, 473.189))
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.AutoBoss and _G.SelectBoss then
            pcall(function()
                if Workspace.Enemies:FindFirstChild(_G.SelectBoss) then
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob.Name == _G.SelectBoss and mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                mob.HumanoidRootPart.CanCollide = false
                                mob.Humanoid.WalkSpeed = 0
                                mob.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                TP1(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.AutoBoss or mob.Humanoid.Health <= 0
                        end
                    end
                elseif ReplicatedStorage:FindFirstChild(_G.SelectBoss) then
                    local mob = ReplicatedStorage:FindFirstChild(_G.SelectBoss)
                    TP1(mob.HumanoidRootPart.CFrame * CFrame.new(5, 10, 2))
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.AutoNear then
            pcall(function()
                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                        local hrp = GetHRP()
                        if hrp and (hrp.Position - mob.HumanoidRootPart.Position).Magnitude <= 5000 then
                            repeat task.wait(_G.FastAttackDelay or 0.1)
                                StartBring = true
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                TP1(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                mob.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                mob.HumanoidRootPart.Transparency = 1
                                mob.Humanoid.JumpPower = 0
                                mob.Humanoid.WalkSpeed = 0
                                mob.HumanoidRootPart.CanCollide = false
                                MonFarm = mob.Name
                            until not _G.AutoNear or mob.Humanoid.Health <= 0 or not mob.Parent
                            StartBring = false
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoHaki then
            pcall(AutoHaki)
        end
    end
end)

pcall(function()
    settings().Rendering.QualityLevel = "Level01"
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 9e9
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Enabled = false
        end
    end
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    local hum = GetHumanoid()
    if hum and _G.InfJump ~= false then
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local hrp = GetHRP()
            if hrp and hrp.Position.Y < -100 then
                hrp.CFrame = CFrame.new(0, 50, 0)
            end
        end)
    end
end)

pcall(function()
    local hum = GetHumanoid()
    if hum then hum.WalkSpeed = 32 end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = 32 end
end)

game:GetService("Players").PlayerRemoving:Connect(function(plr)
    if plr == LocalPlayer then
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
end)

print("[Bao Hub] Blox Fruits Loaded")
print("bao Hub")