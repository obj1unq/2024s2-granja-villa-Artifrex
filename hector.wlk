import wollok.game.*
import cultivos.*
import granja.*
import movimientos.*
import aspersores.*
import mercados.*

object hector {
	var property position = game.center()
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
		self.validarVender()
		const mercado = game.uniqueCollider(self)
		ahorros += self.valorTotalDeCosecha()
		mercado.comprarMercaderia()
		mochila.clear()
	}

	method validarVender() {
		if(!self.hayMercadoAca(self.position())) {
			self.error("Tengo que estar en un mercado para poder vender")
		}
	}

	method hayMercadoAca(posicion) {
		return //preguntar como hacer para devolver la posicion de algun mercado
	}

	method valorTotalDeCosecha() {
		return mochila.sum({cultivo => cultivo.valor()})
	}

	method dineroJuntado() {
		game.say(self, "Tengo " + ahorros + " monedas y " + mochila.size() + " plantas para vender")
	}

	method colocarAspersor() {
		const aspersor = new Aspersor()
		//self.validarColocar()
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
		return //preguntar como hacer esto NO ME SALE UFA
	}

	method crecer() {

	}
}