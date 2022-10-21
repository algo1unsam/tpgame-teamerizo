import wollok.game.*
import nivel.*
import erizo.*


object agua {
	
	var property tocandoAgua = false
	
	//Coleccion de posiciones que queremos analizar
	const pos = [
		new Position(y = 7),
		new Position(y = 8),
		new Position(y = 9),
		new Position(y = 10),
		new Position(y = 11)
	]
	
	//Comprobamos por cada posicion si el erizo se encuenta alli
	method estaDentroDelAgua(){
		//previo a la verificacion se debe de inicializar en false el valor tocandoAgua
		self.tocandoAgua(false)
		//Una vez terminado el forEach tendremos la respuesta a la pregunta (Esta dentro del agua?)
		pos.forEach{ y =>
			if(erizo.position().y() == y.y()){
				self.tocandoAgua(true)
				}
			}
		}
}
