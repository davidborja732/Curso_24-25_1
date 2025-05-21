sealed class EstadoHttp {
    object Cargando : EstadoHttp()
    data class Exito<T>(val datos: T) : EstadoHttp()
    data class Error(val mensaje: String) : EstadoHttp()
}

fun manejarSolicitud(estado: EstadoHttp) {
    when (estado) {
        is EstadoHttp.Cargando -> println("Cargando...")
        is EstadoHttp.Exito<*> -> println("Éxito: ${estado.datos}")
        is EstadoHttp.Error -> println("Error: ${estado.mensaje}")
    }
}

fun main() {
    val estado1: EstadoHttp = EstadoHttp.Cargando
    val estado2: EstadoHttp = EstadoHttp.Exito("Datos recibidos correctamente")
    val estado3: EstadoHttp = EstadoHttp.Error("Error de conexión")

    manejarSolicitud(estado1)
    manejarSolicitud(estado2)
    manejarSolicitud(estado3)
}
