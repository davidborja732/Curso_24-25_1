import kotlin.time.times

fun main() {
    println("Dime un número ")
    val numero = readLine()?.toInt()
    var factorial = 1

    if (numero != null) {
        if (numero > 0) { // Aseguramos que el número sea positivo
            var tempNumero = numero // Usamos una variable temporal
            while (tempNumero > 1) {
                factorial *= tempNumero
                tempNumero-- // Reducimos el valor correctamente
            }
        } else {
            println("El factorial solo está definido para números positivos.")
            return
        }
    }
    println("El factorial de $numero es: $factorial")
}

