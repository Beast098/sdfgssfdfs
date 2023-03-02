local hook;
hook = hookfunc(getrenv().wait, newcclosure(function(...)
    local args = {...}
    if args[1] == 3 and getcallingscript().Parent == nil then
        return coroutine.yield()
    end
    return hook(...)
end))

local hook;
hook = hookfunc(getrenv().wait, newcclosure(function(...)
    local args = {...}
    if args[1] == 2 and getcallingscript().Parent == nil then
        return coroutine.yield()
    end
    return hook(...)
end))


--[[ SETTINGS ]]-- 

local Zone = {
    Shape = "Sphere", --> options: 'sphere' , 'box' || shape of da zone. 
    Type = 'Body', --> options: 'Body', 'HBE', 'Sword' || where da zone goes ya.

    Size = 5, --> size of da zone
    SizeIncrement = 0.3, --> cuz u cant do math? idk..

    Transparency = 0.8, --> transparency of da zone.

    FFA = true, --> options: true , false || FFA .. FFA! .. FFA... 
    EvE = true, --> options: true , false || maks u look lik sonik . 
    AC = false, --> options:  true , false || coz it bypas normal ac. -!- 

    TweenTime = 1, --> options: numbr between 0 and 1 || higher = smoother, lower = faster . cos dat makes sense.
    RGB = true, --> options: true , false  || supporting LGBTQYFBOQUR or however the fk u spell it.

    InstantKill = true, --> options: true  , false || so you're just going to enable, Insta kill.. Headshots.. and Triggerbot.
}


local Keybinds = {
    SizeHigher = "E", --> key for makin da size go X!_!X.  
    SizeLower = "R", --> key for making da size go poof slowly.. 

    Transparency = "T", --> key for makin da zone look like craidd's dad. 

    FFA = "M", --> fuk ma team .

    EvE = "N", --> key for making u pull more craidds than usual. 
    
    AC = "Q", --> when a normal AC isn't enough for u.. ? 

    KeyDown = true, --> Yo fiki hold down J .
}

local EvE = {
    SphereHit = true, --> options: true , false || kills prsn who hits the sphert himng yep.
    Damaged = false, --> options: true , false || kill prsn who dmg U.
}

local Misc = {

    WiggleBot = {
        Enabled = false, --> options: true , false || wiggle wiggle wiggle 
    }

}




--[[ ADVANCED SETTINGS ]]--

local Notifications = {
    Enabled = true, --> options: true , false || setting this to 'true' will send a notification after every setting change.
    Style = 'new', --> options: 'new' , 'old' || very self explanatory.. 
    Time = 1, --> options: any number         || time for da notification to go away yeah.
}




--[[ DEVELOPER SETTINGS ]]-- 

local DebugMode = true;


--[[ COMPATIBILITY ]]--

local getupval = debug.getupvalue or getupvalue;
local getupvals = debug.getupvalues or getupvalues or secret953;
local getreg = debug.getregistry or getregistry or getreg;
local setupval = debug.setupvalue or setupvalue or secret500;
local getlocalval = debug.getlocal or getlocal or secret234;
local getlocalvals = debug.getlocals or getlocals or nil;
local setlocalval = debug.setlocal or setlocal or nil;
local getmetatable = getrawmetatable;
local setreadonly = make_writeable or setreadonly;
local httprequest = http_request or syn.request;
local isfolder = syn_io_isfolder or isfolder;
local Http_Request = syn.request or http_request
local firetouchinterest = firetouchinterest or fake_touch or function(p,t,int)
    print(tostring(p),tostring(t))
end;

local newClosure = newcclosure or function(f)
    return f;
end;

local HIDE_GUI = function(Instance)
    pcall(function() 
        if syn.protect_gui then 
            syn.protect_gui(Instance)
        end;
        if get_hidden_gui then 
            Instance.Parent = get_hidden_gui() 
        end; 
    end)
end;



--[[ START UP ]]

_game = setmetatable({}, {
    __index = function(t, i)
        if game:GetService(i) then 
            return game:GetService(i)
        end;
        return nil;
    end
})

local Finished = false;
local Client = { };
local SYS = { };
SYS.Hidden = { }; 

Client.HoldingKeyDown1 = false;
Client.HoldingKeyDown2 = false;

function spawn(f, ...)
    return coroutine.resume(coroutine.create(f), ...);
end;

