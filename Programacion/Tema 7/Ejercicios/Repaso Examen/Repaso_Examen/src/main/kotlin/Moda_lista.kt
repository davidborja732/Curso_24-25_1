fun calcularModa(lista: List<Int>): Int? {
    val conteo = lista.groupingBy { it }.eachCount()
    println(conteo)
    return conteo.maxOf { it.key }
}

fun main() {
    val numeros = listOf(5, 5, 3, 7, 5, 3, 7, 8, 8, 8, 9)
    val moda = calcularModa(numeros)

    println("La moda es: $moda")
}
