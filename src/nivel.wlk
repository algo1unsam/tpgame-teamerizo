import wollok.game.*
import erizo.*
import movimientoPersonajes.*
import vehiculos.*
import plataformas.*
import moneda.*
import temporizador.*

object nivel {

	const width = 17
	// Sacar codigo redundante (sacar posX, direccion y esquina e implementar IzqODer)
	const autos = [ new Vehiculos(posY = 1 ,velocidad = 400, image = "assets/autoRojo.png"), new Vehiculos(posY = 2, velocidad = 200, image = "assets/autoRojo.png"), new Vehiculos(posY = 3, velocidad = 300, image = "assets/autoRojo.png"), new Vehiculos(posY = 4, velocidad = 50, image = "assets/autoRojo.png"), new Vehiculos(posY = 5, velocidad = 100, image = "assets/autoRojo.png") ]
	const troncos = [ new Tronco(posY = 7 ,velocidad = 1000, image = "assets/TRONCO.png"), new Tronco(posY = 8, velocidad = 500, image = "assets/TRONCO.png"), new Tronco(posY = 9, velocidad = 800, image = "assets/TRONCO.png"), new Tronco(posY = 10, velocidad = 1000, image = "assets/TRONCO.png"), new Tronco(posY = 11, velocidad = 500, image = "assets/TRONCO.png") ]

	// const autoRojo1 = new Vehiculos(posY = 1 ,velocidad = 400, image = "assets/autoRojo.png")
	// const autoRojo2 = new Vehiculos(posY = 2, velocidad = 200, image = "assets/autoRojo.png")
	// const autoRojo3 = new Vehiculos(posY = 3, velocidad = 300, image = "assets/autoRojo.png")
	// const autoRojo4 = new Vehiculos(posY = 4, velocidad = 50, image = "assets/autoRojo.png")
	// const autoRojo5 = new Vehiculos(posY = 5, velocidad = 100, image = "assets/autoRojo.png")
	// const madrigueras = [
	// new Madriguera(posX = 7 , posY = 12),
	// new Madriguera(posX = 9 , posY = 12)
	// ]
	method configurate() {
		// CONFIG	
		// game.title("Test")
		game.height(13)
		game.width(width)
		game.boardGround("assets/backgroundFrog.png")
			// VISUALES
		game.addVisual(reloj)
		game.addVisual(erizo)
		movimiento.configurarFlechas(erizo)
		autos.forEach{ auto => game.addVisual(auto)}
		troncos.forEach{ tronco => game.addVisual(tronco)}
			// madrigueras.forEach{ madriguera =>
			// game.addVisual(madriguera)
			// }
		self.generarMonedas()
			// autos.forEach(2){ auto =>
			// auto.cambiarDireccionDeMov()
			// }
			// autoRojo1.cambiarDireccionDeMov()
			// INICIAR	
		reloj.iniciar()
		autos.forEach{ auto => auto.iniciar()}
		troncos.forEach{ tronco => tronco.iniciar()}
			// madrigueras.forEach{ madriguera =>
			// madriguera.iniciar()
			// }
		self.generarMonedas()
			// Collide
		game.onCollideDo(erizo, { objeto => objeto.chocar()})
	}

	method perder() {
		game.addVisual(gameOver)
		self.terminar()
		erizo.morir()
	}

	method terminar() {
		autos.forEach{ auto => auto.detener()}
		troncos.forEach{ tronco => tronco.detener()}
		reloj.detener()
	}

	// MONEDA
	method generarMonedas() {
		game.schedule(500, { self.generarMoneda(100)})
	}

	method generarMoneda(valor) {
		const pos = self.posicionAleatoria()
		const moneda = new Moneda(position = pos, valor = valor)
		game.addVisual(moneda)
	}

	method posicionAleatoria() = game.at(0.randomUpTo(game.width()), 1.randomUpTo(game.height()))

}

object victoria {

	method position() = game.center()

	method cartel() = game.addVisual(self)

	method image() = "assets/winner.png"

}

object gameOver {

	method position() = game.center()

	method text() = "GAME OVER"

}