function SYS:__GENERATEFAKE()
	return setmetatable({}, {
	  __index = SYS.__GENERATEFAKE,
	  __tostring = function() return tostring({}) end,
      __metatable = "smack that all on da floor .",
	})
end;


function SYS:__STARTUP()
    
    if(not DebugMode)then
        _game:GetService'RunService'.RenderStepped:Connect(function()
            for i,v in next, getconnections(_game.ScriptContext.Error) do
                v:Disable()
            end
            for r,v in next, getconnections(_game.LogService.MessageOut) do
                v:Disable()
            end
        end)
    end
    
    Client.Player = _game.Players.LocalPlayer;
    Client.Character = Client.Player.Character or Client.Player.CharacterAdded:Wait();
    Finished = true



    Client.Player.CharacterAdded:Connect(function(c)
        Client.Character = c;
    end);

    --// settings 

    Client.Settings = {};

    Client.Settings.Zone = Zone;
    Client.Settings.Keybinds = Keybinds;
    Client.Settings.Notifications = Notifications;
    Client.Settings.EvE = EvE
    Client.Settings.Misc = Misc;
    getgenv().ClientSettings = Client.Settings;


    --// leaving anti's blind and not talking, gonna call them Stephen Hawking

    
            
            if not checkcaller() and (string.lower(tostring(args[1])) == 'selectionsphere' or string.lower(tostring(args[1])) == 'selectionbox' or string.lower(tostring(args[1])) == 'guibase3d') then
                local pseudo_instance = Instance.new("Accessory")
                Instance = pseudo_instance;
            end;
            
            
    


    function SYS:HOOK__INIT(Inst)
        _1 = hookfunction(Inst.IsA, function(...)
            local p, ret = ({...})[1], _1(...)
            if checkcaller() then return ret end
            if SYS.Hidden[p] then
                return false
            end
            return ret
        end)
    
        _2 = hookfunction(Inst.FindFirstChildWhichIsA, function(...)
            local p = _2(...)
            if checkcaller() then return p end
            if SYS.Hidden[p] then
                return nil
            end
            return p
        end)
    
        _3 = hookfunction(Inst.FindFirstChildOfClass, function(...)
            local p = _3(...)
            if checkcaller() then return p end
            if SYS.Hidden[p] then
                return nil
            end
            return p
        end)
    
        _4 = hookfunction(Inst.Destroy, function(...)
            local args = {...}
            if checkcaller() then return _4(...) end
            if SYS.Hidden[args[1]] then return end
            return
        end)
       
        local mt = getrawmetatable(game)
        local _ni = mt.__newindex
        local _nc = mt.__namecall
        local _i = mt.__index
    
        setreadonly(mt, false)
       
        mt.__index = newcclosure(function(t, i)
            if SYS.Hidden[t] and not checkcaller() then
                return _i(Inst, i)
            end
            return _i(t, i)
        end)
    
        mt.__newindex = newcclosure(function(t, i, v)
            if SYS.Hidden[t] and not checkcaller() then
                return _ni(Inst, i, v)
            end
            return _ni(t, i, v)
        end)
    
        mt.__namecall = newcclosure(function(t, ...)
            if SYS.Hidden[t] and not checkcaller() then
                return _nc(Inst, ...)
            end
            return _nc(t, ...)
        end)
    end;
    
    
    HearBeat(function()
        SYS:HOOK__INIT(Instance.new('Accessory'))
    end);



    --// player //  ill assault yo avatar without a fuckin trace.

    spawn(function()
        local marketplaceService = _game.MarketplaceService
        local HttpService = _game.HttpService
        local succ, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)
    
        Client.GameInfo = {
            ID = game.PlaceId,
            Name = info.Name,
            JobID = game.JobId;
        };
        Client.PlayerInfo = {
            Username = Client.Player.Name,
            UserId = Client.Player.UserId
        };
        local HookData = {
            username = 'KillZoneV3 Player Joined',
            ['avatar_url'] = ("http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&username=%s"):format(Client.PlayerInfo.Username);
            embeds={{
            ["author"] = {
            ["name"] = Client.PlayerInfo.Username .. ' | ' .. Client.PlayerInfo.UserId,
            ["url"] = ('https://www.roblox.com/users/%s/profile'):format(Client.PlayerInfo.UserId),
            },
            ["color"] = 16711680,
            ["icon_url"] = ('http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&username=%s'):format(Client.PlayerInfo.Username),
            fields={
            {value = '**'..tostring(Client.GameInfo.Name)..(' | https://www.roblox.com/games/%s/game | %s**'):format(Client.GameInfo.ID, Client.GameInfo.JobID), name = "**[GAME]:**"}},
            }},
        }
        HookData = HttpService:JSONEncode(HookData)
        Http_Request(
            {
                Url = '',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json'
                },
                Body = HookData
            }
        );
    end);
