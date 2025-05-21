import kotlin.random.Random

fun main() {
    val lista = listOf("Piedra", "Papel", "Tijera")

    println("Dime una de las tres opciones:")
    println("1 - Piedra")
    println("2 - Papel")
    println("3 - Tijera")

    val seleccionUsuario = readLine()?.toIntOrNull()

    if (seleccionUsuario == null || seleccionUsuario !in 1..3) {
        println("Selección inválida. Debes elegir 1, 2 o 3.")
        return
    }

    val maquina = Random.nextInt(1, 4)
    val seleccionMaquina = lista[maquina - 1]
    val seleccionUsuarioTexto = lista[seleccionUsuario - 1]

    println("Tú eliges: $seleccionUsuarioTexto")
    println("La máquina elige: $seleccionMaquina")

    if (seleccionUsuarioTexto == seleccionMaquina) {
        println("¡Empate!")
    } else if (
        (seleccionUsuarioTexto == "Piedra" && seleccionMaquina == "Tijera") ||
        (seleccionUsuarioTexto == "Papel" && seleccionMaquina == "Piedra") ||
        (seleccionUsuarioTexto == "Tijera" && seleccionMaquina == "Papel")
    ) {
        println("¡Ganaste!")
    } else {
        println("La máquina gana.")
    }
}
