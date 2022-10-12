import wollok.game.*
import erizo.*
import movimientoPersonajes.*
import vehiculos.*

object nivel {
	
	const width = 17
		// Sacar codigo redundante (sacar posX, direccion y esquina e implementar IzqODer)
		var autoRojo1 = new Vehiculos(posY = 1, posX = width ,velocidad = 400, image = "assets/autoRojo.png", direccion = -1, esquina = width)
		var autoRojo2 = new Vehiculos(posY = 2, velocidad = 400, image = "assets/autoRojo.png")
		var autoRojo3 = new Vehiculos(posY = 3, velocidad = 400, image = "assets/autoRojo.png")
		var autoRojo4 = new Vehiculos(posY = 4, velocidad = 400, image = "assets/autoRojo.png")
		var autoRojo5 = new Vehiculos(posY = 5, velocidad = 400, image = "assets/autoRojo.png")
		

	method configurate(){
	
		
	//	CONFIG	
		//game.title("Test")
		game.height(13)
		game.width(width)
		game.boardGround("assets/backgroundFrog.png")
		
		
	//	VISUALES
	 	game.addVisual(erizo)
	 	movimiento.configurarFlechas(erizo)
	 	
		game.addVisual(autoRojo1)
		game.addVisual(autoRojo2)
		game.addVisual(autoRojo3)
		game.addVisual(autoRojo4)
		game.addVisual(autoRojo5)
		
		
	//  INICIAR	
		autoRojo1.iniciar()		
		autoRojo2.iniciar()	
		autoRojo3.iniciar()	
		autoRojo4.iniciar()
		autoRojo5.iniciar()	
			
	//  Collide
		game.onCollideDo(erizo,{ objeto => objeto.chocar()})
	}
	
    
	method terminar(){
        game.addVisual(gameOver)
        autoRojo1.detener()
        autoRojo2.detener()
        autoRojo3.detener()
        autoRojo4.detener()
        autoRojo5.detener()
        erizo.morir()
    }

}

object gameOver {
	method position() = game.center()
	method text() = "GAME OVER"
	

}