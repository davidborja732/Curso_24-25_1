public class Demo {
    public static void main(String[] args) {
        //Creo Pacientes, Medicos y Jefes
        Paciente paciente=new Paciente
                ("Borja","Calle 1","2134589P",20,"Pepe",678987654,"Jose luis",8563);
        Paciente paciente2=new Paciente
                ("Mateo","Calle 2","2154719P",30,"Luis",678974154,"Antonia",8564);
        Medico medico=new Medico
                ("Garcia","Calle 4","6989504O",45,"Luisa",632908765,"Psiquiatria",2598,3450);
        Medico medico2=new Medico
                ("Lopez","Calle 5","6588904O",48,"Jose",632991265,"Emergencias",298,3200);
        Jefe_departamento jefeDepartamento=new Jefe_departamento
                ("Muñoz","Calle 6","7896541P",62,"Andres",657214536,7890,98);
        Jefe_departamento jefeDepartamento2=new Jefe_departamento
                ("Igual","Calle 9","788454P",54,"Andrea",687414536,4790,102);
        //Pruebo el metodo calcular_beneficios
        System.out.println(paciente.calcularbeneficios(4));
        System.out.println(medico.calcularbeneficios(18));
        System.out.println(jefeDepartamento.calcularbeneficios(30));
        System.out.println("");
        //Pruebo a añadir y eliminar medicos
        System.out.println(jefeDepartamento2.añadir_medico(medico2));
        System.out.println("Muestro la lista de medicos ");
        System.out.println(jefeDepartamento2.medicos.toString());
        System.out.println("Borro el medico y compruebo si funciona");
        System.out.println(jefeDepartamento2.eliminar_medico(medico2));
        System.out.println("Muestro la lista de medicos ");
        System.out.println(jefeDepartamento2.medicos.toString());
        System.out.println("");
        //Pruebo a añadir y eliminar pacientes
        System.out.println(medico2.añadir_paciente(paciente2));
        System.out.println("Muestro la lista de pacientes ");
        System.out.println(medico2.pacientes.toString());
        System.out.println("Borro el paciente y compruebo si funciona");
        System.out.println(medico2.eliminar_paciente(paciente2));
        System.out.println("Muestro la lista de pacientes ");
        System.out.println(medico2.pacientes.toString());
        System.out.println("");
        //Pruebo el metodo imprimir
        System.out.println(paciente.imprimir());
        System.out.println(medico.imprimir());
        System.out.println(jefeDepartamento.imprimir());
        //Pruebo a añadir y eliminar diagnosticos
        System.out.println(paciente2.añadir_diagnostico("Varicela"));
        System.out.println("Muestro la lista de diagnosticos ");
        System.out.println(paciente2.enfermedades.toString());
        System.out.println("");
        //Pruebo actualizar datos
        System.out.println(paciente.imprimir());
        System.out.println(paciente.actualizardatos("Lopez","Calle 23","21985647P",24,"Estela",854147963,"pepa",8741));
        System.out.println(paciente.imprimir());
        System.out.println("");
        System.out.println(medico.imprimir());
        System.out.println(medico.actualizardatos("calle 34",875214693,"Radiografia"));
        System.out.println(medico.imprimir());
        System.out.println("");
        System.out.println(jefeDepartamento.imprimir());
        System.out.println(jefeDepartamento.actualizardatos("calle 34",875214693,90));
        System.out.println(jefeDepartamento.imprimir());
    }
}
