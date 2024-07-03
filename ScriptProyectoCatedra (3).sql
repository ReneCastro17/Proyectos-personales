--create base de datos y tables
CREATE DATABASE hospitales_db_x
go

use hospitales_db_x
go

create table usuario(
	id_usuario int not null IDENTITY(1,1) unique,
	usuario varchar(50) not null,
	correo varchar(50) not null,
	contraseña varchar(50) not null,
	estado bit not null, --1 o 0 activo o inactivo
	id_tipo_usuario int not null,
	id_empleado int not null,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	constraint PK_USUARIO
	primary key (id_usuario)
);

create table tipo_pago(
	id_tipo_pago int not null IDENTITY(1,1) unique,
	usuario_insert INTEGER,
	usuario_update INTEGER, 
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	tipo_pago varchar(40) not null
	constraint PK_TIPO_PAGO
	primary key (id_tipo_pago)
);

create table tipo_medicamento(
	id_tipo_medicamento int not null IDENTITY(1,1) unique,
	tipo_medicamento varchar(40) not null,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP
	constraint PK_TIPO_MEDICAMENTO
	primary key(id_tipo_medicamento)
);

create table tipo_usuario(
	id_tipo_usuario int not null IDENTITY(1,1) unique,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	tipo_usuario varchar(40) not null
	constraint PK_TIPO_USUARIO
	primary key(id_tipo_usuario)
);
create table tipo_empleado(
	id_tipo_empleado int not null IDENTITY(1,1) unique,
	tipo_empleado varchar(40) not null,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP
	constraint PK_TIPO_EMPLEADO
	primary key(id_tipo_empleado)
);

create table hospital(
	id_hospital int not null IDENTITY(1,1) unique,
	nombre_hospital varchar(100) not null,
	direccion varchar(150) not null,
	numero_niveles int not null,
	numero_habitaciones int not null,
	precio_habitacion decimal(7,2) not null,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	consultorios_nivel int not null,
	pais varchar(50) not null,
	precio_con_especial decimal(7,2) not null,
	precio_con_general decimal(7,2) not null,
	correo varchar(60) not null,
	telefono char(9) not null,
	cantidad_parqueo int not null
	constraint PK_HOSPITAL
	primary key(id_hospital)
);


create table empleado(
	id_empleado int not null IDENTITY(1,1) unique, 
	estado_civil varchar(40) not null,
	telefono char(9) not null,
	nacionalidad varchar(40) not null,
	peso decimal(20,2) not null,
	fecha_nacimiento date not null,
	apellidos varchar(40) not null,
	nombres varchar(40) not null,
	profesion varchar(40) not null,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	estatura decimal(3,2) not null,
	color_ojos char(8) not null,
	direccion varchar(150) not null,
	tipo_sangre char(5) not null,
	telefono_casa char(9) not null,
	correo varchar(60) not null,
	salario_mensual decimal(7,2) not null,
	salario_hora decimal(6,2) not null,
	id_hospital int not null,
	id_tipo_empleado int not null
	constraint PK_EMPLEADO
	primary key(id_empleado)
);

create table paciente(
	id_paciente int not null IDENTITY(1,1) unique, 
	estado_civil_pac  varchar(40) not null,
	telefono_pac char(9) not null,
	nacionalidad_pac varchar(40) not null,
	peso_pac  decimal(20,2) not null,
	nacimiento_pac  date not null,
	apellidos_pac varchar(40) not null,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	nombres_pac varchar(40) not null,
	profesion_pac  varchar(40) not null,
	estatura_pac  decimal(3,2) not null,
	color_ojos_pac  char(8) not null,
	direccion_pac  varchar(150) not null,
	tipo_sangre_pac  char(5) not null,
	correo_pac  varchar(60) not null,
	enfermedad_alergia_pac varchar(150) not null
	constraint PK_PACIENTE
	primary key (id_paciente)
);

create table afiliado(
	id_afiliado int not null IDENTITY(1,1) unique, 
	estado_civil  varchar(40) not null,
	telefono char(9) not null,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	nacionalidad varchar(40) not null,
	peso  decimal(20,2) not null,
	nacimiento  date not null,
	apellidos varchar(40) not null,
	nombres varchar(40) not null,
	profesion varchar(40) not null,
	estatura decimal(3,2) not null,
	color_ojos char(8) not null,
	direccion varchar(150) not null,
	tipo_sangre char(5) not null,
	telefono_casa char(9) not null,
	correo  varchar(60) not null,
	id_paciente int not null
	constraint PK_AFILIADO
	primary key(id_afiliado),
);

create table horario(
	id_horario int not null IDENTITY(1,1) unique, 
	hora_inicio time not null,
	hora_fin time not null,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha date not null,
	id_empleado int not null
	constraint PK_HORARIO
	primary key(id_horario),
);

create table metodo_pago(
	id_metodo_pago int not null IDENTITY(1,1) unique,
	titular varchar(100),
	numero_cuenta varchar(100),
	monto decimal(7,2),
	firma_cheque varchar(100),
	numero_tarjeta varchar(20),
	pago_efectivo bit,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	id_tipo_pago int not null
	constraint PK_METODO_PAGO
	primary key(id_metodo_pago)
);

