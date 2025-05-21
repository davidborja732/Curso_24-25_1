fun main() {
    println("Dime una palabra")
    var palabra= readlnOrNull()
    if (palabra != null) {
        if (palabra==palabra.reversed()){
            println("La palabra $palabra es un palindromo")
        }else{
            println("La palabra $palabra no es un palindromo")
        }
    }
}