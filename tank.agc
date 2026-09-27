
	global tanquesInicializados = 0

	// Player 1 - Vermelho
	global imagem_Player1Cima, imagem_Player1Baixo, imagem_Player1Esquerda, imagem_Player1Direita
	global Player1_Hitbox, Player1_Image

	// Player 2 - Azul  
	global imagem_Player2Cima, imagem_Player2Baixo, imagem_Player2Esquerda, imagem_Player2Direita
	global Player2_Hitbox, Player2_Image

	// Sistema de tiro simplificado
	global imagemBala
	global proximoTiro1# = 0.0
	global proximoTiro2# = 0.0

	// Balas ativas na tela (máximo 5 por player)
	global balaP1_1, balaP1_2, balaP1_3, balaP1_4, balaP1_5
	global balaP2_1, balaP2_2, balaP2_3, balaP2_4, balaP2_5
	global dirP1_1#, dirP1_2#, dirP1_3#, dirP1_4#, dirP1_5#
	global dirP2_1#, dirP2_2#, dirP2_3#, dirP2_4#, dirP2_5#
	global ativaP1_1, ativaP1_2, ativaP1_3, ativaP1_4, ativaP1_5
	global ativaP2_1, ativaP2_2, ativaP2_3, ativaP2_4, ativaP2_5


	function Tanques()
		
		// Inicializar tanques se necessário
		if tanquesInicializados = 0
			// Carregar imagens dos tanques
			imagem_Player1Cima = LoadImage("tanqueVermelhoCIMA.png")
			imagem_Player1Baixo = LoadImage("tanqueVermelhoBAIXO.png")
			imagem_Player1Esquerda = LoadImage("tanqueVermelhoESQUERDA.png")
			imagem_Player1Direita = LoadImage("tanqueVermelhoDIREITA.png")

			imagem_Player2Cima = LoadImage("tanqueAzulCIMA.png")
			imagem_Player2Baixo = LoadImage("tanqueAzulBAIXO.png")
			imagem_Player2Esquerda = LoadImage("tanqueAzulESQUERDA.png")
			imagem_Player2Direita = LoadImage("tanqueAzulDIREITA.png")

			// Carregar imagem da bala
			imagemBala = LoadImage("BalaCanhao.png")

			// Criar Player 1
			Player1_Hitbox = CreateSprite(0)
			SetSpriteSize(Player1_Hitbox, 38, 38)
			SetSpritePosition(Player1_Hitbox, 125, 144)
			SetSpriteColorAlpha(Player1_Hitbox, 0)
			SetSpriteVisible(Player1_Hitbox, 0)

			Player1_Image = CreateSprite(imagem_Player1Direita)
			SetSpriteSize(Player1_Image, 40, 40)
			SetSpritePosition(Player1_Image, 125, 144)

			// Criar Player 2
			Player2_Hitbox = CreateSprite(0)
			SetSpriteSize(Player2_Hitbox, 38, 38)
			SetSpritePosition(Player2_Hitbox, 1010, 560)
			SetSpriteColorAlpha(Player2_Hitbox, 0)
			SetSpriteVisible(Player2_Hitbox, 0)

			Player2_Image = CreateSprite(imagem_Player2Cima)
			SetSpriteSize(Player2_Image, 40, 40)
			SetSpritePosition(Player2_Image, 1010, 560)

			//sobreposição
			SetSpriteDepth(Player1_Hitbox, 50)  // TANQUES NA CAMADA MÉDIA
			SetSpriteDepth(Player1_Image, 50)
			SetSpriteDepth(Player2_Hitbox, 50)
			SetSpriteDepth(Player2_Image, 50)
			
			tanquesInicializados = 1
		endif

		// Mostrar tanques
		SetSpriteVisible(Player1_Image, 1)
		SetSpriteVisible(Player2_Image, 1)

		tempoAtual# = GetMilliseconds() * 1.0
		velocidade# = 2.0

		x1Anterior# = GetSpriteX(Player1_Hitbox)
		y1Anterior# = GetSpriteY(Player1_Hitbox)
		x1# = x1Anterior#
		y1# = y1Anterior#

		if GetRawKeyState(65) = 1 // A
			SetSpriteImage(Player1_Image, imagem_Player1Esquerda)
			x1# = x1# - velocidade#
		endif
		if GetRawKeyState(68) = 1 // D
			SetSpriteImage(Player1_Image, imagem_Player1Direita)
			x1# = x1# + velocidade#
		endif
		if GetRawKeyState(87) = 1 // W
			SetSpriteImage(Player1_Image, imagem_Player1Cima)
			y1# = y1# - velocidade#
		endif
		if GetRawKeyState(83) = 1 // S
			SetSpriteImage(Player1_Image, imagem_Player1Baixo)
			y1# = y1# + velocidade#
		endif

		SetSpritePosition(Player1_Hitbox, x1#, y1#)
		SetSpritePosition(Player1_Image, x1#, y1#)

		// Colisão Player1 com paredes
		if TestarColisaoParedes(Player1_Hitbox) = 1
			SetSpritePosition(Player1_Hitbox, x1Anterior#, y1Anterior#)
			SetSpritePosition(Player1_Image, x1Anterior#, y1Anterior#)
		endif

		x2Anterior# = GetSpriteX(Player2_Hitbox)
		y2Anterior# = GetSpriteY(Player2_Hitbox)
		x2# = x2Anterior#
		y2# = y2Anterior#

		if GetRawKeyState(37) = 1 // Seta esquerda
			SetSpriteImage(Player2_Image, imagem_Player2Esquerda)
			x2# = x2# - velocidade#
		endif
		if GetRawKeyState(39) = 1 // Seta direita
			SetSpriteImage(Player2_Image, imagem_Player2Direita)
			x2# = x2# + velocidade#
		endif
		if GetRawKeyState(38) = 1 // Seta cima
			SetSpriteImage(Player2_Image, imagem_Player2Cima)
			y2# = y2# - velocidade#
		endif
		if GetRawKeyState(40) = 1 // Seta baixo
			SetSpriteImage(Player2_Image, imagem_Player2Baixo)
			y2# = y2# + velocidade#
		endif

		SetSpritePosition(Player2_Hitbox, x2#, y2#)
		SetSpritePosition(Player2_Image, x2#, y2#)

		// Colisão Player2 com paredes
		if TestarColisaoParedes(Player2_Hitbox) = 1
			SetSpritePosition(Player2_Hitbox, x2Anterior#, y2Anterior#)
			SetSpritePosition(Player2_Image, x2Anterior#, y2Anterior#)
		endif

		if GetRawKeyPressed(32) = 1 and tempoAtual# >= proximoTiro1# // SPACE
			AtiraPlayer1()
			proximoTiro1# = tempoAtual# + 1500.0 // Cooldown de 0.5 segundos
		endif

		if GetRawKeyPressed(48) = 1 and tempoAtual# >= proximoTiro2# // Tecla 0
			AtiraPlayer2()
			proximoTiro2# = tempoAtual# + 1500.0 // Cooldown de 0.5 segundos
		endif

		resultado = ProcessarTodasBalas()

	endfunction resultado

	function AtiraPlayer1()
		// Procura um slot vazio para criar bala
		if ativaP1_1 = 0
			CriarBalaP1(1)
		elseif ativaP1_2 = 0
			CriarBalaP1(2)
		elseif ativaP1_3 = 0
			CriarBalaP1(3)
		elseif ativaP1_4 = 0
			CriarBalaP1(4)
		elseif ativaP1_5 = 0
			CriarBalaP1(5)
		endif
		// Se todos os slots estão ocupados, não atira
	endfunction

	function AtiraPlayer2()
		// Procura um slot vazio para criar bala
		if ativaP2_1 = 0
			CriarBalaP2(1)
		elseif ativaP2_2 = 0
			CriarBalaP2(2)
		elseif ativaP2_3 = 0
			CriarBalaP2(3)
		elseif ativaP2_4 = 0
			CriarBalaP2(4)
		elseif ativaP2_5 = 0
			CriarBalaP2(5)
		endif
	endfunction

	function CriarBalaP1(slot)
		offset# = 20.0
		xBala# = GetSpriteX(Player1_Hitbox) + 14
		yBala# = GetSpriteY(Player1_Hitbox) + 14
		img = GetSpriteImageID(Player1_Image)
		
		// Determinar direção
		direcao# = 0.0
		if img = imagem_Player1Cima
			direcao# = 270.0
			yBala# = yBala# - offset#
		endif
		if img = imagem_Player1Baixo
			direcao# = 90.0
			yBala# = yBala# + offset#
		endif
		if img = imagem_Player1Esquerda
			direcao# = 180.0
			xBala# = xBala# - offset#
		endif
		if img = imagem_Player1Direita
			direcao# = 0.0
			xBala# = xBala# + offset#
		endif
		
		// Criar bala no slot correspondente
		if slot = 1
			balaP1_1 = CreateSprite(imagemBala)
			SetSpriteSize(balaP1_1, 10, 10)
			SetSpritePosition(balaP1_1, xBala#, yBala#)
			dirP1_1# = direcao#
			ativaP1_1 = 1
		elseif slot = 2
			balaP1_2 = CreateSprite(imagemBala)
			SetSpriteSize(balaP1_2, 10, 10)
			SetSpritePosition(balaP1_2, xBala#, yBala#)
			dirP1_2# = direcao#
			ativaP1_2 = 1
		elseif slot = 3
			balaP1_3 = CreateSprite(imagemBala)
			SetSpriteSize(balaP1_3, 10, 10)
			SetSpritePosition(balaP1_3, xBala#, yBala#)
			dirP1_3# = direcao#
			ativaP1_3 = 1
		elseif slot = 4
			balaP1_4 = CreateSprite(imagemBala)
			SetSpriteSize(balaP1_4, 10, 10)
			SetSpritePosition(balaP1_4, xBala#, yBala#)
			dirP1_4# = direcao#
			ativaP1_4 = 1
		elseif slot = 5
			balaP1_5 = CreateSprite(imagemBala)
			SetSpriteSize(balaP1_5, 10, 10)
			SetSpritePosition(balaP1_5, xBala#, yBala#)
			dirP1_5# = direcao#
			ativaP1_5 = 1
		endif
	endfunction

	function CriarBalaP2(slot)
		offset# = 20.0
		xBala# = GetSpriteX(Player2_Hitbox) + 14
		yBala# = GetSpriteY(Player2_Hitbox) + 14
		img = GetSpriteImageID(Player2_Image)
		
		// Determinar direção
		direcao# = 0.0
		if img = imagem_Player2Cima
			direcao# = 270.0
			yBala# = yBala# - offset#
		endif
		if img = imagem_Player2Baixo
			direcao# = 90.0
			yBala# = yBala# + offset#
		endif
		if img = imagem_Player2Esquerda
			direcao# = 180.0
			xBala# = xBala# - offset#
		endif
		if img = imagem_Player2Direita
			direcao# = 0.0
			xBala# = xBala# + offset#
		endif
		
		// Criar bala no slot correspondente
		if slot = 1
			balaP2_1 = CreateSprite(imagemBala)
			SetSpriteSize(balaP2_1, 10, 10)
			SetSpritePosition(balaP2_1, xBala#, yBala#)
			dirP2_1# = direcao#
			ativaP2_1 = 1
		elseif slot = 2
			balaP2_2 = CreateSprite(imagemBala)
			SetSpriteSize(balaP2_2, 10, 10)
			SetSpritePosition(balaP2_2, xBala#, yBala#)
			dirP2_2# = direcao#
			ativaP2_2 = 1
		elseif slot = 3
			balaP2_3 = CreateSprite(imagemBala)
			SetSpriteSize(balaP2_3, 10, 10)
			SetSpritePosition(balaP2_3, xBala#, yBala#)
			dirP2_3# = direcao#
			ativaP2_3 = 1
		elseif slot = 4
			balaP2_4 = CreateSprite(imagemBala)
			SetSpriteSize(balaP2_4, 10, 10)
			SetSpritePosition(balaP2_4, xBala#, yBala#)
			dirP2_4# = direcao#
			ativaP2_4 = 1
		elseif slot = 5
			balaP2_5 = CreateSprite(imagemBala)
			SetSpriteSize(balaP2_5, 10, 10)
			SetSpritePosition(balaP2_5, xBala#, yBala#)
			dirP2_5# = direcao#
			ativaP2_5 = 1
		endif
	endfunction

	function ProcessarTodasBalas()
		velocidadeBala# = 5.0
		resultado = 0
		
		// Processar balas do Player 1
		if ativaP1_1 = 1
			resultado = ProcessarBala(balaP1_1, dirP1_1#, velocidadeBala#, 1, 1)
			if resultado > 0 then exitfunction resultado
		endif
		if ativaP1_2 = 1
			resultado = ProcessarBala(balaP1_2, dirP1_2#, velocidadeBala#, 1, 2)
			if resultado > 0 then exitfunction resultado
		endif
		if ativaP1_3 = 1
			resultado = ProcessarBala(balaP1_3, dirP1_3#, velocidadeBala#, 1, 3)
			if resultado > 0 then exitfunction resultado
		endif
		if ativaP1_4 = 1
			resultado = ProcessarBala(balaP1_4, dirP1_4#, velocidadeBala#, 1, 4)
			if resultado > 0 then exitfunction resultado
		endif
		if ativaP1_5 = 1
			resultado = ProcessarBala(balaP1_5, dirP1_5#, velocidadeBala#, 1, 5)
			if resultado > 0 then exitfunction resultado
		endif
		
		// Processar balas do Player 2
		if ativaP2_1 = 1
			resultado = ProcessarBala(balaP2_1, dirP2_1#, velocidadeBala#, 2, 1)
			if resultado > 0 then exitfunction resultado
		endif
		if ativaP2_2 = 1
			resultado = ProcessarBala(balaP2_2, dirP2_2#, velocidadeBala#, 2, 2)
			if resultado > 0 then exitfunction resultado
		endif
		if ativaP2_3 = 1
			resultado = ProcessarBala(balaP2_3, dirP2_3#, velocidadeBala#, 2, 3)
			if resultado > 0 then exitfunction resultado
		endif
		if ativaP2_4 = 1
			resultado = ProcessarBala(balaP2_4, dirP2_4#, velocidadeBala#, 2, 4)
			if resultado > 0 then exitfunction resultado
		endif
		if ativaP2_5 = 1
			resultado = ProcessarBala(balaP2_5, dirP2_5#, velocidadeBala#, 2, 5)
			if resultado > 0 then exitfunction resultado
		endif
		
	endfunction resultado


	function ProcessarBala(balaID, direcao#, velocidade#, player, slot)
		resultado = 0
		
		// Mover bala
		x# = GetSpriteX(balaID)
		y# = GetSpriteY(balaID)
		x# = x# + Cos(direcao#) * velocidade#
		y# = y# + Sin(direcao#) * velocidade#
		SetSpritePosition(balaID, x#, y#)
		
		// Verificar apenas se saiu da tela (SEM colisão com paredes)
		if x# < 0 or x# > 1280 or y# < 0 or y# > 720
			DeleteSprite(balaID)
			DesativarBala(player, slot)
		else
			// Colisão apenas com players - evitar auto-dano
			if player = 2 and GetSpriteCollision(balaID, Player1_Hitbox) = 1
				resultado = 1 // Player1 foi atingido por Player2
				DeleteSprite(balaID)
				DesativarBala(player, slot)
			elseif player = 1 and GetSpriteCollision(balaID, Player2_Hitbox) = 1
				resultado = 2 // Player2 foi atingido por Player1
				DeleteSprite(balaID)
				DesativarBala(player, slot)
			endif
		endif
		
	endfunction resultado


	function DesativarBala(player, slot)
		if player = 1
			if slot = 1 then ativaP1_1 = 0
			if slot = 2 then ativaP1_2 = 0
			if slot = 3 then ativaP1_3 = 0
			if slot = 4 then ativaP1_4 = 0
			if slot = 5 then ativaP1_5 = 0
		else
			if slot = 1 then ativaP2_1 = 0
			if slot = 2 then ativaP2_2 = 0
			if slot = 3 then ativaP2_3 = 0
			if slot = 4 then ativaP2_4 = 0
			if slot = 5 then ativaP2_5 = 0
		endif
	endfunction


	function EsconderTanques()
		if tanquesInicializados = 1
			SetSpriteVisible(Player1_Image, 0)
			SetSpriteVisible(Player2_Image, 0)
		endif
	endfunction


	function ResetarPosicoesTanques()
		if tanquesInicializados = 1
			// Resetar posições iniciais
			// Player 1 - posição inicial (canto superior esquerdo)
			SetSpritePosition(Player1_Hitbox, 125, 144)
			SetSpritePosition(Player1_Image, 125, 144)
			SetSpriteImage(Player1_Image, imagem_Player1Direita)  // Direção inicial
			
			// Player 2 - posição inicial (canto inferior direito)
			SetSpritePosition(Player2_Hitbox, 1010, 560)
			SetSpritePosition(Player2_Image, 1010, 560)
			SetSpriteImage(Player2_Image, imagem_Player2Cima)  // Direção inicial
			
			// Limpar todas as balas ativas do Player 1
			if ativaP1_1 = 1
				DeleteSprite(balaP1_1)
				ativaP1_1 = 0
			endif
			if ativaP1_2 = 1
				DeleteSprite(balaP1_2)
				ativaP1_2 = 0
			endif
			if ativaP1_3 = 1
				DeleteSprite(balaP1_3)
				ativaP1_3 = 0
			endif
			if ativaP1_4 = 1
				DeleteSprite(balaP1_4)
				ativaP1_4 = 0
			endif
			if ativaP1_5 = 1
				DeleteSprite(balaP1_5)
				ativaP1_5 = 0
			endif
			
			// Limpar todas as balas ativas do Player 2
			if ativaP2_1 = 1
				DeleteSprite(balaP2_1)
				ativaP2_1 = 0
			endif
			if ativaP2_2 = 1
				DeleteSprite(balaP2_2)
				ativaP2_2 = 0
			endif
			if ativaP2_3 = 1
				DeleteSprite(balaP2_3)
				ativaP2_3 = 0
			endif
			if ativaP2_4 = 1
				DeleteSprite(balaP2_4)
				ativaP2_4 = 0
			endif
			if ativaP2_5 = 1
				DeleteSprite(balaP2_5)
				ativaP2_5 = 0
			endif
			
			// Resetar cooldowns de tiro
			proximoTiro1# = 0.0
			proximoTiro2# = 0.0
		endif
	endfunction