create table proveedor(
	id_proveedor int not null IDENTITY(1,1) unique,
	nombre varchar(100) not null,
	direccion varchar(150) not null,
	telefono char(9),
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	correo varchar(50) not null
	constraint PK_PROVEEDOR
	primary key (id_proveedor)
);

create table medicamento(
	id_medicamento int not null IDENTITY(1,1) unique,
	nombre varchar(150) not null,
	descripcion varchar(150) not null,
	fecha_ingreso date not null,
	stock bit not null,
	cantidad int not null,
	id_proveedor int not null,
	id_tipo_medicamento int not null,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP
	constraint PK_MEDICAMENTO
	primary key(id_medicamento)
);

create table habitacion(
	id_habitacion int not null IDENTITY(1,1) unique,
	precio decimal(7,2) not null,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	id_hospital int not null
	constraint PK_HABITACION
	primary key (id_habitacion)
);

create table expediente(
	id_expediente int not null IDENTITY(1,1) unique,
	dias_habitacion int not null,
	cantidad_med int not null,
	procesos varchar(250) not null,
	id_habitacion int not null,
	id_paciente int not null,
	id_empleado int not null,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	id_medicamento int not null
	constraint PK_EXPEDIENTE
	primary key(id_expediente)
);


create table facturacion(
	id_facturacion int not null IDENTITY(1,1) unique,
	costo_consulta decimal(7,2) not null,
	fecha_transaccion date not null,
	id_expediente int not null,
	id_hospital int not null,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	id_metodo_pago int not null
	constraint PK_FACTURACION
	primary key (id_facturacion)
);


create table consultorio(
	id_consultorio int not null IDENTITY(1,1) unique,
	hora_inicio time not null,
	hora_fin time not null,
	fecha date not null,
	nombre varchar(60) not null,
	id_empleado int not null,
	usuario_insert INTEGER,
	usuario_update INTEGER,
	fecha_insert DATETIME DEFAULT CURRENT_TIMESTAMP,
	fecha_update DATETIME DEFAULT CURRENT_TIMESTAMP,
	id_hospital int not null
	constraint PK_CONSULTORIO
	primary key (id_consultorio)
);
GO
--inserts.

insert into usuario(usuario,correo, contraseña,estado,id_tipo_usuario, id_empleado)values('Administrador','admin@gmial.com','admin123',1,1,1)
insert into usuario(usuario,correo, contraseña,estado,id_tipo_usuario, id_empleado)values('Fernando','fer@gmial.com','fer123',1,2,2)
insert into usuario(usuario,correo, contraseña,estado,id_tipo_usuario, id_empleado)values('Jose','jose@gmial.com','jos123',0,4,3)
insert into usuario(usuario,correo, contraseña,estado,id_tipo_usuario, id_empleado)values('Oscar','osc@gmial.com','osc123',1,5,4)
insert into usuario(usuario,correo, contraseña,estado,id_tipo_usuario, id_empleado)values('Edgardo','edg@gmial.com','edg123',0,2,5)
insert into usuario(usuario,correo, contraseña,estado,id_tipo_usuario, id_empleado)values('Alberto','alb@gmial.com','albn123',1,3,6)
insert into usuario(usuario,correo, contraseña,estado,id_tipo_usuario, id_empleado)values('Samuel','samn@gmial.com','sam123',1,4,7)
insert into usuario(usuario,correo, contraseña,estado,id_tipo_usuario, id_empleado)values('Rene','ren@gmial.com','ren123',0,1,8)
insert into usuario(usuario,correo, contraseña,estado,id_tipo_usuario, id_empleado)values('Eduardo','edu@gmial.com','edu123',1,1,9)
insert into usuario(usuario,correo, contraseña,estado,id_tipo_usuario, id_empleado)values('Roberto','rob@gmial.com','rob123',0,1,10)

insert into tipo_pago(usuario_insert,usuario_update,tipo_pago)values(1,1,'Transferencia')
insert into tipo_pago(usuario_insert,usuario_update,tipo_pago)values(2,2,'Cheque')
insert into tipo_pago(usuario_insert,usuario_update,tipo_pago)values(3,3,'Efectivo')
insert into tipo_pago(usuario_insert,usuario_update,tipo_pago)values(4,4,'Tarjeta de credito')
insert into tipo_pago(usuario_insert,usuario_update,tipo_pago)values(5,5,'Tarjeta de debito')
insert into tipo_pago(usuario_insert,usuario_update,tipo_pago)values(6,6,'Abono')
insert into tipo_pago(usuario_insert,usuario_update,tipo_pago)values(7,7,'Bitcoin')
insert into tipo_pago(usuario_insert,usuario_update,tipo_pago)values(8,8,'Plazos')
insert into tipo_pago(usuario_insert,usuario_update,tipo_pago)values(9,9,'Cuotas')
insert into tipo_pago(usuario_insert,usuario_update,tipo_pago)values(10,10,'Contado')

insert into tipo_medicamento(tipo_medicamento)values('Analgesico')
insert into tipo_medicamento(tipo_medicamento)values('Antialergico')
insert into tipo_medicamento(tipo_medicamento)values('Antiinfecciosos')
insert into tipo_medicamento(tipo_medicamento)values('Antitusivos')
insert into tipo_medicamento(tipo_medicamento)values('Laxante')
insert into tipo_medicamento(tipo_medicamento)values('Antibiotico')
insert into tipo_medicamento(tipo_medicamento)values('Antipiréticos')
insert into tipo_medicamento(tipo_medicamento)values('mucolíticos')
insert into tipo_medicamento(tipo_medicamento)values('Antiinflamatorios')
insert into tipo_medicamento(tipo_medicamento)values('Ansiolítico')
insert into tipo_medicamento(tipo_medicamento)values('Antigripal')

