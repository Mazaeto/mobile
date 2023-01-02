local ca1c = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker.CameraShakeInstance)
local cac = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local vailon = getupvalues(cac)
function attack()
    local buoi = vailon[2].activeController.attack
    local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
    local l__CombatFramework__7 = l__ReplicatedStorage__1:WaitForChild("CombatFramework");
    local l__RigControllerEvent__16 = l__ReplicatedStorage__1:WaitForChild("RigControllerEvent");
    pcall(function()
        local u6 = getupvalues(buoi)[4]
        local u7 = getupvalues(buoi)[5]
        local u8 = getupvalues(buoi)[6]
        local u9 = getupvalues(buoi)[7]

        local u12 = (u7 * 798405 + u6 * 727595) % u8;
        local u13 = u6 * 798405;
        u12 = (u12 * u8 + u13) % 1099511627776;
        u7 = math.floor(u12 / u8);
        u6 = u12 - u7 * u8;
        u9 = u9 + 1;

        setupvalue(buoi,4,u6)
        setupvalue(buoi,5,u7)
        setupvalue(buoi,6,u8)
        setupvalue(buoi,7,u9)

        for i, v in pairs(vailon[2].activeController.animator.anims.basic) do
            v:AdjustSpeed(0)
            v:Play()
        end

        local plr = game.Players.LocalPlayer
        local cac = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
        local onhit = {}
        for i,v in pairs(cac.getBladeHits(plr.Character, {plr.Character.HumanoidRootPart},60)) do
            table.insert(onhit, v)
        end
        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(vailon[2].activeController.currentWeaponModel))
        game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u9)
        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", onhit, 1, "") 
    end)
    wait(.1)
end
while wait() do
attack()
end
