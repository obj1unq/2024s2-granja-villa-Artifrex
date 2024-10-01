import wollok.game.*
import cultivos.*
import granja.*
import movimientos.*
import aspersores.*

object hector {
	var property position = game.center()
	const property image = "player.png"
	var ahorros = 0

	const mochila = []

	method mover(direccion) {
		position = direccion.siguiente(position)
	}

	method sembrar(cultivo) {
		self.validarSembrar()
		granja.cultivos(cultivo)
		game.addVisual(cultivo)
	}

	method validarSembrar() {
		if (granja.hayCultivoEn(position.x(), position.y())){
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
		if (!granja.hayCultivoEn(position.x(), position.y())){
			self.error("No hay nada para regar aquí")
		}
	}

	method vender() {
		const valorTotalCosecha = mochila.sum({cultivo => cultivo.valor()})
		ahorros += valorTotalCosecha
		mochila.clear()
	}

	method dineroJuntado() {
		game.say(self, "Tengo " + ahorros + " monedas y " + mochila.sum() + " plantas para vender")
	}

	method colocarAspersor() {
		game.addVisual(new Aspersor())
	}

}