insert into tipo_usuario(tipo_usuario)values('Administrador')
insert into tipo_usuario(tipo_usuario)values('Gerente')
insert into tipo_usuario(tipo_usuario)values('Supervisor')
insert into tipo_usuario(tipo_usuario)values('Manger')
insert into tipo_usuario(tipo_usuario)values('Analista')
insert into tipo_usuario(tipo_usuario)values('Modelador')
insert into tipo_usuario(tipo_usuario)values('Medico Supervisor')
insert into tipo_usuario(tipo_usuario)values('Medico Cabezera')
insert into tipo_usuario(tipo_usuario)values('Instructor')
insert into tipo_usuario(tipo_usuario)values('Tester')

insert into tipo_empleado(tipo_empleado)values('Medico General')
insert into tipo_empleado(tipo_empleado)values('Cardiologo')
insert into tipo_empleado(tipo_empleado)values('Oftalmologo')
insert into tipo_empleado(tipo_empleado)values('Medico cirujano')
insert into tipo_empleado(tipo_empleado)values('Anestecsologo')
insert into tipo_empleado(tipo_empleado)values('Medico Cirujano Plastico')
insert into tipo_empleado(tipo_empleado)values('Endocrinologo')
insert into tipo_empleado(tipo_empleado)values('Dermatologo')
insert into tipo_empleado(tipo_empleado)values('Nutricionista')
insert into tipo_empleado(tipo_empleado)values('Enfermo')

insert into hospital(nombre_hospital, direccion, numero_niveles,numero_habitaciones,precio_habitacion, consultorios_nivel,
pais,precio_con_especial,precio_con_general,correo,telefono,cantidad_parqueo)values('San Rafael','Colonia Escalon',3,45,90.5,1,'El Salvador',30,40,'HospRafael@gmail.com','7744 9996',105)
insert into hospital(nombre_hospital, direccion, numero_niveles,numero_habitaciones,precio_habitacion, consultorios_nivel,
pais,precio_con_especial,precio_con_general,correo,telefono,cantidad_parqueo)values('La mujer','San Salvador',4,90,75.5,2,'El Salvador',27,35,'Lamujer@gmail.com','7744 9456',135)
insert into hospital(nombre_hospital, direccion, numero_niveles,numero_habitaciones,precio_habitacion, consultorios_nivel,
pais,precio_con_especial,precio_con_general,correo,telefono,cantidad_parqueo)values('Escalon','Santa Elena',5,80,110.5,3,'El Salvador',65,70,'Escalon@gmail.com','5554 9176',145)
insert into hospital(nombre_hospital, direccion, numero_niveles,numero_habitaciones,precio_habitacion, consultorios_nivel,
pais,precio_con_especial,precio_con_general,correo,telefono,cantidad_parqueo)values('Fosalud','Colonia Escalon',3,85,80.5,1,'El Salvador',30,40,'Fosalud@gmail.com','7744 9576',95)
insert into hospital(nombre_hospital, direccion, numero_niveles,numero_habitaciones,precio_habitacion, consultorios_nivel,
pais,precio_con_especial,precio_con_general,correo,telefono,cantidad_parqueo)values('Clinica Maya','Colonia Escalon',2,75,90.5,2,'El Salvador',60,80.5,'CliMaya@gmail.com','7544 9456',105)
insert into hospital(nombre_hospital, direccion, numero_niveles,numero_habitaciones,precio_habitacion, consultorios_nivel,
pais,precio_con_especial,precio_con_general,correo,telefono,cantidad_parqueo)values('ISSS','Colonia Escalon',2,45,60.,2,'El Salvador',20,25,'ISSS@gmail.com','7994 9546',87)
insert into hospital(nombre_hospital, direccion, numero_niveles,numero_habitaciones,precio_habitacion, consultorios_nivel,
pais,precio_con_especial,precio_con_general,correo,telefono,cantidad_parqueo)values('Clinica General','Colonia Escalon',3,55,60.5,1,'El Salvador',60,70,'ClinicaGeneral@gmail.com','9944 7796',54)
insert into hospital(nombre_hospital, direccion, numero_niveles,numero_habitaciones,precio_habitacion, consultorios_nivel,
pais,precio_con_especial,precio_con_general,correo,telefono,cantidad_parqueo)values('Seguro Social','Colonia Escalon',4,35,20.5,2,'El Salvador',10,20,'SSocial@gmail.com','7454 9846',98)
insert into hospital(nombre_hospital, direccion, numero_niveles,numero_habitaciones,precio_habitacion, consultorios_nivel,
pais,precio_con_especial,precio_con_general,correo,telefono,cantidad_parqueo)values('Sivar Hospital','Colonia Escalon',3,85,30.5,3,'El Salvador',30,40,'SivarHP@gmail.com','7755 9996',155)
insert into hospital(nombre_hospital, direccion, numero_niveles,numero_habitaciones,precio_habitacion, consultorios_nivel,
pais,precio_con_especial,precio_con_general,correo,telefono,cantidad_parqueo)values('Cleveland Clinic','Colonia Escalon',2,45,90.5,1,'El Salvador',50,90,'ClevelanClinic@gmail.com','7786 1216',105)


