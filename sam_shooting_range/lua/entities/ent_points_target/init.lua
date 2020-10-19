AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/slownls_firearms/target.mdl")

    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self:SetUseType(SIMPLE_USE)

    self.timer = CurTime()

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then

        phys:Wake()
    
    end
    

end

function ENT:Think()

    self:SetPointsLimit(150 * self:GetLevel())

    if self:GetPoints() >= 1500 then

        self:SetPoints(1500)

    end

    if self:GetLevel() != 10 then

    if self:GetPoints() >= self:GetLevel() * 150 then

        self:SetLevel(self:GetLevel() + 1)

    end

    end

end

function ENT:OnTakeDamage(dmginfo)

    self:SetPoints(self:GetPoints() + 1)

end

function ENT:Use(ent, caller)

    if self:GetPoints() != 0 then
        
        self:SetPoints(0)
        self:SetLevel(1)
        DarkRP.notify(caller,0,7,"Score du stand de tir réinitialisé")
        
    end

    print()

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