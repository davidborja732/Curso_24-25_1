import java.math.BigInteger
import kotlin.random.Random

fun main() {
    /*
    println("Dime un numero")
    val numero= readLine()?.toInt()
    esprimo(numero)
    */
    val numero= 9
    println(numero.toBigInteger().isProbablePrime(Random.nextInt(1,101)))


}
fun esprimo(numero: Int?){
    /*
    var numerotemporal= numero
    var primo=false;
    if (numero==1){
        println("El numero 1 no es primo")
    }else{
        if (numerotemporal != null) {
            while (numerotemporal>1){
                if (numero != null) {
                    if ((numero/numerotemporal)>0){
                        primo=false

                    }else{
                        primo=true
                    }
                }
                numerotemporal--
            }

        }
    }
    println("El numnero es primo "+primo)
    */
}