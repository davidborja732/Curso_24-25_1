import java.util.Stack;

public class Pilas {
    public static void main(String[] args) {
        Stack<String> pila = new Stack<>();
        pila.push("Jose");
        pila.push("Ana");
        pila.push("Pepe");
        pila.push("Vanesa");
        //System.out.println(pila.peek());
        /**for (String elemento:pila){
            System.out.print(elemento+" ");
        }
        System.out.println(" ");
        String valor= pila.pop();
        System.out.println(valor);
        for (String elemento:pila){
            System.out.print(elemento+" ");
        }**/
        pila.stream().filter(nombre -> nombre.endsWith("e")).forEach(System.out::println);
        Stack<Integer> pila1 = new Stack<>();
        pila1.push(45);
        pila1.push(90);
        //pila1.stream().filter(numero -> numero>=50).forEach(System.out::println);
        int max=pila1.stream().max(Integer::compare).orElseThrow();
        int min=pila1.stream().min(Integer::compare).orElseThrow();
        //System.out.println(max);
        //System.out.println(min);
        pila1.stream().distinct().forEach(System.out::println);
        int suma=pila1.stream().mapToInt(Integer::intValue).sum();
        System.out.println(suma);
        int resta=pila1.stream().reduce(Integer::compareTo).orElseThrow();
        System.out.println(resta);
    }
}
