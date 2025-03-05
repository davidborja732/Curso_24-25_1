package Repaso_herencia_y_polimorfismo;

public class Libor extends Publicacion {
    private int numero_paginas;


    public Libor(String titulos, String autor, int numero_paginas) {
        super(titulos, autor);
        this.numero_paginas = numero_paginas;
    }

    public int getNumero_paginas() {
        return numero_paginas;
    }

    public void setNumero_paginas(int numero_paginas) {
        this.numero_paginas = numero_paginas;
    }

    @Override
    public String mostrar_informacion() {
        return super.mostrar_informacion()+" numero paginas "+numero_paginas;
    }
}
