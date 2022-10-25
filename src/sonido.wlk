import wollok.game.*
    const perder =  game.sound("audio/sonidoPerder.mp3")
    const ganarr =  game.sound("audio/sonidoGanar.mp3")
    const fondo1 =  game.sound("audio/fondo1.mp3") 

    
    
       
object sonido{
	
	
	method play(sonido){sonido.play()}	
	
	method reanudarSonido(sonido){
		sonido.resume()}
		
		
	method ruidoCorto(sonido,segundos){
		if(not sonido.played()){sonido.play()}
		else sonido.resume()
		game.schedule(segundos,{ sonido.pause()})
	}	
	method pararSonido(sonido){
		sonido.pause()
		
		}

	
}
