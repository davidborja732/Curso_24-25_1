fun main() {
    println("Dime un texto ")
    val texto= readLine()?.lowercase()

    val lista = texto?.split(" ") ?:emptyList()
    println(lista.toSet())
    println("El texto contiene "+lista.toSet().size+" palabras distintas.")
}