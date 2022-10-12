import wollok.game.*
import erizo.*
import movimientoPersonajes.*
import vehiculos.*

object nivel {
	
	const width = 17
		// Sacar codigo redundante (sacar posX, direccion y esquina e implementar IzqODer)
		const autos = [
			new Vehiculos(posY = 1 ,velocidad = 400, image = "assets/autoRojo.png"),
			new Vehiculos(posY = 2, velocidad = 200, image = "assets/autoRojo.png"),
			new Vehiculos(posY = 3, velocidad = 300, image = "assets/autoRojo.png"),
			new Vehiculos(posY = 4, velocidad = 50, image = "assets/autoRojo.png"),
			new Vehiculos(posY = 5, velocidad = 100, image = "assets/autoRojo.png")
		]
		
		//const autoRojo1 = new Vehiculos(posY = 1 ,velocidad = 400, image = "assets/autoRojo.png")
		//const autoRojo2 = new Vehiculos(posY = 2, velocidad = 200, image = "assets/autoRojo.png")
		//const autoRojo3 = new Vehiculos(posY = 3, velocidad = 300, image = "assets/autoRojo.png")
		//const autoRojo4 = new Vehiculos(posY = 4, velocidad = 50, image = "assets/autoRojo.png")
		//const autoRojo5 = new Vehiculos(posY = 5, velocidad = 100, image = "assets/autoRojo.png")
		
		
		

	method configurate(){
	
		
	//	CONFIG	
		//game.title("Test")
		game.height(13)
		game.width(width)
		game.boardGround("assets/backgroundFrog.png")
		
		
	//	VISUALES
	 	game.addVisual(erizo)
	 	movimiento.configurarFlechas(erizo)
	 	
	 	autos.forEach{ auto =>
	 		game.addVisual(auto)
	 	}

		autos.forEach(2){ auto =>
			auto.cambiarDireccionDeMov()
		}
		//autoRojo1.cambiarDireccionDeMov()
		
		
	//  INICIAR	
	
		autos.forEach{ auto =>
		 		auto.iniciar()
		 	}

	//  Collide
		game.onCollideDo(erizo,{ objeto => objeto.chocar()})
	}
	
    
	method terminar(){
        game.addVisual(gameOver)
        
        autos.forEach{ auto =>
		 		auto.detener()
		 	}
        erizo.morir()
    }

}

object gameOver {
	method position() = game.center()
	method text() = "GAME OVER"
	

}