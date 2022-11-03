import wollok.game.*
import nivel.*
import erizo.*


object agua {
		
	//Coleccion de posiciones que queremos analizar
	const pos = [7,8,9,10,11]
	
	//Comprobamos por cada posicion si el erizo se encuenta alli
	method estaDentroDelAgua(alguien) = pos.contains(alguien.position().y())
		
}
