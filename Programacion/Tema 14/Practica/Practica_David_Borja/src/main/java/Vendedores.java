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
import java.util.ArrayList;
@XmlRootElement
public class Vendedores {
    private ArrayList<Vendedor> vendedor=new ArrayList<>();

    public Vendedores() {
    }
    @XmlElement
    public ArrayList<Vendedor> getVendedor() {
        return vendedor;
    }

    public void setVendedor(ArrayList<Vendedor> vendedor) {
        this.vendedor = vendedor;
    }
    public void add(Vendedor vendedor_insertar){
        vendedor.add(vendedor_insertar);
    }
    public void serializar(Vendedores vendedoreslista){
        try {
            JAXBContext context = JAXBContext.newInstance(Vendedores.class);
            Marshaller marshaller = context.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            marshaller.marshal(vendedoreslista,new FileWriter("Ficheros/vendedores.xml"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void deserializar(File file,ArrayList<Vendedores> vendedores_lista){
        try {
            JAXBContext context=JAXBContext.newInstance(Vendedores.class);
            Unmarshaller unmarshaller= context.createUnmarshaller();
            Vendedores vendedores = (Vendedores) unmarshaller.unmarshal(new FileReader(file));
            vendedores_lista.add(vendedores);
        } catch (JAXBException e) {
            throw new RuntimeException(e);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
