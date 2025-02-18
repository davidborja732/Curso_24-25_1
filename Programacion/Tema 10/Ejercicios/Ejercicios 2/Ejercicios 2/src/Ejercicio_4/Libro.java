package Ejercicio_4;

public class Libro extends Publicacion{
    private int numero_paginas;

    public Libro(String titulo, String autor, int numero_paginas) {
        super(titulo, autor);
        this.numero_paginas = numero_paginas;
    }

    public int getNumero_paginas() {
        return numero_paginas;
    }

    public void setNumero_paginas(int numero_paginas) {
        this.numero_paginas = numero_paginas;
    }

    @Override
    public String mostrarinformacion() {
        return super.mostrarinformacion()+" Con "+numero_paginas+" paginas";
    }
}
