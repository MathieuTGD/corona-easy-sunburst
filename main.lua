-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local sunburst = require "sunburst"


local color1 = { type="gradient", color1={0,0,0,0}, color2={1,1,1,1}, direction="down" }
local color2 = { 1, 0, 0,.1 }

-- Other accepted color format
-- {1}
-- {1,.5}
-- {.4,1,.4}

-- Color 2 is optional

-- Note that an odd number of rays will create an odd output 
-- since one color will appear one more time

local rays = sunburst:newBurst(26, color1, color2)


-- You can then add animation to the sunburst if you want
local t = transition.to(rays, {time=10000, rotation=360, iterations=0})