insert into empleado(estado_civil,telefono,nacionalidad,peso,fecha_nacimiento,apellidos,nombres,profesion,estatura, color_ojos,direccion,tipo_sangre,
telefono_casa,correo,salario_mensual,salario_hora,id_hospital,id_tipo_empleado)values('Soltero','7848 9969','Salvadoreño',60,'2004-12-02','Hernandez Castro','René Eduardo','Medico Especialista Reconstrucion Facial',
1.8,'Cafes','Santa Tecla,La Libertad','OR+','7845 1251','renecastro@gmail.com',2500,20,1,3)
insert into empleado(estado_civil,telefono,nacionalidad,peso,fecha_nacimiento,apellidos,nombres,profesion,estatura, color_ojos,direccion,tipo_sangre,
telefono_casa,correo,salario_mensual,salario_hora,id_hospital,id_tipo_empleado)values('Soltera','7848 9459','Salvadoreña',50,'1999-12-02','Contreras Carranza','Melani Fabiola','Medico General',
1.5,'Cafes','Santa Tecla,La Libertad','OR-','7455 1551','melanicontreraso@gmail.com',1500,14,1,10)
insert into empleado(estado_civil,telefono,nacionalidad,peso,fecha_nacimiento,apellidos,nombres,profesion,estatura, color_ojos,direccion,tipo_sangre,
telefono_casa,correo,salario_mensual,salario_hora,id_hospital,id_tipo_empleado)values('Soltero','7845 1119','Salvadoreño',90,'1989-08-05','Navarro Escobar','Oscar Edgardo','Medico General',
1.8,'Verdes','Morazan, La union','O+','7445 5841','edgarnavarro@gmail.com',1800,16,2,9)
insert into empleado(estado_civil,telefono,nacionalidad,peso,fecha_nacimiento,apellidos,nombres,profesion,estatura, color_ojos,direccion,tipo_sangre,
telefono_casa,correo,salario_mensual,salario_hora,id_hospital,id_tipo_empleado)values('Soltero','7238 9948','Salvadoreño',50,'2000-05-05','Aquino Valles','Fernando Jose','Medico Especialista Cardivascular',
1.7,'Cafes','Mejicanos','OR+','5264 1256','fernandoaquino@gmail.com',3500,40,6,2)
insert into empleado(estado_civil,telefono,nacionalidad,peso,fecha_nacimiento,apellidos,nombres,profesion,estatura, color_ojos,direccion,tipo_sangre,
telefono_casa,correo,salario_mensual,salario_hora,id_hospital,id_tipo_empleado)values('Soltera','5428 9989','Salvadoreña',45,'2001-08-09','Turcios Morales','Alejandra Gabriela','Medico Traumatologo',
1.6,'Cafes','Santa Tecla,La Libertad','OR+','7848 1461','aletrucios@gmail.com',1750,14,5,5)
insert into empleado(estado_civil,telefono,nacionalidad,peso,fecha_nacimiento,apellidos,nombres,profesion,estatura, color_ojos,direccion,tipo_sangre,
telefono_casa,correo,salario_mensual,salario_hora,id_hospital,id_tipo_empleado)values('Soltero','7848 4269','Salvadoreño',70,'2004-07-06','Villata Diaz','Jose Vicente','Medico especialista nutricionista',
1.8,'Verdes','Antiguo Cuscatlan','OR-','7895 7891','josevillalta@gmail.com',1500,17,1,2)
insert into empleado(estado_civil,telefono,nacionalidad,peso,fecha_nacimiento,apellidos,nombres,profesion,estatura, color_ojos,direccion,tipo_sangre,
telefono_casa,correo,salario_mensual,salario_hora,id_hospital,id_tipo_empleado)values('Soltero','8548 8669','Salvadoreño',60,'2004-12-08','Ramos Cruz','Alberto Jose','Medico Especialista Oftalmologo',
1.8,'Azules','Santa Tecla,La Libertad','R-','4525 8951','albertramos@gmail.com',1900,18,7,3)
insert into empleado(estado_civil,telefono,nacionalidad,peso,fecha_nacimiento,apellidos,nombres,profesion,estatura, color_ojos,direccion,tipo_sangre,
telefono_casa,correo,salario_mensual,salario_hora,id_hospital,id_tipo_empleado)values('Soltera','7845 9415','Salvadoreña',60,'1998-04-09','Morales BuenDia','Melani Gabriela','Medico Especialista Anesteciloga',
1.7,'Cafes','Sonsonate','OR+','7878 4557','melanimorales@gmail.com',2500,20,9,4)
insert into empleado(estado_civil,telefono,nacionalidad,peso,fecha_nacimiento,apellidos,nombres,profesion,estatura, color_ojos,direccion,tipo_sangre,
telefono_casa,correo,salario_mensual,salario_hora,id_hospital,id_tipo_empleado)values('Soltero','7788 9969','Salvadoreño',55,'2004-11-01','Vladimir Godoy','Samuel Ayala','Medico Cardilogo',
1.8,'Cafes','Santa Tecla,La Libertad','OR-','7845 8568','samuelgodoy@gmail.com',4500,40,4,2)
insert into empleado(estado_civil,telefono,nacionalidad,peso,fecha_nacimiento,apellidos,nombres,profesion,estatura, color_ojos,direccion,tipo_sangre,
telefono_casa,correo,salario_mensual,salario_hora,id_hospital,id_tipo_empleado)values('Soltero','7857 5265','Salvadoreño',60,'2004-08-02','Hernandez Martinez','Sebastian Rene','Medico General',
1.8,'Cafes','San Salvador','OR+','7186 8645','renemartinez@gmail.com',1200,12,6,10)

