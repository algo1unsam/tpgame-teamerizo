import wollok.game.*
import erizo.*
import movimientoPersonajes.*
import vehiculos.*
import plataformas.*
import moneda.*
import temporizador.*
import agua.*
import madriguera.*
 
	const autosDer = []
	
	const autosIzq = []
	
	const plataformasDer = []
	
	const plataformasIzq = []
	
	const madrigueras = [
	 	new Madriguera(posX = 7 , posY = 12),
	 	new Madriguera(posX = 9 , posY = 12)
	 ]

const width = 17

object nivel {

	method configurate() {
		// CONFIG	
		
		game.height(13)
		game.width(width)
		game.boardGround("assets/backgroundFrog.png")		
	
	}
	
	method cargarObjetos(dificultad){
		dificultad.cargar(plataformasDer, plataformasIzq, autosDer, autosIzq)
	}
	
	method iniciarNivel(){
		
		// VISUALES
		game.addVisual(reloj)
		
        game.addVisual(primeraVida)
        game.addVisual(segundaVida)
        game.addVisual(terceraVida)
        
		
		// MOVIMIENTOS
		movimiento.configurarFlechas(erizo)		
		
		// RELOJ
		reloj.iniciar()
		
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
		
		// Collide
		game.whenCollideDo(erizo, { objeto => objeto.chocar()})
		
	}
	method perderPorVehiculo() {
		game.addVisual(gameOverGolpeado)
		self.terminar()
		erizo.morir()
	}    
	method perderPorAgua() {
		game.addVisual(gameOverAhogado)
		self.terminar()
		erizo.morir()
	}    
	method perderPorTiempo() {
		game.addVisual(gameOverTiempo)
		self.terminar()
		erizo.morir()
	}
	method perderPorSalirDeMapa() {
		game.addVisual(gameOverSalirDeMapa)
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

	method position() = game.origin()

	method cartel() = game.addVisual(self)

	method image() = "assets/winner.png"

}

object gameOverTiempo {
	
	method chocar() {}

	method position() = game.origin()

	method image() = "assets/perderPorTiempo.png"
 
}
object gameOverGolpeado {
	
	method chocar() {}

	method position() = game.origin()

	method image() = "assets/erizoGolpeado.png"

}
object gameOverAhogado {
	
	method chocar() {}

	method position() = game.origin()

	method image() = "assets/erizoAhogado.png"

}
object gameOverSalirDeMapa {
	
	method chocar() {}

	method position() = game.origin()

	method image() = "assets/erizoFueraDeMapa.png"
 
}