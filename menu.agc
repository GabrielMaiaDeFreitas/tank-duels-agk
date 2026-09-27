
	
	global selecaoMenu = 1
	global menuID, playID, exitID, setaID
	global menuSprite, BotaoplaySprite, BotaoexitSprite, Seta_Menu1, Seta_Menu2
	global menuInicializado = 0

	
	function InicializarMenu()
		if menuInicializado = 1 then exitfunction
		
		// Carregamento das imagens
		menuID = LoadImage("menu.png")
		playID = LoadImage("Play.png")  
		exitID = LoadImage("Exit.png")
		setaID = LoadImage("Seta_Menu.png")
		
		// Criação dos sprites
		menuSprite = CreateSprite(menuID)
		BotaoplaySprite = CreateSprite(playID)
		BotaoexitSprite = CreateSprite(exitID)
		Seta_Menu1 = CreateSprite(setaID)
		Seta_Menu2 = CreateSprite(setaID)
		
		// Posicionamento
		SetSpritePosition(menuSprite, 0, 0)
		SetSpritePosition(BotaoplaySprite, 460, 250)
		SetSpritePosition(BotaoexitSprite, 460, 400)
		SetSpritePosition(Seta_Menu1, 395, 285)
		SetSpritePosition(Seta_Menu2, 395, 435)
		
		// Configuração das setas
		SetSpriteScale(Seta_Menu1, 0.5, 0.5)
		SetSpriteScale(Seta_Menu2, 0.5, 0.5)
		
	  SetSpriteDepth(menuSprite, 10)      
		SetSpriteDepth(BotaoplaySprite, 5)
		SetSpriteDepth(BotaoexitSprite, 5)
		SetSpriteDepth(Seta_Menu1, 2)    //sopreposição de sprite
		SetSpriteDepth(Seta_Menu2, 2)
		
		menuInicializado = 1
	endfunction

	
	function MostrarMenu()
		SetSpriteVisible(menuSprite, 1)
		SetSpriteVisible(BotaoplaySprite, 1)
		SetSpriteVisible(BotaoexitSprite, 1)
		
		// Mostrar seta na posição correta
		if selecaoMenu = 1
			SetSpriteVisible(Seta_Menu1, 1)
			SetSpriteVisible(Seta_Menu2, 0)
		else
			SetSpriteVisible(Seta_Menu1, 0)
			SetSpriteVisible(Seta_Menu2, 1)
		endif
	endfunction

	
	function EsconderMenu()
		SetSpriteVisible(menuSprite, 0)
		SetSpriteVisible(BotaoplaySprite, 0)
		SetSpriteVisible(BotaoexitSprite, 0)
		SetSpriteVisible(Seta_Menu1, 0)
		SetSpriteVisible(Seta_Menu2, 0)
	endfunction


	function ProcessarMenu()
		resultado = 0
		
		// Navegação - Seta para baixo
		if GetRawKeyPressed(40) = 1 and selecaoMenu = 1
			selecaoMenu = 2
			SetSpriteVisible(Seta_Menu1, 0)
			SetSpriteVisible(Seta_Menu2, 1)
		endif
		
		// Navegação - Seta para cima
		if GetRawKeyPressed(38) = 1 and selecaoMenu = 2
			selecaoMenu = 1
			SetSpriteVisible(Seta_Menu1, 1)
			SetSpriteVisible(Seta_Menu2, 0)
		endif
		
		// Confirmação com Enter
		if GetRawKeyPressed(13) = 1
			if selecaoMenu = 1
				resultado = 1 // Iniciar jogo
			else
				resultado = 2 // Sair do jogo
			endif
		endif
		
	endfunction resultado

