package interfaz

import java.time.LocalDate

fun main() {
    val opcion="sdvsd"
    when (opcion.lowercase()) {
        "Hola" -> println("Adios")
        "Adios" -> println("hola")
        else -> println("desconocido")
    }
    while (true) {
        println("\nMenú Interactivo:")
        println("1. Saludar")
        println("2. Dia semana")
        println("3. Salir")
        print("Selecciona una opción: ")

        val opcion = readLine()?.toIntOrNull()

        when (opcion) {
            1 -> println("¡Hola! ¿Cómo estás?")
            2 -> println("La hora actual es: ${LocalDate.now().dayOfWeek}")
            3 -> {
                println("Saliendo del programa...")
                break
            }
            else -> println("Opción inválida, intenta de nuevo.")
        }
        val opcion1="Hola"
        when (opcion1.lowercase()) {
            "Hola" -> println("Adios")
            "Adios" -> println("hola")
            else -> println("desconocido")
        }
    }
}
