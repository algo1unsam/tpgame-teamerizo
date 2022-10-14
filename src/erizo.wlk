import wollok.game.*
import plataformas.*
import nivel.*

object erizo {

	var puntos = 0
	var vivo = true
	var property position = new Position(x = 8, y = 0)

	method image() = "assets/erizo_arriba.png"

	method morir() {
		vivo = false
	}

	method quejarse() {
		game.say(self, "¡Auch!")
	}

	method iniciar() {
		vivo = true
	}

	method estaVivo() {
		return vivo
	}

	method seSubio() {
		self.mover()
	}

	method mover() {
		position = position.left(1)
		if (position.x() == -1) position = self.position()
	}

	method aumentar(valor) {
		puntos += valor
	}

	method puntaje() = puntos

	method ganar() = victoria.cartel()

}

