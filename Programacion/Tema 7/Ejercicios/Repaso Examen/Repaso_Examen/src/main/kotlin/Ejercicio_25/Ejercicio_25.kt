package Ejercicio_25

fun main() {
    val libro1 = libro("Cien años de soledad", "Gabriel García Márquez", 1967)
    val libro2 = libro("1984", "George Orwell", 1949)
    val libro3 = libro("El principito", "Antoine de Saint-Exupéry", 1943)
    val listalibros=mutableListOf<libro>()
    listalibros.add(libro1)
    listalibros.add(libro2)
    listalibros.add(libro3)
    listalibros.forEach {
        println(it.toString())
    }
    ordenarlista(listalibros)

}
fun ordenarlista(list: List<libro>){
    val listaordenada=list.sortedBy{it.añoPublicacion}
    return listaordenada.forEach {
        println(it.toString())
    }
}