include("shared.lua")

surface.CreateFont( "sam_stand_01", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 100,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

surface.CreateFont( "sam_stand_02", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 35,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

function ENT:Draw()

	self:DrawModel()

    local ang = self:GetAngles()

	ang:RotateAroundAxis(self:GetAngles():Up(), 90)
	ang:RotateAroundAxis(self:GetAngles():Forward(), 180)
	ang:RotateAroundAxis(self:GetAngles():Right(), -90)

	local pos = self:GetPos() +ang:Up() * 1 -ang:Forward() * 30 -ang:Right() * 61

    cam.Start3D2D(pos, ang, 0.1)

        draw.RoundedBox(100, -30, -350, 670, 200, Color(100,100,100,150))

        if self:GetIsHostage() == 0 then

            if self:GetIsDown() == 1 then

                draw.SimpleText("Otage touché!", "sam_stand_01", 300, -305, color_red, TEXT_ALIGN_CENTER)

            else

                draw.SimpleText("Otage", "sam_stand_01", 300, -305, color_blue, TEXT_ALIGN_CENTER)

            end

        elseif self:GetIsHostage() == 1 then

            if self:GetIsDown() == 1 then

                draw.SimpleText("Tireur touché!", "sam_stand_01", 300, -305, color_green, TEXT_ALIGN_CENTER)

            else

                draw.SimpleText("Tireur", "sam_stand_01", 300, -305, color_red, TEXT_ALIGN_CENTER)

            end
        end

		-- surface.SetMaterial( Material "materials/weed.png")
		-- surface.SetDrawColor(255,255,255,255)
		-- surface.DrawTexturedRect( 440, 0, 150, 150 )

	cam.End3D2D()

end