class Localidad {
    
    var nombre 
    var equipajeImprescindible
    var kilometro
    var precio

    constructor(unNombre, equipaje, unKilometro, unPrecio) {
        nombre = unNombre
        equipajeImprescindible = equipaje
        kilometro = unKilometro
        precio = unPrecio
    }

    method kilometro() {
        return kilometro
    }
     
    method precio() {
        return precio
    }
      
    method equipajeImprescindible() {
        return equipajeImprescindible
    }
      
    method nombre() {
        return nombre
    }
      
    method localidadDestacada() {
        return precio > 2000
    }
      
    method aplicarDescuento(descuento) {
        precio -= descuento / 100 * self.precio()
        equipajeImprescindible.add("Certificado de Descuento")
    }
      
    method esPeligrosa() {
        return equipajeImprescindible.any({equipaje => equipaje.contains("Vacuna")})
    }
      
    method tieneCertificadoDeDescuento() {
        return equipajeImprescindible.any({equipaje => equipaje.contains("Certificado de Descuento")})
    }
  
    method distanciaA(otraLocalidad) {
        return (self.kilometro() - otraLocalidad.kilometro()).abs()
    }
}

class Playa inherits Localidad {
	
	override method esPeligrosa() = false
}

class Montana inherits Localidad {
	var altura

	constructor(unNombre, unEquipaje, unKilometro, unPrecio, unaAltura) =
  		super(unNombre, unEquipaje, unKilometro, unPrecio) {

		altura = unaAltura
  	}

  	override method esPeligrosa(){
  		return super() && altura > 5000
  	}

	override method localidadDestacada() = true
}

class CiudadHistorica inherits Localidad {
	var property museos

	constructor(unNombre, unEquipaje, unKilometro, unPrecio, unosMuseos) =
  		super(unNombre, unEquipaje, unKilometro, unPrecio) {

		museos = unosMuseos
  	}

	override method localidadDestacada(){
		return super() && museos.size() >= 3
	}

	override method esPeligrosa(){
		return !equipajeImprescindible.contains("seguro de asistencia al viajero")
	}
}