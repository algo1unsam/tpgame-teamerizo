import plataformas.*
import vehiculos.*
import movimientoPersonajes.*


class Niveles{
	
	const objetos = []
	
	method seImplementanElementos()
	
	//n = distancia entre objetos
	
	method crearTresTroncos(y,x,n,direccion) = [new Tronco(posY = y ,posXInicio = x, direc = direccion),new Tronco(posY = y ,posXInicio = x+n, direc = direccion),new Tronco(posY = y ,posXInicio = x+n+n, direc = direccion)]
	
	method crearDosTroncos(y,x,n,direccion) = [new Tronco(posY = y ,posXInicio = x, direc = direccion),new Tronco(posY = y ,posXInicio = x+n, direc = direccion)]
	
	method crearTresTortugas(y,x,n,direccion) = [new Tortuga(posY = y ,posXInicio = x, direc = direccion),new Tortuga(posY = y ,posXInicio = x+n, direc = direccion),new Tortuga(posY = y ,posXInicio = x+n+n, direc = direccion)]
	
	method crearDosTortugas(y,x,n,direccion) = [new Tortuga(posY = y ,posXInicio = x, direc = direccion),new Tortuga(posY = y ,posXInicio = x+n, direc = direccion)]
	
	method crearTresMantarrayas(y,x,n,direccion) = [new Mantarraya(posY = y ,posXInicio = x, direc = direccion),new Mantarraya(posY = y ,posXInicio = x+n, direc = direccion),new Mantarraya(posY = y ,posXInicio = x+n+n, direc = direccion)]
	
	method crearDosMantarrayas(y,x,n,direccion) = [new Mantarraya(posY = y ,posXInicio = x, direc = direccion),new Mantarraya(posY = y ,posXInicio = x+n, direc = direccion)]
	
	method crearDosAutosMedios(y,x,n,direccion) = [new AutoMedio(posY = y , posXInicio = x, direc = direccion), new AutoMedio(posY = y , posXInicio = x+n, direc = direccion)]
	
	method crearDosAutosLentos(y,x,n,direccion) = [new AutoLento(posY = y , posXInicio = x, direc = direccion), new AutoLento(posY = y , posXInicio = x+n, direc = direccion)]
	
	method crearAutoRapido(y,x,direccion) = [new AutoRapido(posY = y,posXInicio = x, direc = direccion)]
	
	method cargar(obj){
		obj.addAll(objetos)
	}
	
}

object nivelFacil inherits Niveles{
	
	override method seImplementanElementos(){
		
		objetos.addAll(
			//autos
			self.crearDosAutosMedios(1,1,4, derecha) +
			self.crearDosAutosMedios(1,8,2, derecha)	+
			self.crearDosAutosLentos(3,1,5, derecha) +
			self.crearDosAutosLentos(3,10,2, derecha) +		
			self.crearDosAutosMedios(5,8,8, derecha) +
			self.crearDosAutosMedios(2,1,5, izquierda) +		
			self.crearAutoRapido(4,1, izquierda) +
			//plataformas
			self.crearTresTroncos(7,1,1,derecha) +
			self.crearTresTroncos(7,7,1,derecha) +
			self.crearDosTroncos(7,12,1,derecha) +
			self.crearTresTortugas(9,4,2,derecha) +
			self.crearDosTortugas(9,12,1,derecha) +
			self.crearDosTroncos(11,3,1,derecha) +
			self.crearDosTroncos(11,10,1,derecha) +
			self.crearDosTroncos(11,15,1,derecha) +
			self.crearTresTroncos(8,1,-1,izquierda) + 
			self.crearDosTroncos(8,9,-1,izquierda) +
			self.crearTresTroncos(10,14,-1,izquierda) +
			self.crearTresTroncos(10,5,-1,izquierda)
			)		
		}
	
}


object nivelMedio inherits Niveles{
	
	override method seImplementanElementos(){
		objetos.addAll(
			//autos
			self.crearDosAutosMedios(1,1,4, derecha) +
			self.crearDosAutosMedios(1,14,2, derecha)+			
			self.crearDosAutosMedios(3,1,5, derecha) +
			self.crearDosAutosMedios(3,8,3, derecha) +							
			self.crearDosAutosMedios(5,8,8, derecha) +
			self.crearAutoRapido(2,6, izquierda) +		
			self.crearAutoRapido(4,1, izquierda) +
			//plataformas
			self.crearTresTroncos(7,1,1,derecha) +
			self.crearDosTroncos(7,12,3,derecha) +			
			self.crearTresTortugas(9,4,3,derecha)+			
			self.crearDosTroncos(11,3,6,derecha) +
			self.crearDosTroncos(11,15,1,derecha) +
			self.crearDosMantarrayas(8,1,-4,izquierda) + 			
			self.crearDosTroncos(10,14,-1,izquierda) +
			self.crearDosTroncos(10,5,-1,izquierda)
			)
			
		}
	
}

object nivelDificil inherits Niveles{
	
	override method seImplementanElementos(){
		
		objetos.addAll(
			//autos
			self.crearAutoRapido(1,1, derecha) +
			self.crearAutoRapido(3,1, derecha) +
			self.crearAutoRapido(5,1, derecha) +	
			self.crearAutoRapido(2,1, izquierda) +
			self.crearAutoRapido(4,1, izquierda) +
			//plataformas
			self.crearDosMantarrayas(7,1,-1,derecha) +
			self.crearDosMantarrayas(7,8,-1,derecha) +			
			self.crearDosMantarrayas(9,4,-1,derecha) +
			self.crearDosMantarrayas(9,10,-1,derecha)+			
			self.crearDosMantarrayas(11,1,-1,derecha)+
			self.crearDosMantarrayas(11,12,-1,derecha)+
			self.crearDosMantarrayas(8,4,-1,izquierda) +
			self.crearDosMantarrayas(10,13,-1,izquierda) 
		)
	}	
}