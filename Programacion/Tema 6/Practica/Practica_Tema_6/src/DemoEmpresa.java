import java.time.LocalDate;


public class DemoEmpresa {
    public static void main(String[] args) {
        Empresa listaempresa=new Empresa();
        Empleado empleado1=new Empleado("Diego");
        Empleado empleado2=new Empleado("Lucia", LocalDate.parse("2004-12-08"));
        Empleado empleado3=new Empleado("Pepe","Jardinero",4500,"12876532K",LocalDate.parse("2003-11-09"),"Lopez");
        Empleado empleado5=new Empleado("Roberto","Conserje",6500,"12389532L",LocalDate.parse("2001-10-14"),"Suarez");
        Empleado empleado6=new Empleado("Antonia","Directora",9500,"11087632J",LocalDate.parse("1976-04-10"),"Martinez");
        listaempresa.getListaEmpleado().add(empleado1);
        listaempresa.getListaEmpleado().add(empleado2);
        listaempresa.getListaEmpleado().add(empleado3);
        listaempresa.getListaEmpleado().add(empleado5);
        listaempresa.getListaEmpleado().add(empleado6);
        System.out.println(empleado1.toString());
        empleado3.trabajar();
        empleado2.trabajar();
        System.out.println(empleado5.antigüedad());
        System.out.println(" ");
        listaempresa.mostrarempleados();
        System.out.println(listaempresa.Salario_Promedio());
        System.out.println(listaempresa.Empleadomasantiguo());
        listaempresa.busqueda();

    }
}
