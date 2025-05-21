package interfaz

import java.time.LocalDate

fun main() {
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
    }
}
