
create database if not exists Dennoun;
use Dennoun;

create table if not exists admins(
administrador varchar(30)primary key not null,
nombre_admin varchar(30),
apellidos_admin varchar(30),
correo_admin varchar(60),
telefono_admin varchar(30),
mes_na_admin varchar(10),
dia_na_admin varchar(10),
anio_admin varchar(10),
contrasenia_admin varchar(30),
funcion_admin varchar(30)
);

insert into admins values ('admin','admin','admin','jimenezramirezulises@gmail.com','5539863242','FEBRERO','7','2005','admin','Propietario');

create table productos (productos_ID int primary key auto_increment, 
					nombre varchar(20), 
                    descripcion varchar(20), 
                    precio_producto double(11,2));

create table if not exists personal(
id_empleado int not null primary key auto_increment,
nombre_empleado varchar(150),
puesto varchar(150),
fecha_contratacion timestamp NOT NULL DEFAULT current_timestamp(),
salario int(30),
horas_trabajo int(30),
turno_empleado varchar(150),
evaluación text
);


create table franquicias (franquicias_ID int primary key auto_increment, 
					nombre varchar(20), 
                    direccion varchar(20), 
                    telefono varchar(20));
                    
create table empleados (empleados_ID int primary key auto_increment, 
					franquicias_ID int,
					nombre varchar(20), 
                    apellidos varchar(20), 
                    puesto varchar (20),
                    fecha_de_nacimiento varchar(20),
					direccion varchar(20), 
                    telefono varchar(20),
                    foreign key (franquicias_ID) references franquicias (franquicias_ID) on update cascade on delete cascade);
                    

                    
create table ventas (ventas_ID int primary key auto_increment, 
					franquicias_ID int,
                    empleados_ID int,
                    productos_ID int,
					cantidad int(20), 
                    precio_venta double(11,2), 
				foreign key (productos_ID) references productos (productos_ID) on update cascade on delete cascade,
                foreign key (empleados_ID) references empleados (empleados_ID) on update cascade on delete cascade,
				foreign key (franquicias_ID) references franquicias (franquicias_ID) on update cascade on delete cascade);
                
create table compras (compras_ID int primary key auto_increment, 
				franquicias_ID int,
                productos_ID int,
				fecha_compra varchar(20), 
				cantidad int(11),	
				precio_compra double(11,2),
				foreign key (productos_ID) references productos (productos_ID) on update cascade on delete cascade,
				foreign key (franquicias_ID) references franquicias (franquicias_ID) on update cascade on delete cascade);

create table ingresos (ingresos_ID int primary key auto_increment, 
			franquicias_ID int,
			fecha_ingreso varchar(20),
			concepto varchar(20), 
			monto double(11,2),
            foreign key (franquicias_ID) references franquicias (franquicias_ID) on update cascade on delete cascade);
                




select*from admins;
select*from ventas;
select*from productos;
select*from personal;
select * from franquicias;
select * from empleados;
select * from compras;
select * from ingresos;




