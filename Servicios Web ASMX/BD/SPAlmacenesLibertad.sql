-- seleccionamos la BD 
use bdalmaceneslibertad 
go 

-- procedimiento categoria -- Mostrar 
IF EXISTS(SELECT * FROM sys.procedures WHERE 
NAME='SP_MostrarCategoria')  
DROP PROCEDURE SP_MostrarCategoria   
go 
CREATE PROC SP_MostrarCategoria 
as 
begin 
select * from categoria where estcat = 1 
end 
go 
exec SP_MostrarCategoria 

 -- Mostrar Todo 
IF EXISTS(SELECT * FROM sys.procedures WHERE 
NAME='SP_MostrarCategoriaTodo')  
DROP PROCEDURE SP_MostrarCategoriaTodo   
go 
CREATE PROC SP_MostrarCategoriaTodo 
as 
begin 
select * from categoria 
end 
go 
exec SP_MostrarCategoriaTodo 

-- Registrar 
IF EXISTS(SELECT * FROM sys.procedures WHERE 
NAME='SP_RegistrarCategoria')  
DROP PROCEDURE SP_RegistrarCategoria   
go 
CREATE PROC SP_RegistrarCategoria 
@nombre varchar(60), 
@estado bit 
as 
begin 
begin tran SP_RegistrarCategoria 
begin try 
insert into categoria values(@nombre,@estado) 
commit tran SP_RegistrarCategoria 
end try 
begin catch 
rollback tran SP_RegistrarCategoria 
end catch 
end 
go 

-- actualizar 
IF EXISTS(SELECT * FROM sys.procedures WHERE 
NAME='SP_ActualizarCategoria')  
DROP PROCEDURE SP_ActualizarCategoria   
go 
CREATE PROC SP_ActualizarCategoria 
@codigo int, 
@nombre varchar(60), 
@estado bit 
as 
begin 
begin tran SP_ActualizarCategoria 
begin try 
update categoria set  nomcat=@nombre, estcat=@estado where 
codcat=@codigo 
commit tran SP_ActualizarCategoria 
end try 
begin catch 
rollback tran SP_ActualizarCategoria 
end catch 
end 
go 

-- eliminar 
IF EXISTS(SELECT * FROM sys.procedures WHERE 
NAME='SP_EliminarCategoria')  
DROP PROCEDURE SP_EliminarCategoria   
go 
CREATE PROC SP_EliminarCategoria 
@codigo int 
as 
begin 
begin tran SP_EliminarCategoria 
begin try 
update categoria set estcat=0 where codcat=@codigo 
commit tran SP_EliminarCategoria 
end try 
begin catch 
rollback tran SP_EliminarCategoria 
end catch 
end 
go 

-- procedimiento marca 
-- Mostrar 
IF EXISTS(SELECT * FROM sys.procedures WHERE NAME='SP_MostrarMarca')  
DROP PROCEDURE SP_MostrarMarca   
go 
CREATE PROC SP_MostrarMarca 
as 
begin 
select * from marca where estmar = 1 
end 
go 
exec SP_MostrarMarca 

-- Mostrar Todo 
IF EXISTS(SELECT * FROM sys.procedures WHERE 
NAME='SP_MostrarMarcaTodo')  
DROP PROCEDURE SP_MostrarMarcaTodo   
go 
CREATE PROC SP_MostrarMarcaTodo 
as 
begin 
select * from marca 
end 
go 
exec SP_MostrarMarcaTodo 

-- Registrar 
IF EXISTS(SELECT * FROM sys.procedures WHERE NAME='SP_RegistrarMarca')  
DROP PROCEDURE SP_RegistrarMarca   
go 
CREATE PROC SP_RegistrarMarca 
@nombre varchar(60), 
@estado bit 
as 
begin 
begin tran SP_RegistrarMarca 
begin try 
insert into marca values(@nombre,@estado) 
commit tran SP_RegistrarMarca 
end try 
begin catch 
rollback tran SP_RegistrarMarca 
end catch 
end 
go 

