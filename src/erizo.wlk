import wollok.game.*
import plataformas.*
import nivel.*
import agua.*

object erizo {

	var puntos = 0
	var vivo = true
	var property position = new Position(x = 8, y = 0)
	var direccionDelTronco
	var property estaArriba = false


	method image() = "assets/erizo_arriba.png"

	method morir() {
		vivo = false
	}

	method quejarse() {
		game.say(self, "¡Auch!")
	}
	
	method meAhogo(){
		game.say(self, "¡Me ahogooo!")
	}

	method iniciar() {
		vivo = true
	}

	method estaVivo() {
		return vivo
	}

	//Guardamos la direccion en la que se mueve el ultimo tronco con el cual haya colicionado el erizo
	method seSubio(direccion) {
		direccionDelTronco = direccion
	}
	
	
	//Verificamos posicion del erizo para detectar si esta pisando agua o no
	method verificarPosicion(){
		agua.estaDentroDelAgua()
		//Una vez obtenida la respuesta a la pregunta "estaDentroDelAgua" comprobamos si el erizo
		//se encuentra dentro de la zona de agua y afuera de un objeto
		//En caso de no estarlo, sigue el juego
		if(agua.tocandoAgua() && !self.estaArriba()){
			game.say(self, "¡Me ahogooo!")
			nivel.perder()
		}
	}
	
	//Movemos al erizo +1 espacios en la direccion del ultimo tronco con el cual haya colicionado
	method meMuevoConTronco(){
		position = position.left(direccionDelTronco)
	}
	
	
	method aumentar(valor) {
		puntos += valor
	}
	


	method puntaje() = puntos

	method ganar() = victoria.cartel()

}

