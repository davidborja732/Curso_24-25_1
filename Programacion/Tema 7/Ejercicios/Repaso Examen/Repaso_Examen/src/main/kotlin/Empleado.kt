class Empleado(
    val nombre: String,
    val edad:Int
)
fun calcularjubilacion(empleado: Empleado){
    val calculo=65-empleado.edad
    if (calculo>0){
        println("Te quedan $calculo años para jubilarte")
    }else{
        println("Ya estas jubilado")
    }
}