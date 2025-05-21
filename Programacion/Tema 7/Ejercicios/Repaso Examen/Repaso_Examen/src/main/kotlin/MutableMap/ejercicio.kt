fun main() {
    val numeros = listOf(3, 5, 3, 7, 5, 3, 7, 8, 8, 8, 9)
    val conteo = mutableMapOf<Int, Int>()

    for (numero in numeros) {
        conteo[numero] = conteo.getOrDefault(numero, 0) + 1
    }

    println("Conteo de repeticiones: $conteo")
}
