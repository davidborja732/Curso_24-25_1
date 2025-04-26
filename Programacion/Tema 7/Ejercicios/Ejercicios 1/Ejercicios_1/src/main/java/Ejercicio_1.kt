fun main(){
    print("Introduce un numero ")
    val numero1: String? = readLine()
    print("Introduce otro numero ")
    val numero2: String?=readLine()
    if (numero1!! < numero2.toString()){
        println("numero 1 mayor")
    }else{
        println("numero 2 mayor")
    }
}
