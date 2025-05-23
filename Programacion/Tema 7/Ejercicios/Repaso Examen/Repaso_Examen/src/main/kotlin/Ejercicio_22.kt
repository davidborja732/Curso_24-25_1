import java.time.LocalDate
import java.time.Period
import kotlin.io.println

fun main() {
    val enero_uno= LocalDate.of(LocalDate.now().year+1,1,1)
    println(Period.between(enero_uno,LocalDate.now()))

}