insert into paciente(estado_civil_pac,telefono_pac,nacionalidad_pac,peso_pac,nacimiento_pac,apellidos_pac,nombres_pac,profesion_pac,estatura_pac,color_ojos_pac,
direccion_pac, tipo_sangre_pac,correo_pac,enfermedad_alergia_pac)values('Soltero','4564 7845', 'Salvadoreño',68,'2004-11-01','Castro Buendia','Boris Alejandro', 'Ingeniero Industrial' ,
1.9,'Cafes','Santa Tecla','OR+','borizbuendia@gmail.com','Ninguna')
insert into paciente(estado_civil_pac,telefono_pac,nacionalidad_pac,peso_pac,nacimiento_pac,apellidos_pac,nombres_pac,profesion_pac,estatura_pac,color_ojos_pac,
direccion_pac, tipo_sangre_pac,correo_pac,enfermedad_alergia_pac)values('Soltero','4154 4152', 'Salvadoreño',50,'2008-05-01','Navarro Contreras','Fernando Fabio', 'Ninguna' ,
1.7,'Cafes','San Miguel','OR+','fernandocontreras@gmail.com','Ninguna')
insert into paciente(estado_civil_pac,telefono_pac,nacionalidad_pac,peso_pac,nacimiento_pac,apellidos_pac,nombres_pac,profesion_pac,estatura_pac,color_ojos_pac,
direccion_pac, tipo_sangre_pac,correo_pac,enfermedad_alergia_pac)values('Soltera','7464 6545', 'Salvadoreña',58,'1980-06-01','Buendia Castro','Thelma Elizabeth', 'Economista' ,
1.8,'Cafes','San Salvador','OR-','thelmacastro@gmail.com','Ninguna')
insert into paciente(estado_civil_pac,telefono_pac,nacionalidad_pac,peso_pac,nacimiento_pac,apellidos_pac,nombres_pac,profesion_pac,estatura_pac,color_ojos_pac,
direccion_pac, tipo_sangre_pac,correo_pac,enfermedad_alergia_pac)values('Soltero','7864 7965', 'Salvadoreño',98,'2014-05-08','Palacios Hecheverria','Fernando Josue', 'Ninguna' ,
1.6,'Azules','Santa Tecla','OR-','fernandohecheverria@gmail.com','Polen')
insert into paciente(estado_civil_pac,telefono_pac,nacionalidad_pac,peso_pac,nacimiento_pac,apellidos_pac,nombres_pac,profesion_pac,estatura_pac,color_ojos_pac,
direccion_pac, tipo_sangre_pac,correo_pac,enfermedad_alergia_pac)values('Soltera','4547 7445', 'Salvadoreño',48,'2001-04-03','Cruz Godoy','Oscar Alberto', 'Profesor Educacion Fisica' ,
1.8,'Cafes','Apopa','OR+','oscarcruz@gmail.com','Polvo')
insert into paciente(estado_civil_pac,telefono_pac,nacionalidad_pac,peso_pac,nacimiento_pac,apellidos_pac,nombres_pac,profesion_pac,estatura_pac,color_ojos_pac,
direccion_pac, tipo_sangre_pac,correo_pac,enfermedad_alergia_pac)values('Soltera','8564 5645', 'Salvadoreña',88,'1995-11-02','Cortez Madrid','Sophia Alexandra', 'Econista en finanzas' ,
1.6,'Cafes','Santa Elena','OR-','madrizcortes@gmail.com','perros')
insert into paciente(estado_civil_pac,telefono_pac,nacionalidad_pac,peso_pac,nacimiento_pac,apellidos_pac,nombres_pac,profesion_pac,estatura_pac,color_ojos_pac,
direccion_pac, tipo_sangre_pac,correo_pac,enfermedad_alergia_pac)values('Soltero','8924 1245', 'Salvadoreño',68,'2002-02-08','Rodriguez Blanco','Crishtopher', 'Ingeniero en sistemas' ,
1.7,'Cafes','Santa Tecla','OR','blancorodriguez@gmail.com','perros')
insert into paciente(estado_civil_pac,telefono_pac,nacionalidad_pac,peso_pac,nacimiento_pac,apellidos_pac,nombres_pac,profesion_pac,estatura_pac,color_ojos_pac,
direccion_pac, tipo_sangre_pac,correo_pac,enfermedad_alergia_pac)values('Soltera','7848 2365', 'Salvadoreña',60,'2003-07-01','Castro Mejia', 'Valeria Patricia' ,'Economista empresarial',
1.5,'Cafes','San Miguel','OR-','patricia@gmail.com','Ninguna')
insert into paciente(estado_civil_pac,telefono_pac,nacionalidad_pac,peso_pac,nacimiento_pac,apellidos_pac,nombres_pac,profesion_pac,estatura_pac,color_ojos_pac,
direccion_pac, tipo_sangre_pac,correo_pac,enfermedad_alergia_pac)values('Soltero','7564 7745', 'Salvadoreño',78,'2007-11-01','Castro Montano','René Emiliano', 'Ingeniero Industrial' ,
1.9,'Cafes','Santa Tecla','OR+','renemontano@gmail.com','Ninguna')
insert into paciente(estado_civil_pac,telefono_pac,nacionalidad_pac,peso_pac,nacimiento_pac,apellidos_pac,nombres_pac,profesion_pac,estatura_pac,color_ojos_pac,
direccion_pac, tipo_sangre_pac,correo_pac,enfermedad_alergia_pac)values('Soltero','5964 7855', 'Salvadoreño',68,'2004-11-01','Palacios Buendia','Kevin Jose', 'Ingeniero electrico' ,
1.8,'Cafes','Cabñas','OR+','palaciosa@gmail.com','Ninguna')

