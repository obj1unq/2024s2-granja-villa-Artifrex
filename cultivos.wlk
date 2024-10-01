import wollok.game.*
import hector.*
import movimientos.*
import granja.*

class Maiz {
	var estado = "baby"
	var property position = game.at(hector.position().x(), hector.position().y())

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_" + estado + ".png"
	}

	method crecer() {
		estado = "adult"
	}

	method valor() {
		return 150
	}

	method validarCultivar() {
		if(!self.esAdulto()) {
			self.error("")
		}
	}

	method esAdulto() {
		return estado == "adult"
	}
}

class Trigo {
	var property position = game.at(hector.position().x(), hector.position().y())
	var evolucion = 0
	method image() {
		return "wheat_" + evolucion +".png"
	}
	
	method crecer() {
		evolucion = (evolucion + 1) % 4
	}

	method valor() {
		return (evolucion - 1) * 100
	}

	method validarCultivar() {
		if(evolucion < 2) {
			self.error("No estoy lista :)")
		}
	}
}

class Tomate {
	var property position = game.at(hector.position().x(), hector.position().y())
	var estado = "_baby"
	method image() {
		return "tomaco" + estado + ".png"
	}

	method crecer() {
		self.validarMover()
		position = position.up(1)
		estado = ""	
	}

	method validarMover() {
		if(granja.hayCultivoEn(self.position().x() + 1, self.position().y())) {
			self.error("")
		}
	}

	method valor() {
		return 80
	}

	method validarCultivar() {

	}
}