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
import vidas.* 

const objetos = []	
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
		
		// MOVIMIENTOS
		movimiento.configurarFlechas(erizo)		
		
		// RELOJ
		reloj.iniciar()
		
		objetos.reverse().forEach{ objeto => 
			
			game.addVisual(objeto)
			objeto.velocidad()
			objeto.iniciar()
		}
			
		sectorDeMadrigueras.madrigueras().forEach{ madriguera =>
			game.addVisual(madriguera)
		}
		tableroDevidas.corazones().forEach{ corazon =>
			game.addVisual(corazon)
		}
		
		self.generarMonedas()
		
		game.addVisual(erizo)
		
		// Collide
		game.whenCollideDo(erizo, { objeto => objeto.chocar()})
		
	} 
	
	method perderPor(motivo){
		soundFondo.pause()
		pantallaFinal.image(motivo) 
		game.addVisual(pantallaFinal)		
     	soundPerder.play()		 
	    self.terminar()
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

	method ganar(){
		game.clear()
		soundFondo.pause()
		victoria.cartel()
	 	soundGanar.play()
	}

}

object pantallaFinal{
	
	var image
	
	method position() = game.origin()
	
	method image(newImage){
		image = newImage
	}
	
	method image() = image 
	
}


object victoria {
	method position() = game.origin()
	method cartel() = game.addVisual(self)
	method image() = "assets/winner.png"
} 