INSERT INTO afiliado(estado_civil, telefono, nacionalidad, peso,
nacimiento, apellidos, nombres, profesion, estatura, color_ojos, direccion, tipo_sangre, telefono_casa, correo, id_paciente)
VALUES('casado', '7253-6552', 'salvadoreña', 90, 
'2001-03-11', 'Barrera Molina', 'Rodrigo Garza', 'Carpintero', 
1.73, 'cafe', 'Mejicanos, San Salvador', 'O-', '2262-4853',
'rog@gmail.com', 1),
('divorciada', '7562-2186', 'salvadoreña', 50, 
'2000-01-10', 'Edgard Pepe', 'Salvador Buendia', 'Mesero', 
1.70, 'negro', 'Miravalle, San Salvador', 'O-', '2270-4256',
'pepe@gmail.com', 2),
('soltera', '1469-6692', 'beliceña', 42.6, 
'1998-01-10', 'Montes Oliva', 'Flores Blanco', 'Ingeniera', 
1.62, 'cafe', 'Belice', 'O+', '2163-5253',
'mont@gmail.com', 3),
('soltera', '8451-1561', 'hondureña', 62.6, 
'2004-02-09', 'Carmen del Sol', 'Valeria Natalia', 'Estudiante', 
1.68, 'azul', 'Honduras', 'AB+', '2565-0456',
'lid2@gmail.com', 4),
('casada', '7514-1232', 'salvadoreña', 58.2, 
'1989-02-07', 'Romania Escarlia', 'Natasha Adiel', 'Profesora', 
1.65, 'cafe', 'Mejicanos, San Salvador', 'O+', '2254-8953',
'scj@gmail.com', 5),
('casado', '8642-9456', 'belga', 80.4, 
'1971-08-12', 'Ernesto Díaz', 'Chavo Leonel', 'Contador', 
1.80, 'cafe', 'Belgica', 'B-', '4212-8646',
'rog@gmail.com', 6),
('soltera', '7769-4200', 'alemana', 71.6, 
'2003-07-05', 'Wright Luna', 'Laura Reyes', 'estudiante', 
1.78, 'azul', 'Alemania', 'A+', '2742-1234',
'lau@gmail.com', 7),
('soltero', '7246-6564', 'salvadoreño', 62, 
'2001-01-01', 'Ojos Marroquín', 'García Roque', 'Diseñador', 
1.78, 'verde', 'San Salvador', 'O-', '2012-4614',
'garci@gmail.com', 8),
('divorciado', '7133-8964', 'mexicano', 70, 
'2003-02-11', 'Reyes Umaña', 'Alejandro Carlos', 'Veterinario', 
1.81, 'negro', 'Honduras', 'B+', '2262-8653',
'bor@gmail.com', 9),
('casada', '7456-6154', 'argentina', 59, 
'2000-01-08', 'Maria Vientos', 'Santa Rios', 'Secretaria', 
1.69, 'café', 'Guatemala', 'O-', '5441-2215',
'marv@gmail.com', 10)


Insert into horario(hora_inicio,hora_fin,fecha,id_empleado) values('12:11:00','23:11:00','2022-12-02',1),
('12:11:00','23:11:00','2022-12-02',10),
('10:21:00','11:11:00','2022-11-02',2),
('11:12:00','07:11:00','2022-10-01',3),
('09:31:00','11:11:00','2022-09-12',4),
('08:00:00','14:11:00','2022-05-12',5),
('07:00:00','15:11:00','2022-04-11',6),
('06:00:00','16:11:00','2022-03-02',7),
('05:44:00','17:11:00','2022-02-02',8),
('01:00:00','18:11:00','2022-01-02',9);

INSERT INTO metodo_pago(titular, numero_cuenta, monto, firma_cheque,
numero_tarjeta, pago_efectivo, id_tipo_pago)
VALUES('RODRIGO GARZA', '16516516', 32.45, '',
'', 0, 1), 
('', '', 39.15, 'Salvador Buendia',
'', 0, 2),
('FLORES BLANCO', '', 50, '',
'', 1, 3),
('VALERIA NATALIA', '', 31, '',
'64684864686', 0, 4),
('LAURA WRIGHT', '', 60, '',
'564654654654', 0, 5),
('', '', 70, 'Pepe Edgardo',
'', 0, 6),
('REYES UMANA', '', 20.15, '',
'77845646', 0, 7),
('', '', 17.2, 'Garcia Roque',
'', 1, 8),
('SALVADOR BUENDIA', '', 69, 'Maria Vientos',
'', 0, 9),
('', '', 420, 'Ojos Marroquin',
'', 1, 10)

