USE [master]
GO
/****** Object:  Database [DBSportStore]    Script Date: 11/1/2023 7:11:52 PM ******/
CREATE DATABASE [DBSportStore]
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBSportStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBSportStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBSportStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBSportStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBSportStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBSportStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBSportStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBSportStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBSportStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBSportStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBSportStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBSportStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBSportStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBSportStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBSportStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBSportStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBSportStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBSportStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBSportStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBSportStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBSportStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBSportStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBSportStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBSportStore] SET RECOVERY FULL 
GO
ALTER DATABASE [DBSportStore] SET  MULTI_USER 
GO
ALTER DATABASE [DBSportStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBSportStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBSportStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBSportStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBSportStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBSportStore', N'ON'
GO
ALTER DATABASE [DBSportStore] SET QUERY_STORE = OFF
GO
USE [DBSportStore]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 11/1/2023 7:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[ID] [int] NOT NULL,
	[NameUser] [nvarchar](max) NULL,
	[RoleUser] [nvarchar](max) NULL,
	[PasswordUser] [nchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/1/2023 7:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IDCate] [nchar](20) NOT NULL,
	[NameCate] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/1/2023 7:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[IDCus] [int] IDENTITY(1,1) NOT NULL,
	[NameCus] [nvarchar](max) NULL,
	[PhoneCus] [nvarchar](15) NULL,
	[EmailCus] [nvarchar](max) NULL,
	[PassCus] [char](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/1/2023 7:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDProduct] [int] NULL,
	[IDOrder] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPro]    Script Date: 11/1/2023 7:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [date] NULL,
	[IDCus] [int] NULL,
	[AddressDeliverry] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/1/2023 7:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[NamePro] [nvarchar](max) NULL,
	[DecriptionPro] [nvarchar](max) NULL,
	[Category] [nchar](20) NULL,
	[Price] [decimal](18, 2) NULL,
	[ImagePro] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [IDCate], [NameCate]) VALUES (1, N'DK                  ', N'DESKTOP')
INSERT [dbo].[Category] ([Id], [IDCate], [NameCate]) VALUES (4, N'KB                  ', N'KEYBOARD')
INSERT [dbo].[Category] ([Id], [IDCate], [NameCate]) VALUES (2, N'LP                  ', N'LAPTOP')
INSERT [dbo].[Category] ([Id], [IDCate], [NameCate]) VALUES (3, N'MS                  ', N'MOUSE')
INSERT [dbo].[Category] ([Id], [IDCate], [NameCate]) VALUES (5, N'RM                  ', N'RAM')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [NamePro], [DecriptionPro], [Category], [Price], [ImagePro]) VALUES (5, N'LAPTOP ASUS', N'LAPTOP', N'LP                  ', CAST(30000000.00 AS Decimal(18, 2)), N'computer.jpg')
INSERT [dbo].[Products] ([ProductID], [NamePro], [DecriptionPro], [Category], [Price], [ImagePro]) VALUES (6, N'LAPTOP DELL', N'LAPTOP', N'LP                  ', CAST(40000000.00 AS Decimal(18, 2)), N'computer.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([IDOrder])
REFERENCES [dbo].[OrderPro] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderPro]  WITH CHECK ADD FOREIGN KEY([IDCus])
REFERENCES [dbo].[Customer] ([IDCus])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Pro_Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([IDCate])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Pro_Category]
GO
USE [master]
GO
ALTER DATABASE [DBSportStore] SET  READ_WRITE 
GO
