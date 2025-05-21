package Pruebas

import java.io.File

fun main() {
    val lectura= File("archivo/archivo1.txt").readLines()
    lectura.forEach { println(it) }
    // sobreescribe el texto
    val escritura = File("archivo/archivo1.txt").writeText("Estoy escribiendo esto ")
    val lectura1= File("archivo/archivo1.txt").readLines()
    lectura1.forEach { println(it) }
    // no sobreescribe texto
    val escritura1 = File("archivo/archivo1.txt").appendText("\nEstoy escribiendo esto sin sobreescribir ")
    val lectura2= File("archivo/archivo1.txt").readLines()
    lectura2.forEach { println(it) }
}