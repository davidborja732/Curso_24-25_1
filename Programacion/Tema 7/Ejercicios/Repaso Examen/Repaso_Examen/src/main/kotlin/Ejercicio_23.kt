import java.time.LocalDate

fun main() {
    println("Dime una fecha")
    val fecha=readLine()
    val diasemana= LocalDate.parse(fecha).dayOfWeek
    println(diasemana)
}