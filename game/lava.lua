-- lava.lua

local composer = require("composer")
local scene = composer.newScene()
local mydata = require("mydata")

local physics = require("physics")
physics.start()
--physics.setDrawMode("hybrid")
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

--local physics = require("physics")
--physics.start()

local widget = require("widget")

audio.setVolume( 0.5, { channel=1 } )
audio.setVolume( 1.0, { channel=2 } )
audio.setVolume( 1.0, { channel=3 } )
local backgroundMusic = audio.loadStream( "music1.mp3" )
local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=5000 } )


local gameoverMusic = audio.loadStream( "death.mp3" )
local gameoverMusicChannel

local buttonMusic = audio.loadStream( "button.mp3" )
local buttonMusicChannel

local background --= display.newImage("board.png", 375, 450)


local face --= display.newImage("face.png", 47, 121)
--physics.addBody( face, {radius = 30})
--face.gravityScale = 0
--face.collision = faceCollision
--face:addEventListener("collision", face)

local trap --= display.newImage("trap.png", 375, 453)
local warn --= display.newImage("warn1.png", 375, 453)
local trap1 --= display.newImage("trap.png", 375, 453)
local warn1 --= display.newImage("warn1.png", 375, 453)
local trap2 --= display.newImage("trap.png", 375, 453)
local warn2 --= display.newImage("warn1.png", 375, 453)
local trap3 --= display.newImage("trap.png", 375, 453)
local warn3 --= display.newImage("warn1.png", 375, 453)

--physics.addBody( trap, "static")
--physics.addBody( trap1, "static")
--physics.addBody( trap2, "static")
--physics.addBody( trap3, "static")

--trap:toBack()
--warn:toBack()
--trap1:toBack()
--warn1:toBack()
--trap2:toBack()
--warn2:toBack()
--trap3:toBack()
--warn3:toBack()
--background:toBack()

local minuteTime --= 0
local secondTime --= 0

local scoreTxt --= display.newText( "Time: 00:00", 0, 0, "Helvetica", 40 )
--scoreTxt.x = display.screenOriginX + 110
--scoreTxt.y = display.screenOriginY + 850

local scoreTimer
--group:insert(scoreTxt)

--local padup = display.newImage("square1.png", centerX, 950)
--local paddown = display.newImage("square1.png", centerX, 1200)
--local padl = display.newImage("square1.png", 150, 1080)
--local padr = display.newImage("square1.png", 600, 1080)

local trapping
local trapping1
local trapping2
local trapping3




-- Button Functions

local function ButtonLeft(event)
	local phase = event.phase
	if "ended" == phase then
		if face.x > 47 then
			face.x = face.x - 94
			print("pressed")
			buttonMusicChannel = audio.play( buttonMusic, { channel=2 } )
		end
	end
end

local function ButtonRight(event)
	local phase = event.phase
	if "ended" == phase then
		if face.x < 705 then
		face.x = face.x + 94
		print("pressed")
		buttonMusicChannel = audio.play( buttonMusic, { channel=2 } )
		end
	end
end

local function ButtonUp(event)
	local phase = event.phase
	if "ended" == phase then
		if face.y > 122 then
			face.y = face.y - 94
			print("pressed")
			buttonMusicChannel = audio.play( buttonMusic, { channel=2 } )
		end
	end
end

local function ButtonDown(event)
	local phase = event.phase
	if "ended" == phase then
		if face.y < 700 then
			face.y = face.y + 94
			print("pressed")
			buttonMusicChannel = audio.play( buttonMusic, { channel=2 } )
		end
	end
end

-- Trap Functions

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


-- FIX THIS LATER
function newTrap(self, event)
	warn.x = face.x + 45
	warn.y = face.y + 50

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
		--timer.cancel(scoreTimer)
		--composer.reloadScene()
		composer.gotoScene("reloading", {time=500, effect="crossFade"} )
	end
end

function onCollision(event)
	if event.phase == "began" then
		print("collide!")
		timer.cancel(scoreTimer)
	end
end

local function updateScore()
     secondTime = secondTime + 1
     if secondTime == 60 then
     	secondTime = 0
     	minuteTime = minuteTime + 1
     end
     scoreTxt.text = string.format("Time: %02d:%02d", minuteTime, secondTime)
end

local function faceCollision(self, event)
	if event.phase == "began" then
		print ("collide!face")
		mydata.score = minuteTime*100 + secondTime
		timer.cancel(trapping)
		timer.cancel(trapping1)
		timer.cancel(trapping2)
		timer.cancel(trapping3)
		gameoverMusicChannel = audio.play(gameoverMusic, {channel = 3})
		composer.gotoScene("reloading", {time=2000, effect="crossFade"} )
	end
end

function scene:create ( event )
	local group = self.view

	background = display.newImage("board.png", 375, 450)

	group:insert(background)

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

	group:insert(padl)
	group:insert(padr)
	group:insert(paddown)
	group:insert(padup)

	-- Create Junks

	face = display.newImage("face.png", 47, 121)
	physics.addBody( face, {radius = 30})
	face.gravityScale = 0
	face.collision = faceCollision
	face:addEventListener("collision", face)

	trap = display.newImage("trap.png", 375, 453)
	warn = display.newImage("warn1.png", 375, 453)
	trap1 = display.newImage("trap.png", 375, 453)
	warn1 = display.newImage("warn1.png", 375, 453)
	trap2 = display.newImage("trap.png", 375, 453)
	warn2 = display.newImage("warn1.png", 375, 453)
	trap3 = display.newImage("trap.png", 375, 453)
	warn3 = display.newImage("warn1.png", 375, 453)

	physics.addBody( trap, "static")
	physics.addBody( trap1, "static")
	physics.addBody( trap2, "static")
	physics.addBody( trap3, "static")

	trap:toBack()
	warn:toBack()
	trap1:toBack()
	warn1:toBack()
	trap2:toBack()
	warn2:toBack()
	trap3:toBack()
	warn3:toBack()
	background:toBack()

	minuteTime = 0
	secondTime = 0

	scoreTxt = display.newText( "Time: 00:00", 0, 0, "Helvetica", 40 )
	scoreTxt.x = display.screenOriginX + 110
	scoreTxt.y = display.screenOriginY + 850

	group:insert(warn)
	group:insert(warn1)
	group:insert(warn2)
	group:insert(warn3)
	group:insert(trap)
	group:insert(trap1)
	group:insert(trap2)
	group:insert(trap3)
	group:insert(face)
	group:insert(scoreTxt)
end


function scene:show ( event )
	local group = self.view
	local phase = event.phase

	if (phase == "will") then

	elseif (phase == "did") then
	trapping = timer.performWithDelay(1000, newTrap, 0)
	trapping1 = timer.performWithDelay(2000, newTrap1, 0)
	trapping2 = timer.performWithDelay(1000, newTrap2, 0)
	trapping3 = timer.performWithDelay(2000, newTrap3, 0)
	--local checkifDead = timer.performWithDelay(2000, ifDead, 0)
	scoreTimer = timer.performWithDelay(1000, updateScore, 0)
	Runtime:addEventListener("collision", onCollision)
	--group:insert(trapping)
	--group:insert(trapping1)
	--group:insert(trapping2)
	--group:insert(trapping3)
	--group:insert(checkifDead)
	--group:insert(scoreTimer)
	end
end

function scene:hide ( event )
	local group = self.view
	local phase = event.phase
	if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
    end

end

function scene:destroy ( event )
	local group = self.view
	--trapping:removeSelf
	--background:removeSelf()
	--face:removeSelf()
	--trap:removeSelf()
	--trap1:removeSelf()
	--trap2:removeSelf()
	--trap3:removeSelf()
	--warn:removeSelf()
	--warn1:removeSelf()
	--warn2:removeSelf()
	--warn3:removeSelf()
	--scoreTxt:removeSelf()


end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene

