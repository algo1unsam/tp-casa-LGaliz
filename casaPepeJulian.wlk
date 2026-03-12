object casa{
    var viveres = 50
    var monto = 0

    method monto(valor) {
        monto = valor
}
    method monto() {
        return monto
    } 

   method viveresSuficientes() {
     return viveres > 40
   }

   method necesitaReparaciones() {
    return monto > 0
     
   }

   method estaEnOrden() {
    return self.viveresSuficientes() and not self.necesitaReparaciones()
   } 
}


object cuentaCorriente {
    var saldo = 0

    method depositar(valor){
        //saldo = saldo + valor ES IGUAL A...
        saldo +=valor
    }

    method extraer(valor) {
        saldo -= valor
    }
}

object cuentaGastos {
     var saldo = 0
     var costoOperacion = 0

     method saldo() {
        return saldo
     }

     method costoOperacion(valor) {
       costoOperacion = valor
     }

    method depositar(valor){
        saldo +=valor - costoOperacion
    }

    method extraer(valor) {
        saldo -= valor
    }
}

object cuentaCombinada {
    var primaria = cuentaGastos
    var secundaria = cuentaCorriente
    

method primaria(cuenta){
    primaria = cuenta
}
  method depositar(valor) {
    primaria.depositar(valor)
  }

  method extraer(valor) {
    if(primaria.saldo() >= valor){
        primaria.extraer(valor)
    }
    else secundaria.extraer(valor)
  }

  method saldoTotal(){
    return primaria.saldo() + secundaria.saldo()
  }
}