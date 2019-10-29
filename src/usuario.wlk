import viaje.*
import barrileteCosmico.*
class Usuario {

    var nombreYApellido
    var dineroEnCuenta
    var viajesRealizados = #{}
    var usuariosSeguidos = #{}
    var localidadDeOrigen
	var property perfil

    constructor(nombre, dinero, losViajesRealizados, losUsuariosSeguidos, suLocalidadDeOrigen, suPerfil) {
        nombreYApellido = nombre
        dineroEnCuenta = dinero
        viajesRealizados = losViajesRealizados
        usuariosSeguidos = losUsuariosSeguidos
        localidadDeOrigen = suLocalidadDeOrigen
        perfil = suPerfil
    }

    method usuariosSeguidos() {
        return usuariosSeguidos
    }

    method dineroEnCuenta() {
        return dineroEnCuenta
    }

    method localidadDeOrigen() {
        return localidadDeOrigen
    }

    method viajesRealizados() {
        return viajesRealizados
    }

	method realizarViaje(unViaje) {
		if(self.tieneDineroParaViajar(unViaje)){
			dineroEnCuenta -= unViaje.precio()
			viajesRealizados.add(unViaje)
			localidadDeOrigen = unViaje.destino()
		} else {
			throw(new NoPuedoRealizarElViajeException())
		}
	}

    method kilometrosRecorridos() {
        return viajesRealizados.sum({unViaje => unViaje.distancia()})
    }  

    method seguirUsuario(otroUsuario) {
        usuariosSeguidos.add(otroUsuario)
        otroUsuario.agregar(self)
    }

    method agregar(otroUsuario) {
        usuariosSeguidos.add(otroUsuario)
    }
    
    method destinoConocido(unDestino) {
    	return viajesRealizados.map({unViaje => unViaje.destino()}).contains(unDestino)
    }
    method tieneDineroParaViajar(unViaje){
    	return self.dineroEnCuenta() >= unViaje.precio()
    } 
}

class Perfil {
	method determinarMedioDeTransporte(unUsuario, unaDistancia)
}

object empresarial inherits Perfil {
	override method determinarMedioDeTransporte(unUsuario, unaDistancia) {
		return barrileteCosmico.mediosDeTransporte().max({medioDeTransporte => medioDeTransporte.velocidad()})
	}
}

object estudiantil inherits Perfil {
	override method determinarMedioDeTransporte(unUsuario, unaDistancia) {
		var mediosDisponibles = barrileteCosmico.mediosDeTransporte().filter({medioDeTransporte => medioDeTransporte.precioPorKilometro() * unaDistancia <= unUsuario.dineroEnCuenta()})
		if(mediosDisponibles.size() > 0)
			return mediosDisponibles.max({medioDeTransporte => medioDeTransporte.velocidad()})
		else
			throw new NoHayMedioDeTransporteDisponibleException(message = "Falta dinero para contratar algun medio de transporte")
	}
}

object grupoFamiliar inherits Perfil {
	override method determinarMedioDeTransporte(unUsuario, unaDistancia) {
		return barrileteCosmico.mediosDeTransporte().anyOne()
	}
}

class NoPuedoRealizarElViajeException inherits Exception {}

class NoHayMedioDeTransporteDisponibleException inherits Exception {}
