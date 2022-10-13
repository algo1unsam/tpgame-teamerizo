import wollok.game.*
import nivel.*
import erizo.*

class Vehiculos {
	var posY
	var posX = 1
	var velocidad
	var image
	var direccion = 1
	var esquina = -1
	
	var position = self.posicionInicial()
	
	method cambiarDireccionDeMov(){
		posX = game.width()
		direccion = -1
		esquina = game.width()
	}
	
	method image() = image    //"assets/autoRojo.png"

    method position() = position

    method posicionInicial() = game.at(game.width()-posX, posY)
    

    method iniciar(){
        position = self.posicionInicial()
        game.onTick(velocidad, "vehiculos",{self.mover()})}

	method mover(){
			position = position.left(direccion)
			if (position.x() == esquina)
				position = self.posicionInicial()
	}
	
	method chocar(){
		erizo.quejarse()
        nivel.perder()
    }
    
    method detener(){
    	game.removeTickEvent("vehiculos")
    }
    

}
