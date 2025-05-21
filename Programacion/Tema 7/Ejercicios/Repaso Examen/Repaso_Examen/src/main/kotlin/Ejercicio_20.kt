import kotlin.random.Random

fun main() {
    var dado1= 0
    var dado2= 0
    while (!(dado1 == 6 && dado2 == 6)){
        dado1= Random.nextInt(1,7)
        dado2= Random.nextInt(1,7)
        println("$dado1 y $dado2")
    }
    println("¡Doble seis! $dado1 y $dado2")
}