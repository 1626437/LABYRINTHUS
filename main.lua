-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Retira a barra de status no jogo
display.setStatusBar( display.HiddenStatusBar )
-- A tela nunca irá hibernar
system.setIdleTimer(false)

local composer = require( "composer" )

composer.gotoScene( "menu" )