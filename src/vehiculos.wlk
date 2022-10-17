import wollok.game.*
import nivel.*
import erizo.*

class Vehiculos {

	var posY
	var posX = 1
	var posXInicio
	var velocidad
	var image
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
		nivel.perder()
	}

	method detener() {
		game.removeTickEvent("vehiculos")
	}

	method desplazar(){}
}

