import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Scanner;

public class Empresa {
    private ArrayList<Empleado> ListaEmpleado;

    public Empresa() {
        this.ListaEmpleado = new ArrayList<>();
    }

    public ArrayList<Empleado> getListaEmpleado() {
        return ListaEmpleado;
    }

    public double Salario_Promedio(){
        if (ListaEmpleado.isEmpty()){
            return 0.0;
        }
        int salariototal=0;
        for (Empleado empleado:ListaEmpleado){
            if (empleado.getSalario()!=0 && empleado.getSalario() >0){
                salariototal+= (int) empleado.getSalario();
            }
        }
        System.out.println("La media de salario es ");
        return (double) salariototal/ListaEmpleado.size();
    }
    public Empleado Empleadomasantiguo(){
        if (ListaEmpleado.isEmpty()){
            return null;
        }
        Empleado empleadomasveterano=null;
        for (Empleado empleado:ListaEmpleado){
            if (empleado.getFecha_contratacion()!=null){
                int antiguedad= Period.between(empleado.getFecha_contratacion(), LocalDate.now()).getYears();
                if (antiguedad>0){
                    empleadomasveterano=empleado;
                }
            }
        }
        System.out.println("El empleado mas veterano es ");
        return empleadomasveterano;
    }
    public void mostrarempleados(){
        for (Empleado empleado:ListaEmpleado){
            System.out.println(empleado);
        }
    }
    public void busqueda(){
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el nombre o puesto del empleado ");
        String buscar= scanner.next();
        for (Empleado empleado:ListaEmpleado){
            if (empleado.getPuesto()!=null && empleado.getNombre()!=null){
                if (empleado.getNombre().equals(buscar)){
                    System.out.println("El empleado buscado es ");
                    System.out.println(empleado);
                } else if (empleado.getPuesto().equals(buscar)) {
                    System.out.println("El empleado buscado es ");
                    System.out.println(empleado);
                }
            }

        }
    }


}
