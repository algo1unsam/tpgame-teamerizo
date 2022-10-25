import wollok.game.*
import nivel.*
import erizo.*

object reloj {

	var tiempo
	const tiempoInicial = 60

	method text() = "tiempo restate " + tiempo.toString()

	method position() = game.at(1, game.height() - 1)

	method pasarTiempo() {
		tiempo = tiempo - 1
		if (tiempo == 0) nivel.perderPorTiempo()
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

object primeraVida {
	
	
  method image() = "assets/corazon.png"
  method position() = game.at(13, 12)
 
		
    
  method restarVida(){
  	if(erizo.vidas() == 2) 	
  		game.removeVisual(self)
 }
 }
 
object segundaVida {
	
  method image() = "assets/corazon.png"
  method position() = game.at(14, 12)

  method restarVida(){
  	if(erizo.vidas() == 1)	
  	 game.removeVisual(self)
 }
 }
 

object terceraVida{

  method image() = "assets/corazon.png"
  method position() = game.at(15, 12)
  
  }
