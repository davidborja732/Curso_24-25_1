fun main() {
    val cuenta1=cuentabancaria(1,"Jose",2300)
    val cuenta2 =cuentabancaria(7,"Luis",5600)
    println(cuenta1)
    println(cuenta1.retirar(200))
    println(cuenta1.consultar())
}