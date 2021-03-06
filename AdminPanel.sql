USE [AdminPanel]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](50) NOT NULL,
	[CreatedAt] [date] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationClaims]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_OperationClaim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserOperationClaims]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OperationClaimId] [int] NOT NULL,
 CONSTRAINT [PK_UserOperationClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PasswordSalt] [varbinary](500) NOT NULL,
	[PasswordHash] [varbinary](500) NOT NULL,
	[Status] [bit] NOT NULL,
	[Fav] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddCategory]
(
@Name nvarchar(50) 
)
as
begin
	insert into Categories(Name) values (@Name)
end
GO
/****** Object:  StoredProcedure [dbo].[AddOperationClaim]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddOperationClaim]
(
@Name nvarchar(250)
)
as
begin
	insert into OperationClaims (Name) values (@Name)
end
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddProduct]
(
@Name nvarchar(50) ,
@Price money  ,
@CategoryId int 
)
as
begin
	insert into Products (Name,Price,CategoryId) values (@Name,@Price,@CategoryId)
end
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddUser]
(
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50),
@PasswordSalt varbinary(500),
@PasswordHash varbinary(500),
@status bit
)
as
begin
	insert into Users (FirstName,LastName,Email,PasswordSalt,PasswordHash,Status) values (@FirstName,@LastName,@Email,@PasswordSalt,@PasswordHash,@status)
end
GO
/****** Object:  StoredProcedure [dbo].[AddUserOperationClaim]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddUserOperationClaim]
(
@UserId int,
@OperationClaimId int
)
as
begin
	insert into UserOperationClaims (UserId,OperationClaimId) values(@UserId,@OperationClaimId)
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteCategory]
(
@Id int 
)
as
begin
	delete from Categories where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteOperationClaim]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteOperationClaim]
(
@Id int
)
as
begin
	delete from OperationClaims where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteProduct]
(
@Id int 
)
as
begin
	delete from Products where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteUser]
(
@Id int

)
as
begin
	delete from Users where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserOperationClaim]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteUserOperationClaim]
(
@Id int
)
as
begin
	delete from UserOperationClaims where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllCategory]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllCategory]
(
@Id int 
)
as
begin
	select *from Categories
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllOperationClaim]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllOperationClaim]
as
begin
	Select *from OperationClaims
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllProduct]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllProduct]
as
select * from Products
GO
/****** Object:  StoredProcedure [dbo].[GetAllUser]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllUser]
as
begin
	select * from Users
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllUserOperationClaim]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllUserOperationClaim]
as
begin
	select *from UserOperationClaims
end
GO
/****** Object:  StoredProcedure [dbo].[GetCategory]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetCategory]
(
@Id int 
)
as
begin
	select *from Categories where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[GetClaims]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetClaims]
(
@UserId int
)
as
begin
	select *from UserOperationClaims u inner join OperationClaims o
	on u.OperationClaimId=o.Id where u.UserId=@UserId
end
GO
/****** Object:  StoredProcedure [dbo].[GetOperationClaim]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetOperationClaim]
(
@Id int
)
as
begin
	Select *from OperationClaims where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[GetProduct]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetProduct]
(
@Id int 
)
as
begin
	select *from Products where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUser]
(
@Id int
)
as
begin
	select * from Users where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[GetUserOperationClaim]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserOperationClaim]
(
@Id int
)
as
begin
	select *from UserOperationClaims where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateCategory]
(
@Id int,
@Name nvarchar(250)
)
as
begin
	Update Categories set
	Name=@Name
	where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateOperationClaim]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateOperationClaim]
(
@Id int,
@Name nvarchar(250)
)
as
begin
	Update OperationClaims set
	Name=@Name
	where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateProduct]
(
@Id int ,
@Name nvarchar(50),
@Price money,
@CategoryId int
)
as
begin
	update Products set
	Name=@Name,
	Price=@Price,
	CategoryId=@CategoryId
	where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateUser]
(
@Id int,
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50),
@PasswordSalt varbinary(500),
@PasswordHash varbinary(500),
@status bit
)
as
begin
	update Users set
	FirstName=@FirstName,
	LastName=@LastName,
	Email=@Email,
	PasswordSalt=@PasswordSalt,
	PasswordHash=@PasswordHash,
	Status=@status
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserOperationClaim]    Script Date: 27.10.2021 21:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateUserOperationClaim]
(
@Id int,
@UserId int,
@OperationClaimId int
)
as
begin
	Update UserOperationClaims set
	UserId=@UserId,
	OperationClaimId=@OperationClaimId
	where Id=@Id
end
GO