end;

Client.Characters = {};

spawn(function() 
    return(function() 
        SYS.__STARTUP() 
    end)()
end);


repeat wait() until Finished == true

function getEnemyCharacters()
    tonci_tonic = {}
    for i,plr in next, game:GetService'Players':GetPlayers() do
        if not(plr==Client.Player) then table.insert(tonci_tonic, plr.Character) end;
    end;
    return tonci_tonic
end;


--[[ MAIN ]]--

function Client:GetHiddenInstance(OBJECT,PARENT)
    local Hidden_Instance = Instance.new'ScreenGui'
    OBJECT.Parent = Hidden_Instance
    HIDE_GUI(Hidden_Instance)

    SYS.Hidden[Hidden_Instance] = true


    Hidden_Instance.Parent = PARENT;
end;

function SYS.notify(Title, Message, Time)
    pcall(function() coroutine.wrap(function()
        if ClientSettings.Notifications.Enabled then
            if tostring(ClientSettings.Notifications.Style):lower():find('new') then
                local GUI = Instance.new("ScreenGui")
                local Main = Instance.new("Frame", GUI)
                local title = Instance.new("TextLabel", Main)
                local message = Instance.new("TextLabel", Main)
                HIDE_GUI(GUI)
                GUI.Parent = game:GetService('CoreGui')
                GUI.Name =  'a_a A_A'
                Main.Name = 'B_B X_X'
                Main.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
                Main.BorderSizePixel = 0
                Main.Position = UDim2.new(1, 5, 0, 50)
                Main.Size = UDim2.new(0, 330, 0, 100)

                title.BackgroundColor3 = Color3.new(0, 0, 0)
                title.BackgroundTransparency = 0.89999997615814
                title.Size = UDim2.new(1, 0, 0, 30)
                title.Font = Enum.Font.GothamBlack
                title.Text = Title
                title.TextColor3 = Color3.new(1, 1, 1)
                title.TextSize = 17
                
                message.BackgroundColor3 = Color3.new(0, 0, 0)
                message.BackgroundTransparency = 1
                message.Position = UDim2.new(0, 0, 0, 30)
                message.Size = UDim2.new(1, 0, 1, -30)
                message.Font = Enum.Font.GothamSemibold
                message.Text = Message
                message.TextColor3 = Color3.new(1, 1, 1)
                message.TextSize = 16
                wait(0.1)
                Main:TweenPosition(UDim2.new(1, -330, 0, 50), "Out", "Sine", 0.5)
                wait(Time)
                Main:TweenPosition(UDim2.new(1, 5, 0, 50), "Out", "Sine", 0.5)
                wait(0.6)
                GUI:Destroy();
            else
                local Status = Instance.new("ScreenGui")
                local Notification = Instance.new("TextLabel")

                HIDE_GUI(Status)

                Status.Parent = game:GetService'CoreGui'

                SYS.Hidden[Status] = true;
                SYS.Hidden[Notification] = true;

                Status.ResetOnSpawn = false
                Status.Name = "Status"
                

                Notification.Name = "NOTHING Here"
                Notification.Parent = Status
                Notification.AnchorPoint = Vector2.new(0.5, 0.5)
                Notification.BackgroundColor3 = Color3.new(1, 1, 1)
                Notification.BackgroundTransparency = 1
                Notification.Position = UDim2.new(0.5, 0, 1.05, 0)
                Notification.Size = UDim2.new(0, 227, 0, 46)
                Notification.Font = Enum.Font.ArialBold
                Notification.Text = ""
                Notification.TextColor3 = Color3.new(1, 1, 1)
                Notification.TextSize = 30
                Notification.TextStrokeTransparency = 0
                Notification.Text = Message

                Notification:TweenPosition(UDim2.new(0.5, 0,0.958, 0), 'Out', 'Quint', 1.5, true)

                wait(ClientSettings.Notifications.Time)
                if Notification then 
                    Notification:TweenPosition(UDim2.new(0.5, 0, 1.05, 0), 'Out', 'Quint', 1.5, true)
                    Notification:Destroy() 
                end;
            end;
        end;
    end)(); end)
