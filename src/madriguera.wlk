import wollok.game.*
import erizo.*
import nivel.*

class Madriguera{
	var posX
	var posY
	var property position = new Position(x = posX, y = posY)
	   	 
	method image()= "assets/madriguera.png"
	
	method quitarImagen() = game.removeVisual(self)
	
    method chocar() = if(sectorDeMadrigueras.ultimaMadrigueraDeLista()) nivel.ganar() else self.objetivoAlcanzado()
    		   	   
    method objetivoAlcanzado(){
    	self.quitarImagen()
    	sectorDeMadrigueras.removerMadriguera(self)
    	erizo.reiniciarPosicion()
    }
} 
   
object sectorDeMadrigueras{
	
	const madrigueras = [
		new Madriguera(posX = 4 , posY = 12),
	 	new Madriguera(posX = 6, posY = 12),
	 	new Madriguera(posX = 8, posY = 12),
	 	new Madriguera(posX = 10, posY = 12)
	 ]
	 
	 method madrigueras() = madrigueras
	 
	 method ultimaMadrigueraDeLista() = self.madrigueras().size() == 1
	 
	 method removerMadriguera(madriguera) = madrigueras.remove(madriguera)
	
}