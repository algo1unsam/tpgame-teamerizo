import wollok.game.*
import plataformas.*
import nivel.*
import agua.*
import temporizador.*
import sonido.*

object erizo {

	var vidas = 3
	var puntos = 0
	var vivo = true
	var property position = new Position(x = 8, y = 0)
	var direccionDelTronco
	var property estaArriba = false


	method image() = "assets/erizo_arriba.png"
	
	method posicionDeInicio() = game.at(8, 0)
	
//	method salirDeMapa(){
//	if(position.x() == -1) self.perderVidaPorAgua()
//	}
	
	
	method perderVidaPorVehiculo() {
	vidas -=1
    position = self.posicionDeInicio() 
		  
	 if(vidas == 0){
	    fondo1.pause()
		nivel.perderPorVehiculo()
		
		}
	primeraVida.restarVida()
	segundaVida.restarVida()
	   
	}
	
	method perderVidaPorAgua() {
	vidas -=1
    position = self.posicionDeInicio() 
	  
	 if(vidas == 0){
	 	 fondo1.pause()
		nivel.perderPorAgua()
		}
	primeraVida.restarVida()
	segundaVida.restarVida()	   
	}
	 
	method perderVidaPorSaliDeMapa() {
	vidas -=1
    position = self.posicionDeInicio() 
	
    if(vidas == 0){
    fondo1.pause()
	nivel.perderPorSalirDeMapa()
		}
	primeraVida.restarVida()
	segundaVida.restarVida()	   
	}
	
	
	method vidas() = vidas 
	

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
			self.perderVidaPorAgua()
		}
			self.fueraDeMapa()
	}
 
	
	//Movemos al erizo +1 espacios en la direccion del ultimo tronco con el cual haya colicionado
	method meMuevoConTronco(){
		position = position.left(direccionDelTronco)
	}
	method fueraDeMapa(){
		self.fueraDeEjeX()
		self.fueraDeEjeY()
	}
	
	method fueraDeEjeX(){
		if (position.x() == -1 || position.x() == game.width()) self.perderVidaPorSaliDeMapa()
	}
	
	method fueraDeEjeY(){
		if (position.y() == -1 ) position = game.at(position.x(), 0)
		if (position.y() == game.height()) position = game.at(position.x(), game.height() - 1)
	}
	
	
	method aumentar(valor) {
		puntos += valor
	}
	
 

	method puntaje() = puntos

	method ganar() {
		game.clear()
		fondo1.pause()
		victoria.cartel()
	return ganarr.play()
	}
	 
}