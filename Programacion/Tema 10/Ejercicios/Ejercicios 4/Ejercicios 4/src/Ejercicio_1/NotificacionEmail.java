package Ejercicio_1;

public class NotificacionEmail extends Notificacion {
    private String direccionCorreo;

    public NotificacionEmail(String direccionCorreo) {
        this.direccionCorreo = direccionCorreo;
    }

    @Override
    public String enviar(String mensaje) {
        return "Enviando correo a " + direccionCorreo + " con el mensaje: " + mensaje;
    }
}
