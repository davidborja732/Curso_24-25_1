package Ejercicio_5;

import java.util.regex.Pattern;

public class Usuario {
    private String nombreusuario;
    private String contraseña;

    public String getNombreusuario() {
        return nombreusuario;
    }

    public Usuario() {
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public Usuario(String nombreusuario, String contraseña) {
        this.nombreusuario = nombreusuario;
        this.contraseña = contraseña;
    }
    String verificar_contrasseña(String contra){
        if (contra.equals(contraseña)){
            return "Contraseña correcta";
        }else {
            return "Contraseña incorrecta";
        }
    }
    String modificar_contraseña(String contra){
        boolean comprobar=Pattern.matches("^(?=.*[A-Z])(?=.*[0-9]).{8,}",contra);
        if (comprobar){
            setContraseña(contra);
            return "Contraseña modificada";
        }else {
            return "La contraseña no cumple los requisitos minimos";
        }
    }


}
