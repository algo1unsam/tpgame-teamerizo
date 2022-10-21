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
		new Vehiculos(posY = 1 , posXInicio = 1,velocidad = 400, image = "assets/autoRojo.png"),		
		new Vehiculos(posY = 3, posXInicio = 1,velocidad = 300, image = "assets/autoRojo.png"),				
		new Vehiculos(posY = 5, posXInicio = 11,velocidad = 100, image = "assets/autoRojo.png")
	]
	
	const autosIzq = [
		new Vehiculos(posY = 2,posXInicio = 1, velocidad = 200, image = "assets/autoRojo.png"),		
		new Vehiculos(posY = 4,posXInicio = 1, velocidad = 50, image = "assets/autoRojo.png")
	]
	
	const troncosDer = [
		new Tronco(posY = 7 ,velocidad = 1000, posXInicio = 1, image = "assets/TRONCO.png"),
		new Tronco(posY = 7 ,velocidad = 1000, posXInicio = 2, image = "assets/TRONCO.png"),
		new Tronco(posY = 7 ,velocidad = 1000, posXInicio = 8, image = "assets/TRONCO.png"),
		new Tronco(posY = 7 ,velocidad = 1000, posXInicio = 9, image = "assets/TRONCO.png"),
		new Tronco(posY = 7 ,velocidad = 1000, posXInicio = 13, image = "assets/TRONCO.png"),
		
		new Tronco(posY = 9, velocidad = 800, posXInicio = 4, image = "assets/TRONCO.png"),
		new Tronco(posY = 9, velocidad = 800, posXInicio = 5, image = "assets/TRONCO.png"),
		new Tronco(posY = 9, velocidad = 800, posXInicio = 10, image = "assets/TRONCO.png"),
		new Tronco(posY = 9, velocidad = 800, posXInicio = 11, image = "assets/TRONCO.png"),		
			
		new Tronco(posY = 11, velocidad = 500, posXInicio = 1, image = "assets/TRONCO.png"),
		new Tronco(posY = 11, velocidad = 500, posXInicio = 2, image = "assets/TRONCO.png"),
		new Tronco(posY = 11, velocidad = 500, posXInicio = 6, image = "assets/TRONCO.png"),
		new Tronco(posY = 11, velocidad = 500, posXInicio = 7, image = "assets/TRONCO.png"),
		new Tronco(posY = 11, velocidad = 500, posXInicio = 12, image = "assets/TRONCO.png"),
		new Tronco(posY = 11, velocidad = 500, posXInicio = 13, image = "assets/TRONCO.png")
	]
	
	const troncosIzq = [
		
		new Tronco(posY = 8, velocidad = 500, posXInicio = 1, image = "assets/TRONCO.png"),
		new Tronco(posY = 8, velocidad = 500, posXInicio = 4, image = "assets/TRONCO.png"),
		new Tronco(posY = 8, velocidad = 500, posXInicio = 7, image = "assets/TRONCO.png"),
		new Tronco(posY = 8, velocidad = 500, posXInicio = 10, image = "assets/TRONCO.png"),
		new Tronco(posY = 8, velocidad = 500, posXInicio = 13, image = "assets/TRONCO.png"),	
		
		new Tronco(posY = 10, velocidad = 1000, posXInicio = 15, image = "assets/TRONCO.png"),
		new Tronco(posY = 10, velocidad = 1000, posXInicio = 14, image = "assets/TRONCO.png"),
		new Tronco(posY = 10, velocidad = 1000, posXInicio = 13, image = "assets/TRONCO.png")
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
		
		
		
		troncosDer.forEach{ tronco => 
			game.addVisual(tronco)
			tronco.iniciar()
		
		}
		troncosIzq.forEach{ tronco => 
			game.addVisual(tronco)
			tronco.iniciar()
			tronco.cambiarDireccionDeMov()
		
		}
		autosDer.forEach{ auto => 
			game.addVisual(auto)
			auto.iniciar()
		}
		
		autosIzq.forEach{ auto => 
			game.addVisual(auto)
			auto.iniciar()
			auto.cambiarDireccionDeMov()
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
		troncosDer.forEach{ tronco => tronco.detener()}
		troncosIzq.forEach{ tronco => tronco.detener()}
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

