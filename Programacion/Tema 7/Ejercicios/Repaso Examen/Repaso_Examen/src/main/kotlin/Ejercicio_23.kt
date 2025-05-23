import java.time.LocalDate

fun main() {
    println("Dime una fecha")
    val fecha=readLine()
    val diasemana= fecha?.let { LocalDate.parse(it).dayOfWeek }
    println(diasemana)
}