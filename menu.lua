-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )

local scene = composer.newScene()

local localGroup = display.newGroup()
local w = display.contentWidth -- representa a largura da tela
local h = display.contentHeight -- altura da tela
local touchEvent

-- create()
function scene:create( event )

	-----------Codigo Principal----------------

	--Declarando imagem de fundo
	local background = display.newImageRect(localGroup, "imagens/background.jpg", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 240 + display.screenOriginX 
	background.y = 165 + display.screenOriginY
	--Declarando buntões
	
	local buttons1 = display.newImage(localGroup,"imagens/Button-Player.png")
	buttons1.x = display.contentCenterX
	buttons1.y = display.contentHeight - 180
	buttons1.myName = "play"

	local buttons2 = display.newImage(localGroup,"imagens/comoJogar.png")
	buttons2.x = display.contentCenterX
	buttons2.y = display.contentHeight - 132
	buttons2.myName = "comoJogar"

	local buttons3 = display.newImage(localGroup,"imagens/configuracoes.png")
	buttons3.x = display.contentCenterX
	buttons3.y = display.contentHeight - 85
	buttons3.myName = "configuracoes"


	--Direciona para tela de fases	
	touchEvent = function(event)
		local x = event.target
		if x.myName == "play" then 
			composer.gotoScene("fases")
		end
	end

	-- Limpa a memoria do Grupo criado

	buttons1:addEventListener("tap", touchEvent )
end


-- show()
function scene:show( event )


end


-- hide()
function scene:hide( event )
  
end


-- destroy()
function scene:destroy( event )
	display.remove(localGroup)
end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene