--reloading.lua

local composer = require("composer")
local scene = composer.newScene()
local mydata = require("mydata")

local score

local loadText

local function restartGame ( target )
	composer.gotoScene("lava", {time=500, effect="crossFade"} )
end

function scene:create ( event )

	local group = self.view
	

	loadText = display.newText("Restarting...", 0, 0, native.systemFont, 100)
	loadText:setTextColor(255, 255, 255, 255)
	loadText.x = display.contentCenterX
	loadText.y = display.contentCenterY

	group:insert(loadText)

	score = display.newText(mydata.score, 0, 0, native.systemFont, 100)
	score:setTextColor(255, 255, 255, 255)
	score.x = display.contentCenterX
	score.y = display.contentCenterY + 200

	group:insert(score)
end

function scene:show( event )
	local group = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		composer.removeScene("lava")
		loadText.alpha = 1.0
		score.alpha = 1.0
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    transition.to(score, {time = 1000, alpha = 0.0})
	transition.to(loadText, {time = 1000, alpha = 0.0, onComplete=restartGame})
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
        -- Called immediately after scene goes off screen.
    end

end

function scene:destroy ( event )
	local group = self.view
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene