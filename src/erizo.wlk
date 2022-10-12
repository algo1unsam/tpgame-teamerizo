import wollok.game.*

object erizo {
	var vivo = true
	
	var property position = new Position(x = 8, y = 0)
	
	method image() = "assets/erizo_arriba.png"
	
	method morir(){
		game.say(self,"¡Auch!")
		vivo = false
	}
	
	method iniciar() {
		vivo = true
	}
	method estaVivo() {
		return vivo
	}
}

