

create database ServicioMilitar
go

use ServicioMilitar
go

create table Compania(
ID_Compania int identity  (1,1) primary key,
Actividades varchar (100) null,
)
go

create table Cuerpo(
ID_Cuerpo  int identity  (1,1) primary key,
Denominacion varchar (100) null,
)
go

create table Cuartel(
ID_Cuartel int identity  (1,1) primary key,
Nombre varchar (100)null,
Direccion varchar (100) null,
)
go

create table Soldado(
ID_Soldado int identity  (1,1) primary key,
Nombre varchar (100) not null,
Apellidos varchar (100) not null,
ID_Compania int foreign key references Compania(ID_Compania) not null,
ID_Cuartel int foreign key references Cuartel(ID_Cuartel) not null,


)
go

create table servicio(
cod_sev int identity  (1,1) primary key,
descripcion varchar (100) not null,
ID_Compania int foreign key references Compania(ID_Compania) not null,
ID_Cuerpo int foreign key references Cuerpo(ID_Cuerpo) not null,


)
go



Create Procedure Agregar_Compania(
@Actividades varchar(100)
)

As
Begin

Begin try


Insert Into [dbo].[Compania]
           ([Actividades]
		   )
     Values
           (@Actividades
		   )



End try

Begin catch
Raiserror('ERROR AL INSERTAR COMPA�IA',10,1)
Rollback Tran

End catch

End

Go



Create Procedure Eliminar_Compania(@ID int)

As
Begin

Begin try
Delete from Compania where ID_Compania = @ID


End try

Begin catch
Raiserror('ERROR AL ELIMINAR COMPA�IA',10,1)
Rollback Tran
End catch

End

Go


Create Procedure Actualizar_Compania(
@ID int,
@Actividades varchar(100)
)

As
Begin

Begin try


Update [dbo].[Compania]
   Set [Actividades] = @Actividades
 Where([ID_Compania]= @ID)


End try

Begin catch
Raiserror('ERROR AL ACTUALIZAR COMPA�IA',10,1)
Rollback Tran
End catch

End

Go

----------------
----------------



Create Procedure Agregar_Cuartel(
@Nombre varchar(100),
@Direccion varchar(100)
)

As
Begin

Begin try


Insert Into [dbo].[Cuartel]
           ([Nombre],
		   [Direccion]
		   )
     Values
           (@Nombre, @Direccion
		   )



End try

Begin catch
Raiserror('ERROR AL INSERTAR CUARTEL',10,1)
Rollback Tran

End catch

End

Go



Create Procedure Eliminar_Cuartel(@ID int)

As
Begin

Begin try
Delete from Cuartel where [ID_Cuartel] = @ID


End try

Begin catch
Raiserror('ERROR AL ELIMINAR CUARTEL',10,1)
Rollback Tran
End catch

End

Go


Create Procedure Actualizar_Cuartel(
@ID int,
@Nombre varchar(100),
@Direccion varchar(100)
)

As
Begin

Begin try


Update [dbo].[Cuartel]
   Set [Nombre] = @Nombre,
	   [Direccion] = @Direccion
 Where([ID_Cuartel]= @ID)


End try

Begin catch
Raiserror('ERROR AL ACTUALIZAR CUARTEL',10,1)
Rollback Tran
End catch

End

Go

----------------
----------------

Create Procedure Agregar_Cuerpo(
@Denominacion varchar(100)
)

As
Begin

Begin try


Insert Into [dbo].[Cuerpo]
           ([Denominacion]
		   )
     Values
           (@Denominacion)



End try

Begin catch
Raiserror('ERROR AL INSERTAR CUERPO',10,1)
Rollback Tran

End catch

End

Go



Create Procedure Eliminar_Cuerpo(@ID int)

As
Begin

Begin try
Delete from Cuartel where [ID_Cuartel] = @ID


End try

Begin catch
Raiserror('ERROR AL ELIMINAR CUERPO',10,1)
Rollback Tran
End catch

End

Go


