-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Retira a barra de status no jogo
display.setStatusBar( display.HiddenStatusBar )
-- A tela nunca irá hibernar
system.setIdleTimer(false)

-- Declara o objeto "director" do Corona 
local director = require ("telas.director")

-- Carrrega a tela de MENU
director:changeScene( "telas.menu" )