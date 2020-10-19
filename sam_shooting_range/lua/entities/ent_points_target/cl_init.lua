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
	
	if self:GetLevel() <= 3 then
		
		self.color01 = color_yellow

	elseif self:GetLevel() >= 7 then

		self.color01 = color_red

	else

		self.color01 = color_orange

	end

    local ang = self:GetAngles()

	ang:RotateAroundAxis(self:GetAngles():Up(), 90)
	ang:RotateAroundAxis(self:GetAngles():Forward(), 180)
	ang:RotateAroundAxis(self:GetAngles():Right(), -90)

	local pos = self:GetPos() +ang:Up() * 1 -ang:Forward() * 30 -ang:Right() * 61

    cam.Start3D2D(pos, ang, 0.1)

		draw.RoundedBox(100, 450, -150, 750, 450, Color(100,100,100,150))

		draw.SimpleText("Niveau " .. self:GetLevel() .. " + ", "sam_stand_01", 820, -105, Color(self.color01), TEXT_ALIGN_CENTER)

		draw.SimpleText("Points: " .. self:GetPoints() .. "/" .. self:GetPointsLimit(), "sam_stand_01", 465, 0, color_white, TEXT_ALIGN_LEFT)

		if self:GetPoints() >= 1500 then

			draw.SimpleText("Score Maximum!", "sam_stand_01", 820, 105, Color(self.color01), TEXT_ALIGN_CENTER)

		end
		-- surface.SetMaterial( Material "materials/weed.png")
		-- surface.SetDrawColor(255,255,255,255)
		-- surface.DrawTexturedRect( 440, 0, 150, 150 )

	cam.End3D2D()

end