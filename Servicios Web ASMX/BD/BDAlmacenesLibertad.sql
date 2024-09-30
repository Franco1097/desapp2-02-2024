-- cerrar todas las conexiones a la base de datos
use master
go
IF EXISTS(SELECT * from sys.databases WHERE name='bdalmaceneslibertad')  
BEGIN 
alter database bdalmaceneslibertad set single_user 
with rollback immediate
END 
go

-- buscamos si existe la base de datos
IF EXISTS(SELECT * from sys.databases WHERE name='bdalmaceneslibertad')  
BEGIN 
	-- seleccionamos el master 
	use master
	--eliminamos la base de datos 
    drop DATABASE bdalmaceneslibertad
END 
go

-- creacion de la base de datos
create database bdalmaceneslibertad
go

-- seleccionamos la base de datos
use bdalmaceneslibertad
go

-- creacion de tablas simples
create table categoria(
codcat integer primary key identity(1,1),
nomcat varchar(30) not null,
estcat bit not null
)
go
create table marca(
codmar integer primary key identity(1,1),
nommar varchar(40) not null,
estmar bit not null
)
go

-- creacion de tablas cruzadas
create table producto(
codpro integer primary key identity(1,1),
nompro varchar(80) not null,
despro varchar(300) not null,
prepro money not null,
canpro int not null,
estpro bit not null,
codcat integer not null,
codmar integer not null,
foreign key (codcat) references categoria(codcat),
foreign key (codmar) references marca(codmar)
)
go

-- maestro y detalle


-- insertando datos simples en la tabla Categoria
insert into categoria values('Laptops',1)
insert into categoria values('Celulares',1)
insert into categoria values('Memorias Usb',1)
insert into categoria values('Microprocesadores',1)
insert into categoria values('Discos Duros Solidos',1)
go

-- insertando datos simples en la tabla Marca
insert into marca values('Kingston',1)
insert into marca values('Segate',1)
insert into marca values('Western Digital',1)
insert into marca values('Intel',1)
insert into marca values('AMD',1)
go

-- insertando datos simples en la tabla cruzadas Marca
insert into producto values('Usb 64 Gb','Usb 64 Gb, tecnología 3.0 con 
disipador de calor integrado en color negro',45,30,1,3,1)
insert into producto values('Disco duro SD 1 TB','Disco duro en estado 
solido de 1 Tb, con tecnologia SATA 3.0',350,15,1,5,2)
go

-- maestro detalle


-- Mostrando informacion de la base de datos simples de las tablas Categoria y Marca
select * from categoria
select * from marca
go

-- Haciendo el INNER JOIN en la tabla cruzada
select p.codpro, p.nompro, p.despro, p.prepro, p.canpro, p.estpro,c.nomcat, m.nommar 
from producto p inner join categoria c 
on
p.codcat=c.codcat inner join marca m 
on 
p.codmar=m.codmar
go