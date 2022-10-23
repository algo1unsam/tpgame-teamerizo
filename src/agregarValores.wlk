import plataformas.*
import vehiculos.*


object nivelFacil {
	
	const autosDer = [ 
		new AutoMedio(posY = 1 , posXInicio = 1),
		new AutoMedio(posY = 1 , posXInicio = 7),		
		new AutoLento(posY = 3, posXInicio = 1),
		new AutoLento(posY = 3, posXInicio = 7),
		new AutoLento(posY = 3, posXInicio = 12),				
		new AutoMedio(posY = 5, posXInicio = 1),
		new AutoMedio(posY = 5, posXInicio = 7)
	]
	
	const autosIzq = [
		new AutoMedio(posY = 2,posXInicio = 1),		
		new AutoRapido(posY = 4,posXInicio = 1)
	]
	
	const plataformasDer = [
		new Tronco(posY = 7 ,posXInicio = 1),
		new Tronco(posY = 7 , posXInicio = 2),
		new Tronco(posY = 7 , posXInicio = 8),
		new Tronco(posY = 7 , posXInicio = 9),
		new Tronco(posY = 7 , posXInicio = 13),
		
		new Tortuga(posY = 9, posXInicio = 4),
		new Tortuga(posY = 9, posXInicio = 5),
		new Tortuga(posY = 9, posXInicio = 10),
		new Tortuga(posY = 9, posXInicio = 11),		
			
		new Tronco(posY = 11, posXInicio = 1),
		new Tronco(posY = 11, posXInicio = 2),
		new Tronco(posY = 11, posXInicio = 6),
		new Tronco(posY = 11, posXInicio = 7),
		new Tronco(posY = 11, posXInicio = 12),
		new Tronco(posY = 11, posXInicio = 13)
	]
	
	const plataformasIzq = [
		
		new Tronco(posY = 8, posXInicio = 1),
		new Tronco(posY = 8, posXInicio = 4),
		new Tronco(posY = 8, posXInicio = 7),
		new Tronco(posY = 8, posXInicio = 10),
		new Tronco(posY = 8, posXInicio = 13),	
		
		new Tronco(posY = 10, posXInicio = 15),
		new Tronco(posY = 10, posXInicio = 14),
		new Tronco(posY = 10, posXInicio = 13)
	]
	
	method cargar(platDer, platIzq, aDer, aIzq){
		platDer.addAll(plataformasDer)
		platIzq.addAll(plataformasIzq)
		aDer.addAll(autosDer)
		aIzq.addAll(autosIzq)
	}
	
}


object nivelMedio {
	
		const autosDer = [ 
		new AutoRapido(posY = 1 , posXInicio = 1),		
		new AutoLento(posY = 3, posXInicio = 1),
		new AutoLento(posY = 3, posXInicio = 4),
		new AutoLento(posY = 3, posXInicio = 8),
		new AutoLento(posY = 3, posXInicio = 12),				
		new AutoRapido(posY = 5 , posXInicio = 1)	
	]
	
	const autosIzq = [
		new AutoMedio(posY = 2,posXInicio = 1),
		new AutoMedio(posY = 2,posXInicio = 3),	
		new AutoMedio(posY = 2,posXInicio = 10),			
		new AutoMedio(posY = 4,posXInicio = 1),	
		new AutoMedio(posY = 4,posXInicio = 8)	
	]
	
	const plataformasDer = [
		new Tronco(posY = 7 ,posXInicio = 1),
		new Tronco(posY = 7 , posXInicio = 2),
		new Tronco(posY = 7 , posXInicio = 9),
		new Tronco(posY = 7 , posXInicio = 13),
		
		new Tortuga(posY = 9, posXInicio = 4),
		new Tortuga(posY = 9, posXInicio = 5),
		new Tortuga(posY = 9, posXInicio = 10),
		new Tortuga(posY = 9, posXInicio = 11),		
			
		new Tronco(posY = 11, posXInicio = 1),
		new Tronco(posY = 11, posXInicio = 2),
		new Tronco(posY = 11, posXInicio = 6),
		new Tronco(posY = 11, posXInicio = 7),
		new Tronco(posY = 11, posXInicio = 12),
		new Tronco(posY = 11, posXInicio = 13)
	]
	
	const plataformasIzq = [
		
		new Tronco(posY = 8, posXInicio = 1),
		new Tronco(posY = 8, posXInicio = 4),
		new Tronco(posY = 8, posXInicio = 13),	
		
		new Mantarraya(posY = 10, posXInicio = 15),
		new Mantarraya(posY = 10, posXInicio = 14),
		new Mantarraya(posY = 10, posXInicio = 13)
	]
	
	method cargar(platDer, platIzq, aDer, aIzq){
		platDer.addAll(plataformasDer)
		platIzq.addAll(plataformasIzq)
		aDer.addAll(autosDer)
		aIzq.addAll(autosIzq)
	}
	
}

object nivelDificil {
	
		const autosDer = [ 
		new AutoRapido(posY = 1 , posXInicio = 1),		
		new AutoRapido(posY = 3, posXInicio = 1),				
		new AutoRapido(posY = 5, posXInicio = 1)
	]
	
	const autosIzq = [
		new AutoRapido(posY = 2,posXInicio = 1),		
		new AutoRapido(posY = 4,posXInicio = 1)
	]
	
	const plataformasDer = [
		new Mantarraya(posY = 7 ,posXInicio = 1),
		new Mantarraya(posY = 7 , posXInicio = 2),
		new Mantarraya(posY = 7 , posXInicio = 8),
		new Mantarraya(posY = 7 , posXInicio = 9),
		new Mantarraya(posY = 7 , posXInicio = 13),
		
		new Mantarraya(posY = 9, posXInicio = 4),
		new Mantarraya(posY = 9, posXInicio = 10),
		new Mantarraya(posY = 9, posXInicio = 11),		
			
		new Mantarraya(posY = 11, posXInicio = 1),
		new Mantarraya(posY = 11, posXInicio = 2),
		new Mantarraya(posY = 11, posXInicio = 12),
		new Mantarraya(posY = 11, posXInicio = 13)
	]
	
	const plataformasIzq = [
		
		new Mantarraya(posY = 8, posXInicio = 1),
		new Mantarraya(posY = 8, posXInicio = 4),
		new Mantarraya(posY = 8, posXInicio = 13),	
		
		new Mantarraya(posY = 10, posXInicio = 15),
		new Mantarraya(posY = 10, posXInicio = 13)
	]
	
	method cargar(platDer, platIzq, aDer, aIzq){
		platDer.addAll(plataformasDer)
		platIzq.addAll(plataformasIzq)
		aDer.addAll(autosDer)
		aIzq.addAll(autosIzq)
	}
}