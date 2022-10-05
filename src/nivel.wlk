import wollok.game.*
import erizo.*
import movimientoPersonajes.*

object nivel {

method configurate(){
	//	CONFIG	
		//game.title("Test")
		game.height(13)
		game.width(17)
		game.boardGround("assets/backgroundFrog.png")
		
	//	VISUALES
	 	game.addVisual(erizo)
	 	movimiento.configurarFlechas(erizo)
				
	
	}

}