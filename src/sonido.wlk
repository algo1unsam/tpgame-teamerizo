import wollok.game.*
    const soundPerder =  game.sound("audio/sonidoPerder.mp3")
    const soundGanar =  game.sound("audio/sonidoGanar.mp3")
    const soundFondo =  game.sound("audio/fondo1.mp3") 

       
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
