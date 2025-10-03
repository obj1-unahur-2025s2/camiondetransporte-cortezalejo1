class Ser{
    //var habilidad
    //var inmortalidad
    method inmortalidad() = true
    method adquirirExp()
    method suenioProfundo()
    method conforme(unTerritorio)
    method tomarRecursos(unTerritorio)
}

class Elfo inherits Ser{
    var canciones = 20

    method canciones() = canciones
    //method aprenderCancion(){canciones ++}
    //method olvidarCancion(){canciones = 0.max(canciones-1)}

    method habilidad(){
        return if (canciones <= 60) {180} else {canciones3}
    }

    override method adquirirExp(){
        canciones = canciones2
    }

    override method suenioProfundo(){
        canciones = 0.max(canciones -10)
    }

    override method conforme(unTerritorio){
        return unTerritorio.lembas() >= 8
    }

    override method tomarRecursos(unTerritorio){
        unTerritorio.lembas( 0.max( unTerritorio.lembas()-3 ) )
        canciones += 15
    }
}

class Hobbit inherits Ser{
    var amigos = 40
    var historias = 6
    method amigos() = amigos
    method historias() = historias
    override method inmortalidad(){
        return if (amigos >=20) {super()} else {false}
    }
    method habilidad(){
        return if (amigos <60) {historias100} else {historias50}
    }

    override method adquirirExp(){
        amigos = amigos+8
    }

    method hacerFiesta(){
        amigos = amigos + 5
        historias = historias + 5
    }

    override method suenioProfundo(){
        amigos = 0.max(amigos-3)
    }

    override method conforme(unTerritorio){
        return unTerritorio.seresConMasHabilidadQue(self.habilidad()).size()<=2
    }

    override method tomarRecursos(unTerritorio){
        unTerritorio.tabaco( 0.max( unTerritorio.tabaco()-4 ) )
        amigos += 7
        historias += 7
    }
}
[0:05]
class Enano inherits Ser{
    var property ira = 200

    override method inmortalidad() = false

    method habilidad(){
        return ira2
    }

    override method adquirirExp(){
        ira = ira + 300
    }

    override method suenioProfundo(){
        ira = 0.max(ira -50)
    }

    override method conforme(unTerritorio){
        return ( unTerritorio.seresTorpes().difference(#{self}) ).size()<=1
    }

    override method tomarRecursos(unTerritorio){}

    method equilibrarse(){
        if (self.habilidad()<=700) { self.adquirirExp() } else { self.suenioProfundo() }
    }
}

class Silvano inherits Elfo{
    override method habilidad(){ return super()+400}
}

class Herrero inherits Enano{
    var espadas = 3

    override method habilidad(){
        return espadas100
    }

    override method adquirirExp(){
        super()
        espadas ++
    }

}

class Furioso inherits Enano{
    var property habilidadMax = 2000

    override method habilidad(){
        return habilidadMax.max(super())
    }
}


class Minero inherits Enano{
    const property escondites = #{}

    method agregarEscondite(unEscondite){
        escondites.add(unEscondite)
    }

    override method adquirirExp(){
        super()
        self.agregarEscondite(new Escondite())
    }
    //VER**
    override method suenioProfundo(){
        if (escondites.size() > 2) {self.agregarCandado()} {super()}
    }

    method agregarCandado(){
        escondites.forEach({e=>e.candados( e.candados()+1 )})
    }

    override method ira(){
        return super() + escondites.sum({e=>e.valor()})
    } 


}







class Escondite{
    var property candados = 5
    var property oro = 3

    method valor(){
        return ( (candadosoro)+20 )
    }
}