local composer = require("composer")

local mydata = require("mydata")



mydata.score = 0
mydata.reloads = 0

math.randomseed( os.time() )
display.setStatusBar( display.HiddenStatusBar)

composer.gotoScene("lava")