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

-- Carrega a 'biblioteca' de fisica
local physics = require ( "physics" )
physics.start() -- Inicia a fisica
physics.setGravity(0,0)

--Functions--------------->

local touchEvent
local freeMemory
-- Limpa a memoria do Grupo criado
	freeMemory = function()
		display.remove(localGroup)
		localGroup = nil 
	end



--Principal Function--------------------------------------------------------------------------->
----------------------------------------------------------------------------------------------->
function _M.new()

	local localGroup = display.newGroup()

	--Posição de saída do jogo
	local vitoria = display.newRect(390, 135, 40, 40)
	vitoria:setFillColor(192,192,192)
	physics.addBody(vitoria, "static")

	------- Plano de Fundo ------------
	local background = display.newImage(localGroup, "imagens/background1.png", display.actualContentWidth, display.actualContentHeight) -- cria uma nova imagem de fundo
	background.anchorX = 0
	background.anchorY = 0
	background.x = 240 + display.screenOriginX 
	background.y = 160 + display.screenOriginY
	------- Fim do Plano de fundo --------
	--------------//-----------//----------------//----------------
	------- Mapa --------------
	local wall = {} 
	wall[1] = display.newRect(90, 04, 10, 155)
	wall[1]:setFillColor(0,0,0)
	physics.addBody(wall[1], "static") 
	wall[2] = display.newRect(390, 04, 10, 130)
	wall[2]:setFillColor(0,0,0)
	physics.addBody(wall[2], "static") 
	wall[22] = display.newRect(390, 190, 10, 110)
	wall[22]:setFillColor(0,0,0)
	physics.addBody(wall[22], "static") 
	wall[3] = display.newRect(90, 210, 10, 90)
	wall[3]:setFillColor(0,0,0)
	physics.addBody(wall[3], "static") 
	wall[4] = display.newRect(95, 04, 300, 10)
	wall[4]:setFillColor(0,0,0)
	physics.addBody(wall[4], "static") 
	wall[5] = display.newRect(95, 300, 305, 10)
	wall[5]:setFillColor(0,0,0)
	physics.addBody(wall[5], "static") 
	wall[6] = display.newRect(100, 130, 30, 10)
	wall[6]:setFillColor(0,0,0)
	physics.addBody(wall[6], "static") 
	wall[7] = display.newRect(130, 50, 10, 90)
	wall[7]:setFillColor(0,0,0)
	physics.addBody(wall[7], "static") 
	wall[8] = display.newRect(100, 210, 45, 10)
	wall[8]:setFillColor(0,0,0)
	physics.addBody(wall[8], "static") 
	wall[9] = display.newRect(140, 180, 10, 45)
	wall[9]:setFillColor(0,0,0)
	physics.addBody(wall[9], "static") 
	wall[10] = display.newRect(150, 180, 30, 10)
	wall[10]:setFillColor(0,0,0)
	physics.addBody(wall[10], "static") 
	wall[11] = display.newRect(180, 100, 10, 170)
	wall[11]:setFillColor(0,0,0)
	physics.addBody(wall[11], "static") 
	wall[12] = display.newRect(220, 145, 10, 125)
	wall[12]:setFillColor(0,0,0)
	physics.addBody(wall[12], "static") 
	wall[13] = display.newRect(190, 100, 30, 10)
	wall[13]:setFillColor(0,0,0)
	physics.addBody(wall[13], "static") 
	wall[14] = display.newRect(220, 60, 10, 50)
	wall[14]:setFillColor(0,0,0)
	physics.addBody(wall[14], "static") 
	wall[15] = display.newRect(130, 40, 50, 10)
	wall[15]:setFillColor(0,0,0)
	physics.addBody(wall[15], "static") 
	wall[16] = display.newRect(130, 260, 50, 10)
	wall[16]:setFillColor(0,0,0)
	physics.addBody(wall[16], "static") 
	wall[17] = display.newRect(230, 145, 70, 10)
	wall[17]:setFillColor(0,0,0)
	physics.addBody(wall[17], "static") 
	wall[18] = display.newRect(270, 14, 10, 135)
	wall[18]:setFillColor(0,0,0)
	physics.addBody(wall[18], "static") 
	wall[19] = display.newRect(230, 260, 40, 10)
	wall[19]:setFillColor(0,0,0)
	physics.addBody(wall[19], "static") 
	wall[20] = display.newRect(260, 225, 10, 35)
	wall[20]:setFillColor(0,0,0)
	physics.addBody(wall[20], "static") 
	wall[21] = display.newRect(260, 215, 70, 10)
	wall[21]:setFillColor(0,0,0)
	physics.addBody(wall[21], "static") 
	wall[23] = display.newRect(300, 275, 10, 25)
	wall[23]:setFillColor(0,0,0)
	physics.addBody(wall[23], "static") 
	wall[24] = display.newRect(280, 180, 120, 10)
	wall[24]:setFillColor(0,0,0)
	physics.addBody(wall[24], "static") 
	wall[25] = display.newRect(350, 60, 10, 120)
	wall[25]:setFillColor(0,0,0)
	physics.addBody(wall[25], "static") 
	wall[26] = display.newRect(310, 80, 40, 10)
	wall[26]:setFillColor(0,0,0)
	physics.addBody(wall[26], "static") 
	------- Fim do Mapa -------
	---------------//----------//-----------------//---------------
    ------- Cronometro ------
    local secondsLeft = 45  -- 1 minutes * 60 seconds
 
	local clockText = display.newText( "00:45", display.contentCenterY-135, 30, native.systemFont, 22 )
	clockText:setFillColor( 0.7, 0.7, 1 )
	local function updateTime( event )
	    -- Decrement the number of seconds
	    secondsLeft = secondsLeft - 1
	    if secondsLeft == 0 then
	    	local buttonText = display.newText(localGroup, "GAME OVER", 0, 0, nil, 23 )
			buttonText.x = display.contentCenterX - 10
			buttonText.y = 290
			buttonText:setFillColor( 255, 100, 0 )
	    	--local gameover = display.newText("GAME OVER")
	    	--gameover.x = display.contentCenterX
			--gameover.y = display.contentCenterY
			
			local test = function()
				freeMemory()
				director:changeScene("telas.menu")
			end
			timer.performWithDelay(2000, test)
		end	
	    -- Time is tracked in seconds; convert it to minutes and seconds
	    local minutes = math.floor( secondsLeft / 60 )
	    local seconds = secondsLeft % 60
	 
	    -- Make it a formatted string
	    local timeDisplay = string.format( "%02d:%02d", minutes, seconds )
	     
	    -- Update the text object
	    clockText.text = timeDisplay
	end
	local countDownTimer = timer.performWithDelay( 1000, updateTime, secondsLeft )
    ------- Fim do Cronometro ------
    -----------//------------//-----------//-------------//---------
	------- Sprite e Movimentação ---------
	local sheetData =  { width=45, height=63, numFrames=12 }
	-- width: largura de cada frame
	-- height: altura de cada frame
	-- numFrames: número de frames da sprite

	local sheet = graphics.newImageSheet( "imagens/gaara@4x.png", sheetData)
	-- cria uma nova imagem usando a sprite "gaara.png" e as propriedades vistas acima

	local sequenceData = 
	{
		{ name = "idleDown", start = 1, count = 1, time = 0, loopCount = 1 }, --idleDown = parado para baixo (é só um nome, vc quem nomeia como quiser)
		-- name: nome desse movimento
		-- start: frame da sprite onde a animação começa (nesse caso começa no primeiro frame da sprite)
		-- count: número de frames para essa animação (nesse caso essa animação só terá um frame, o primeiro, aquele q o gaara tá parado pra baixo)
		-- time: tempo de duração da animação (está zero pq essa animação só tem um quadro
		-- loopCount: número de vezes que a animação é executada, nesse caso a animação só é executada uma vez, pois só tem um frame
		
		-- os outros vetores são da mesma forma, cada um com a sua animação
	    { name = "idleLeft", start = 4, count = 1, time = 0, loopCount = 1 }, --parado pra esquerda
	    { name = "idleRight", start = 7, count = 1, time = 0, loopCount = 1 }, --parado pra direita
	    { name = "idleUp", start = 10, count = 1, time = 0, loopCount = 1 }, --parado pra cima
		
		-- esses vetores já contem mais do q um frame de animação, então eles já mostram um movimento
	    { name = "moveDown", start = 2, count = 2, time = 300, loopCount = 0 },
		-- nesse caso a animação começa do segundo frame e termina do terceiro (já q o count é igual a 2)
		-- e o 'time' é igual a 300, isso significa q essa animação (moveDown), será executada em 300 centésimos de segundo, ou 0,3 segundos
		-- o loopCount é igual a zero, isso significa q animação será executada para sempre, até q alguém cancele essa animação ou execute outra
	    { name = "moveLeft", start = 5, count = 2, time = 300, loopCount = 0 },
		-- mesmo principio da animação de cima, mas agora começa no quinto frame (start=5) e contém 2 frames de animação apenas
	    { name = "moveRight", start = 8, count = 2, time = 300, loopCount = 0 },
	    { name = "moveUp", start = 11, count = 2, time = 300, loopCount = 0 },
	}

	local player = display.newSprite(localGroup, sheet, sequenceData)
	-- cria finalmente a sprite utilizando as propriedades vistas acima
	player.x = 100
	player.y = 190
	physics.addBody(player, "dynamic",{radius = 9}) 


	player:setSequence("idleDown")
	-- configura um valor inicial para sprite, nesse caso é o "idleDown", por isso o gaara começa olhando para baixo

	local buttons = {}

	buttons[1] = display.newImage(localGroup, "imagens/button.png")
	buttons[1].x = 435
	buttons[1].y = display.contentHeight - 90
	buttons[1].myName = "up"
	buttons[1].rotation = -90

	buttons[2] = display.newImage(localGroup, "imagens/button.png")
	buttons[2].x = 435
	buttons[2].y = display.contentHeight - 35
	buttons[2].myName = "down"
	buttons[2].rotation = 90

	buttons[3] = display.newImage(localGroup, "imagens/button.png")
	buttons[3].x = 25
	buttons[3].y = display.contentHeight - 70
	buttons[3].myName = "left"
	buttons[3].rotation = 180

	buttons[4] = display.newImage(localGroup, "imagens/button.png")
	buttons[4].x = 65
	buttons[4].y = display.contentHeight - 40
	buttons[4].myName = "right"

	local yAxis = 0
	local xAxis = 0

	local touchFunction = function(e)
		local eventName = e.phase
		local direction = e.target.myName
		
		if eventName == "began" or eventName == "moved" then
			if direction == "up" then 
				player:setSequence("moveUp")
				-- caso o botão pra cima for precionado ou arrastado, 
				-- animação é trocada para a "moveUp" q mostra uma animação do gaara se movimentando para cima
				
				yAxis = -2.5
				xAxis = 0
			elseif direction == "down" then 
				player:setSequence("moveDown")
				-- mesmo principio do moveUp, mas agora é mostrada a animação do gaara olhando para baixo

				yAxis = 2.5
				xAxis = 0
			elseif direction == "right" then
				player:setSequence("moveRight")

				xAxis = 2.5
				yAxis = 0
			elseif direction == "left" then
				player:setSequence("moveLeft")

				xAxis = -2.5
				yAxis = 0
			end
		else 
			-- caso os botões sejam soltos uma dessas funções será executada, 
			-- isso serve para q quando alguém soltar os botões, o player não continue movimentando,
			-- então a animação é trocada para os frames em q o gaara está parado
			if e.target.myName == "up" then 
				player:setSequence("idleUp")
				-- a animação "idleUp"(parado para cima) é ativada se o jogar soltar o botão para cima
			elseif e.target.myName == "down" then 
				player:setSequence("idleDown")
				-- mesmo principio do "idleUp", mas agora o gaara olha para baixo
			elseif e.target.myName == "right" then
				player:setSequence("idleRight")
			elseif e.target.myName == "left" then
				player:setSequence("idleLeft")
			end
			
			yAxis = 0
			xAxis = 0
		end
	end

	local j=1

	for j=1, #buttons do 
		buttons[j]:addEventListener("touch", touchFunction)
	end

	function houveColisao()
		local buttonTextV = display.newText(localGroup, "WINNER", 0, 0, nil, 23 )
			buttonTextV.x = display.contentCenterX - 10
			buttonTextV.y = 290
			buttonTextV:setFillColor( 255, 100, 0 )

		local test = function()
				freeMemory()
				director:changeScene("telas.menu")
			end
			timer.performWithDelay(2000, test)
	end

	local update = function()
		player.x = player.x + xAxis
		player.y = player.y + yAxis

		if player.x <= player.width * .5 then 
			player.x = player.width * .5
		elseif player.x >= w - player.width * .5 then 
			player.x = w - player.width * .5
		end

		if player.y <= player.height * .5 then
			player.y = player.height * .5
		elseif player.y >= h - player.height * .5 then 
			player.y = h - player.height * .5
		end 
		
		vitoria.collision = houveColisao
		vitoria:addEventListener("collision")
		
		player:play() --executa a animação, é necessário usar essa função para ativar a animação
	end

	
	Runtime:addEventListener("enterFrame", update)
	------- Fim do Sprite -----------------
	-----------//----------//--------------//---------------//-----------------
	------- Codigo Principal ---------------
	
	

	------ Fim do Codigo Principal --------------
	return localGroup
end

return _M