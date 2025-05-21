import java.time.LocalDate

fun main() {
    var lista=mutableMapOf<String, LocalDate>()
    lista.put("Juan", LocalDate.of(1990, 5, 21))
    lista.put("María", LocalDate.of(1985, 10, 15))
    lista.put("Pepa", LocalDate.of(1975, 11, 18))
    val mayor=lista.minOf { it.value }
    for ((nombre, fecha) in lista) {
        if (fecha == mayor){
            println(nombre+" "+fecha)
        }
    }

}