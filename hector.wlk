import wollok.game.*
import cultivos.*
import granja.*
import movimientos.*
import aspersores.*
import mercados.*

//hay mucho codigo repetido, pero como me cuesta BOCHA entender game,
// por ahora lo dejo asi hasta que comprenda mejor
object hector {
	var property position = game.at(5,6)
	const property image = "player.png"
	var ahorros = 0

	const property mochila = []

	method mover(direccion) {
		position = direccion.siguiente(position)
	}

	method sembrar(cultivo) {
		self.validarSembrar()
		granja.cultivos(cultivo)
		game.addVisual(cultivo)
	}

	method validarSembrar() {
		if (granja.hayCultivoEn(self.position().x(), self.position().y())){
			self.error("No puedo sembrar ahi, ya hay un cultivo")
		}
	}
	
	method cultivar() {
		const cultivo = game.uniqueCollider(self)
		cultivo.validarCultivar()
		mochila.add(cultivo)
		granja.cosechar(cultivo)
	}

	method regar() {
		const cultivo = game.uniqueCollider(self)
		self.validarRiego()
		cultivo.crecer()
	}
	
	method validarRiego() {
		if (!granja.hayCultivoEn(self.position().x(), self.position().y())){
			self.error("No hay nada para regar aquí")
		}
	}

	method vender() {
		//self.validarVender() -> ahora esta en el mercado
		const mercado = game.uniqueCollider(self) //esto me dice si hay una unica cosa (en este caso el mercado) en la posicion de hector
		mercado.comprarMercaderia()
		ahorros += self.valorTotalDeCosecha()		
		mochila.clear()
	}

/*	method validarVender() {
		if(!self.hayMercadoAca(self.position())) {
			self.error("Tengo que estar en un mercado para poder vender")
		}
	}

	method hayMercadoAca(posicion) {
		return game.colliders(self)
	} 
*/

	method valorTotalDeCosecha() {
		return mochila.sum({cultivo => cultivo.valor()})
	}

	method dineroJuntado() {
		game.say(self, "Tengo " + ahorros + " monedas y " + mochila.size() + " plantas para vender")
	}

	method colocarAspersor() {
		const aspersor = new Aspersor()
		self.validarColocar()
		game.addVisual(aspersor)
		aspersor.agregarObjetos()
		game.onTick(1000, "regar alrededor", {aspersor.regarPlantas()})
	}

	method validarColocar() {
		if(self.hayAlgoAca()) {
			self.error("No puedo colocarlo, está ocupado")
		}
	}

	method hayAlgoAca() {
		return game.colliders(self) > 0 // ??
	}

	method crecer() {

	}
}