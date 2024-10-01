import cultivos.*
import wollok.game.*
import granja.*
import hector.*

class Aspersor {
    var property position = game.at(hector.position().x(), hector.position().y())

    method regarPlantas() {
      ??????  game.onTick(1000, "regar", game.onCollideDo(self, cultivo.regar()))
    }
}