public class Main {
    public static void main(String[] args) {
        Secretario secretario1 = new Secretario("Juan", "Pérez", "12345678A", "Calle Falsa 123", 987654321, 2000, 101, 123456);
        Secretario secretario2 = new Secretario("María", "López", "87654321B", "Avenida Siempre Viva 456", 123456789, 2200, 102, 654321);
        Vendedor vendedor1 = new Vendedor("Carlos", "García", "12345678C", "Calle Luna 987", 987654321, 2900, "Zona Norte", 5, "Ford", 12345, "Focus", 987654321, 10);
        Vendedor vendedor2 = new Vendedor("Ana", "Martínez", "87654321D", "Avenida Sol 123", 123456789, 2700, "Zona Sur", 7, "Toyota", 67890, "Corolla", 123456789, 15);
        Vendedor_de_zona vendedorDeZona1 = new Vendedor_de_zona("Carlos", "García", "12345678C", "Calle Luna 987", 987654321, 3500, 201, secretario1, "Focus", "Ford", 12345, 5);
        Vendedor_de_zona vendedorDeZona2 = new Vendedor_de_zona("Ana", "Martínez", "87654321D", "Avenida Sol 123", 123456789, 2800, 202, secretario2, "Corolla", "Toyota", 67890, 7);
        System.out.println("Añado vendedor y muestro los vendedores que hay");
        System.out.println(vendedorDeZona1.añadir_vendedor(vendedor1));
        System.out.println(vendedorDeZona1.añadir_vendedor(vendedor2));
        System.out.println(vendedorDeZona1.listavendedores.toString());
        System.out.println("");
        System.out.println("Borro vendedor");
        System.out.println(vendedorDeZona1.eliminar_vendedor(vendedor2));
        System.out.println(vendedorDeZona1.listavendedores.toString());
        System.out.println("");
        System.out.println("Modifico coche de vendedor y vendedor de zona");
        System.out.println(vendedor1.Cambiar_coche("Fiat","Multipla",2345234));
        System.out.println(vendedorDeZona1.Cambiar_coche("Fiat","500 XL",23434));
        System.out.println("");
        System.out.println("Aumento salarios");
        System.out.println(secretario1.incrementarsalariosalario(12, secretario1.getIncremento()));
        System.out.println(vendedor1.incrementarsalariosalario(29, vendedor1.getIncremento()));
        System.out.println(vendedorDeZona1.incrementarsalariosalario(32, vendedorDeZona1.getIncremento()));
        System.out.println("");
        System.out.println("Cambio Secretarios");
        System.out.println(vendedorDeZona1.Cambiar_secretario(secretario2));
    }
}

