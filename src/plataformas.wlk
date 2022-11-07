import wollok.game.*
import nivel.*
import erizo.*

class Plataforma {

	var posY
	var posXInicio
	var property velocidad = 100
	var property image = "assets/plataformaBasica.png"
	var position = self.posicionDeInicio()
	var property direc

	method image() = image // "assets/tronco.png"
	
	//Posicion actual
	method position() = position

	//Posicion a la cual regresara el objeto una vez toque la esquina contraria
	method posicionEsquina() = game.at(direc.posicionDeReinicio(), posY)

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
		
		if (erizo.position() == self.position()){
			erizo.meMuevoConTronco()
		}
	}

	//Movemos el objeto +1 espacios en la direccion que se le haya indicado
	method mover() {
		position = position.left(direc.direccion())
		//Si se encuentra al final del mapa, lo regresamos a la esquina opuesta
		
		if (erizo.estaArriba()){
			erizo.fueraDeMapa() 
		}
		if (position.x() == direc.esquina()) position = self.posicionEsquina()
	}

	//Al chocar con el erizo, el erizo comenzara a moverse a la par de este objeto
	//hasta que el erizo realize un movimiento
	//Tambien se le indica en que direccion se esta moviendo este objeto, para que lo pueda seguir correctamente
	method chocar() {
		erizo.estaArriba(true)
		erizo.seSubio(direc)
	}
	
	
	//Se detiene el objeto
	method detener() {
		game.removeTickEvent("troncos")
	}
	
}


class Tortuga inherits Plataforma{
	
	var property imagenDerecha = "assets/tortugaDerecha.png"
	var property imagenIzquierda = "assets/tortugaIzquierda.png"
	var debajoDeAgua = false
	
	override method velocidad(){
		velocidad = 1000
	}
	
	method cambiaAimagenRoja(){
		self.imagenDerecha("assets/tortugaRojaDerecha.png")
		self.imagenIzquierda("assets/tortugaRojaIzquierda.png")
	}
	
	method cambiarAimagenNormal(){
		self.imagenDerecha("assets/tortugaDerecha.png")
		self.imagenIzquierda("assets/tortugaIzquierda.png")
	}
	
	method cambiarAimagenDebajoDelAgua(){
		self.imagenDerecha("assets/vacio.png")
		self.imagenIzquierda("assets/vacio.png")
	}
	
	method salirDelAgua(){
		self.cambiarAimagenNormal()
		debajoDeAgua = false
	}
	
	method debajoDelAgua(){
		self.cambiarAimagenDebajoDelAgua()
		debajoDeAgua = true
		game.schedule(2000, {self.salirDelAgua()})
	}
	
	method velocidadDeHundimiento() = 10000.randomUpTo(25000)
	
	override method image() = if(direc.esDerecha()) imagenDerecha else imagenIzquierda 
	
	override method iniciar(){
		super()
		game.onTick(self.velocidadDeHundimiento(), "tortugas", {
			self.avisoPrevioAHundirse()
		})
	}
	
	method avisoPrevioAHundirse(){
		self.cambiaAimagenRoja()
		game.schedule(1000, {self.cambiarAimagenNormal()})
		game.schedule(2000, {self.cambiaAimagenRoja()})
		game.schedule(3000, {self.cambiarAimagenNormal()})
		game.schedule(4000, {self.cambiaAimagenRoja()})
		game.schedule(5000, {self.cambiarAimagenNormal()})
		game.schedule(6000, {self.debajoDelAgua()})
	}
	
	override method chocar(){
		if(debajoDeAgua){
			erizo.meAhogo()
			erizo.perderVidaPor("assets/erizoAhogado.png")
		}else{
			super()
		}
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
	
	const imagenDerecha = "assets/mantarrayaDerecha.png"
	const imagenIzquierda = "assets/mantarrayaIzquierda.png"
	
	
	override method velocidad(){
		velocidad = 200
	}
	
	override method image() = if(direc.esDerecha()) imagenDerecha else imagenIzquierda 
	
}