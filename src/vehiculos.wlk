import wollok.game.*
import nivel.*
import erizo.*
import sonido.*

class Vehiculos {

	var posY
	var posXInicio
	var property velocidad = 100
	var property image = "assets/autoRojo.png"
	var position = self.posicionDeInicio()
	var property direc


	method image() = if(direc.esDerecha()) image else image 
	
	method position() = position

	method posicionEsquina() = game.at(direc.posicionDeReinicio(), posY)

	method posicionDeInicio() = game.at(posXInicio , posY)

	method iniciar() {
		position = self.posicionDeInicio()
		game.onTick(velocidad, "vehiculos", { self.mover()})
	}

	method mover() {
		position = position.left(direc.direccion())
		if (position.x() == direc.esquina()) position = self.posicionEsquina()
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
	
	const imagenDerecha = "assets/autoDeportivoDerecha.png"
	const imagenIzquierda = "assets/autoDeportivoIzquierda.png"
	
	override method velocidad(){
		velocidad = 50
	}
	
	override method image() = if(direc.esDerecha()) imagenDerecha else imagenIzquierda 
	
	
}

class AutoLento inherits Vehiculos{
	
	const imagenDerecha = "assets/camionDerecha.png"
	const imagenIzquierda = "assets/camionIzquierda.png"
	
	override method velocidad(){
		velocidad = 1000
	}
	
	override method image() = if(direc.esDerecha()) imagenDerecha else imagenIzquierda 
		
}

class AutoMedio inherits Vehiculos{
	
	const imagenDerecha = "assets/autoRojoDerecha.png"
	const imagenIzquierda = "assets/autoRojoIzquierda.png"
	
	override method velocidad(){
		velocidad = 300
	}	
	
	override method image() = if(direc.esDerecha()) imagenDerecha else imagenIzquierda 
	
}