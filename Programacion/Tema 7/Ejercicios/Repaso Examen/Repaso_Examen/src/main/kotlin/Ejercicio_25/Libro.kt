package Ejercicio_25

class libro(
    val titulo: String,
    val autor: String,
    val añoPublicacion: Int
){
    override fun toString(): String {
        return "$titulo $autor $añoPublicacion"
    }
}