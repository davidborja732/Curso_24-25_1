mysql> show tables;
+-------------------+
| Tables_in_vacunas |
+-------------------+
| enfermedad        |
+-------------------+
1 row in set (0,00 sec)

mysql> CREATE TABLE paciente ( codigo CHAR(5), nombre VARCHAR(30), f_nacimiento DATE, CONSTRAINT pk_enfermedad PRIMARY KEY (codigo) )
    -> ^C
mysql> CREATE TABLE paciente ( codigo CHAR(5), nombre VARCHAR(30), f_nacimiento DATE, CONSTRAINT pk_paciente_codigo PRIMARY KEY (codigo));
Query OK, 0 rows affected (0,02 sec)

mysql> ALTER TABLE paciente ADD medico CHAR(5);
Query OK, 0 rows affected (0,02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE paciente ADD CONSTRAINT fk_paciente_medico FOREIGN KEY (medico) REFERENCES paciente(codigo);
Query OK, 0 rows affected (0,04 sec)
Records: 0  Duplicates: 0  Warnings: 0

