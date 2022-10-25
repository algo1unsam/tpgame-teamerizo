import wollok.game.*

object menu {
	
	method position() = game.origin()

	method image() = "assets/menu.png"
	
	method pantalla() = game.addVisual(self)
	
}