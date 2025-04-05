import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Marshaller;
import jakarta.xml.bind.Unmarshaller;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;

@XmlRootElement
public class Vendedor {
    private int id;
    private String nombre;
    private String empresa;
    private String contacto;

    @Override
    public String toString() {
        return "Vendedor{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", empresa='" + empresa + '\'' +
                ", contacto='" + contacto + '\'' +
                '}';
    }

    public Vendedor() {
    }

    public Vendedor(int id, String nombre, String empresa, String contacto) {
        this.id = id;
        this.nombre = nombre;
        this.empresa = empresa;
        this.contacto = contacto;
    }
    @XmlElement
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    @XmlElement
    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }
    @XmlElement
    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }
    @XmlElement
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

}
