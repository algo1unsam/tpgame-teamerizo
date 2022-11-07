import plataformas.*
import vehiculos.*
import movimientoPersonajes.*


class Niveles{
	
	const objetos = []
	
	method seImplementanElementos()
	
	//n = distancia entre objetos
	method crearCuatroTroncos(y,x,n,direccion) = [new Tronco(posY = y ,posXInicio = x, direc = direccion),new Tronco(posY = y ,posXInicio = x+n, direc = direccion),new Tronco(posY = y ,posXInicio = x+n+n, direc = direccion), new Tronco(posY = y ,posXInicio = x+n+n+n, direc = direccion)]
		
	method crearCuatroTortugas(y,x,n,direccion) = [new Tortuga(posY = y ,posXInicio = x, direc = direccion),new Tortuga(posY = y ,posXInicio = x+n, direc = direccion),new Tortuga(posY = y ,posXInicio = x+n+n, direc = direccion), new Tortuga(posY = y ,posXInicio = x+n+n+n, direc = direccion)]
	
	method crearDosMantarrayas(y,x,n,direccion) = [new Mantarraya(posY = y ,posXInicio = x, direc = direccion),new Mantarraya(posY = y ,posXInicio = x+n, direc = direccion)]
	
	method crearCuatroAutosMedios(y,x,n,direccion) = [new AutoMedio(posY = y , posXInicio = x, direc = direccion), new AutoMedio(posY = y , posXInicio = x+n, direc = direccion), new AutoMedio(posY = y , posXInicio = x+n+n, direc = direccion), new AutoMedio(posY = y , posXInicio = x+n+n+n, direc = direccion)]
	
	method crearCuatroAutosLentos(y,x,n,direccion) = [new AutoLento(posY = y , posXInicio = x, direc = direccion), new AutoLento(posY = y , posXInicio = x+n, direc = direccion), new AutoLento(posY = y , posXInicio = x+n+n, direc = direccion), new AutoLento(posY = y , posXInicio = x+n+n+n, direc = direccion)]
	
	method crearAutoRapido(y,x,direccion) = [new AutoRapido(posY = y,posXInicio = x, direc = direccion)]
	
	method crearAutoAcelerado(y,x,direccion) = [new AutoAcelerado(posY = y,posXInicio = x, direc = direccion)]
	
	method cargar(obj){
		obj.addAll(objetos)
	}
	
}

object nivelFacil inherits Niveles{
	
	override method seImplementanElementos(){
		
		objetos.addAll(
			//autos
			self.crearCuatroAutosMedios(1,1,4, derecha) +
			self.crearCuatroAutosLentos(3,1,4, derecha) +	
			self.crearCuatroAutosLentos(4,15,-4, izquierda) +
			self.crearCuatroAutosMedios(2,15,-4, izquierda) +		
			self.crearAutoRapido(5,1, derecha) +
			//plataformas
			self.crearCuatroTroncos(7,1,4,derecha) +
			self.crearCuatroTroncos(8,15,-4,izquierda) +
			self.crearCuatroTroncos(8,14,-4,izquierda) +
			self.crearCuatroTroncos(9,7,1,derecha) +
			self.crearCuatroTroncos(10,15,-4,izquierda) +
			self.crearCuatroTroncos(10,14,-4,izquierda) +
			self.crearCuatroTroncos(11,1,4,derecha) 
			)		
		}
	
}


object nivelMedio inherits Niveles{
	
	override method seImplementanElementos(){
		objetos.addAll(
			//autos
			self.crearCuatroAutosMedios(1,1,4, derecha) +		
			self.crearCuatroAutosMedios(3,2,4, derecha) +							
			self.crearCuatroAutosMedios(5,3,4, derecha) +
			self.crearAutoRapido(2,6, izquierda) +		
			self.crearAutoAcelerado(4,1, izquierda) +
			//plataformas
			self.crearCuatroTroncos(7,1,4,derecha) +
			self.crearCuatroTroncos(8,15,-4,izquierda) +
			self.crearCuatroTroncos(8,14,-4,izquierda) +
			self.crearCuatroTortugas(9,1,4,derecha) +
			self.crearCuatroTortugas(9,2,4,derecha) +
			self.crearCuatroTroncos(10,15,-4,izquierda) +
			self.crearCuatroTroncos(10,14,-4,izquierda) +
			self.crearCuatroTroncos(11,1,4,derecha) 
			)
			
		}
	
}

object nivelDificil inherits Niveles{
	
	override method seImplementanElementos(){
		
		objetos.addAll(
			//autos
			self.crearAutoRapido(1,1, derecha) +
			self.crearAutoRapido(2,1, izquierda) +
			self.crearAutoRapido(3,1, derecha) +
			self.crearAutoRapido(4,1, izquierda) +
			self.crearCuatroAutosLentos(5,1,4, derecha) +
			self.crearCuatroAutosLentos(5,3,4, derecha) +
			//plataformas
			self.crearDosMantarrayas(7,1,1,derecha) +
			self.crearDosMantarrayas(7,8,1,derecha) +			
			self.crearDosMantarrayas(9,4,1,derecha) +
			self.crearDosMantarrayas(9,10,1,derecha)+			
			self.crearDosMantarrayas(11,1,1,derecha)+
			self.crearDosMantarrayas(11,12,1,derecha)+
			self.crearDosMantarrayas(8,4,-1,izquierda) +
			self.crearDosMantarrayas(10,13,-1,izquierda) 
		)
	}	
}