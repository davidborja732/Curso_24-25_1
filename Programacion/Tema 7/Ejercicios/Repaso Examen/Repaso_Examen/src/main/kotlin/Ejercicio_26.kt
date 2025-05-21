class cuentabancaria(val numero_cuenta:Int, val propietario: String, var saldo:Int){
    fun depositar(cantidad: Int){
        saldo+=cantidad
    }
    fun retirar(cantidad: Int): String {
        if (cantidad>saldo){
            return "No tienes tanto dinero"
        }else{
            saldo-=cantidad
            return "Tu saldo es de $saldo"
        }
    }
    fun consultar(): Int {
        return saldo
    }

    override fun toString(): String {
        return "$numero_cuenta $propietario $saldo"
    }
}