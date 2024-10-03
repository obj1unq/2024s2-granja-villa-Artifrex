import hector.*
class Mercado {
    var property position    
    var oroDisponible 
    const mercaderia = []

    method image() {
        return "market.png"
    }

    method comprarMercaderia() {
        self.validarPosicion()
        self.validarCompra()
        mercaderia.addAll(hector.mochila())
        oroDisponible-= hector.valorTotalDeCosecha()
    }

    method validarPosicion() {
        if(hector.position() != self.position()) {
            self.error("No estoy en el mercado para vender")
        }
    }

    method validarCompra() {
        if (oroDisponible < hector.valorTotalDeCosecha()) {
            self.error("No hay suficiente dinero")
        }
    }

    method crecer() {
        
    }
    
}