-- actualizar 
IF EXISTS(SELECT * FROM sys.procedures WHERE 
NAME='SP_ActualizarMarca')  
DROP PROCEDURE SP_ActualizarMarca   
go 
CREATE PROC SP_ActualizarMarca 
@codigo int, 
@nombre varchar(60), 
@estado bit 
as 
begin 
begin tran SP_ActualizarMarca 
begin try 
update marca set  nommar=@nombre, estmar=@estado where codmar=@codigo 
commit tran SP_ActualizarMarca 
end try 
begin catch 
rollback tran SP_ActualizarMarca 
end catch 
end 
go 

-- eliminar 
IF EXISTS(SELECT * FROM sys.procedures WHERE NAME='SP_EliminarMarca')  
DROP PROCEDURE SP_EliminarMarca   
go 
CREATE PROC SP_EliminarMarca 
@codigo int 
as 
begin 
begin tran SP_EliminarMarca 
begin try 
update marca set estmar=0 where codmar=@codigo 
commit tran SP_EliminarMarca 
end try 
begin catch 
rollback tran SP_EliminarMarca 
end catch 
end 
go 

--

-- producto
-- Mostrar Productos
IF EXISTS(SELECT * FROM sys.procedures WHERE NAME='SP_MostrarProducto') 
DROP PROCEDURE SP_MostrarProducto
go
CREATE PROC	SP_MostrarProducto
as
begin
select * from producto where estpro = 1
end
go
exec SP_MostrarProducto

-- Mostrar Todos los Productos
IF EXISTS(SELECT * FROM sys.procedures WHERE NAME='SP_MostrarProductoTodo') 
DROP PROCEDURE SP_MostrarProductoTodo;  
go
CREATE PROC	SP_MostrarProductoTodo
as
begin
select * from producto
end
go
exec SP_MostrarProductoTodo

-- Registrar Producto
IF EXISTS(SELECT * FROM sys.procedures WHERE NAME='SP_RegistrarProducto') 
DROP PROCEDURE SP_RegistrarProducto;  
go
CREATE PROC	SP_RegistrarProducto
	@nombre VARCHAR(80),
    @descripcion VARCHAR(300),
    @precio MONEY,
    @cantidad INT,
    @estado BIT,
    @codcat INT,
    @codmar INT
as
begin
	begin tran SP_RegistrarProducto
	begin try
		insert into producto (nompro,despro,prepro,canpro,estpro,codcat,codmar)
		values(@nombre,@descripcion,@precio,@cantidad,@estado,@codcat,@codmar)
		commit tran SP_RegistrarProducto
	end try
	begin catch
		rollback tran SP_RegistrarProducto
	end catch
end
go

-- Actualizar Producto
IF EXISTS(SELECT * FROM sys.procedures WHERE NAME='SP_ActualizarProducto') 
DROP PROCEDURE SP_ActualizarProducto;  
go
CREATE PROC	SP_ActualizarProducto
	@codigo int,
	@nombre varchar(80),
	@descripcion varchar(300),
	@precio money,
	@cantidad int,
	@estado bit,
	@codcat int,
	@codmar int
as
begin
	begin tran SP_ActualizarProducto
	begin try
		update producto 
		set nompro=@nombre,
			despro=@descripcion,
			prepro=@precio,
			canpro=@cantidad,
			estpro=@estado,
			codcat=@codcat,
			codmar=@codmar
			where codpro=@codigo
			commit tran SP_ActualizarProducto
	end try
	begin catch
		rollback tran SP_ActualizarProducto
	end catch
end
go

-- Eliminar Producto
IF EXISTS(SELECT * FROM sys.procedures WHERE NAME='SP_EliminarProducto') 
DROP PROCEDURE SP_EliminarProducto;  
go
CREATE PROC	SP_EliminarProducto
@codigo int
as
begin
begin tran SP_EliminarProducto
begin try
update producto set estpro=0 where codpro=@codigo
commit tran SP_EliminarProducto
end try
begin catch
	rollback tran SP_EliminarProducto
end catch
end
go
