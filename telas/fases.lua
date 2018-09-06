-----------------------------------------------------------------------------------------
--
-- fases.lua
--
-----------------------------------------------------------------------------------------

local _M = {} 

--Variables--------------->

local director = require("telas.director")

local w = display.contentWidth -- representa a largura da tela
local h = display.contentHeight -- altura da tela

local j = 1

--Images------------------>

local background

--Functions--------------->

local touchEvent
local freeMemory

local w = display.contentWidth -- representa a largura da tela
	local h = display.contentHeight -- altura da tela

--Principal Function--------------------------------------------------------------------------->
----------------------------------------------------------------------------------------------->
function _M.new()
	local localGroup = display.newGroup()
	
	------- Codigo Principal ---------------
	-- tela de Fundo
	local background = display.newRect(localGroup, 0, 0, w, h)
	background.x = w * .5
	background.y = h * .5
	background:setFillColor(255, 255, 255)         

	local buttonText = display.newText(localGroup, "Má oee", 0, 0, nil, 30 )
	buttonText.x =  display.contentCenterX
	buttonText.y = display.contentHeight - 150
	buttonText:setFillColor(255, 0, 255) 

	local test = function()
		freeMemory()
		director:changeScene("telas.menu")
	end

	timer.performWithDelay(2000, test)

	freeMemory = function()
		display.remove(localGroup)
		localGroup = nil 
	end

	return localGroup
end

return _M