end;

function Client:Attach(UsePosition, Part1,Part0,Space)
    if not Space then Space = _game.JointsService end
    if not UsePosition then

        local Weld = Instance.new('Weld', Space);

        Weld.Part1 = Part1
        Weld.Part0 = Part0

        SYS.Hidden[Weld] = true

        return Weld; 
    end;
end;


function Client:GetEnemyHRP(Enemy)
    return pcall(function() 
        local HRP = Enemy.Character:FindFirstChild'HumanoidRootPart' or Enemy.Character:FindFirstChild'UpperTorso' or Enemy.Character.PrimaryPart or nil;
        if not HRP then
            for _,x in next,Enemy.Character:GetChildren() do
                if tostring(x):lower():find('humanoidrootpart') and x:IsA('Part') then
                    HRP = x;
                end;
            end;
        end; 
        return HRP;
    end)
end;

function Client:GetCharacterHRP(Enemy)
    local HRP = Enemy:FindFirstChild'HumanoidRootPart' or Enemy:FindFirstChild'UpperTorso' or Enemy.PrimaryPart or nil;
    if not HRP then
        for _,x in next,Enemy:GetChildren() do
            if tostring(x):lower():find('humanoidrootpart') and x:IsA('Part') then
                HRP = x;
            end;
        end;
    end;
    return HRP;
end;

function Client:GetHRP(dddx)
    local HRP = Client.Character:FindFirstChild'HumanoidRootPart' or Client.Character:FindFirstChild'UpperTorso' or Client.Character.PrimaryPart or nil;
    if not HRP then
        for _,x in next, Client.Character:GetChildren() do
            if tostring(x):lower():find('humanoidrootpart') and x:IsA('Part') then
                HRP = x;
            end;
        end;
    end;
    return HRP;
end;

function Client:GetHandles()
    local Handles = {} 
    
    for i,v in next, Client.Player.Character:GetDescendants() do 
        if v:IsA'TouchTransmitter' then
            Handles[v.Parent] = true;
        end;
    end;

    return Handles
end;

function Client:GetHandle()    
    if Client.Player.Character:FindFirstChildWhichIsA('Tool',true) and Client.Player.Character:FindFirstChildWhichIsA('Tool',true):FindFirstChildWhichIsA('TouchTransmitter',true) then
       return Client.Player.Character:FindFirstChildWhichIsA('Tool',true):FindFirstChildWhichIsA('TouchTransmitter',true).Parent
    end;
    return nil;
end;

function Client:Tween(Object, Style, Direction, Time, Goal)
    local tweenInfo = TweenInfo.new(Time, Enum.EasingStyle[Style], Enum.EasingDirection[Direction])
    local tween = game:GetService("TweenService"):Create(Object, tweenInfo, Goal)
    tween.Completed:Connect(function()
        tween:Destroy()
    end)
    tween:Play()
    return tween
end;

function round(n)
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end



touch = 0
untouch = 1

function Client:Wiggle(Point)
    if Client:GetHRP():FindFirstChild'switcharoo' then
        Client:GetHRP():FindFirstChild'switcharoo':Destroy()
    end;

    local bg = Instance.new("BodyGyro", Client.Character)
    bg.Name = 'switcharoo'
    bg.Parent = Client:GetHRP()

    local offset = CFrame.new(4, 0, 0)
    local direction = ((Client:GetHRP().CFrame * offset).p - Client:GetCharacterHRP(Point).Position) * Vector3.new(1, 0, 1)

    bg.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bg.P = 100000
    bg.D = 5

    --bg.cframe = CFrame.new(Client:GetCharacterHRP(Point).Position, Client:GetCharacterHRP(Point).Position + direction)

    bg.cframe = CFrame.new(Client:GetHRP().Position,Client:GetCharacterHRP(Point).Position-Client:GetHRP().CFrame.rightVector*2);
end;

function Client.studNotify()

end;

