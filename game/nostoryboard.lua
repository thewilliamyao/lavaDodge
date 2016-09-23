-- nostoryboard.lua

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



local trap = display.newImage("trap.png", 375, 453)
local warn = display.newImage("warn1.png", 375, 453)
local trap1 = display.newImage("trap.png", 375, 453)
local warn1 = display.newImage("warn1.png", 375, 453)
local trap2 = display.newImage("trap.png", 375, 453)
local warn2 = display.newImage("warn1.png", 375, 453)
local trap3 = display.newImage("trap.png", 375, 453)
local warn3 = display.newImage("warn1.png", 375, 453)
trap:toBack()
warn:toBack()
trap1:toBack()
warn1:toBack()
trap2:toBack()
warn2:toBack()
trap3:toBack()
warn3:toBack()
background:toBack()

function moveTrap(self, event)
	trap.x = warn.x
	trap.y = warn.y

end

function moveTrap1(self, event)
	trap1.x = warn1.x
	trap1.y = warn1.y

end

function moveTrap2(self, event)
	trap2.x = warn2.x
	trap2.y = warn2.y

end

function moveTrap3(self, event)
	trap3.x = warn3.x
	trap3.y = warn3.y

end

function newTrap(self, event)
	warn.x = (math.random(0,6) * 94) + 94
	warn.y = (math.random(0,6) * 94) + 168

	local moveIt = timer.performWithDelay(900, moveTrap, 1)

end

function newTrap1(self, event)
	warn1.x = (math.random(0,6) * 94) + 94
	warn1.y = (math.random(0,6) * 94) + 168

	local moveIt = timer.performWithDelay(900, moveTrap1, 1)

end

function newTrap2(self, event)
	warn2.x = (math.random(0,6) * 94) + 94
	warn2.y = (math.random(0,6) * 94) + 168

	local moveIt = timer.performWithDelay(900, moveTrap2, 1)

end

function newTrap3(self, event)
	warn3.x = (math.random(0,6) * 94) + 94
	warn3.y = (math.random(0,6) * 94) + 168

	local moveIt = timer.performWithDelay(900, moveTrap3, 1)

end

function ifDead(self, event)
	if (face.x == trap.x - 47 and face.y == trap.y - 47) 
		or (face.x == trap.x - 47 and face.y == trap.y + 47)
		or (face.x == trap.x + 47 and face.y == trap.y - 47)
		or (face.x == trap.x + 47 and face.y == trap.y + 47)
		or (face.x == trap1.x - 47 and face.y == trap1.y - 47) 
		or (face.x == trap1.x - 47 and face.y == trap1.y + 47)
		or (face.x == trap1.x + 47 and face.y == trap1.y - 47)
		or (face.x == trap1.x + 47 and face.y == trap1.y + 47)
		or (face.x == trap2.x - 47 and face.y == trap2.y - 47) 
		or (face.x == trap2.x - 47 and face.y == trap2.y + 47)
		or (face.x == trap2.x + 47 and face.y == trap2.y - 47)
		or (face.x == trap2.x + 47 and face.y == trap2.y + 47)
		or (face.x == trap3.x - 47 and face.y == trap3.y - 47) 
		or (face.x == trap3.x - 47 and face.y == trap3.y + 47)
		or (face.x == trap3.x + 47 and face.y == trap3.y - 47)
		or (face.x == trap3.x + 47 and face.y == trap3.y + 47)
		then
		print ("TOUCHED")
		timer.cancel(scoreTimer)
	end
end

--Runtime:addEventListener("enterFrame", newTrap)
local trapping = timer.performWithDelay(1000, newTrap, 0)
local trapping1 = timer.performWithDelay(1000, newTrap1, 0)
local trapping2 = timer.performWithDelay(1000, newTrap2, 0)
local trapping3 = timer.performWithDelay(1000, newTrap3, 0)
local checkifDead = timer.performWithDelay(100, ifDead, 0)