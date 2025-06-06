fun elementosComunes(lista1: List<Any>, lista2: List<Any>): List<Any> {
    return lista1.intersect(lista2.toSet()).toList()
}

fun main() {
    val listaA = listOf(8, 2, 4, 5)
    val listaB = listOf(3, 4, 5, 6, 7,8)

    val comunes = elementosComunes(listaA, listaB)
    println("Elementos comunes: $comunes") // Salida: [3, 4, 5]
}