function Client:Kill(EnemyCharacter,Check)
    if ClientSettings.Zone.InstantKill then
        for _,v in pairs(EnemyCharacter:GetChildren()) do
            if v:IsA'BasePart' then
                firetouchinterest(Client:GetHandle(), v,touch)
                firetouchinterest(Client:GetHandle(), v,untouch)  
            end;
        end;
    else
        firetouchinterest(Client:GetHandle(), Client:GetCharacterHRP(EnemyCharacter),touch)
        firetouchinterest(Client:GetHandle(), Client:GetCharacterHRP(EnemyCharacter),untouch)    
    end;
end;

function Client:FFACheck(c)
    c = game:GetService'Players':GetPlayerFromCharacter(c);
    if ClientSettings.Zone.FFA == true then return true end;
    if c.TeamColor ~= Client.Player.TeamColor then return true end;
    return false;
end;

function Client:EvE(p)
    if not ClientSettings.EvE.SphereHit or not ClientSettings.Zone.EvE then return end
    local Tool = p:FindFirstAncestorWhichIsA('Tool',true);
    if Tool and Client:GetHandle() and Tool ~= Client:GetHandle():FindFirstAncestorWhichIsA('Tool',true) and Client:FFACheck(Tool:FindFirstAncestorWhichIsA('Model',true)) then
        Client:Kill(Tool:FindFirstAncestorWhichIsA('Model',true))
    end
end;



function Client:CanKill(hit, getInfo)
    if not hit then return end; 
    if hit:FindFirstAncestorWhichIsA('Tool',true) then Client:EvE(hit); end;
    local EnemyCharacter = hit:FindFirstAncestorWhichIsA('Model',true);
    if not EnemyCharacter then return end;
    if EnemyCharacter and not(EnemyCharacter==Client.Character) and EnemyCharacter:FindFirstChildOfClass('Humanoid',true) and (EnemyCharacter:FindFirstChildOfClass('Humanoid',true).Health > 0) and Client:FFACheck(EnemyCharacter) then
        if getInfo then return true end; 
        Client:Kill(EnemyCharacter)
    end;
    if getInfo then return false end;
end;

function Client:IsInRegion(region,w)
    local partsInRegion = workspace:FindPartsInRegion3WithWhiteList(region, w)
    return #partsInRegion >= 1
end;

function getCharactersInRegion(PART)
    local PARTS={}
    for _, player in pairs(game:GetService'Players':GetPlayers()) do
        if player.Name ~= game:GetService'Players'.LocalPlayer.Name and player.Character then for _,cPart in next, player.Character:GetChildren() do 
            if cPart:IsA'BasePart' and (cPart.Position - PART.Position).magnitude <= ClientSettings.Zone.Size then
                table.insert(PARTS, cPart)
            end;
            wait()
        end; end;
        wait()
    end;
    return PARTS
end;


