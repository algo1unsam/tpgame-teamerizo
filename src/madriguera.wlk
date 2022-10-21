import wollok.game.*
import erizo.*
import nivel.*

class Madriguera{
	var posX
	var posY
	var property position = new Position(x = posX, y = posY)
	   	 
	method image()= "assets/madriguera.png"
	
    method chocar()= erizo.ganar()   
     
} 
   
