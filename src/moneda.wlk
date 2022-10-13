import wollok.game.*
import erizo.*
import nivel.*

class Moneda {
	const image = "moneda.png"
	var valor
	const position
	
	method chocar() {
		erizo.aumentar(valor)
		game.say(erizo, erizo.puntaje().toString())
		game.removeVisual(self)
		nivel.generarMoneda(valor)
		nivel.generarMoneda(valor*2)
	}
	
	method text() =  valor.toString()
	method image() = image
	method position() = position
	

	

}
