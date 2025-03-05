package Indizador;

public class Notas {
    private Integer[] notas;

    public Notas(int cantidadnotas) {
        if (cantidadnotas <=0){
            System.out.println("La cantidad minima es 1");
        }else {
            notas=new Integer[cantidadnotas];
        }
    }
    public void SetCalificacion(int indice,int nota) throws Exception {
        if (indice<0||indice>=notas.length){
            //System.out.println("Fuera de rango");
            throw new Exception("Fuera de rango");
        }else {
            notas[indice]=nota;
        }
    }
    public Integer getCalificacion(int indice){
        int valor=-1;
        if (!(indice <=0) && !(indice >=notas.length)){
            valor= notas[indice];
        }
        return valor;
    }
}
