import wollok.game.*
import nivel.*
import erizo.*

class Plataforma {

	var posY
	var posX = 1
	var posXInicio
	var property velocidad = 100
	var property image = "assets/plataformaBasica.png"
	var direccion = 1
	var esquina = -1
	var position = self.posicionEsquina()
	var posicionDeErizo = position
	
	//Utilizado para cambiar direcciones del objeto
	method cambiarDireccionDeMov() {
		posX = game.width()
		direccion = -1
		esquina = game.width()
	}

	method image() = image // "assets/tronco.png"
	
	//Posicion actual
	method position() = position

	//Posicion a la cual regresara el objeto una vez toque la esquina contraria
	method posicionEsquina() = game.at(game.width() - posX, posY)

	//Posicion en la cual el objeto inicialmente comienza dentro del juego
	method posicionDeInicio() = game.at(posXInicio , posY)

	//Se le da una ubicacion al objeto, se inicializa el movimiento y se verifica si el erizo
	//se encuentra arriba del objeto o no
	method iniciar() {
		position = self.posicionDeInicio()
		game.onTick(velocidad, "troncos", {
			self.estaArribaDelObjeto()
			self.mover()
		})
	}
	//Si el erizo esta arriba, movemos +1 espacios en la direccion que se este moviendo el objeto
	method estaArribaDelObjeto(){
		posicionDeErizo = erizo.position()
		if (posicionDeErizo == self.position()){
			erizo.meMuevoConTronco()
		}
	}

	//Movemos el objeto +1 espacios en la direccion que se le haya indicado
	method mover() {
		position = position.left(direccion)
		//Si se encuentra al final del mapa, lo regresamos a la esquina opuesta
		
		if (erizo.estaArriba()){
			erizo.fueraDeMapa() 
		}
		if (position.x() == esquina) position = self.posicionEsquina()
	}

	//Al chocar con el erizo, el erizo comenzara a moverse a la par de este objeto
	//hasta que el erizo realize un movimiento
	//Tambien se le indica en que direccion se esta moviendo este objeto, para que lo pueda seguir correctamente
	method chocar() {
		erizo.estaArriba(true)
		erizo.seSubio(direccion)
	}
	
	
	//Se detiene el objeto
	method detener() {
		game.removeTickEvent("troncos")
	}
	
}


class Tortuga inherits Plataforma{
	
	var nuevaImagen = "assets/tortugaIzquierda.png"
	
	override method velocidad(){
		velocidad = 1000
	}
	
	override method image() = nuevaImagen
	
	override method cambiarDireccionDeMov(){
	    super()
	    nuevaImagen = "assets/tortugaDerecha.png"
	 
	}
}


class Tronco inherits Plataforma{
	
	const nuevaImagen = "assets/TRONCO.png"
	
	override method velocidad(){
		velocidad = 800
	}
	
	override method image() = nuevaImagen
	
}

class Mantarraya inherits Plataforma{
	
	var nuevaImagen = "assets/mantarrayaIzquierda.png"
	
	override method velocidad(){
		velocidad = 200
	}
	
	override method image() = nuevaImagen
	
	override method cambiarDireccionDeMov(){
	    super()
	    nuevaImagen = "assets/mantarrayaDerecha.png"
	 
	}
	
}