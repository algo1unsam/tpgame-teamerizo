import wollok.game.*
import nivel.*
import erizo.*

class Tronco {

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

	method image() = image // "assets/tronco.png"

	method position() = position

	method posicionEsquina() = game.at(game.width() - posX, posY)

	method posicionDeInicio() = game.at(posXInicio , posY)

	method iniciar() {
		position = self.posicionDeInicio()
		game.onTick(velocidad, "troncos", {self.mover()})
	}

	method mover() {
		position = position.left(direccion)
		if (position.x() == esquina) position = self.posicionDeInicio()
	}

	method chocar() {
		erizo.seSubio(direccion)
	}

	method detener() {
		game.removeTickEvent("troncos")
	}
	
	

}

