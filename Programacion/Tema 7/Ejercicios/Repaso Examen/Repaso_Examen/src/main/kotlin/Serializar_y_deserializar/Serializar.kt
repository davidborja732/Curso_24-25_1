package Serializar_y_deserializar
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import kotlinx.serialization.encodeToString
import java.io.File

@Serializable
data class Usuario(val nombre: String, val edad: Int, val correo: String)
fun main() {
    val usuario = Usuario("Ana", 25, "ana@example.com")
    val json = Json.encodeToString(usuario)
    File("archivo/archivo2.json").appendText(json)

    println("Nombre: ${usuario.nombre}, Edad: ${usuario.edad}, Correo: ${usuario.correo}")
}