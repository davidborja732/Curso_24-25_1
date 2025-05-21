package Ejercicio_15

class Circulo(val  radio: Double): Figura{
    override fun area(): Double {
        return Math.PI*(radio*radio)
    }
}