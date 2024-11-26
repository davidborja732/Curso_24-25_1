public class Prueba {
    public static void main(String[] args) {
        /**String str = "Hello world";
        char[] c = new char[str.length()];
        str.getChars(0, str.length(), c, 0);

        // Imprimir el contenido del array de caracteres
        for (char ch : c) {
            System.out.print(ch+" ");
        }**/
        /**char[] arrayHello = {'H', 'e', 'l', 'l', 'o'};
        String str1 = new String(arrayHello);
        String str2 = new String(arrayHello);
        System.out.println(str1==str2);
        System.out.println("Hello," + " world" + "!" );**/
        /**String greeting = "Hello world!";
        String word1 = greeting.substring(0,5);
        String word2 = greeting.substring(6,8);
        System.out.println(word1+" "+word2);**/
        float a = Float.parseFloat("1.25");
        Float objB = Float.valueOf("3.75");
        float b = objB.floatValue();
        System.out.println(a+b);
    }
}
