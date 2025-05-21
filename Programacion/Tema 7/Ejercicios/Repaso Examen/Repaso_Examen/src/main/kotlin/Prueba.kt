fun main() {
    val miprimeralista=mutableListOf<Int>(45,67,90,54)
    println(miprimeralista[0])
    println(obtenerMayor(miprimeralista))
}
fun obtenerMayor(lista: List<Int>): String? {
    if (lista.contains(6)){
        return "Contiene el numero"
    }
    return "No lo contiene"
}