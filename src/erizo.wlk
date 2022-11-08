import wollok.game.*
import plataformas.*
import nivel.*
import agua.*
import temporizador.*
import sonido.*
import movimientoPersonajes.*
import vidas.*

object erizo {

	var puntos = 0
	var property position = self.posicionDeInicio()
	var property direccionDelTronco = derecha
	var property estaArriba = false
	var image = "assets/erizo_arriba.png"

	method image() = image
	
	method image(newImage){
		image = newImage
	}
	
	method posicionDeInicio() = game.at(8, 0)
	
	method reiniciarPosicion(){
		position = self.posicionDeInicio()
	}
	
	method perderVidaPor(motivo){
		 position = self.posicionDeInicio() 
		 if(tableroDevidas.tengoCorazonesDisponibles()){
		 	tableroDevidas.restarCorazon()
		 	
		 }else{
		 	nivel.perderPor(motivo)
		 }
	}
	 
	method quejarse() {
		game.say(self, "¡Auch!")
	}
	
	method meAhogo(){
		game.say(self, "¡Me ahogooo!")
	}

	//Guardamos la direccion en la que se mueve el ultimo tronco con el cual haya colicionado el erizo
	method seSubio(direccion) {
		direccionDelTronco = direccion
	}
	
	
	//Verificamos posicion del erizo para detectar si esta pisando agua o no
	method verificarPosicion(){
		if(agua.estaDentroDelAgua(self) && !self.estaArriba()){
			game.say(self, "¡Me ahogooo!")
			self.perderVidaPor("assets/erizoAhogado.png")
		}
			self.fueraDeMapa()
	}
 
	
	//Movemos al erizo +1 espacios en la direccion del ultimo tronco con el cual haya colicionado
	method meMuevoConTronco(){ 
		position = position.left(direccionDelTronco.direccion())
	}
	method fueraDeMapa(){
		self.fueraDeEjeX()
		self.fueraDeEjeY()
	}
	
	method fueraDeEjeX(){
		if (position.x() == -1 || position.x() == game.width()) self.perderVidaPor("assets/erizoFueraDeMapa.png")
	}
	
	method fueraDeEjeY(){
		if (position.y() == -1 ) position = game.at(position.x(), 0)
		if (position.y() == game.height()) position = game.at(position.x(), game.height() - 1)
	}
	
	
	method aumentar(valor) {
		puntos += valor
	}
	
	method puntaje() = puntos
}