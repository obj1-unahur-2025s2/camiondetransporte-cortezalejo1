class Territorio{
    const property seres = #{}
    var property lembas = 10
    var property tabaco = 10

    method agregarSer(unSer){
        seres.add(unSer)
    }

    //method lembas() = lembas

    //method tabaco() = tabaco

    method seresTorpes(){
        return seres.filter({s=>s.habilidad() < 1000})
    }

    method habilidadMaxima(){
        return seres.max({s=>s.habilidad()}).habilidad()
    }

    method habilidadPromedio(){
        return ( seres.sum({s=>s.habilidad()}) / seres.size() )
    }

    method territorioSabio(){
        return seres.all({s=>s.habilidad() > 300})
    }

    method torneo(){
        seres.forEach({s=>s.adquirirExp()})
    }

    method epifania(){
        self.seresTorpes().forEach({s=>s.adquirirExp()})
    }

    method hayMortal(){
        return seres.any({s=>!s.inmortalidad()})
    }

//MAS SOBRE TERRITORIO *VER48
    method     capitan(){
        if ( self.habilidadMaxima().between(1000,3000) ){
            return seres.max({s=>s.habilidad()}) 
        } else {return null}
    }

    method somnolencia(){
        seres.forEach({s=>s.suenioProfundo()})
    }

    method enPaz(){
        return seres.all({s=>s.conforme(self)})
    }

    method seresConMasHabilidadQue(unNumero){
        return seres.filter({s=>s.habilidad()>unNumero})
    }

    method consumirRecursos(){
        seres.forEach({s=>s.tomarRecursos(self)})
    }

}
