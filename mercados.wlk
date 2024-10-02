import hector.*
class Mercado {
    var property position    
    var oroDisponible 
    const mercaderia = []

    method image() {
        return "market.png"
    }

    method comprarMercaderia() {
        self.validarCompra()
        mercaderia.addAll(hector.mochila())
        oroDisponible-= hector.valorTotalDeCosecha()
    }

    method validarCompra() {
        if(oroDisponible < hector.valorTotalDeCosecha()) {
            self.error("No hay suficiente dinero")
        }
    }

    method crecer() {
        
    }
    
}