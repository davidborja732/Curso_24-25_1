fun main() {
    val listaproductos= mutableListOf<producto>()
    val producto1=producto("Reloj",21.00,456)
    val producto2=producto("Almohada",12.00,0)
    val producto3=producto("Monitor",210.00,45)
    val producto4=producto("Teclado",56.50,78)
    listaproductos.add(producto1)
    listaproductos.add(producto2)
    listaproductos.add(producto3)
    listaproductos.add(producto4)
    // calculo coste de lista
    var preciototal=listaproductos.sumOf { it.precio }
    println(preciototal)
    // solo productos que su stock es 0
    for (producto in listaproductos){
        if (producto.stock==0){
            println(producto.nombre+"-"+producto.precio+"-"+producto.stock)
        }
    }
    // calculo coste solo con productos que su stock es mayor a cero
    for (producto in listaproductos){
        if (producto.stock==0){
            preciototal-=producto.precio
        }
    }
    println(preciototal)

}