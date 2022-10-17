import wollok.game.*
import plataformas.*
import nivel.*

object erizo {

	var puntos = 0
	var vivo = true
	var property position = new Position(x = 8, y = 0)
	var property arribaDeTronco = false
	var arribaDeAgua = false
	var direccionDelTronco


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

	
	method seSubio(direccion) {
		arribaDeTronco = true
		arribaDeAgua = false
		direccionDelTronco = direccion
		
	}
	
	method dentroDeZonaDeAgua(){
		
		arribaDeAgua = true
		
		if(arribaDeTronco && arribaDeAgua){
			
			position = position.left(direccionDelTronco)
			
		}else if(!arribaDeTronco && arribaDeAgua){
			
			self.meAhogo()
			nivel.perder()
		}
		
	
	}
	
	method arribaDeTroncoFalse(){
		arribaDeTronco = false
	}

	method aumentar(valor) {
		puntos += valor
	}
	


	method puntaje() = puntos

	method ganar() = victoria.cartel()

}

