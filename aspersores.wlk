import cultivos.*
import wollok.game.*
import granja.*
import hector.*

class Aspersor {
    var property position = game.at(hector.position().x(), hector.position().y())
    const property objetosAlrededor = []

    method agregarObjetos() {
      objetosAlrededor.add(game.getObjectsIn(position.up(1)))
      objetosAlrededor.add(game.getObjectsIn(position.left(1)))
      objetosAlrededor.add(game.getObjectsIn(position.right(1)))
      objetosAlrededor.add(game.getObjectsIn(position.down(1)))
    }

    method regarPlantas() {
      objetosAlrededor.forEach({objeto => objeto.crecer()})
    }//me dice que "aspersor" no entiende el metodo crecer

    method image() {
      return "aspersor.png"
    }

    method crecer() {

    }
}