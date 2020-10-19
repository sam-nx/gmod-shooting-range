ENT.Type = "anim"

ENT.Base = "base_gmodentity"

ENT.PrintName = "Cible 2"

ENT.Category = "Sam Shooting Range"

ENT.Spawnable = true

function ENT:SetupDataTables()

    local randomnumber = math.random(0, 1)

    self:NetworkVar("Int", 1 , "IsDown")
    self:NetworkVar("Int", 2 , "IsHostage")

    if SERVER then

        self:SetIsDown(0)
        self:SetIsHostage(randomnumber)

    end

end