insert into proveedor(nombre,direccion,telefono,correo) values ('Fernando Aquino','Final Segundo pasaje',5444-1111,'fernando@gmail.com'),
('Rene Hernandez','Final Primer pasaje',5444-3333,'rene@gmail.com'),
('Luis Arenivar','Final Cuarto pasaje',5555-4444,'luis@gmail.com'),
('Jose Valle','Final Tercer pasaje',1851-25111,'jose@gmail.com'),
('Alberto Ramos','Colonia Estonia',5522-2412,'alber@gmail.com'),
('Marcos Regalado','Casa Blanca',3353-1111,'marcos@gmail.com'),
('Roberto Melgares','Luisiana',8944-0500,'fidel@gmail.com'),
('Mario Villatoro','Colonia Mexico',5555-0000,'vlad@gmail.com'),
('Adolfo Arnulfo','Colonia Peru',8986-9999,'ruiasd@gmail.com'),
('Bukele Marcos','La escalon',7867-9966,'adaaaa@gmail.com');

insert into medicamento(nombre, descripcion, fecha_ingreso, stock,cantidad,id_proveedor,id_tipo_medicamento)values('Paracetamol','farmaco con propiedades analgesicas','2022-01-09',1,1000,1,1),
('Acetaminofen','formaco contra fiebre y dolor de cabeza','2022-01-09',1,10000,1,2),
('Virogrip','alivia sintomas comunes de la gripe','2022-01-09',1,1000,1,3),
('Peptobismol','alivia sintomas estomacales','2022-01-09',1,1080,1,4),
('Ibuprofeno','alivia sintoms de dolor en las articulaciones','2022-01-09',1,100,1,8),
('Ventolin','tratamiento del cierre de vias respiratorias','2022-01-09',1,1000,1,4),
('Eutoriz','tratamiento de enfermedades disfuncionales','2022-01-09',1,1000,1,4),
('Lexatin','Alivia tencion y ansiedad','2022-01-09',1,10,1,8),
('Enantyum','tratar dolor de alta intensidad','2022-01-09',1,100,1,8),
('Paracetamol Kren','Analgesico','2022-01-09',1,100,1,8),
('Adiro 100','previene formacion de obstrucion arteriales','2022-01-09',1,10,1,5);

insert into habitacion(precio, id_hospital) values (90.5,1),
(75.5,2),
(110.5,3),
(80.5,4),
(90.5,5),
(60.,6),
(60.5,7),
(20.5,8),
(30.5,9),
(90.5,10);


insert into expediente(dias_habitacion,cantidad_med,procesos,id_habitacion,id_paciente,id_empleado,id_medicamento)values(10,5,'Cuidados de fuertes dolores arituclares, vigilancia de tratamiento',
1,2,5,8),
(10,4,'Cuidados de fuertes dolores arituclares, vigilancia de tratamiento',1,2,3,4),
(1,5,'Cuidados de vendajes y tramiento para el dolor de cabeza',5,2,5,8),
(2,6,'Administracion de tratamiento',5,2,4,4),
(3,3,'Vigilancia durante el tratamiento',4,3,3,6),
(5,8,'Recuperacion asistida de fuertes traumatismo',6,4,4,4),
(1,9,'Chequeo mensual de examenes ',8,6,8,4),
(7,5,'Estabilizacion de signos vitales',6,8,9,8),
(3,3,'Estabilizacion de niveles de minerales y tratamiento de vias respiratorias',6,8,9,7),
(1,2,'Chequeo rutinario de examenes de sangre',6,8,9,7)

INSERT INTO facturacion(costo_consulta, fecha_transaccion, id_expediente, id_hospital,
id_metodo_pago)
VALUES(90.5, '2022-11-01', 1, 1, 1),
(90.75, '2022-11-03', 2, 2, 2),
(110.5, '2022-10-07', 3, 3, 3),
(80.5, '2022-11-06', 4, 4, 4),
(75, '2022-11-05', 5, 5, 5),
(60, '2022-09-10', 6, 6, 6),
(55, '2022-02-05', 7, 7, 7),
(20.5, '2022-11-04', 8, 8, 8),
(30.5, '2022-10-06', 9, 9, 9),
(45, '2022-09-01', 10, 10, 10)


INSERT INTO consultorio(hora_inicio, hora_fin, fecha, nombre,
id_empleado, id_hospital)
VALUES('07:00:00', '18:00:00', '2008-11-06', 'Consultorio Las Perlas', 1, 1),
('05:00:00', '17:00:00', '2011-07-01', 'Consultorio Higado Feliz', 2, 2),
('07:00:00', '18:00:00', '2015-05-12', 'Consultorio Doctor Arturo', 3, 3),
('06:00:00', '19:00:00', '2017-02-04', 'Consultorio Enrique Curatodo', 4, 4),
('07:00:00', '18:00:00', '2018-01-03', 'Consultorio Padre Santo', 5, 5),
('08:00:00', '19:00:00', '2018-08-10', 'Consultorio El Arbol', 6, 6),
('07:00:00', '18:00:00', '2019-10-08', 'Consultorio Doctora Nuñez', 7, 7),
('07:00:00', '18:00:00', '2019-06-06', 'Consultorio General Maya', 8, 8),
('07:00:00', '18:00:00', '2022-01-07', 'Consultorio Sivar', 9, 9),
('05:00:00', '17:00:00', '2022-11-11', 'Consultorio Cleveland', 10, 10)