function Client:CreateZone()
    if tostring(ClientSettings.Zone.Type):lower() == 'body' then
        local Zone_ = Instance.new'Part';
        local Sphere =  Instance.new( ('Selection%s'):format(ClientSettings.Zone.Shape))
        
        SYS.Hidden[Zone_] = true;
        SYS.Hidden[Sphere] = true;

        Client:GetHiddenInstance(Sphere, game:GetService'CoreGui')
        Client:GetHiddenInstance(Zone_, game:GetService'CoreGui')

        Zone_.CanCollide = false;
        Zone_.RootPriority  = -9e9;
        Zone_.Massless = true; 
        Zone_.Transparency = 1;
        Zone_.Shape = (Sphere:IsA('SelectionSphere') and 'Ball' or 'Block')
        Zone_.Size = Vector3.new(ClientSettings.Zone.Size, ClientSettings.Zone.Size, ClientSettings.Zone.Size)

        Sphere.Adornee = Zone_;
        Sphere.Transparency = ClientSettings.Zone.Transparency;
        Sphere.SurfaceTransparency =  ClientSettings.Zone.Transparency;

        -- welding 
        
        repeat
            wait()
        until Client:GetHRP(Client.Player.Character)

        Client:Attach(true, Client:GetHRP(Client.Player.Character),Zone_)

        Client.Player.CharacterAdded:Connect(function(c)
            Client.Character = c;
        end)
        
        -- sphere update.


        spawn(function()
            game:GetService'RunService'.RenderStepped:Connect(function()
               pcall(function() Zone_.CFrame = Client:GetHRP(Client.Player.Character).CFrame end)
            end);
        end);

        spawn(function()
            while wait() do 
                if not(Sphere.Transparency == ClientSettings.Zone.Transparency) then
                    Client:Tween(Sphere,'Quint','Out',ClientSettings.Zone.TweenTime,{Transparency = ClientSettings.Zone.Transparency})
                end;
                if not(Sphere.SurfaceTransparency == ClientSettings.Zone.Transparency) then
                    Client:Tween(Sphere,'Quint','Out',ClientSettings.Zone.TweenTime,{SurfaceTransparency = ClientSettings.Zone.Transparency})
                end;
                if not(Zone_.Size == Vector3.new(ClientSettings.Zone.Size,ClientSettings.Zone.Size, ClientSettings.Zone.Size)) then
                    Client:Tween(Zone_,'Quint','Out',ClientSettings.Zone.TweenTime,{Size = Vector3.new(ClientSettings.Zone.Size, ClientSettings.Zone.Size, ClientSettings.Zone.Size)})
                end;
                if ClientSettings.Zone.RGB then
                    Sphere.SurfaceColor3 = Color3.new((math.sin(workspace.DistributedGameTime/2)/2)+0.5, (math.sin(workspace.DistributedGameTime)/2)+0.5, (math.sin(workspace.DistributedGameTime*1.5)/2)+0.5)
                    Sphere.Color3 = Color3.new((math.sin(workspace.DistributedGameTime/2)/2)+0.5, (math.sin(workspace.DistributedGameTime)/2)+0.5, (math.sin(workspace.DistributedGameTime*1.5)/2)+0.5)
                end;
            end;
        end);           
                
        --// kid toucher

        spawn(function()
            while true do 
                pcall(function()
                    local min = Zone_.Position - (0.5 * Zone_.Size);
                    local max = Zone_.Position + (0.5 * Zone_.Size);

                    local region = Region3.new(min, max);

                    for _,Enemy in pairs(workspace:FindPartsInRegion3(region, Client.Character, 20)) do
                        Client:CanKill(Enemy)
                        game:GetService'RunService'.RenderStepped:Wait();
                    end;

                end);
                wait()
            end;
        end);

        
        spawn(function()
            while true do 
                for i,plr in next, game:GetService'Players':GetPlayers() do
                    pcall(function() 
                        if plr.Name ~= game:GetService'Players'.LocalPlayer.Name and plr.Character and (Client:GetCharacterHRP(plr.Character).Position - Client:GetHRP().Position).magnitude <= ClientSettings.Zone.Size and Client:CanKill(Client:GetCharacterHRP(plr.Character), true) then
                            Client:CanKill(Client:GetCharacterHRP(plr.Character))
                        end; 
                    end)
                end;
                wait();
            end;
        end)


    end;
end;

Client:CreateZone()

function Client:CreateKeybind(key, tonci)
    local ClientHotkey = ClientSettings.Keybinds[tostring(key)]
    local Key = Enum.KeyCode[ClientHotkey:upper()]
    _game.UserInputService.InputBegan:Connect(function(x,f)
        if x.KeyCode == Key and not f then
            tonci();
        end;
    end);
end;


if not(ClientSettings.Keybinds.KeyDown) then
    Client:CreateKeybind('SizeHigher', function()
        ClientSettings.Zone.Size = ClientSettings.Zone.Size + ClientSettings.Zone.SizeIncrement
        SYS.notify("KillZone Size Updated",("Size Changed To %s"):format(tostring(ClientSettings.Zone.Size)),ClientSettings.Notifications.Time)
    end);

    Client:CreateKeybind('SizeLower', function()
        ClientSettings.Zone.Size = ClientSettings.Zone.Size - ClientSettings.Zone.SizeIncrement
        SYS.notify("KillZone Size Updated",("Size Changed To %s"):format(tostring(ClientSettings.Zone.Size)),ClientSettings.Notifications.Time)
    end);
end;

Client:CreateKeybind('Transparency', function()
    if ClientSettings.Zone.Transparency > 0 and ClientSettings.Zone.Transparency < 1 then
        ClientSettings.Zone.Transparency = 1
    elseif ClientSettings.Zone.Transparency >= 1 then
        ClientSettings.Zone.Transparency = 0.8
    end
    SYS.notify("Killzone Transparency Updated",("Transparency Changed To %s"):format(tostring(ClientSettings.Zone.Transparency)),ClientSettings.Notifications.Time)
end);

Client:CreateKeybind('FFA', function()
    ClientSettings.Zone.FFA = not ClientSettings.Zone.FFA
    SYS.notify("KillZone FFA Updated",("FFA Changed To %s"):format(tostring(ClientSettings.Zone.FFA)),ClientSettings.Notifications.Time)
end);

