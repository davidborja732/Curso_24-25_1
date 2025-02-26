package Ejercicio_1;

public class NotificacionSMS extends Notificacion {
    private String numeroTelefono;

    public NotificacionSMS(String numeroTelefono) {
        this.numeroTelefono = numeroTelefono;
    }

    @Override
    public String enviar(String mensaje) {
        return "Enviando SMS al número " + numeroTelefono + " con el mensaje: " + mensaje;
    }
}
