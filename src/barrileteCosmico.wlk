import localidad.*
import usuario.*
import viaje.*

object barrileteCosmico {
    var property localidades = #{}
    var property usuarios = #{}
    var property mediosDeTransporte = #{}

    method obtenerLasLocalidadesMasImportantes() {
        return localidades.filter({localidad => localidad.localidadDestacada()})
    }

    method aplicarDescuentoALasLocalidades(descuento) {
        localidades.forEach({localidad => localidad.aplicarDescuento(descuento)})
    }

    method esEmpresaExtrema() {
        return localidades.any({localidad => localidad.esPeligrosa()})
    }

    method conocerCartaDeLocalidades() {
        return localidades.map({localidad => localidad.nombre()})
    }

    method armarViaje(usuario, destino) {
        var viaje = new Viaje(usuario.localidadDeOrigen(), destino, usuario.perfil().determinarMedioDeTransporte(usuario, usuario.localidadDeOrigen().distanciaA(destino)))
        usuario.realizarViaje(viaje)
    }
}