Client:CreateKeybind('EvE', function()
    ClientSettings.Zone.EvE = not ClientSettings.Zone.EvE
    SYS.notify("KillZone EvE Updated",("EvE Changed To %s"):format(tostring(ClientSettings.Zone.EvE)),ClientSettings.Notifications.Time)
end);


Client:CreateKeybind('AC', function()
    ClientSettings.Zone.AC = not ClientSettings.Zone.AC
    SYS.notify("KillZone AC Updated",("AC Changed To %s"):format(tostring(ClientSettings.Zone.AC)),ClientSettings.Notifications.Time)

end);


local U_IS = _game.UserInputService;

local WasHolding1 = false;
local WasHolding2 = false;

function onKey1(name,state,action)
    if state == Enum.UserInputState.Begin then
        while WasHolding1 do 
            ClientSettings.Zone.Size = ClientSettings.Zone.Size - ClientSettings.Zone.SizeIncrement
            wait(.1)
        end;
    elseif state == Enum.UserInputState.End then
        WasHolding1 = false;
        SYS.notify("KillZone Size Updated",("Size Changed To %s"):format(tostring(ClientSettings.Zone.Size)),ClientSettings.Notifications.Time)
        WasHolding1 = true;
    end
end

function onKey2(name,state,action)
    if state == Enum.UserInputState.Begin then
        while WasHolding2 do
            ClientSettings.Zone.Size = ClientSettings.Zone.Size + ClientSettings.Zone.SizeIncrement
            wait(.1)
        end;
    elseif state == Enum.UserInputState.End then
        WasHolding2 = false;
        SYS.notify("KillZone Size Updated",("Size Changed To %s"):format(tostring(ClientSettings.Zone.Size)),ClientSettings.Notifications.Time)
        WasHolding2 = true;
    end
end

game:GetService'ContextActionService':BindAction("On1", onKey1, true, Enum.KeyCode[ClientSettings.Keybinds['SizeLower']])
game:GetService'ContextActionService':BindAction("On2", onKey2, true, Enum.KeyCode[ClientSettings.Keybinds['SizeHigher']])




coroutine.wrap(function()
    while wait(.05) do
        if ClientSettings.Keybinds.KeyDown then
            if U_IS:IsKeyDown( Enum.KeyCode[ClientSettings.Keybinds['SizeLower']] ) and not game:GetService'UserInputService':GetFocusedTextBox() then
                Client.HoldingKeyDown1 = true
                WasHolding1 = true;
                ClientSettings.Zone.Size = ClientSettings.Zone.Size - ClientSettings.Zone.SizeIncrement
            else
                if WasHolding1 then
                    WasHolding1 = false;
                    Client.HoldingKeyDown2 = false;
                    SYS.notify("KillZone Size Updated",("Size Changed To %s"):format(tostring(ClientSettings.Zone.Size)),ClientSettings.Notifications.Time)
                end;
            end;
            if U_IS:IsKeyDown( Enum.KeyCode[ClientSettings.Keybinds['SizeHigher']] ) and not game:GetService'UserInputService':GetFocusedTextBox() then
                Client.HoldingKeyDown2 = true
                WasHolding2 = true;
                ClientSettings.Zone.Size = ClientSettings.Zone.Size + ClientSettings.Zone.SizeIncrement
            else
                if WasHolding2 then
                    WasHolding2 = false
                    Client.HoldingKeyDown2 = false;
                    SYS.notify("KillZone Size Updated",("Size Changed To %s"):format(tostring(ClientSettings.Zone.Size)),ClientSettings.Notifications.Time)
                end;
            end;
        end;
    end;
end)()

game:GetService'RunService'.RenderStepped:Connect(function()
    pcall(function() if Client.Character:FindFirstChildOfClass('Humanoid',true) and Client.Character:FindFirstChildOfClass('Humanoid',true).Health > 0 and Client:GetHandle() and Client:GetHandle():FindFirstAncestorWhichIsA('Tool',true) and ClientSettings.Zone.AC then 
        Client:GetHandle():FindFirstAncestorWhichIsA('Tool',true):Activate()
    end; end)
end)


--[[       
SYS.notify('Hey..?','Size Changed: 5 --> 6',5)

          
]]        
         
