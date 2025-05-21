package Ejercicio_15

class Cuadrado(val lado: Double): Figura{
    override fun area(): Double {
        return lado*lado
    }
}