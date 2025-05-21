fun main() {
    println("Dime una palabra")
    val palabra= readLine()
    val caracterespalabra : List<Char> = palabra!!.toCharArray().toList()
    var contador=caracterespalabra.size
    while (contador!=0){
        print(caracterespalabra[contador-1])
        contador--
    }
}