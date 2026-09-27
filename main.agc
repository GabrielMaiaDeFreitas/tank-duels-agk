	SetErrorMode(2)
	SetWindowTitle("TankDuels")
	SetWindowSize(1280, 720, 0)
	SetWindowAllowResize(1)
	SetVirtualResolution(1280, 720)
	SetOrientationAllowed(1, 1, 1, 1)
	SetSyncRate(60, 0)
	SetScissor(0,0,0,0)
	UseNewDefaultFonts(1)

	#include "menu.agc"
	#include "background.agc"
	#include "tank.agc"
	#include "WinLoss.agc"

	// Inicializar sistemas
	InicializarMenu()
	CarregarImagensVida()
	InicializarSpriteVidas()
	EsconderSpriteVidas()

	// Inicializar sistemas
	InicializarMenu()
	CarregarImagensVida()
	InicializarSpriteVidas()
	estadoJogo = 0
	telaVitoriaAtiva = 0
	vencedor = 0
	vidaPlayer1 = 3
	vidaPlayer2 = 3

	do
		if estadoJogo = 0 and telaVitoriaAtiva = 0

			MostrarMenu()
			
			resultadoMenu = ProcessarMenu()
			
			if resultadoMenu = 1
				estadoJogo = 1
				EsconderMenu()
				
				// Resetar estado
				telaVitoriaAtiva = 0
				vencedor = 0
				
				// Resetar vidas
				vidaPlayer1 = 3
				vidaPlayer2 = 3
				AtualizarSpriteVidaPlayer1()
				AtualizarSpriteVidaPlayer2()
				MostrarSpriteVidas()
				
				ResetarPosicoesTanques()
				
			elseif resultadoMenu = 2
				End
			endif
			
		elseif estadoJogo = 1 and telaVitoriaAtiva = 0

			
			Mapa()
			
			resultadoTanques = Tanques()
			
			if resultadoTanques = 1
				CausarDanoPlayer1()
			elseif resultadoTanques = 2
				CausarDanoPlayer2()
			endif
			
			if GetRawKeyPressed(27) = 1
				estadoJogo = 0
				telaVitoriaAtiva = 0
				vencedor = 0
				
				if spriteVitoria > 0
					DeleteSprite(spriteVitoria)
					spriteVitoria = 0
				endif
				
				EsconderMapa()
				EsconderTanques()
				EsconderSpriteVidas()
				MostrarMenu()
			endif
			
		elseif telaVitoriaAtiva = 1
			// ========== ESTADO VITÓRIA ==========
			resultadoVitoria = ProcessarTelaVitoria()
			
			if resultadoVitoria = 1
				// ENTER - Voltar ao lobby
				estadoJogo = 0
				telaVitoriaAtiva = 0
				vencedor = 0
				
				EsconderMapa()
				EsconderTanques()
				EsconderSpriteVidas()
				MostrarMenu()
				
			elseif resultadoVitoria = 2
				// ESC - Sair do jogo COMPLETAMENTE
				End
			endif
		endif
		
		Sync()
	loop
