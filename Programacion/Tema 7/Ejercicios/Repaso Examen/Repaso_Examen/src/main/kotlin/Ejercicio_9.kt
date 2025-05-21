fun main() {
    val lista= listOf(9,7,6,4,3,2,1,8,9,0,7,65,43,23,54,54,23,123,7,0,4)
    println(lista)
    sinduplicados(lista)
}
fun sinduplicados(list: List<Int>){
    val listasinduplicados= mutableListOf<Int>()
    for (i in list){
        if (!listasinduplicados.contains(i)){
            listasinduplicados.add(i)
        }
    }
    println(listasinduplicados)
}