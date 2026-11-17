--[[
    Blox Fruits Auto Code Redeemer
    Executor-compatible (Delta, Synapse, Fluxus, etc.)
    Auto-claims all known active codes.
]]

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LP = Players.LocalPlayer

--------------------------------------------------------------
-- ALL KNOWN CODES (Active + Legacy — expired ones just fail silently)
--------------------------------------------------------------
local Codes = {
    -- 2x EXP Codes
    "SUB2GAMERROBOT_EXP1",
    "EASTEREXP",
    "LIGHTNINGABUSE",
    "SUB2OFFICIALNOOBIE",
    "AXIORE",
    "BLUXXY",
    "ENYU_IS_PRO",
    "Sub2CaptainMaui",
    "JCWK",
    "Magicbus",
    "TANTAI",
    "StrawHatMaine",
    "kittgaming",
    "Starcodeheo",
    "Bluxxy",

    -- Stat Reset Codes
    "SUB2GAMERROBOT_RESET1",
    "KITT_RESET",
    "Sub2UncleKizaru",

    -- Title Codes
    "BIGNEWS",

    -- Beli Codes
    "Fudd10",
    "Fudd10_v2",

    -- Misc / Joke
    "CHANDLER",

    -- Legacy (may be expired — no harm trying)
    "UPDATE20",
    "UPDATE17",
    "UPDATE16",
    "UPDATE15",
    "UPDATE14",
    "UPDATE13",
    "UPDATE11",
    "UPDATE10",
    "2BILLION",
    "1BILLION",
    "THIRDSEA",
    "SECONDSEA",
    "DEVSCOOKING",
    "ADMIN_REWORK",
    "REWARDFRUIT",
    "1LOSTADMIN",
}

--------------------------------------------------------------
-- FIND CODE REDEMPTION REMOTE
--------------------------------------------------------------
local codeRemote = nil

-- Method 1: Search for known remote names
local searchNames = {"AwardCode", "RedeemCode", "SubmitCode", "CodeRemote", "Redeem"}
for _, name in searchNames do
    local found = ReplicatedStorage:FindFirstChild(name, true)
    if found and (found:IsA("RemoteEvent") or found:IsA("RemoteFunction")) then
        codeRemote = found
        break
    end
end

-- Method 2: Scan all remotes for "code" or "redeem" in name
if not codeRemote then
    for _, v in ReplicatedStorage:GetDescendants() do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            local lower = string.lower(v.Name)
            if string.find(lower, "code") or string.find(lower, "redeem") then
                codeRemote = v
                break
            end
        end
    end
end

if not codeRemote then
    warn("[AutoCodes] Could not find code redemption remote. Listing all remotes:")
    for _, v in ReplicatedStorage:GetDescendants() do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            print("  ", v.ClassName, v:GetFullName())
        end
    end
    return
end

print("[AutoCodes] Found remote:", codeRemote.ClassName, codeRemote:GetFullName())

--------------------------------------------------------------
-- REDEEM ALL CODES
--------------------------------------------------------------
local redeemed, failed = 0, 0

for i, code in Codes do
    local ok, err = pcall(function()
        if codeRemote:IsA("RemoteEvent") then
            codeRemote:FireServer(code)
        elseif codeRemote:IsA("RemoteFunction") then
            codeRemote:InvokeServer(code)
        end
    end)

    if ok then
        redeemed += 1
        print(("[AutoCodes] [%d/%d] Sent: %s"):format(i, #Codes, code))
    else
        failed += 1
        warn(("[AutoCodes] [%d/%d] Failed: %s — %s"):format(i, #Codes, code, tostring(err)))
    end

    task.wait(1.5) -- throttle to avoid rate limit / kick
end

print(("[AutoCodes] Done! Sent: %d | Failed: %d | Total: %d"):format(redeemed, failed, #Codes))
