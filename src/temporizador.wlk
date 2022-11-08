import wollok.game.*
import nivel.*
import erizo.*
import sonido.*
 
object reloj {

	var tiempo
	const tiempoInicial = 80
 
	method text() = "tiempo restate " + tiempo.toString()

	method position() = game.at(1, game.height() - 1)

	method pasarTiempo() {
		tiempo = tiempo - 1
		if (tiempo == 0) 
		nivel.perderPor("assets/perderPorTiempo.png")
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
