


local sunburst = {}


function sunburst:newBurst (rayCount, color1, color2) 
	local group = display.newGroup()
	group.anchorChildren = true

	color2 = color2 or {0,0} 

	local function setColor (color)
		local c = {}
		if #color == 1 then
			c.r = color[1]
			c.g = color[1]
			c.b = color[1]
			c.a = 1
		elseif #color == 2 then 
			c.r = color[1]
			c.g = color[1]
			c.b = color[1]
			c.a = color[2]
		elseif #color == 3 then 
			c.r = color[1]
			c.g = color[2]
			c.b = color[3]
			c.a = 1
		elseif #color == 4 and color.type == nil then 
			c.r = color[1]
			c.g = color[2]
			c.b = color[3]
			c.a = color[4]
		else 
			c = color
		end	
		return c
	end

	local function setFill (obj, color)
		if color.type == nil then
			obj:setFillColor(color.r, color.g, color.b, color.a)
		else 
			obj:setFillColor(color)
		end
	end

	c1 = setColor(color1)
	c2 = setColor(color2)

	if rayCount < 4 then 
		rayCount = 4
	end 

	local angle = 360 / rayCount
	print("Angle = " .. angle)

	local c = display.contentCenterY + 75
	print ("Side Length = " .. c)

	local len = math.ceil(math.sqrt( math.pow(c,2) + math.pow(c,2) - 2 * c * c * math.cos(math.rad(angle))  ))
	print("Top Edge Length = " .. len)


	local vertices = { 
		display.contentCenterX, display.contentCenterY, 
		display.contentCenterX+(len*.5), -75,
		display.contentCenterX-(len*.5), -75,
	}

	local triangles = {}
	for i=1,rayCount do

		triangles[i] = display.newPolygon(display.contentCenterX, display.contentCenterY, vertices)
		if i%2 == 0 then
			setFill(triangles[i], c1)
			--triangles[i]:setFillColor( color1 )
		else
			setFill(triangles[i], c2)
			--triangles[i]:setFillColor( color2 )
		end
		triangles[i].anchorY = 1
		triangles[i].y = display.contentCenterY
	 	triangles[i]:rotate(angle * i)
	 	group:insert(triangles[i])
	end

	group.anchorY = .5
	group.anchorX = .5
	group.x = display.contentCenterX
	group.y = display.contentCenterY

	return group
end

return sunburst