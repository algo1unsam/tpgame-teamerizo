import wollok.game.*
import erizo.*
import movimientoPersonajes.*
import vehiculos.*
import plataformas.*
import moneda.*
import temporizador.*
import agua.*
import madriguera.*
import sonido.*

	const objetos = []
	
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
		dificultad.seImplementanElementos()
		dificultad.cargar(objetos)
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
		
		objetos.reverse().forEach{ objeto => 
			
			game.addVisual(objeto)
			objeto.velocidad()
			objeto.iniciar()
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
		perder.play()		
		self.terminar()
		erizo.morir()
	}    
	method perderPorAgua() {
		game.addVisual(gameOverAhogado)
		perder.play()		
		self.terminar()
		erizo.morir()
	}    
	method perderPorTiempo() {
		fondo1.pause()
		game.addVisual(gameOverTiempo)
		perder.play()				
		self.terminar()
		erizo.morir()
	}
	method perderPorSalirDeMapa() {
		game.addVisual(gameOverSalirDeMapa)
		perder.play()		
		self.terminar()
		erizo.morir()
	}

	method terminar() {
		objetos.forEach{ objeto => objeto.detener()}
		reloj.detener()
	}

	// MONEDA
	method generarMonedas() {
		game.schedule(50, { self.generarMoneda(100)})
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