select * from hospital
select * from usuario
select * from tipo_pago
select * from tipo_medicamento
select * from tipo_usuario
select * from tipo_empleado
select * from empleado
select * from paciente
select * from horario
select * from proveedor
select * from habitacion
select * from medicamento
select * from expediente
select * from afiliado
select * from metodo_pago
select * from facturacion
select * from consultorio

--alters agregando llaves foraneas y agregando constraints on update delete cascade

ALTER TABLE usuario
	ADD constraint FK_TIPO_USUARIO
	foreign key (id_tipo_usuario)
	references tipo_usuario(id_tipo_usuario),
	constraint FK_EMPLEADO_USUARIO
	foreign key (id_empleado)
	references empleado(id_empleado)
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE tipo_pago
ADD CONSTRAINT USUARIOIN_TIPOPAGO FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_TIPOPAGO FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE tipo_medicamento
ADD CONSTRAINT USUARIOIN_TIPOMEDICAMENTO FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_TIPOMEDICAMENTO FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE tipo_usuario
ADD CONSTRAINT USUARIOIN_TIPOUSUARIO FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_TIPOUSUARIO FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
GO

ALTER TABLE tipo_empleado
ADD CONSTRAINT USUARIOIN_TIPOEMPLEADO FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_TIPOEMPLEADO FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
GO

ALTER TABLE hospital
ADD CONSTRAINT USUARIOIN_HOSPITAL FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_HOSPITAL FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
GO

ALTER TABLE empleado
ADD constraint FK_HOSPITAL_EMPLEADO
	FOREIGN KEY (id_hospital)
	REFERENCES hospital(id_hospital),
	constraint FK_TIPO_EMPLEADO_EMPLEADO
	FOREIGN KEY (id_empleado)
	REFERENCES tipo_empleado(id_tipo_empleado),
	CONSTRAINT USUARIOIN_EMPLEADO FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_EMPLEADO FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
GO

ALTER TABLE paciente
ADD CONSTRAINT USUARIOIN_PACIENTE FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_PACIENTE FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE afiliado
ADD constraint FK_PACIENTE_AFILIADO
	foreign key (id_paciente)
	references paciente(id_paciente),
	CONSTRAINT USUARIOIN_AFILIADO FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_AFILIADO FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE horario
ADD constraint FK_EMPLEADO_HORARIO
	FOREIGN KEY(id_empleado)
	references empleado(id_empleado),
	CONSTRAINT USUARIOIN_HORARIO FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_HORARIO FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE metodo_pago
ADD constraint FK_TIPO_PAGO_METODO
	foreign key (id_tipo_pago)
	references tipo_pago(id_tipo_pago),
	CONSTRAINT USUARIOIN_METODOPAGO FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_METODOPAGO FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE proveedor
ADD CONSTRAINT USUARIOIN_PROVEEDOR FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_PROVEEDOR FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE medicamento
ADD constraint FK_PROVEEDOR_MEDICAMENTO
	foreign key (id_proveedor)
	references proveedor(id_proveedor),
	constraint FK_TIPO_MEDICAMENTO_MEDICAMENTO
	foreign key(id_medicamento)
	references tipo_medicamento(id_tipo_medicamento),
	CONSTRAINT USUARIOIN_MEDICAMENTO FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_MEDICAMENTO FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE habitacion
ADD constraint FK_HOSPITAL_HABITACION
	foreign key (id_hospital)
	references hospital(id_hospital),
	CONSTRAINT USUARIOIN_HABITACION FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_HABITACION FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
GO

ALTER TABLE expediente
ADD constraint FK_EMPLEADO_EXPEDIENTE
	foreign key (id_empleado)
	references empleado(id_empleado),
	constraint FK_PACIENTE_EXPEDIENTE
	foreign key (id_paciente)
	references paciente(id_paciente),
	constraint FK_MEDICAMENTO_EXPEDIENTE
	foreign key (id_medicamento)
	references medicamento(id_medicamento),
	CONSTRAINT USUARIOIN_EXPEDIENTE FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_EXPEDIENTE FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE facturacion
ADD constraint FK_EXPEDIENTE_FACTURACION
	foreign key (id_expediente)
	references expediente(id_expediente),
	constraint FK_HOSPITAL_FACTURACION
	foreign key (id_hospital)
	references hospital(id_hospital),
	constraint FK_METODO_PAGO_FACTURACION
	foreign key (id_metodo_pago)
	references metodo_pago(id_metodo_pago),
	CONSTRAINT USUARIOIN_FACTURACION FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_FACTURACION FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO

ALTER TABLE consultorio
ADD constraint FK_EMPLEADO_CONSULTORIO
	foreign key (id_empleado)
	references empleado(id_empleado),
	constraint FK_HOSPITAL_CONSULTORIO
	foreign key (id_hospital)
	references hospital(id_hospital),
	CONSTRAINT USUARIOIN_CONSULTARIO FOREIGN KEY (usuario_insert) REFERENCES usuario(id_usuario),
	CONSTRAINT USUARIOUP_CONSULTARIO FOREIGN KEY (usuario_update) REFERENCES usuario(id_usuario)
GO