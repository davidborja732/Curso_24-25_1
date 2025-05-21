fun main() {
    val texto="Hola que tal estais"
    println(texto.obtenervocales())
}
fun String.obtenervocales(): String{
    return this.filter { it.lowercase() in "aeiou" }
}