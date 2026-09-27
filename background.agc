	global imagem_MapaLabirinto, sprite_MapaLabirinto
	global mapaInicializado = 0

	// Sprites das paredes individuais
	global parede1, parede2, parede3, parede4, parede5, parede6, parede7, parede8, parede9, parede10
	global parede11, parede12, parede20, parede21, parede22, parede30, parede31, parede32, parede33
	global parede34, parede35, parede36, parede37, parede38, parede50, parede51, parede52, parede53
	global parede54, parede55, parede56, parede57, parede58


	function Mapa()

		// Inicializar mapa se necessário
		if mapaInicializado = 0
			
			imagem_MapaLabirinto = LoadImage("mapa_Labirinto.png")
			sprite_MapaLabirinto = CreateSprite(imagem_MapaLabirinto)
			SetSpritePosition(sprite_MapaLabirinto, 0, 0)

			
			// Paredes externas
			parede1 = CreateSprite(0)
			SetSpriteSize(parede1, 118, 5)
			SetSpritePosition(parede1, 942, 463)
			SetSpriteColorAlpha(parede1, 0)

			parede2 = CreateSprite(0)
			SetSpriteSize(parede2, 5, 134)
			SetSpritePosition(parede2, 942, 329)
			SetSpriteColorAlpha(parede2, 0)

			parede3 = CreateSprite(0)
			SetSpriteSize(parede3, 95, 5)
			SetSpritePosition(parede3, 942, 329)
			SetSpriteColorAlpha(parede3, 0)

			parede4 = CreateSprite(0)
			SetSpriteSize(parede4, 5, 244)
			SetSpritePosition(parede4, 1029, 85)
			SetSpriteColorAlpha(parede4, 0)

			parede5 = CreateSprite(0)
			SetSpriteSize(parede5, 555, 5)
			SetSpritePosition(parede5, 494, 84)
			SetSpriteColorAlpha(parede5, 0)

			parede6 = CreateSprite(0)
			SetSpriteSize(parede6, 5, 59)
			SetSpritePosition(parede6, 490, 84)
			SetSpriteColorAlpha(parede6, 0)

			parede7 = CreateSprite(0)
			SetSpriteSize(parede7, 5, 226)
			SetSpritePosition(parede7, 331, 198)
			SetSpriteColorAlpha(parede7, 0)

			parede8 = CreateSprite(0)
			SetSpriteSize(parede8, 163, 5)
			SetSpritePosition(parede8, 172, 420)
			SetSpriteColorAlpha(parede8, 0)

			parede9 = CreateSprite(0)
			SetSpriteSize(parede9, 5, 174)
			SetSpritePosition(parede9, 169, 420)
			SetSpriteColorAlpha(parede9, 0)

			parede10 = CreateSprite(0)
			SetSpriteSize(parede10, 593, 5)
			SetSpritePosition(parede10, 169, 592)
			SetSpriteColorAlpha(parede10, 0)

			parede11 = CreateSprite(0)
			SetSpriteSize(parede11, 5, 75)
			SetSpritePosition(parede11, 760, 522)
			SetSpriteColorAlpha(parede11, 0)

			parede12 = CreateSprite(0)
			SetSpriteSize(parede12, 242, 21)
			SetSpritePosition(parede12, 760, 522)
			SetSpriteColorAlpha(parede12, 0)

			// Paredes do spawn
			parede20 = CreateSprite(0)
			SetSpriteSize(parede20, 291, 5)
			SetSpritePosition(parede20, 202, 138)
			SetSpriteColorAlpha(parede20, 0)

			parede21 = CreateSprite(0)
			SetSpriteSize(parede21, 134, 5)
			SetSpritePosition(parede21, 202, 197)
			SetSpriteColorAlpha(parede21, 0)

			parede22 = CreateSprite(0)
			SetSpriteSize(parede22, 5, 80)
			SetSpritePosition(parede22, 1059, 463)
			SetSpriteColorAlpha(parede22, 0)

			// Paredes do spawn (continuação)
			parede30 = CreateSprite(0)
			SetSpriteSize(parede30, 5, 127)
			SetSpritePosition(parede30, 966, 525)
			SetSpriteColorAlpha(parede30, 0)

			parede31 = CreateSprite(0)
			SetSpriteSize(parede31, 121, 5)
			SetSpritePosition(parede31, 971, 652)
			SetSpriteColorAlpha(parede31, 0)

			parede32 = CreateSprite(0)
			SetSpriteSize(parede32, 5, 120)
			SetSpritePosition(parede32, 1092, 537)
			SetSpriteColorAlpha(parede32, 0)

			parede33 = CreateSprite(0)
			SetSpriteSize(parede33, 30, 5)
			SetSpritePosition(parede33, 1062, 538)
			SetSpriteColorAlpha(parede33, 0)

			parede34 = CreateSprite(0)
			SetSpriteSize(parede34, 5, 30)
			SetSpritePosition(parede34, 202, 108)
			SetSpriteColorAlpha(parede34, 0)

			parede35 = CreateSprite(0)
			SetSpriteSize(parede35, 114, 5)
			SetSpritePosition(parede35, 88, 108)
			SetSpriteColorAlpha(parede35, 0)

			parede36 = CreateSprite(0)
			SetSpriteSize(parede36, 5, 120)
			SetSpritePosition(parede36, 83, 108)
			SetSpriteColorAlpha(parede36, 0)

			parede37 = CreateSprite(0)
			SetSpriteSize(parede37, 120, 5)
			SetSpritePosition(parede37, 83, 228)
			SetSpriteColorAlpha(parede37, 0)

			parede38 = CreateSprite(0)
			SetSpriteSize(parede38, 5, 37)
			SetSpritePosition(parede38, 202, 197)
			SetSpriteColorAlpha(parede38, 0)

			// Paredes internas
			parede50 = CreateSprite(0)
			SetSpriteSize(parede50, 422, 35)
			SetSpritePosition(parede50, 552, 143)
			SetSpriteColorAlpha(parede50, 0)

			parede51 = CreateSprite(0)
			SetSpriteSize(parede51, 150, 163)
			SetSpritePosition(parede51, 553, 376)
			SetSpriteColorAlpha(parede51, 0)

			parede52 = CreateSprite(0)
			SetSpriteSize(parede52, 100, 162)
			SetSpritePosition(parede52, 394, 377)
			SetSpriteColorAlpha(parede52, 0)

			parede53 = CreateSprite(0)
			SetSpriteSize(parede53, 155, 60)
			SetSpritePosition(parede53, 239, 479)
			SetSpriteColorAlpha(parede53, 0)

			parede54 = CreateSprite(0)
			SetSpriteSize(parede54, 377, 82)
			SetSpritePosition(parede54, 394, 239)
			SetSpriteColorAlpha(parede54, 0)

			parede55 = CreateSprite(0)
			SetSpriteSize(parede55, 101, 42)
			SetSpritePosition(parede55, 394, 198)
			SetSpriteColorAlpha(parede55, 0)

			parede56 = CreateSprite(0)
			SetSpriteSize(parede56, 125, 90)
			SetSpritePosition(parede56, 762, 376)
			SetSpriteColorAlpha(parede56, 0)

			parede57 = CreateSprite(0)
			SetSpriteSize(parede57, 145, 35)
			SetSpritePosition(parede57, 829, 239)
			SetSpriteColorAlpha(parede57, 0)

			parede58 = CreateSprite(0)
			SetSpriteSize(parede58, 58, 104)
			SetSpritePosition(parede58, 829, 273)
			SetSpriteColorAlpha(parede58, 0)

			SetSpriteDepth(sprite_MapaLabirinto, 100) // MAPA NO FUNDO
			
			// definir profundidade(maior mais atrás):
			SetSpriteDepth(parede1, 200)
			SetSpriteDepth(parede2, 200)
			SetSpriteDepth(parede3, 200)
			SetSpriteDepth(parede4, 200)
			SetSpriteDepth(parede5, 200)
			SetSpriteDepth(parede6, 200)
			SetSpriteDepth(parede7, 200)
			SetSpriteDepth(parede8, 200)
			SetSpriteDepth(parede9, 200)
			SetSpriteDepth(parede10, 200)
			SetSpriteDepth(parede11, 200)
			SetSpriteDepth(parede12, 200)
			SetSpriteDepth(parede20, 200)
			SetSpriteDepth(parede21, 200)
			SetSpriteDepth(parede22, 200)
			SetSpriteDepth(parede30, 200)
			SetSpriteDepth(parede31, 200)
			SetSpriteDepth(parede32, 200)
			SetSpriteDepth(parede33, 200)
			SetSpriteDepth(parede34, 200)
			SetSpriteDepth(parede35, 200)
			SetSpriteDepth(parede36, 200)
			SetSpriteDepth(parede37, 200)
			SetSpriteDepth(parede38, 200)
			SetSpriteDepth(parede50, 200)
			SetSpriteDepth(parede51, 200)
			SetSpriteDepth(parede52, 200)
			SetSpriteDepth(parede53, 200)
			SetSpriteDepth(parede54, 200)
			SetSpriteDepth(parede55, 200)
			SetSpriteDepth(parede56, 200)
			SetSpriteDepth(parede57, 200)
			SetSpriteDepth(parede58, 200)
			
			mapaInicializado = 1
		endif

		SetSpriteVisible(sprite_MapaLabirinto, 1)
		
	endfunction



	function EsconderMapa()
		if mapaInicializado = 1
			SetSpriteVisible(sprite_MapaLabirinto, 0)
		endif
	endfunction



	function TestarColisaoParedes(spriteID)
		colidiu = 0
		
		if mapaInicializado = 1
			if GetSpriteCollision(spriteID, parede1) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede2) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede3) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede4) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede5) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede6) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede7) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede8) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede9) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede10) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede11) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede12) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede20) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede21) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede22) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede30) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede31) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede32) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede33) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede34) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede35) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede36) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede37) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede38) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede50) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede51) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede52) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede53) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede54) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede55) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede56) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede57) = 1 then colidiu = 1
			if GetSpriteCollision(spriteID, parede58) = 1 then colidiu = 1
		endif
		
	endfunction colidiu
