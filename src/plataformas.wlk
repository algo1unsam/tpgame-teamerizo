import wollok.game.*
import nivel.*
import erizo.*

 class Tronco {

	var posY
	var posX = 1
	var velocidad
	var image
	var direccion = 1
	var esquina = -1
	var position = self.posicionInicial()

	method cambiarDireccionDeMov() {
		posX = game.width()
		direccion = -1
		esquina = game.width()
	}

	method image() = image // "assets/tronco.png"

	method position() = position

	method posicionInicial() = game.at(game.width() - posX, posY)

	method iniciar() {
		position = self.posicionInicial()
		game.onTick(velocidad, "troncos", { self.mover()})
	}

	method mover() {
		position = position.left(direccion)
		if (position.x() == esquina) position = self.posicionInicial()
	}

	method chocar() {
		erizo.seSubio()
	}

	method detener() {
		game.removeTickEvent("troncos")
	}

}

