-----------------------------------------------------------------------------------------
--
-- you_win.lua
-- Created by: Hunter Connolly
-- Date: November 6, 2019
-- Description: This is the winning screen of the game.
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Use Widget Library
local widget = require( "widget")


-- Name the Scene
sceneName = "you_win3"
------------------------------------------------------------------------------------------

-- create Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function MainMenuTransition ()
    composer.gotoScene("main_menu", {effect = "slideRight", time = 500 })
end

local function NextTransition()
    composer.gotoScene("level4_screen", {effect = "fade", time = 500})
end

local function LevelSelectTransition ()
    composer.gotoScene("level_select", {effect = "slideRight", time = 500 })
end
-----------------------------------------------------------------------------------------
--SOUNDS
-----------------------------------------------------------------------------------------
local youWinSound = audio.loadSound("Sounds/youWin.mp3")
local youWinSoundChannel
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    --------------------------------------------------------------------------------------------
    --BACKGROUND IMAGES
    -----------------------------------------------------------------------------------------
    -- this is the background of the screen
    bkg_image = display.newImage("Images/YouWinScreenHunter@2x.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight   

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()
    
    --------------------------------------------------------------------------------------------
    --BUTTON WIDGETS
    -----------------------------------------------------------------------------------------
    mainMenuButton = widget.newButton(
        {
            --set its position on the screen relative to the screen size
            x = display.contentWidth*0.5/5,
            y = display.contentHeight*7.5/8,

            -- Insert the images here
            defaultFile = "Images/MainMenuButtonUnpressedHunter@2x.png",
            overFile = "Images/MainMenuButtonPressedHunter@2x.png",

            -- When the button is released, call the Credits transition function
            onRelease = MainMenuTransition
        } )  
    
    -- change the size of the button
    mainMenuButton.width = 200
    mainMenuButton.height = 100

    sceneGroup:insert(mainMenuButton)

    NextButton = widget.newButton(
        {
            --set its position on the screen relative to the screen size
            x = display.contentWidth*4.5/5,
            y = display.contentHeight*7.5/8,

            -- Insert the images here
            defaultFile = "Images/NextSelectButtonHunter@2x.png",
            overFile = "Images/NextButtonPressedHunter@2x.png",

            -- When the button is released, call the Credits transition function
            onRelease = NextTransition
        } )  
    
    -- change the size of the button
    NextButton.width = 200
    NextButton.height = 100

    sceneGroup:insert(NextButton)

    levelSelectButton = widget.newButton(
        {
            --set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight*7.5/8,

            -- Insert the images here
            defaultFile = "Images/LevelSelectButtonHunter@2x.png",
            overFile = "Images/LevelSelectButtonPressedHunter@2x.png",

            -- When the button is released, call the Credits transition function
            onRelease = LevelSelectTransition
        } )  
    
    -- change the size of the button
    levelSelectButton.width = 200
    levelSelectButton.height = 100

    sceneGroup:insert(levelSelectButton)
end -- function scene:create( event )


-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        youWinSoundChannel = audio.play(youWinSound)
                
    end
end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  


    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
  

    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene


