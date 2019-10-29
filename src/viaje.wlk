class MedioDeTransporte {

    var property velocidad
	
	constructor (unaVelocidad) {
			velocidad = unaVelocidad;
	}
	
	method precioPorKilometro()
}

class Avion inherits MedioDeTransporte{
	var turbinas
	
	constructor(unaVelocidad, unasTurbinas) = super(unaVelocidad) { turbinas = unasTurbinas }
	
	override method precioPorKilometro() {
		return turbinas.sum({turbina => turbina.nivelDeImpulso()})
	}
}

class Turbina {
	var property nivelDeImpulso
	
	constructor(unNivelDeImpulso) {
		nivelDeImpulso = unNivelDeImpulso
	}
}

class Micro inherits MedioDeTransporte {
	override method precioPorKilometro() = 5000
}

class Tren inherits MedioDeTransporte {
	
	override method precioPorKilometro() {
		return 2300 * 0.62
	}
}

class Barco inherits MedioDeTransporte {
	var probabilidadDeChoqueConIceberg
	
	constructor (unaVelocidad, unaProbabilidadDeChoqueConIceberg) = super(unaVelocidad) { probabilidadDeChoqueConIceberg = unaProbabilidadDeChoqueConIceberg }
	
	override method precioPorKilometro() {
		return 1000 * probabilidadDeChoqueConIceberg
	}
}

class Viaje {
	
	var origen
    var destino
    var medioDeTransporte

    constructor(unOrigen, unDestino, unMedioDeTransporte) {
        origen = unOrigen
        destino = unDestino
        medioDeTransporte = unMedioDeTransporte
    }

    method origen() {
        return origen
    }

    method destino() {
        return destino
    }

    method distancia() {
        return origen.distanciaA(destino)
    }

    method precio() {
        return medioDeTransporte.precioPorKilometro() * self.distancia() + destino.precio()
    }
}