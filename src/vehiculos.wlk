import wollok.game.*
import nivel.*
import erizo.*
import sonido.*

class Vehiculos {

	var posY
	var posX = 1
	var posXInicio
	var property velocidad = 100
	var property image = "assets/autoRojo.png"
	var direccion = 1
	var esquina = -1
	var position = self.posicionEsquina()

	method cambiarDireccionDeMov() {
		posX = game.width()
		direccion = -1
		esquina = game.width()
	}

	method image() = image // "assets/autoRojo.png"
	
	method position() = position

	method posicionEsquina() = game.at(game.width() - posX, posY)

	method posicionDeInicio() = game.at(posXInicio , posY)

	method iniciar() {
		position = self.posicionDeInicio()
		game.onTick(velocidad, "vehiculos", { self.mover()})
	}

	method mover() {
		position = position.left(direccion)
		if (position.x() == esquina) position = self.posicionEsquina()
	}

	method chocar() {
		erizo.quejarse()
		erizo.perderVidaPorVehiculo()
	}
		

	method detener() {
		game.removeTickEvent("vehiculos")
	}

	method desplazar(){}
}

class AutoRapido inherits Vehiculos{
	
	var nuevaImagen = "assets/autoDeportivoIzquierda.png"
	
	override method velocidad(){
		velocidad = 50
	}
	
	override method image() = nuevaImagen
	
	override method cambiarDireccionDeMov(){
	    super()
	    nuevaImagen = "assets/autoDeportivoDerecha.png"
	 
	}
}

class AutoLento inherits Vehiculos{
	
	var nuevaImagen = "assets/camionIzquierda.png"
	
	override method velocidad(){
		velocidad = 1000
	}
	
	override method image() = nuevaImagen
		
	override method cambiarDireccionDeMov(){
		super() 
	    nuevaImagen = "assets/camionDerecha.png"
	}
}

class AutoMedio inherits Vehiculos{
	
	var nuevaImagen = "assets/autoRojoIzquierda.png"
	
	override method velocidad(){
		velocidad = 300
	}	
	
	override method image() = nuevaImagen
	
	override method cambiarDireccionDeMov(){
		super()
	    nuevaImagen = "assets/autoRojoDerecha.png"
	  
	}
}