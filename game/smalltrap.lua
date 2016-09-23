local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

--local physics = require("physics")
--physics.start()

local widget = require("widget")

local background = display.newImage("board.png", 375, 450)

local face = display.newImage("face.png", 47, 121)


--local padup = display.newImage("square1.png", centerX, 950)
--local paddown = display.newImage("square1.png", centerX, 1200)
--local padl = display.newImage("square1.png", 150, 1080)
--local padr = display.newImage("square1.png", 600, 1080)

local function ButtonLeft(event)
	local phase = event.phase
	if "ended" == phase then
		if face.x > 47 then
			face.x = face.x - 94
			print("pressed")
		end
	end
end

local function ButtonRight(event)
	local phase = event.phase
	if "ended" == phase then
		if face.x < 705 then
		face.x = face.x + 94
		print("pressed")
		end
	end
end

local function ButtonUp(event)
	local phase = event.phase
	if "ended" == phase then
		face.y = face.y - 94
		print("pressed")
	end
end

local function ButtonDown(event)
	local phase = event.phase
	if "ended" == phase then
		face.y = face.y + 94
		print("pressed")
	end
end

-- Create the button
local padl = widget.newButton
{
	left = 100,
	top = 1000,
	width = 150,
	height = 150,
	defaultFile = "square1.png",	
	overFile = "square2.png",
	label = "leftButton",
	onEvent = ButtonLeft
}

local padr = widget.newButton
{
	left = 500,
	top = 1000,
	width = 150,
	height = 150,
	defaultFile = "square1.png",	
	overFile = "square2.png",
	label = "rightButton",
	onEvent = ButtonRight
}

local padup = widget.newButton
{
	left = 300,
	top = 900,
	width = 150,
	height = 150,
	defaultFile = "square1.png",	
	overFile = "square2.png",
	label = "upButton",
	onEvent = ButtonUp
}

local paddown = widget.newButton
{
	left = 300,
	top = 1100,
	width = 150,
	height = 150,
	defaultFile = "square1.png",	
	overFile = "square2.png",
	label = "downButton",
	onEvent = ButtonDown
}

local minuteTime = 0
local secondTime = 0

local scoreTxt = display.newText( "Time: 00:00", 0, 0, "Helvetica", 40 )
scoreTxt.x = display.screenOriginX + 110
scoreTxt.y = display.screenOriginY + 850

local function updateScore()
     secondTime = secondTime + 1
     if secondTime == 60 then
     	secondTime = 0
     	minuteTime = minuteTime + 1
     end
     scoreTxt.text = string.format("Time: %02d:%02d", minuteTime, secondTime)
end

local scoreTimer = timer.performWithDelay(1000, updateScore, 0)



local trap = display.newImage("trap1.png", 330, 497)
local warn = display.newImage("warn.png", 330, 497)
trap:toBack()
warn:toBack()
background:toBack()

function moveTrap(self, event)
	trap.x = warn.x
	trap.y = warn.y

	if face.x == trap.x and face.y == trap.y then
		print ("TOUCHED")
		timer.cancel(scoreTimer)
	end
end

function newTrap(self, event)
	warn.x = (math.random(0,7) * 47 * 2) + 47
	warn.y = (math.random(0,7) * 94) + 121

	local moveIt = timer.performWithDelay(300, moveTrap, 1)

end


--Runtime:addEventListener("enterFrame", newTrap)
local trapping = timer.performWithDelay(1000, newTrap, 0)