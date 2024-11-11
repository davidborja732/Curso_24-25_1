public class Ejercicio_14{
    public static void main(String [] args){
        int segundos=3665;
        int horas=segundos/3600;
        int minutos=(segundos%3600)/60;
        int segundo=(segundos%3600)%60;
        System.out.println(horas+" "+minutos+" "+segundo);

    }
}
