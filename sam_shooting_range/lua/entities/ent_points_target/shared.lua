ENT.Type = "anim"

ENT.Base = "base_gmodentity"

ENT.PrintName = "Cible 1"

ENT.Category = "Sam Shooting Range"

ENT.Spawnable = true

function ENT:SetupDataTables()

    self:NetworkVar("Int", 1 , "Points")
    self:NetworkVar("Int", 2 , "PointsLimit")
    self:NetworkVar("Int", 3 , "Level")

    if SERVER then

        self:SetPoints(1400)
        self:SetPointsLimit(0)
        self:SetLevel(1)

    end

end