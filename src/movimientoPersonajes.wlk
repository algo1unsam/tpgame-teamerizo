import wollok.game.*
import agua.*

object movimiento {

	//Movimiento del Personaje + Checkeo por movimiento (Si el personaje se encuentra en agua o no)
	method configurarFlechas(visual) {
		keyboard.up().onPressDo{ 
			self.mover(arriba, visual)
			self.checkearUbicacion(visual)
		}
		keyboard.down().onPressDo{ 
			self.mover(abajo, visual)
			self.checkearUbicacion(visual)
		}
		keyboard.left().onPressDo{ 
			self.mover(izquierda, visual)
			self.checkearUbicacion(visual)
		}
		keyboard.right().onPressDo{ 
			self.mover(derecha, visual)
			self.checkearUbicacion(visual)
		}
	}

	//Mueve al personaje +1 posicion para la direccion seleccionada
	method mover(direccion, personaje) {
		personaje.position(direccion.siguiente(personaje.position()))
		personaje.image(direccion.image())
	}
	
	//Corroboramos si el personaje esta parado en un area permitida o no
	method checkearUbicacion(personaje){
		//Por movimiento sacamos al personaje de arriba de cualquier objeto
		//Ya que en caso de subir a otro, por colicion se reasignara a true
		personaje.estaArriba(false)
		//Le damos un tiempo antes de verificar para que la orden de colicion tenga tiempo suficiente a ejecutarse
		//y no se ejecute despues de esta
		game.schedule(10, {
			personaje.verificarPosicion()
			}
		)
		
	}

}

object izquierda {
	
	method image() = "assets/erizo_izquierda.png"

	method siguiente(position) = position.left(1)

	method posicionDeReinicio() = game.width() - 1
	
	method direccion() = 1
	
	method esquina() = -1
	
	method esDerecha() = false
	
}

object derecha {

	method image() = "assets/erizo_derecha.png"

	method siguiente(position) = position.right(1)
	
	method posicionDeReinicio() = 0
	
	method direccion() = -1
	
	method esquina() = game.width()
	
	method esDerecha() = true

}

object abajo {
	
	method image() = "assets/erizo_abajo.png"

	method siguiente(position) = position.down(1)

}

object arriba {
	
	method image() = "assets/erizo_arriba.png"
	
	method siguiente(position) = position.up(1)

}

