object marDeAjo {
    var nombre = "Garlic´s Sea"
    var equipajeImprescindible = ["Caña de Pescar", "Piloto"]
    var precio = 2500

    method esDestinoDestacado() {
        return precio > 2000
    }

    method aplicarDescuento(descuento) {
        precio -= precio / 100 * descuento
        equipajeImprescindible.add("Certificado de Descuento")
    }

    method esDestinoPeligroso() {
        return equipajeImprescindible.any({equipaje => equipaje.contains("Vacuna")})
    }

    method nombre() {
        return nombre
    }
    
    method precio() {
    	return precio
    }
}

object marDelPlata {
    var nombre = "Silver's Sea"
    var equipajeImprescindible = ["Protector Solar", "Equipo de Buceo"]
    var precio = 1350

    method esDestinoDestacado() {
        return precio > 2000
    }

    method aplicarDescuento(descuento) {
        precio -= precio / 100 * descuento
        equipajeImprescindible.add("Certificado de Descuento")
    }

    method esDestinoPeligroso() {
        return equipajeImprescindible.any({equipaje => equipaje.contains("Vacuna")})
    }

    method nombre() {
        return nombre
    }
    
    method precio() {
    	return precio
    }
}

object lasToninas {
    var nombre = "Last Toninas"
    var equipajeImprescindible = ["Vacuna Gripal", "Vacuna B", "Necronomicon"]
    var precio = 3500

    method esDestinoDestacado() {
        return precio > 2000
    }

    method aplicarDescuento (descuento) {
        precio -= precio / 100 * descuento
        equipajeImprescindible.add("Certificado de Descuento")
    }

    method esDestinoPeligroso() {
        return equipajeImprescindible.any({equipaje => equipaje.contains("Vacuna")})
    }

    method nombre() {
        return nombre
    }
    
    method precio() {
    	return precio
    }
}

object buenosAires {
    var nombre = "Good Airs"
    var equipajeImprescindible = ["Cerveza", "Protector Solar"]
    var precio = 1500

    method esDestinoDestacado() {
        return precio > 2000
    }

    method aplicarDescuento(descuento) {
        precio -= precio / 100 * descuento
        equipajeImprescindible.add("Certificado de Descuentos")
    }

    method esDestinoPeligroso() {
        return equipajeImprescindible.any({equipaje => equipaje.contains("Vacuna")})
    }

    method nombre() {
        return nombre
    }
    
    method precio() {
    	return precio
    }
}

object barrileteCosmico {
    var destinos = #{marDeAjo, marDelPlata, lasToninas, buenosAires}
    var usuarios = [pabloHari]

    method obtenerLosDestinosMasImportantes() {
        return destinos.filter({destino => destino.esDestinoDestacado()})
    }

    method aplicarDescuentoALosDestinos(descuento) {
        destinos.forEach({destino => destino.aplicarDescuento(descuento)})
    }

    method esEmpresaExtrema() {
        return destinos.any({destino => destino.esDestinoPeligroso()})
    }

    method conocerCartaDeDestinos() {
        return destinos.map({destino => destino.nombre()})
    }

    method destinos() {
        return destinos
    }
}

object pabloHari {
    var usuario = "PHari"
    var destinosConocidos = #{lasToninas, buenosAires}
    var dineroEnCuenta = 1500
    var usuariosSeguidos = []

    method volarA(destino) {
        if(dineroEnCuenta >= destino.precio()) {
            dineroEnCuenta -= destino.precio()
            destinosConocidos.add(destino)
        }
    }

    method obtenerKilometrosDisponibles() {
        return destinosConocidos.sum({destino => destino.precio()}) / 10
    }

    method seguirUsuario(otroUsuario) {
    	usuariosSeguidos.add(otroUsuario)
        otroUsuario.devolverSeguida(self)
    }

    method devolverSeguida(otroUsuario) {
        usuariosSeguidos.add(otroUsuario)
    }
    
    method conoce(destino) {
    	return destinosConocidos.contains(destino)
    }
    
    method dineroEnCuenta() {
    	return dineroEnCuenta
    }
}