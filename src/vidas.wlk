import wollok.game.*

class Vida{
	
	var property position
	
    var property image = "assets/corazon.png" 
    
	method quitar() {
		game.removeVisual(self)
	}
	
	method chocar(){}

}

object tableroDevidas{
	
	const corazones = [new Vida (position = game.at(13, 12)), 
		               new Vida (position = game.at(14, 12)),
		               new Vida (position = game.at(15, 12))]
	
	method corazones() = corazones
	
	method ultimoCorazonDeLista() = corazones.last()
	
	method restarCorazon(){
		self.ultimoCorazonDeLista().quitar()
		corazones.remove(self.ultimoCorazonDeLista())
		
	}
	
	method tengoCorazonesDisponibles() = corazones.size() > 1
}