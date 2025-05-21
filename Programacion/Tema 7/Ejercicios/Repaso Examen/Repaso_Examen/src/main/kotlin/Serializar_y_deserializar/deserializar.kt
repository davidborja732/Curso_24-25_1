package Serializar_y_deserializar
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import kotlinx.serialization.decodeFromString

//@Serializable
//data class Usuario(val nombre: String, val edad: Int, val correo: String)
fun main() {
    val jsonString = """{"nombre": "David", "edad": 30, "correo": "david@example.com"}"""

    val usuario = Json.decodeFromString<Usuario>(jsonString)

    println("Nombre: ${usuario.nombre}, Edad: ${usuario.edad}, Correo: ${usuario.correo}")
}