Create Procedure Actualizar_Cuerpo(
@ID int,
@Denominacion varchar (100)
)

As
Begin

Begin try


Update [dbo].[Cuerpo]
   Set [Denominacion] = @Denominacion
 Where([ID_Cuerpo]= @ID)


End try

Begin catch
Raiserror('ERROR AL ACTUALIZAR CUERPO',10,1)
Rollback Tran
End catch

End

Go

----------------
----------------



Create Procedure Agregar_Servicio(
@Descripcion varchar (100),
@ID_Compania int,
@ID_Cuerpo int
)

As
Begin

Begin try


Insert Into [dbo].[servicio]
           ([descripcion],
		   [ID_Compania],
		   [ID_Cuerpo]
		   )
     Values
           (@Descripcion, @ID_Compania, @ID_Cuerpo)



End try

Begin catch
Raiserror('ERROR AL INSERTAR SERVICIO',10,1)
Rollback Tran

End catch

End

Go



Create Procedure Eliminar_Servicio(@ID int)

As
Begin

Begin try
Delete from [dbo].[servicio] where [cod_sev] = @ID


End try

Begin catch
Raiserror('ERROR AL ELIMINAR SERVICIO',10,1)
Rollback Tran
End catch

End

Go


Create Procedure Actualizar_Servicio(
@ID int,
@Descripcion varchar (100),
@ID_Compania int,
@ID_Cuerpo int
)

As
Begin

Begin try


Update [dbo].[servicio]
   Set [descripcion] = @Descripcion,
   [ID_Compania] = @ID_Compania,
   [ID_Cuerpo] = @ID_Cuerpo
 Where([cod_sev] = @ID)


End try

Begin catch
Raiserror('ERROR AL ACTUALIZAR SERVICIO',10,1)
Rollback Tran
End catch

End

Go

----------------
----------------



----------------
----------------



Create Procedure Agregar_Soldado(
@Nombre varchar (100),
@Apellido varchar (100),
@ID_Compania int,
@NombreCuartel varchar (100)

)

As
Begin

Begin try

Declare @ID_Cuartel int

Set @ID_Cuartel = (Select ID_Cuartel from [dbo].[Cuartel] where Nombre = @NombreCuartel)

Insert Into [dbo].[Soldado]
           ([Nombre],
		   [Apellidos],
		   [ID_Compania],
		   [ID_Cuartel]
		   )
     Values
           (@Nombre, @Apellido, @ID_Compania, @ID_Cuartel)



End try

Begin catch
Raiserror('ERROR AL INSERTAR SOLDADO',10,1)
Rollback Tran

End catch

End

Go



Create Procedure Eliminar_Soldado(@ID int)

As
Begin

Begin try
Delete from [dbo].[Soldado] where [ID_Soldado] = @ID


End try

Begin catch
Raiserror('ERROR AL ELIMINAR SOLDADO',10,1)
Rollback Tran
End catch

End

Go


Create Procedure Actualizar_Soldado(
@ID int,
@Nombre varchar (100),
@Apellido varchar (100),
@ID_Compania int,
@NombreCuartel varchar (100)
)

As
Begin

Begin try

 Declare @ID_Cuartel int
 Set @ID_Cuartel = (Select ID_Cuartel from Cuartel where Nombre = @NombreCuartel)

Update [dbo].[Soldado]
   Set [Nombre]=@Nombre,
   [Apellidos]=@Apellido,
   [ID_Compania]=@ID_Compania,
   [ID_Cuartel]=@ID_Cuartel
 Where([ID_Soldado]= @ID)


End try

Begin catch
Raiserror('ERROR AL ACTUALIZAR SOLDADO',10,1)
Rollback Tran
End catch

End

Go

----------------
----------------



Create View SoldadoV
As(
Select S.ID_Soldado, S.Nombre, S.Apellidos, S.ID_Compania, C.Nombre as [Nombre_Cuartel]
from [dbo].[Soldado] S
Inner Join [dbo].[Cuartel] C
On S.ID_Cuartel = C.ID_Cuartel
)


select @@SERVERNAME
