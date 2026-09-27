
	// Estados do jogo
	global estadoJogo = 0

	// Imagens de vida
	global imgVida1_0 = 0  // 3 corações cinza
	global imgVida1_1 = 0  // 1 coração vermelho
	global imgVida1_2 = 0  // 2 corações vermelhos
	global imgVida1_3 = 0  // 3 corações vermelhos
	global imgVida2_0 = 0  // 3 corações cinza
	global imgVida2_1 = 0  // 1 coração azul
	global imgVida2_2 = 0  // 2 corações azuis
	global imgVida2_3 = 0  // 3 corações azuis

	// Sprites de vitória
	global spriteVitoria = 0
	global imgVitoriaP1 = 0
	global imgVitoriaP2 = 0

	// Estado da tela de vitória
	global telaVitoriaAtiva = 0
	global vencedor = 0

	// NOVA VARIÁVEL: ID do texto de instruções
	global textoInstrucoes = 0

	// Vidas dos players
	global vidaPlayer1 = 3
	global vidaPlayer2 = 3

	// Sprites de vida
	global spriteVida1 = 0
	global spriteVida2 = 0

	// Tags dos players
	global tagPlayer1 = 0
	global tagPlayer2 = 0

	// IDs das imagens das tags
	global imgTagPlayer1 = 0
	global imgTagPlayer2 = 0

	// Flag de inicialização
	global vidasInicializadas = 0


	function CarregarImagensVida()
		// Carregar imagens de vida do Player 1 (Vermelho)
		imgVida1_0 = LoadImage("3coracoesCinza.png")
		imgVida1_1 = LoadImage("1coracaoVermelho.png")
		imgVida1_2 = LoadImage("2coracoesVermelhos.png")
		imgVida1_3 = LoadImage("3coracoesVermelhos.png")
		
		// Carregar imagens de vida do Player 2 (Azul)
		imgVida2_0 = LoadImage("3coracoesCinza.png")
		imgVida2_1 = LoadImage("1coracaoAzul.png")
		imgVida2_2 = LoadImage("2coracoesAzuis.png")
		imgVida2_3 = LoadImage("3coracoesAzuis.png")
		
		// Carregar imagens de vitória
		imgVitoriaP1 = LoadImage("Player1Wins.png")
		imgVitoriaP2 = LoadImage("Player2Wins.png")
		
		// Tentar carregar imagens das tags dos players (opcional)
		// Se as imagens não existirem, o LoadImage retornará 0
		imgTagPlayer1 = LoadImage("Player1Tag.png")
		imgTagPlayer2 = LoadImage("Player2Tag.png")
	endfunction


	function InicializarSpriteVidas()
		if vidasInicializadas = 1 then exitfunction
		
		if imgVida1_3 = 0
			CarregarImagensVida()
		endif
		
		// Criar sprite de vida do Player 1
		spriteVida1 = CreateSprite(imgVida1_3)
		SetSpriteSize(spriteVida1, 200, 100)
		SetSpritePosition(spriteVida1, 40, 45)
		SetSpriteDepth(spriteVida1, 1)  // SPRITES DE VIDA NA FRENTE DE TUDO
		
		// Criar sprite de vida do Player 2
		spriteVida2 = CreateSprite(imgVida2_3)
		SetSpriteSize(spriteVida2, 200, 100)
		SetSpritePosition(spriteVida2, 1080, 45)
		SetSpriteDepth(spriteVida2, 1)  // SPRITES DE VIDA NA FRENTE DE TUDO
		
		// Criar tags dos players
		if imgTagPlayer1 > 0
			tagPlayer1 = CreateSprite(imgTagPlayer1)
			SetSpriteSize(tagPlayer1, 200, 40)
			SetSpritePosition(tagPlayer1, 45, 15)
			SetSpriteDepth(tagPlayer1, 1)  // TAGS NA FRENTE
		endif
		
		if imgTagPlayer2 > 0
			tagPlayer2 = CreateSprite(imgTagPlayer2)
			SetSpriteSize(tagPlayer2, 200, 40)
			SetSpritePosition(tagPlayer2, 1085, 15)
			SetSpriteDepth(tagPlayer2, 1)  // TAGS NA FRENTE
		endif
		
		// Esconder inicialmente
		SetSpriteVisible(spriteVida1, 0)
		SetSpriteVisible(spriteVida2, 0)
		if tagPlayer1 > 0 then SetSpriteVisible(tagPlayer1, 0)
		if tagPlayer2 > 0 then SetSpriteVisible(tagPlayer2, 0)
		
		vidasInicializadas = 1
	endfunction


	function MostrarSpriteVidas()

		if spriteVida1 > 0 
			SetSpriteVisible(spriteVida1, 1)
			// GARANTIR QUE ESTÁ NA FRENTE
			SetSpriteDepth(spriteVida1, 10)

		endif
		
		if spriteVida2 > 0 
			SetSpriteVisible(spriteVida2, 1)
			// GARANTIR QUE ESTÁ NA FRENTE
			SetSpriteDepth(spriteVida2, 10)
	 
		endif
		
		if tagPlayer1 > 0 
			SetSpriteVisible(tagPlayer1, 1)
			SetSpriteDepth(tagPlayer1, 10)
		endif
		if tagPlayer2 > 0 
			SetSpriteVisible(tagPlayer2, 1)
			SetSpriteDepth(tagPlayer2, 10)
		endif
	endfunction

	function AtualizarSpriteVidaPlayer1()

		if spriteVida1 > 0
			if vidaPlayer1 = 0
				SetSpriteImage(spriteVida1, imgVida1_0)
			elseif vidaPlayer1 = 1
				SetSpriteImage(spriteVida1, imgVida1_1)
			elseif vidaPlayer1 = 2
				SetSpriteImage(spriteVida1, imgVida1_2)
			else
				SetSpriteImage(spriteVida1, imgVida1_3)
			endif
		  
		else
		  
		endif
	endfunction

	function AtualizarSpriteVidaPlayer2()

		if spriteVida2 > 0
			if vidaPlayer2 = 0
				SetSpriteImage(spriteVida2, imgVida2_0)
			elseif vidaPlayer2 = 1
				SetSpriteImage(spriteVida2, imgVida2_1)
			elseif vidaPlayer2 = 2
				SetSpriteImage(spriteVida2, imgVida2_2)
			else
				SetSpriteImage(spriteVida2, imgVida2_3)
			endif
		 
		else
		
		endif
	endfunction

	function MostrarTelaVitoria(playerVencedor)
		vencedor = playerVencedor
		telaVitoriaAtiva = 1
		
		// Limpar sprite de vitória anterior se existir
		if spriteVitoria > 0
			DeleteSprite(spriteVitoria)
		endif
		
		// Limpar texto anterior se existir
		if textoInstrucoes > 0
			DeleteText(textoInstrucoes)
		endif
		
		// Criar sprite de vitória
		if playerVencedor = 1
			spriteVitoria = CreateSprite(imgVitoriaP1)
		else
			spriteVitoria = CreateSprite(imgVitoriaP2)
		endif
		
		SetSpriteSize(spriteVitoria, 800, 400)
		SetSpritePosition(spriteVitoria, 240, 160)
		SetSpriteDepth(spriteVitoria, 0)  // TELA DE VITÓRIA NA FRENTE DE TUDO
		

		textoInstrucoes = CreateText("ENTER - Voltar ao Lobby | ESC - Sair do Jogo")
		SetTextPosition(textoInstrucoes, 640, 580)  // Centralizado abaixo do sprite
		SetTextAlignment(textoInstrucoes, 1)  // Centralizado
		SetTextSize(textoInstrucoes, 24)
		SetTextColor(textoInstrucoes, 255, 255, 255, 255)  // Branco
		SetTextDepth(textoInstrucoes, 0)  // Na frente de tudo
		
	endfunction


	// Retorna: 0 = continua na tela, 1 = voltar ao lobby, 2 = sair do jogo
	function ProcessarTelaVitoria()
		resultado = 0
		
		if telaVitoriaAtiva = 1
			// ENTER - Voltar ao lobby/menu
			if GetRawKeyPressed(13) = 1  // Enter
				// Limpar tela de vitória
				if spriteVitoria > 0
					DeleteSprite(spriteVitoria)
					spriteVitoria = 0
				endif
				
				// Limpar texto de instruções
				if textoInstrucoes > 0
					DeleteText(textoInstrucoes)
					textoInstrucoes = 0
				endif
				
				// Resetar estado
				telaVitoriaAtiva = 0
				vencedor = 0
				resultado = 1  // Voltar ao lobby
			endif
			
		
			if GetRawKeyPressed(27) = 1  // ESC
				// Limpar tela de vitória
				if spriteVitoria > 0
					DeleteSprite(spriteVitoria)
					spriteVitoria = 0
				endif
				
				// Limpar texto de instruções
				if textoInstrucoes > 0
					DeleteText(textoInstrucoes)
					textoInstrucoes = 0
				endif
				
				// Resetar estado
				telaVitoriaAtiva = 0
				vencedor = 0
				resultado = 2  // Sair do jogo
			endif
		endif
		
	endfunction resultado

	function CausarDanoPlayer1()
		if vidaPlayer1 > 0
			vidaPlayer1 = vidaPlayer1 - 1
			if vidaPlayer1 < 0 then vidaPlayer1 = 0
			
			AtualizarSpriteVidaPlayer1()
			
		
			if vidaPlayer1 <= 0
				MostrarTelaVitoria(2)  // Player 2 venceu
			endif
		endif
	endfunction

	function CausarDanoPlayer2()
		if vidaPlayer2 > 0
			vidaPlayer2 = vidaPlayer2 - 1
			if vidaPlayer2 < 0 then vidaPlayer2 = 0
			
			AtualizarSpriteVidaPlayer2()
			
			
			if vidaPlayer2 <= 0
				MostrarTelaVitoria(1)  // Player 1 venceu
			endif
		endif
	endfunction


	function ResetarVidas()
		vidaPlayer1 = 3
		vidaPlayer2 = 3
		AtualizarSpriteVidaPlayer1()
		AtualizarSpriteVidaPlayer2()
	endfunction

	function EsconderSpriteVidas()
		
		if spriteVida1 > 0 then SetSpriteVisible(spriteVida1, 0)
		if spriteVida2 > 0 then SetSpriteVisible(spriteVida2, 0)
		if tagPlayer1 > 0 then SetSpriteVisible(tagPlayer1, 0)
		if tagPlayer2 > 0 then SetSpriteVisible(tagPlayer2, 0)
	endfunction
