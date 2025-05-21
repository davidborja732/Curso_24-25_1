data class Estudiante(val nombre: String, var nota: Double, var aprobado: Boolean)

val estudiantes = mutableListOf<Estudiante>()

fun main() {
    while (true) {
        println("\nMenú CRUD de Estudiantes:")
        println("1. Agregar estudiante")
        println("2. Mostrar estudiantes")
        println("3. Modificar estudiante")
        println("4. Eliminar estudiante")
        println("5. Salir")
        print("Selecciona una opción: ")

        when (readLine()?.toIntOrNull()) {
            1 -> agregarEstudiante()
            2 -> mostrarEstudiantes()
            3 -> modificarEstudiante()
            4 -> eliminarEstudiante()
            5 -> {
                println("Saliendo del programa...")
                return
            }
            else -> println("Opción inválida, intenta de nuevo.")
        }
    }
}

fun agregarEstudiante() {
    print("Nombre del estudiante: ")
    val nombre = readLine() ?: return

    print("Nota del estudiante: ")
    val nota = readLine()?.toDoubleOrNull() ?: return

    val aprobado = nota >= 5.0

    estudiantes.add(Estudiante(nombre, nota, aprobado))
    println("Estudiante agregado correctamente.")
}

fun mostrarEstudiantes() {
    if (estudiantes.isEmpty()) {
        println("No hay estudiantes registrados.")
        return
    }
    println("\nLista de estudiantes:")
    estudiantes.forEach { println(it.toString()) }
}

fun modificarEstudiante() {
    mostrarEstudiantes()
    print("Ingrese el número del estudiante a modificar: ")
    val index = readLine()?.toIntOrNull()?.minus(1) ?: return

    if (index in estudiantes.indices) {
        print("Nueva nota: ")
        val nuevaNota = readLine()?.toDoubleOrNull() ?: return
        estudiantes[index].nota = nuevaNota
        estudiantes[index].aprobado = nuevaNota >= 5.0
        println("Estudiante modificado exitosamente.")
    } else {
        println("Número inválido.")
    }
}

fun eliminarEstudiante() {
    mostrarEstudiantes()
    print("Ingrese el número del estudiante a eliminar: ")
    val index = readLine()?.toIntOrNull()?.minus(1) ?: return

    if (index in estudiantes.indices) {
        estudiantes.removeAt(index)
        println("Estudiante eliminado correctamente.")
    } else {
        println("Número inválido.")
    }
}
