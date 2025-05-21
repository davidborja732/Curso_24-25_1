fun main() {
    var lista= listOf("hola","prueba","Kotlin","palabralarga","cor")
    println(lista.sortedBy { it.length })
}