import wollok.game.*
import nivel.*
import erizo.*


class Agua {
	
	var posY
	var posX = 1
	var posXInicial
	var velocidad
	var image
	var direccion = 1
	var esquina = -1
	var position = self.posicionInicial()
	
	
	method chocar() {
		erizo.dentroDeZonaDeAgua()
	}
	
	method cambiarDireccionDeMov() {
		posX = game.width()
		direccion = -1
		esquina = game.width()
	}

	method image() = image // "assets/agua.png"

	method position() = position

	method posicionInicial() = game.at(game.width() - posX, posY)
	
	method posicionDeInicio() = game.at(posXInicial, posY)

	method iniciar() {
		position = self.posicionDeInicio()
		game.onTick(velocidad, "agua", {self.mover()})
	}

	method mover() {
		position = position.left(direccion)
		if (position.x() == esquina) position = self.posicionInicial()
	}
	
	method detener() {
		game.removeTickEvent("agua")
	}

}
