import plagas.*

class Elemento {
	method efectoDeAtacar(unaPlaga){
		unaPlaga.efectoDeAtacar()
	}
}

class Hogar inherits Elemento{
	var nivelDeMugre
	var property confort
	
	method nivelDeMugre(unaCantidad){
		nivelDeMugre = nivelDeMugre + unaCantidad
	}
	method nivelDeMugre() = nivelDeMugre
	
	method esBueno() {
		return nivelDeMugre <= confort/2
	}
	method recibirAtaqueDe (unaPlaga){
		self.nivelDeMugre(unaPlaga.nivelDeDanio())
		self.efectoDeAtacar(unaPlaga)
	}
}

class Huerta inherits Elemento{
	var capacidadDeProduccion
	method capacidadDeProduccion(unaCantidad){
		capacidadDeProduccion = capacidadDeProduccion - unaCantidad
	}
	method capacidadDeProduccion() = capacidadDeProduccion
	method esBueno() {
		return capacidadDeProduccion > nivelProduccion
	}
	method recibirAtaqueDe(unaPlaga){
		const disminucion = unaPlaga.nivelDeDanio() * 0.1 + if (unaPlaga.transmiteEnfermedades()) {10} else {0}
		self.capacidadDeProduccion(disminucion)
		self.efectoDeAtacar(unaPlaga)
	}
}

object nivelProduccion{
	var property nivelASuperar
}

class Mascota inherits Elemento{
	var property nivelDeSalud
	
	method nivelDeSalud(unaCantiddad){
		nivelDeSalud = nivelDeSalud - unaCantiddad
	}
	
	method esBueno() {
		return nivelDeSalud > 250
	}
	method recibirAtaqueDe(unaPlaga){
		if (unaPlaga.transmiteEnfermedades()){
			self.nivelDeSalud(unaPlaga.nivelDeDanio())
			self.efectoDeAtacar(unaPlaga)
		}
	}
}


class Barrio {
	const property elementos = []
	method agregarElemento(elemento){
		elementos.add(elemento)
	}

	method esCopado(){
		const elementosBuenos
	}

	method cantidadDeElementosBuenos(){
		return elementos.count { e => e.esBueno() }
	}
}
