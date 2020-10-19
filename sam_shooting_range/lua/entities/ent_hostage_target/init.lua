AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/props_wasteland/controlroom_storagecloset001a.mdl")

    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self:SetUseType(SIMPLE_USE)

    self.timer = CurTime()

    self:SetNetworkedInt('points', 0)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then

        phys:Wake()
    
    end
    

end

function ENT:Think()

    if self:GetIsHostage() == 0 then

        

    elseif self:GetIsHostage() == 1 then

        self:SetModel("models/player/leet.mdl")

    end

end

function ENT:OnTakeDamage()
    
    self:SetIsDown(1)

end

function ENT:Use(ent, caller)

    local randomnumber = math.random(0, 1)

    if self:GetIsDown() == 1 then

        self:SetIsDown(0)
        self:SetIsHostage(randomnumber)
        DarkRP.notify(caller,0,7,"Cible réinitialisée")

    end

end

function ENT:SpawnFunction(ply, tr, classname)

    if !tr.Hit then return end

    local SpawnPos = tr.HitPos + tr.HitNormal * 120
    local ent = ents.Create(classname)
    local ang = ply:GetAngles()
    ang:RotateAroundAxis(ent:GetAngles():Up(), 0)
    ent:SetPos(SpawnPos)
    ent:SetAngles(ang)
    ent:Spawn()
    ent:Activate()
    ent:DropToFloor()

    return ent


end