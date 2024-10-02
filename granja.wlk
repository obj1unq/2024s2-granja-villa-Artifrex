import hector.*
import cultivos.*
import wollok.game.*

object granja {
    const property cultivos = [] //property porque se debe saber que cultivos tiene la granja

    method cultivos(cultivo) {
        cultivos.add(cultivo)
    }

    method hayCultivoEn(x, y) {
        return cultivos.any({cultivo => cultivo.position().y() == y && cultivo.position().x() == x})
        //horrible como pegarle a tu vieja esto, pero por ahora es lo que hay :/
    }

    method cosechar(cultivo) {
        cultivos.remove(cultivo)
        game.removeVisual(cultivo)
    }
}