fun main() {
    val listaletras= CharRange('a','z').toMutableList()
    println("Dime una palabra ")
    val palabra= readlnOrNull()
    val caracterespalabra : List<Char> = palabra!!.toCharArray().toList()
    for (i in listaletras){
        var contador=0;
        for (n in caracterespalabra){
            if (i.lowercase() == n.lowercase()){
                contador++
            }
        }
        if (contador>0){
            println("La letra $i aparece $contador veces")
        }
        contador=0
    }
}