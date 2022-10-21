import wollok.game.*
import nivel.*

object reloj {

	var tiempo
	const tiempoInicial = 60

	method text() = "tiempo restate " + tiempo.toString()

	method position() = game.at(1, game.height() - 1)

	method pasarTiempo() {
		tiempo = tiempo - 1
		if (tiempo == 0) nivel.perder()
	}

	method iniciar() {
		tiempo = tiempoInicial
		game.onTick(1000, "tiempo", { self.pasarTiempo()})
	}

	method detener() {
		game.removeTickEvent("tiempo")
	}
	
	method chocar(){}

}

