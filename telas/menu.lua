-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local _M = {}

----------------------Desenvolvimento da TELA----------------------
function _M.new()

	local director = require("telas.director")

	local localGroup = display.newGroup()

	-- Variaveis para chamar as funções
	local touchEvent
	local freeMemory

	local w = display.contentWidth -- representa a largura da tela
	local h = display.contentHeight -- altura da tela

	-----------Codigo Principal----------------

	--Declarando imagem de fundo
	local background = display.newImageRect(localGroup, "imagens/background.jpg", display.actualContentWidth, display.actualContentHeight )
background.anchorX = 0
background.anchorY = 0
background.x = 290 + display.screenOriginX 
background.y = 160 + display.screenOriginY
	--Declarando buntões
	
	local buttons1 = display.newImage(localGroup,"imagens/Button-Player.png")
	buttons1.x = display.contentCenterX
	buttons1.y = display.contentHeight - 150
	buttons1.myName = "play"

	local buttons2 = display.newImage(localGroup,"imagens/comoJogar.png")
	buttons2.x = display.contentCenterX
	buttons2.y = display.contentHeight - 100
	buttons2.myName = "comoJogar"

	local buttons3 = display.newImage(localGroup,"imagens/configuracoes.png")
	buttons3.x = display.contentCenterX
	buttons3.y = display.contentHeight - 50
	buttons3.myName = "configuracoes"


	--Direciona para tela de fases	
	touchEvent = function(event)
		local x = event.target
		if x.myName == "play" then 
			freeMemory()
			director:changeScene("telas.fases")
		end
	end

	-- Limpa a memoria do Grupo criado
	freeMemory = function()
		display.remove(localGroup)
		localGroup = nil 
	end

	buttons1:addEventListener("tap", touchEvent )

	return localGroup
end
---------------------------------------------------------------------------------

return _M