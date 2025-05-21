import jdk.incubator.vector.VectorOperators.Binary

fun main() {
    println("Dime un numero ")
    val numero= readLine()?.toInt()
    binario(numero)
}
fun binario(numero : Int?){
    println(numero?.let { Integer.toBinaryString(it) })
}