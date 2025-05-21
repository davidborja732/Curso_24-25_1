fun main() {
    val lista= listOf(3,4,0,3,7,9,9,9,9,8,6,1)
    val listasinrepetidos= mutableListOf<Int>()
    var numero=0;
    while (numero<lista.size){
        if (!listasinrepetidos.contains(lista[numero])){
            listasinrepetidos.add(lista[numero])
        }
        numero++
    }
    println(listasinrepetidos.sorted().reversed()[1])
}