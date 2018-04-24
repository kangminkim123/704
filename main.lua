-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- created on kangmin
-- created by april 24
-----------------------------------------------------------------------------------------


local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 25 ) -- ( x, y )
physics.setDrawMode( "hybrid" )

local leftWall = display.newRect( 0, display.contentHeight / 2, 1, display.contentHeight )
--myRectangle.strkewidth = 3
--myRectangle.setFillColor( 0.5 )
--myRectangle.setStrokeColor( 1, 0, 0 )
leftWall.alpha = 0.0
physics.addBody( leftWall, "static", {
	friction = 0.5,
	bounce = 0.3
    } )

local theGround = display.newImage( "./assets/sprites/land.png" )
theGround.x = 520
theGround.y = display.contentHeight
theGround.id = "the ground"
physics.addBody( theGround, "static", {
	friction = 0.5,
	bounce = 0.3
    } )

local theCharacter = display.newImage( "./assets/sprites/mario.png" )
theCharacter.x = display.contentCenterX - 200
theCharacter.y = display.contentCenterY
theCharacter.id = "the character"
physics.addBody( theCharacter, "dynamic", {
	density = 3.0,
	friction = 0.5,
	bounce = 0.3
    } )
theCharacter.isFixedRotation = true

local dPad = display.newImage( "./assets/sprites/d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 200
dPad.id = "d-pad"

local upArrow = display.newImage( "./assets/sprites/upArrow.png" )
upArrow.x = 150
upArrow.y = display.contentHeight - 310
upArrow.id = "up arrow"

local downArrow = display.newImage( "./assets/sprites/downArrow.png" )
downArrow.x = 150
downArrow.y = display.contentHeight - 90
downArrow.id = "down arrow"

local leftArrow = display.newImage( "./assets/sprites/leftArrow.png" )
leftArrow.x = 40
leftArrow.y = display.contentHeight - 200
leftArrow.id = "left arrow"

local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 200
rightArrow.id = "right arrow"

local jumpButton = display.newImage( "./assets/sprites/jumpButton.png" )
jumpButton.x = display.contentWidth - 80
jumpButton.y = display.contentHeight - 80
jumpButton.id = "jump button"
jumpButton.alpha = 0.5

function upArrow:touch( event )
	if ( event.phase == "ended" ) then
	    -- move the character up
	    transition.moveBy( theCharacter, {
	    	    x = 0, -- move 0 in the x direction
	    	    y = -50, -- move up 50 pixels
	    	    time = 100 --move in a 1/10 of a second
	    	    } )
	end
	

	return true
end

upArrow:addEventListener( "touch", upArrow )

function downArrow:touch( event )
	if ( event.phase == "ended" ) then
	    -- move the character up
	    transition.moveBy( theCharacter, {
	    	    x = 0, -- move 0 in the x direction
	    	    y = 50, -- move down 50 pixels
	    	    time = 100 --move in a 1/10 of a second
	    	    } )	
	end

	return true
end

downArrow:addEventListener( "touch", downArrow )

function leftArrow:touch( event )
	if ( event.phase == "ended" ) then
	    -- move the character up
	    transition.moveBy( theCharacter, {
	    	    x = -50, -- move 0 in the x direction
	    	    y = 0, -- move down 50 pixels
	    	    time = 100 --move in a 1/10 of a second
	    	    } )	
	end

	return true
end

leftArrow:addEventListener( "touch", leftArrow )

function rightArrow:touch( event )
	if ( event.phase == "ended" ) then
	    -- move the character up
	    transition.moveBy( theCharacter, {
	    	    x = 50, -- move 0 in the x direction
	    	    y = 0, -- move down 50 pixels
	    	    time = 100 --move in a 1/10 of a second
	    	    } )	
	end

	return true
end

rightArrow:addEventListener( "touch", rightArrow )

function jumpButton:touch( event )
    if ( event.phase == "ended" ) then
        -- make the character jump
        theCharacter:setLinearVelocity( 0, -750 )
    end

    return true
end

function checkCharacterPosition( event )

	if theCharacter.y > display.contentHeight + 500 then
		theCharacter.x = display.contentCenterX - 200
		theCharacter.y = display.contentCenterY
	end
end

jumpButton:addEventListener( "touch", jumpButton )
Runtime:addEventListener( "enterFrame", checkCharacterPosition )