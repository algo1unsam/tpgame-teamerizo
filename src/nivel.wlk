import wollok.game.*
import erizo.*
import movimientoPersonajes.*
import vehiculos.*
import plataformas.*
import moneda.*
import temporizador.*
import agua.*
import madriguera.*

object nivel {

	const width = 17
	
	const autosDer = [ 
		new AutoRapido(posY = 1 , posXInicio = 1),		
		new AutoLento(posY = 3, posXInicio = 1),				
		new AutoMedio(posY = 5, posXInicio = 1)
	]
	
	const autosIzq = [
		new AutoMedio(posY = 2,posXInicio = 1),		
		new AutoLento(posY = 4,posXInicio = 1)
	]
	
	const plataformasDer = [
		new Tronco(posY = 7 ,posXInicio = 1),
		new Tronco(posY = 7 , posXInicio = 2),
		new Tronco(posY = 7 , posXInicio = 8),
		new Tronco(posY = 7 , posXInicio = 9),
		new Tronco(posY = 7 , posXInicio = 13),
		
		new Tortuga(posY = 9, posXInicio = 4),
		new Tortuga(posY = 9, posXInicio = 5),
		new Tortuga(posY = 9, posXInicio = 10),
		new Tortuga(posY = 9, posXInicio = 11),		
			
		new Tronco(posY = 11, posXInicio = 1),
		new Tronco(posY = 11, posXInicio = 2),
		new Tronco(posY = 11, posXInicio = 6),
		new Tronco(posY = 11, posXInicio = 7),
		new Tronco(posY = 11, posXInicio = 12),
		new Tronco(posY = 11, posXInicio = 13)
	]
	
	const plataformasIzq = [
		
		new Tronco(posY = 8, posXInicio = 1),
		new Tronco(posY = 8, posXInicio = 4),
		new Tronco(posY = 8, posXInicio = 7),
		new Tronco(posY = 8, posXInicio = 10),
		new Tronco(posY = 8, posXInicio = 13),	
		
		new Tronco(posY = 10, posXInicio = 15),
		new Tronco(posY = 10, posXInicio = 14),
		new Tronco(posY = 10, posXInicio = 13)
	]
	
	const madrigueras = [
	 	new Madriguera(posX = 7 , posY = 12),
	 	new Madriguera(posX = 9 , posY = 12)
	 ]
	
	method configurate() {
		// CONFIG	
		
		game.height(13)
		game.width(width)
		game.boardGround("assets/backgroundFrog.png")
		
		// VISUALES
		game.addVisual(reloj)
		
		movimiento.configurarFlechas(erizo)
		
		
		
		plataformasDer.forEach{ plataforma => 
			game.addVisual(plataforma)
			plataforma.velocidad()
			plataforma.iniciar()
		
		}
		plataformasIzq.forEach{ plataforma => 
			game.addVisual(plataforma)
			plataforma.velocidad()
			plataforma.iniciar()
			plataforma.cambiarDireccionDeMov()
		
		}
		autosDer.forEach{ auto => 
			
			auto.velocidad()			
			game.addVisual(auto)
			auto.iniciar()
		}
		
		autosIzq.forEach{ auto => 
			
			auto.velocidad()
			auto.cambiarDireccionDeMov()			
			game.addVisual(auto)
			auto.iniciar()
			
		}
		
		madrigueras.forEach{ madriguera =>
			game.addVisual(madriguera)
		}
			
		self.generarMonedas()
		game.addVisual(erizo)
			
		reloj.iniciar()
		
		
			
		self.generarMonedas()
		
		// Collide
		game.whenCollideDo(erizo, { objeto => objeto.chocar()})
		
	}

	method perder() {
		game.addVisual(gameOver)
		self.terminar()
		erizo.morir()
	}

	method terminar() {
		autosDer.forEach{ auto => auto.detener()}
		autosIzq.forEach{ auto => auto.detener()}
		plataformasDer.forEach{ plataforma => plataforma.detener()}
		plataformasIzq.forEach{ plataforma => plataforma.detener()}
		reloj.detener()
	}

	// MONEDA
	method generarMonedas() {
		game.schedule(500, { self.generarMoneda(100)})
	}

	method generarMoneda(valor) {
		const pos = self.posicionAleatoria()
		const moneda = new Moneda(position = pos, valor = valor)
		game.addVisual(moneda)
	}

	method posicionAleatoria() = game.at(0.randomUpTo(game.width()), 1.randomUpTo(game.height()))

}

object victoria {

	method position() = game.center()

	method cartel() = game.addVisual(self)

	method image() = "assets/winner.png"

}

object gameOver {
	
	method chocar() {}

	method position() = game.center()

	method text() = "GAME OVER"

}