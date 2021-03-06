USE [master]
GO
/****** Object:  Database [Componentes]    Script Date: 03/15/2019 17:45:26 ******/
CREATE DATABASE [Componentes] ON  PRIMARY 
( NAME = N'Componentes', FILENAME = N'D:\USR\Sistemas\Data\Componentes.mdf' , SIZE = 44288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Componentes_log', FILENAME = N'D:\USR\Sistemas\Data\Componentes_log.LDF' , SIZE = 297024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Componentes] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Componentes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Componentes] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Componentes] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Componentes] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Componentes] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Componentes] SET ARITHABORT OFF
GO
ALTER DATABASE [Componentes] SET AUTO_CLOSE ON
GO
ALTER DATABASE [Componentes] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Componentes] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Componentes] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Componentes] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Componentes] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Componentes] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Componentes] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Componentes] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Componentes] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Componentes] SET  DISABLE_BROKER
GO
ALTER DATABASE [Componentes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Componentes] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Componentes] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Componentes] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Componentes] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Componentes] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Componentes] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Componentes] SET  READ_WRITE
GO
ALTER DATABASE [Componentes] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Componentes] SET  MULTI_USER
GO
ALTER DATABASE [Componentes] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Componentes] SET DB_CHAINING OFF
GO


USE [Componentes]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[icone] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON
INSERT [dbo].[Categoria] ([id], [nome], [icone]) VALUES (1, N'Categoria X', N'fab fa-alipay')
INSERT [dbo].[Categoria] ([id], [nome], [icone]) VALUES (43, N'Categoria B', N'fab fa-alipay')
INSERT [dbo].[Categoria] ([id], [nome], [icone]) VALUES (47, N'Categoria F', N'fas fa-air-freshener')
INSERT [dbo].[Categoria] ([id], [nome], [icone]) VALUES (51, N'Categora Z', N'fas fa-air-freshener')
INSERT [dbo].[Categoria] ([id], [nome], [icone]) VALUES (54, N'Categoria Sem Icone', N'fas fa-adv')
INSERT [dbo].[Categoria] ([id], [nome], [icone]) VALUES (57, N'Categoria Z', N'fab fa-adv')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
/****** Object:  Table [dbo].[Usuario]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[login] [varchar](20) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[senha] [varchar](70) NULL,
	[superusuario] [bit] NOT NULL,
	[autorizado] [bit] NOT NULL,
	[imageurl] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (1, N'Admin', N'kjhkjh', N'Admin', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (10, N'henrique', N'henrique123', N'henrique', N'4fc82b26aecb47d2868c4efbe3581732a3e7cbcc6c2efb32062c08170a05eeb8', 1, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (11, N'Carol', N'carol123', N'Carol', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (12, N'danilo', N'Rainha do Front', N'danilo', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (13, N'viniciossssssssssssssssssss', N'vinicio123', N'viniciossssssssssssssssssss', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182896, N'Leandro Dias', N'Vampeta', N'Leandro Dias', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 0, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182898, N'nome 0', N'login 0', N'nome 0', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182899, N'nome 1', N'login 1', N'nome 1', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182900, N'nome 2', N'login 2', N'nome 2', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182901, N'nome 3', N'login 3', N'nome 3', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182902, N'nome 4', N'login 4', N'login4@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182903, N'nome 5', N'login 5', N'login5@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182904, N'nome 6', N'login 6', N'login6@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182905, N'nome 7', N'login 7', N'login7@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182906, N'nome 8', N'login 8', N'nome 8', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182907, N'nome 9', N'login 9', N'login9@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182908, N'nome 10', N'login 10', N'login10@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182909, N'nome 11', N'login 11', N'login11@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182910, N'nome 12', N'login 12', N'login12@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182911, N'nome 13', N'login 13', N'login13@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182912, N'nome 14', N'login 14', N'login14@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182913, N'nome 15', N'login 15', N'login15@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182914, N'nome 16', N'login 16', N'login16@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182915, N'nome 17', N'login 17', N'login17@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182916, N'nome 18', N'login 18', N'login18@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182917, N'nome 19', N'login 19', N'login19@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182918, N'nome 20', N'login 20', N'login20@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182919, N'nome 21', N'login 21', N'login21@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182920, N'nome 22', N'login 22', N'login22@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182921, N'nome 23', N'login 23', N'login23@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182922, N'nome 24', N'login 24', N'login24@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182923, N'nome 25', N'login 25', N'login25@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182924, N'nome 26', N'login 26', N'login26@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182925, N'nome 27', N'login 27', N'login27@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182926, N'nome 28', N'login 28', N'login28@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182927, N'nome 29', N'login 29', N'login29@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182928, N'nome 30', N'login 30', N'login30@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182929, N'nome 31', N'login 31', N'login31@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182930, N'nome 32', N'login 32', N'login32@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182931, N'nome 33', N'login 33', N'login33@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182932, N'nome 34', N'login 34', N'login34@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182933, N'nome 35', N'login 35', N'login35@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182934, N'nome 36', N'login 36', N'login36@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182935, N'nome 37', N'login 37', N'login37@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182936, N'nome 38', N'login 38', N'login38@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182937, N'nome 39', N'login 39', N'login39@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182938, N'nome 40', N'login 40', N'login40@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182939, N'nome 41', N'login 41', N'login41@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182940, N'nome 42', N'login 42', N'login42@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182941, N'nome 43', N'login 43', N'login43@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182942, N'nome 44', N'login 44', N'login44@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182943, N'nome 45', N'login 45', N'login45@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182944, N'nome 46', N'login 46', N'login46@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182945, N'nome 47', N'login 47', N'login47@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182946, N'nome 48', N'login 48', N'login48@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182947, N'nome 49', N'login 49', N'login49@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182948, N'nome 50', N'login 50', N'login50@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182949, N'nome 51', N'login 51', N'login51@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182950, N'nome 52', N'login 52', N'login52@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182951, N'nome 53', N'login 53', N'login53@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182952, N'nome 54', N'login 54', N'login54@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182953, N'nome 55', N'login 55', N'login55@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182954, N'nome 56', N'login 56', N'login56@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182955, N'nome 57', N'login 57', N'login57@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182956, N'nome 58', N'login 58', N'login58@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182957, N'nome 59', N'login 59', N'login59@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182958, N'nome 60', N'login 60', N'login60@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182959, N'nome 61', N'login 61', N'login61@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182960, N'nome 62', N'login 62', N'login62@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182961, N'nome 63', N'login 63', N'login63@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182962, N'nome 64', N'login 64', N'login64@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182963, N'nome 65', N'login 65', N'login65@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182964, N'nome 66', N'login 66', N'login66@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182965, N'nome 67', N'login 67', N'login67@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182966, N'nome 68', N'login 68', N'login68@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182967, N'nome 69', N'login 69', N'login69@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182968, N'nome 70', N'login 70', N'login70@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182969, N'nome 71', N'login 71', N'login71@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182970, N'nome 72', N'login 72', N'login72@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182971, N'nome 73', N'login 73', N'login73@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182972, N'nome 74', N'login 74', N'login74@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182973, N'nome 75', N'login 75', N'login75@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182974, N'nome 76', N'login 76', N'login76@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182975, N'nome 77', N'login 77', N'login77@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182976, N'nome 78', N'login 78', N'login78@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182977, N'nome 79', N'login 79', N'login79@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182978, N'nome 80', N'login 80', N'login80@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182979, N'nome 81', N'login 81', N'login81@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182980, N'nome 82', N'login 82', N'login82@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182981, N'nome 83', N'login 83', N'login83@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182982, N'nome 84', N'login 84', N'login84@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182983, N'nome 85', N'login 85', N'login85@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182984, N'nome 86', N'login 86', N'login86@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182985, N'nome 87', N'login 87', N'login87@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182986, N'nome 88', N'login 88', N'login88@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182987, N'nome 89', N'login 89', N'login89@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182988, N'nome 90', N'login 90', N'login90@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182989, N'nome 91', N'login 91', N'login91@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182990, N'nome 92', N'login 92', N'login92@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182991, N'nome 93', N'login 93', N'login93@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182992, N'nome 94', N'login 94', N'login94@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182993, N'nome 95', N'login 95', N'login95@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182994, N'nome 96', N'login 96', N'login96@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182995, N'nome 97', N'login 97', N'login97@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182996, N'nome 98', N'login 98', N'login98@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182997, N'nome 99', N'login 99', N'login99@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182998, N'nome 100', N'login 100', N'login100@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (182999, N'nome 101', N'login 101', N'login101@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183000, N'nome 102', N'login 102', N'login102@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183001, N'nome 103', N'login 103', N'login103@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183002, N'nome 104', N'login 104', N'login104@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183003, N'nome 105', N'login 105', N'login105@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183004, N'nome 106', N'login 106', N'login106@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183005, N'nome 107', N'login 107', N'login107@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183006, N'nome 108', N'login 108', N'login108@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183007, N'nome 109', N'login 109', N'login109@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183008, N'nome 110', N'login 110', N'login110@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183009, N'nome 111', N'login 111', N'login111@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183010, N'nome 112', N'login 112', N'login112@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183011, N'nome 113', N'login 113', N'login113@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183012, N'nome 114', N'login 114', N'login114@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183013, N'nome 115', N'login 115', N'login115@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183014, N'nome 116', N'login 116', N'login116@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183015, N'nome 117', N'login 117', N'login117@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183016, N'nome 118', N'login 118', N'login118@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183017, N'nome 119', N'login 119', N'login119@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183018, N'nome 120', N'login 120', N'login120@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183019, N'nome 121', N'login 121', N'login121@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183020, N'nome 122', N'login 122', N'login122@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183021, N'nome 123', N'login 123', N'login123@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183022, N'nome 124', N'login 124', N'login124@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183023, N'nome 125', N'login 125', N'login125@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183024, N'nome 126', N'login 126', N'login126@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183025, N'nome 127', N'login 127', N'login127@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183026, N'nome 128', N'login 128', N'login128@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183027, N'nome 129', N'login 129', N'login129@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183028, N'nome 130', N'login 130', N'login130@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183029, N'nome 131', N'login 131', N'login131@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183030, N'nome 132', N'login 132', N'login132@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183031, N'nome 133', N'login 133', N'login133@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183032, N'nome 134', N'login 134', N'login134@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183033, N'nome 135', N'login 135', N'login135@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183034, N'nome 136', N'login 136', N'login136@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183035, N'nome 137', N'login 137', N'login137@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183036, N'nome 138', N'login 138', N'login138@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183037, N'nome 139', N'login 139', N'login139@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183038, N'nome 140', N'login 140', N'login140@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183039, N'nome 141', N'login 141', N'login141@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183040, N'nome 142', N'login 142', N'login142@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183041, N'nome 143', N'login 143', N'login143@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183042, N'nome 144', N'login 144', N'login144@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183043, N'nome 145', N'login 145', N'login145@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183044, N'nome 146', N'login 146', N'login146@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183045, N'nome 147', N'login 147', N'login147@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183046, N'nome 148', N'login 148', N'login148@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183047, N'nome 149', N'login 149', N'login149@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183048, N'nome 150', N'login 150', N'login150@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183049, N'nome 151', N'login 151', N'login151@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183050, N'nome 152', N'login 152', N'login152@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183051, N'nome 153', N'login 153', N'login153@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183052, N'nome 154', N'login 154', N'login154@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183053, N'nome 155', N'login 155', N'login155@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183054, N'nome 156', N'login 156', N'login156@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183055, N'nome 157', N'login 157', N'login157@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183056, N'nome 158', N'login 158', N'login158@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183057, N'nome 159', N'login 159', N'login159@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183058, N'nome 160', N'login 160', N'login160@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183059, N'nome 161', N'login 161', N'login161@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183060, N'nome 162', N'login 162', N'login162@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183061, N'nome 163', N'login 163', N'login163@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183062, N'nome 164', N'login 164', N'login164@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183063, N'nome 165', N'login 165', N'login165@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183064, N'nome 166', N'login 166', N'login166@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183065, N'nome 167', N'login 167', N'login167@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183066, N'nome 168', N'login 168', N'login168@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183067, N'nome 169', N'login 169', N'login169@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183068, N'nome 170', N'login 170', N'login170@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183069, N'nome 171', N'login 171', N'login171@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183070, N'nome 172', N'login 172', N'login172@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183071, N'nome 173', N'login 173', N'login173@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183072, N'nome 174', N'login 174', N'login174@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183073, N'nome 175', N'login 175', N'login175@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183074, N'nome 176', N'login 176', N'login176@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183075, N'nome 177', N'login 177', N'login177@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183076, N'nome 178', N'login 178', N'login178@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183077, N'nome 179', N'login 179', N'login179@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183078, N'nome 180', N'login 180', N'login180@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183079, N'nome 181', N'login 181', N'login181@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183080, N'nome 182', N'login 182', N'login182@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183081, N'nome 183', N'login 183', N'login183@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183082, N'nome 184', N'login 184', N'login184@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183083, N'nome 185', N'login 185', N'login185@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183084, N'nome 186', N'login 186', N'login186@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183085, N'nome 187', N'login 187', N'login187@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183086, N'nome 188', N'login 188', N'login188@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183087, N'nome 189', N'login 189', N'login189@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183088, N'nome 190', N'login 190', N'login190@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183089, N'nome 191', N'login 191', N'login191@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183090, N'nome 192', N'login 192', N'login192@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183091, N'nome 193', N'login 193', N'login193@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183092, N'nome 194', N'login 194', N'login194@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183093, N'nome 195', N'login 195', N'login195@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183094, N'nome 196', N'login 196', N'login196@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183095, N'nome 197', N'login 197', N'login197@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183096, N'nome 198', N'login 198', N'login198@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183097, N'nome 199', N'login 199', N'login199@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183098, N'nome 200', N'login 200', N'login200@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183099, N'nome 201', N'login 201', N'login201@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183100, N'nome 202', N'login 202', N'login202@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183101, N'nome 203', N'login 203', N'login203@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183102, N'nome 204', N'login 204', N'login204@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183103, N'nome 205', N'login 205', N'login205@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183104, N'nome 206', N'login 206', N'login206@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183105, N'nome 207', N'login 207', N'login207@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183106, N'nome 208', N'login 208', N'login208@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183107, N'nome 209', N'login 209', N'login209@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183108, N'nome 210', N'login 210', N'login210@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183109, N'nome 211', N'login 211', N'login211@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183110, N'nome 212', N'login 212', N'login212@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183111, N'nome 213', N'login 213', N'login213@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183112, N'nome 214', N'login 214', N'login214@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183113, N'nome 215', N'login 215', N'login215@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183114, N'nome 216', N'login 216', N'login216@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183115, N'nome 217', N'login 217', N'login217@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183116, N'nome 218', N'login 218', N'login218@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183117, N'nome 219', N'login 219', N'login219@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183118, N'nome 220', N'login 220', N'login220@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183119, N'nome 221', N'login 221', N'login221@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183120, N'nome 222', N'login 222', N'login222@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183121, N'nome 223', N'login 223', N'login223@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183122, N'nome 224', N'login 224', N'login224@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183123, N'nome 225', N'login 225', N'login225@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183124, N'nome 226', N'login 226', N'login226@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183125, N'nome 227', N'login 227', N'login227@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183126, N'nome 228', N'login 228', N'login228@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183127, N'nome 229', N'login 229', N'login229@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183128, N'nome 230', N'login 230', N'login230@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183129, N'nome 231', N'login 231', N'login231@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183130, N'nome 232', N'login 232', N'login232@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183131, N'nome 233', N'login 233', N'login233@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183132, N'nome 234', N'login 234', N'login234@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183133, N'nome 235', N'login 235', N'login235@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183134, N'nome 236', N'login 236', N'login236@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183135, N'nome 237', N'login 237', N'login237@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183136, N'nome 238', N'login 238', N'login238@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183137, N'nome 239', N'login 239', N'login239@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183138, N'nome 240', N'login 240', N'login240@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183139, N'nome 241', N'login 241', N'login241@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183140, N'nome 242', N'login 242', N'login242@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183141, N'nome 243', N'login 243', N'login243@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183142, N'nome 244', N'login 244', N'login244@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183143, N'nome 245', N'login 245', N'login245@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183144, N'nome 246', N'login 246', N'login246@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183145, N'nome 247', N'login 247', N'login247@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183146, N'nome 248', N'login 248', N'login248@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183147, N'nome 249', N'login 249', N'login249@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183148, N'nome 250', N'login 250', N'login250@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183149, N'nome 251', N'login 251', N'login251@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183150, N'nome 252', N'login 252', N'login252@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183151, N'nome 253', N'login 253', N'login253@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183152, N'nome 254', N'login 254', N'login254@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183153, N'nome 255', N'login 255', N'login255@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183154, N'nome 256', N'login 256', N'login256@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183155, N'nome 257', N'login 257', N'login257@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183156, N'nome 258', N'login 258', N'login258@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183157, N'nome 259', N'login 259', N'login259@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183158, N'nome 260', N'login 260', N'login260@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183159, N'nome 261', N'login 261', N'login261@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183160, N'nome 262', N'login 262', N'login262@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183161, N'nome 263', N'login 263', N'login263@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183162, N'nome 264', N'login 264', N'login264@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183163, N'nome 265', N'login 265', N'login265@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183164, N'nome 266', N'login 266', N'login266@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183165, N'nome 267', N'login 267', N'login267@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183166, N'nome 268', N'login 268', N'login268@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183167, N'nome 269', N'login 269', N'login269@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183168, N'nome 270', N'login 270', N'login270@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183169, N'nome 271', N'login 271', N'login271@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183170, N'nome 272', N'login 272', N'login272@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183171, N'nome 273', N'login 273', N'login273@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183172, N'nome 274', N'login 274', N'login274@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183173, N'nome 275', N'login 275', N'login275@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183174, N'nome 276', N'login 276', N'login276@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183175, N'nome 277', N'login 277', N'login277@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183176, N'nome 278', N'login 278', N'login278@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183177, N'nome 279', N'login 279', N'login279@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183178, N'nome 280', N'login 280', N'login280@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183179, N'nome 281', N'login 281', N'login281@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183180, N'nome 282', N'login 282', N'login282@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183181, N'nome 283', N'login 283', N'login283@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183182, N'nome 284', N'login 284', N'login284@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183183, N'nome 285', N'login 285', N'login285@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183184, N'nome 286', N'login 286', N'login286@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183185, N'nome 287', N'login 287', N'login287@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183186, N'nome 288', N'login 288', N'login288@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183187, N'nome 289', N'login 289', N'login289@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183188, N'nome 290', N'login 290', N'login290@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183189, N'nome 291', N'login 291', N'login291@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183190, N'nome 292', N'login 292', N'login292@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183191, N'nome 293', N'login 293', N'login293@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183192, N'nome 294', N'login 294', N'login294@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183193, N'nome 295', N'login 295', N'login295@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
GO
print 'Processed 300 total records'
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183194, N'nome 296', N'login 296', N'login296@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183195, N'nome 297', N'login 297', N'login297@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183196, N'nome 298', N'login 298', N'login298@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183197, N'nome 299', N'login 299', N'login299@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183198, N'nome 300', N'login 300', N'login300@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183199, N'nome 301', N'login 301', N'login301@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183200, N'nome 302', N'login 302', N'login302@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183201, N'nome 303', N'login 303', N'login303@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183202, N'nome 304', N'login 304', N'login304@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183203, N'nome 305', N'login 305', N'login305@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183204, N'nome 306', N'login 306', N'login306@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183205, N'nome 307', N'login 307', N'login307@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183206, N'nome 308', N'login 308', N'login308@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183207, N'nome 309', N'login 309', N'login309@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183208, N'nome 310', N'login 310', N'login310@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183209, N'nome 311', N'login 311', N'login311@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183210, N'nome 312', N'login 312', N'login312@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183211, N'nome 313', N'login 313', N'login313@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183212, N'nome 314', N'login 314', N'login314@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183213, N'nome 315', N'login 315', N'login315@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183214, N'nome 316', N'login 316', N'login316@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183215, N'nome 317', N'login 317', N'login317@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183216, N'nome 318', N'login 318', N'login318@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183217, N'nome 319', N'login 319', N'login319@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183218, N'nome 320', N'login 320', N'login320@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183219, N'nome 321', N'login 321', N'login321@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183220, N'nome 322', N'login 322', N'login322@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183221, N'nome 323', N'login 323', N'login323@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183222, N'nome 324', N'login 324', N'login324@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183223, N'nome 325', N'login 325', N'login325@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183224, N'nome 326', N'login 326', N'login326@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183225, N'nome 327', N'login 327', N'login327@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183226, N'nome 328', N'login 328', N'login328@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183227, N'nome 329', N'login 329', N'login329@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183228, N'nome 330', N'login 330', N'login330@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183229, N'nome 331', N'login 331', N'login331@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183230, N'nome 332', N'login 332', N'login332@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183231, N'nome 333', N'login 333', N'login333@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183232, N'nome 334', N'login 334', N'login334@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183233, N'nome 335', N'login 335', N'login335@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183234, N'nome 336', N'login 336', N'login336@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183235, N'nome 337', N'login 337', N'login337@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183236, N'nome 338', N'login 338', N'login338@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183237, N'nome 339', N'login 339', N'login339@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183238, N'nome 340', N'login 340', N'login340@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183239, N'nome 341', N'login 341', N'login341@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183240, N'nome 342', N'login 342', N'login342@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183241, N'nome 343', N'login 343', N'login343@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183242, N'nome 344', N'login 344', N'login344@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183243, N'nome 345', N'login 345', N'login345@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183244, N'nome 346', N'login 346', N'login346@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183245, N'nome 347', N'login 347', N'login347@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183246, N'nome 348', N'login 348', N'login348@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183247, N'nome 349', N'login 349', N'login349@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183248, N'nome 350', N'login 350', N'login350@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183249, N'nome 351', N'login 351', N'login351@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183250, N'nome 352', N'login 352', N'login352@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183251, N'nome 353', N'login 353', N'login353@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183252, N'nome 354', N'login 354', N'login354@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183253, N'nome 355', N'login 355', N'login355@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183254, N'nome 356', N'login 356', N'login356@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183255, N'nome 357', N'login 357', N'login357@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183256, N'nome 358', N'login 358', N'login358@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183257, N'nome 359', N'login 359', N'login359@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183258, N'nome 360', N'login 360', N'login360@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183259, N'nome 361', N'login 361', N'login361@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183260, N'nome 362', N'login 362', N'login362@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183261, N'nome 363', N'login 363', N'login363@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183262, N'nome 364', N'login 364', N'login364@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183263, N'nome 365', N'login 365', N'login365@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183264, N'nome 366', N'login 366', N'login366@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183265, N'nome 367', N'login 367', N'login367@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183266, N'nome 368', N'login 368', N'login368@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183267, N'nome 369', N'login 369', N'login369@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183268, N'nome 370', N'login 370', N'login370@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183269, N'nome 371', N'login 371', N'login371@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183270, N'nome 372', N'login 372', N'login372@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183271, N'nome 373', N'login 373', N'login373@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183272, N'nome 374', N'login 374', N'login374@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183273, N'nome 375', N'login 375', N'login375@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183274, N'nome 376', N'login 376', N'login376@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183275, N'nome 377', N'login 377', N'login377@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183276, N'nome 378', N'login 378', N'login378@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183277, N'nome 379', N'login 379', N'login379@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183278, N'nome 380', N'login 380', N'login380@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183279, N'nome 381', N'login 381', N'login381@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183280, N'nome 382', N'login 382', N'login382@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183281, N'nome 383', N'login 383', N'login383@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183282, N'nome 384', N'login 384', N'login384@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183283, N'nome 385', N'login 385', N'login385@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183284, N'nome 386', N'login 386', N'login386@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183285, N'nome 387', N'login 387', N'login387@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183286, N'nome 388', N'login 388', N'login388@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183287, N'nome 389', N'login 389', N'login389@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183288, N'nome 390', N'login 390', N'login390@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183289, N'nome 391', N'login 391', N'login391@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183290, N'nome 392', N'login 392', N'login392@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183291, N'nome 393', N'login 393', N'login393@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183292, N'nome 394', N'login 394', N'login394@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183293, N'nome 395', N'login 395', N'login395@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183294, N'nome 396', N'login 396', N'login396@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
GO
print 'Processed 400 total records'
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183295, N'nome 397', N'login 397', N'login397@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183296, N'nome 398', N'login 398', N'login398@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183297, N'nome 399', N'login 399', N'login399@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183298, N'nome 400', N'login 400', N'login400@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183299, N'nome 401', N'login 401', N'login401@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183300, N'nome 402', N'login 402', N'login402@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183301, N'nome 403', N'login 403', N'login403@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183302, N'nome 404', N'login 404', N'login404@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183303, N'nome 405', N'login 405', N'login405@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183304, N'nome 406', N'login 406', N'login406@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183305, N'nome 407', N'login 407', N'login407@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183306, N'nome 408', N'login 408', N'login408@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183307, N'nome 409', N'login 409', N'login409@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183308, N'nome 410', N'login 410', N'login410@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183309, N'nome 411', N'login 411', N'login411@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183310, N'nome 412', N'login 412', N'login412@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183311, N'nome 413', N'login 413', N'login413@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183312, N'nome 414', N'login 414', N'login414@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183313, N'nome 415', N'login 415', N'login415@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183314, N'nome 416', N'login 416', N'login416@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183315, N'nome 417', N'login 417', N'login417@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183316, N'nome 418', N'login 418', N'login418@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183317, N'nome 419', N'login 419', N'login419@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183318, N'nome 420', N'login 420', N'login420@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183319, N'nome 421', N'login 421', N'login421@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183320, N'nome 422', N'login 422', N'login422@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183321, N'nome 423', N'login 423', N'login423@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183322, N'nome 424', N'login 424', N'login424@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183323, N'nome 425', N'login 425', N'login425@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183324, N'nome 426', N'login 426', N'login426@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183325, N'nome 427', N'login 427', N'login427@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183326, N'nome 428', N'login 428', N'login428@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183327, N'nome 429', N'login 429', N'login429@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183328, N'nome 430', N'login 430', N'login430@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183329, N'nome 431', N'login 431', N'login431@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183330, N'nome 432', N'login 432', N'login432@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183331, N'nome 433', N'login 433', N'login433@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183332, N'nome 434', N'login 434', N'login434@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183333, N'nome 435', N'login 435', N'login435@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183334, N'nome 436', N'login 436', N'login436@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183335, N'nome 437', N'login 437', N'login437@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183336, N'nome 438', N'login 438', N'login438@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183337, N'nome 439', N'login 439', N'login439@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183338, N'nome 440', N'login 440', N'login440@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183339, N'nome 441', N'login 441', N'login441@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183340, N'nome 442', N'login 442', N'login442@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183341, N'nome 443', N'login 443', N'login443@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183342, N'nome 444', N'login 444', N'login444@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183343, N'nome 445', N'login 445', N'login445@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183344, N'nome 446', N'login 446', N'login446@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183345, N'nome 447', N'login 447', N'login447@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183346, N'nome 448', N'login 448', N'login448@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183347, N'nome 449', N'login 449', N'login449@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183348, N'nome 450', N'login 450', N'login450@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183349, N'nome 451', N'login 451', N'login451@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183350, N'nome 452', N'login 452', N'login452@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183351, N'nome 453', N'login 453', N'login453@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183352, N'nome 454', N'login 454', N'login454@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183353, N'nome 455', N'login 455', N'login455@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183354, N'nome 456', N'login 456', N'login456@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183355, N'nome 457', N'login 457', N'login457@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183356, N'nome 458', N'login 458', N'login458@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183357, N'nome 459', N'login 459', N'login459@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183358, N'nome 460', N'login 460', N'login460@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183359, N'nome 461', N'login 461', N'login461@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183360, N'nome 462', N'login 462', N'login462@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183361, N'nome 463', N'login 463', N'login463@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183362, N'nome 464', N'login 464', N'login464@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183363, N'nome 465', N'login 465', N'login465@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183364, N'nome 466', N'login 466', N'login466@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183365, N'nome 467', N'login 467', N'login467@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183366, N'nome 468', N'login 468', N'login468@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183367, N'nome 469', N'login 469', N'login469@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183368, N'nome 470', N'login 470', N'login470@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183369, N'nome 471', N'login 471', N'login471@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183370, N'nome 472', N'login 472', N'login472@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183371, N'nome 473', N'login 473', N'login473@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183372, N'nome 474', N'login 474', N'login474@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183373, N'nome 475', N'login 475', N'login475@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183374, N'nome 476', N'login 476', N'login476@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183375, N'nome 477', N'login 477', N'login477@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183376, N'nome 478', N'login 478', N'login478@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183377, N'nome 479', N'login 479', N'login479@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183378, N'nome 480', N'login 480', N'login480@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183379, N'nome 481', N'login 481', N'login481@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183380, N'nome 482', N'login 482', N'login482@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183381, N'nome 483', N'login 483', N'login483@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183382, N'nome 484', N'login 484', N'login484@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183383, N'nome 485', N'login 485', N'login485@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183384, N'nome 486', N'login 486', N'login486@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183385, N'nome 487', N'login 487', N'login487@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183386, N'nome 488', N'login 488', N'login488@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183387, N'nome 489', N'login 489', N'login489@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183388, N'nome 490', N'login 490', N'login490@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183389, N'nome 491', N'login 491', N'login491@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183390, N'nome 492', N'login 492', N'login492@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183391, N'nome 493', N'login 493', N'login493@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183392, N'nome 494', N'login 494', N'login494@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183393, N'nome 495', N'login 495', N'login495@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183394, N'nome 496', N'login 496', N'login496@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183395, N'nome 497', N'login 497', N'login497@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
GO
print 'Processed 500 total records'
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183396, N'nome 498', N'login 498', N'login498@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183397, N'nome 499', N'login 499', N'login499@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183398, N'nome 500', N'login 500', N'login500@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183399, N'nome 501', N'login 501', N'login501@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183400, N'nome 502', N'login 502', N'login502@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183401, N'nome 503', N'login 503', N'login503@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183402, N'nome 504', N'login 504', N'login504@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183403, N'nome 505', N'login 505', N'login505@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183404, N'nome 506', N'login 506', N'login506@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183405, N'nome 507', N'login 507', N'login507@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183406, N'nome 508', N'login 508', N'login508@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183407, N'nome 509', N'login 509', N'login509@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183408, N'nome 510', N'login 510', N'login510@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183409, N'nome 511', N'login 511', N'login511@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183410, N'nome 512', N'login 512', N'login512@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183411, N'nome 513', N'login 513', N'login513@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183412, N'nome 514', N'login 514', N'login514@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183413, N'nome 515', N'login 515', N'login515@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183414, N'nome 516', N'login 516', N'login516@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183415, N'nome 517', N'login 517', N'login517@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183416, N'nome 518', N'login 518', N'login518@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183417, N'nome 519', N'login 519', N'login519@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183418, N'nome 520', N'login 520', N'login520@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183419, N'nome 521', N'login 521', N'login521@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183420, N'nome 522', N'login 522', N'login522@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183421, N'nome 523', N'login 523', N'login523@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183422, N'nome 524', N'login 524', N'login524@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183423, N'nome 525', N'login 525', N'login525@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183424, N'nome 526', N'login 526', N'login526@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183425, N'nome 527', N'login 527', N'login527@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183426, N'nome 528', N'login 528', N'login528@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183427, N'nome 529', N'login 529', N'login529@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183428, N'nome 530', N'login 530', N'login530@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183429, N'nome 531', N'login 531', N'login531@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183430, N'nome 532', N'login 532', N'login532@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183431, N'nome 533', N'login 533', N'login533@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183432, N'nome 534', N'login 534', N'login534@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183433, N'nome 535', N'login 535', N'login535@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183434, N'nome 536', N'login 536', N'login536@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183435, N'nome 537', N'login 537', N'login537@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183436, N'nome 538', N'login 538', N'login538@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183437, N'nome 539', N'login 539', N'login539@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183438, N'nome 540', N'login 540', N'login540@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183439, N'nome 541', N'login 541', N'login541@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183440, N'nome 542', N'login 542', N'login542@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183441, N'nome 543', N'login 543', N'login543@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183442, N'nome 544', N'login 544', N'login544@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183443, N'nome 545', N'login 545', N'login545@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183444, N'nome 546', N'login 546', N'login546@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183445, N'nome 547', N'login 547', N'login547@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183446, N'nome 548', N'login 548', N'login548@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183447, N'nome 549', N'login 549', N'login549@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183448, N'nome 550', N'login 550', N'login550@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183449, N'nome 551', N'login 551', N'login551@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183450, N'nome 552', N'login 552', N'login552@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183451, N'nome 553', N'login 553', N'login553@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183452, N'nome 554', N'login 554', N'login554@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183453, N'nome 555', N'login 555', N'login555@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183454, N'nome 556', N'login 556', N'login556@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183455, N'nome 557', N'login 557', N'login557@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183456, N'nome 558', N'login 558', N'login558@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183457, N'nome 559', N'login 559', N'login559@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183458, N'nome 560', N'login 560', N'login560@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183459, N'nome 561', N'login 561', N'login561@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183460, N'nome 562', N'login 562', N'login562@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183461, N'nome 563', N'login 563', N'login563@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183462, N'nome 564', N'login 564', N'login564@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183463, N'nome 565', N'login 565', N'login565@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183464, N'nome 566', N'login 566', N'login566@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183465, N'nome 567', N'login 567', N'login567@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183466, N'nome 568', N'login 568', N'login568@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183467, N'nome 569', N'login 569', N'login569@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183468, N'nome 570', N'login 570', N'login570@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183469, N'nome 571', N'login 571', N'login571@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183470, N'nome 572', N'login 572', N'login572@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183471, N'nome 573', N'login 573', N'login573@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183472, N'nome 574', N'login 574', N'login574@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183473, N'nome 575', N'login 575', N'login575@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183474, N'nome 576', N'login 576', N'login576@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183475, N'nome 577', N'login 577', N'login577@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183476, N'nome 578', N'login 578', N'login578@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183477, N'nome 579', N'login 579', N'login579@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183478, N'nome 580', N'login 580', N'login580@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183479, N'nome 581', N'login 581', N'login581@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183480, N'nome 582', N'login 582', N'login582@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183481, N'nome 583', N'login 583', N'login583@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183482, N'nome 584', N'login 584', N'login584@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183483, N'nome 585', N'login 585', N'login585@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183484, N'nome 586', N'login 586', N'login586@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183485, N'nome 587', N'login 587', N'login587@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183486, N'nome 588', N'login 588', N'login588@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183487, N'nome 589', N'login 589', N'login589@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183488, N'nome 590', N'login 590', N'login590@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183489, N'nome 591', N'login 591', N'login591@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183490, N'nome 592', N'login 592', N'login592@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183491, N'nome 593', N'login 593', N'login593@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183492, N'nome 594', N'login 594', N'login594@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183493, N'nome 595', N'login 595', N'login595@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183494, N'nome 596', N'login 596', N'login596@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183495, N'nome 597', N'login 597', N'login597@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183496, N'nome 598', N'login 598', N'login598@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
GO
print 'Processed 600 total records'
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183497, N'nome 599', N'login 599', N'login599@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183498, N'nome 600', N'login 600', N'login600@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183499, N'nome 601', N'login 601', N'login601@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183500, N'nome 602', N'login 602', N'login602@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183501, N'nome 603', N'login 603', N'login603@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183502, N'nome 604', N'login 604', N'login604@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183503, N'nome 605', N'login 605', N'login605@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183504, N'nome 606', N'login 606', N'login606@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183505, N'nome 607', N'login 607', N'login607@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183506, N'nome 608', N'login 608', N'login608@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183507, N'nome 609', N'login 609', N'login609@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183508, N'nome 610', N'login 610', N'login610@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183509, N'nome 611', N'login 611', N'login611@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183510, N'nome 612', N'login 612', N'login612@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183511, N'nome 613', N'login 613', N'login613@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183512, N'nome 614', N'login 614', N'login614@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183513, N'nome 615', N'login 615', N'login615@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183514, N'nome 616', N'login 616', N'login616@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183515, N'nome 617', N'login 617', N'login617@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183516, N'nome 618', N'login 618', N'login618@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183517, N'nome 619', N'login 619', N'login619@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183518, N'nome 620', N'login 620', N'login620@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183519, N'nome 621', N'login 621', N'login621@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183520, N'nome 622', N'login 622', N'login622@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183521, N'nome 623', N'login 623', N'login623@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183522, N'nome 624', N'login 624', N'login624@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183523, N'nome 625', N'login 625', N'login625@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183524, N'nome 626', N'login 626', N'login626@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183525, N'nome 627', N'login 627', N'login627@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183526, N'nome 628', N'login 628', N'login628@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183527, N'nome 629', N'login 629', N'login629@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183528, N'nome 630', N'login 630', N'login630@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183529, N'nome 631', N'login 631', N'login631@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183530, N'nome 632', N'login 632', N'login632@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183531, N'nome 633', N'login 633', N'login633@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183532, N'nome 634', N'login 634', N'login634@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183533, N'nome 635', N'login 635', N'login635@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183534, N'nome 636', N'login 636', N'login636@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183535, N'nome 637', N'login 637', N'login637@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183536, N'nome 638', N'login 638', N'login638@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183537, N'nome 639', N'login 639', N'login639@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183538, N'nome 640', N'login 640', N'login640@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183539, N'nome 641', N'login 641', N'login641@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183540, N'nome 642', N'login 642', N'login642@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183541, N'nome 643', N'login 643', N'login643@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183542, N'nome 644', N'login 644', N'login644@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183543, N'nome 645', N'login 645', N'login645@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183544, N'nome 646', N'login 646', N'login646@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183545, N'nome 647', N'login 647', N'login647@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183546, N'nome 648', N'login 648', N'login648@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183547, N'nome 649', N'login 649', N'login649@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183548, N'nome 650', N'login 650', N'login650@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183549, N'nome 651', N'login 651', N'login651@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183550, N'nome 652', N'login 652', N'login652@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183551, N'nome 653', N'login 653', N'login653@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183552, N'nome 654', N'login 654', N'login654@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183553, N'nome 655', N'login 655', N'login655@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183554, N'nome 656', N'login 656', N'login656@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183555, N'nome 657', N'login 657', N'login657@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183556, N'nome 658', N'login 658', N'login658@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183557, N'nome 659', N'login 659', N'login659@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183558, N'nome 660', N'login 660', N'login660@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183559, N'nome 661', N'login 661', N'login661@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183560, N'nome 662', N'login 662', N'login662@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183561, N'nome 663', N'login 663', N'login663@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183562, N'nome 664', N'login 664', N'login664@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183563, N'nome 665', N'login 665', N'login665@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183564, N'nome 666', N'login 666', N'login666@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183565, N'nome 667', N'login 667', N'login667@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183566, N'nome 668', N'login 668', N'login668@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183567, N'nome 669', N'login 669', N'login669@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183568, N'nome 670', N'login 670', N'login670@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183569, N'nome 671', N'login 671', N'login671@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183570, N'nome 672', N'login 672', N'login672@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183571, N'nome 673', N'login 673', N'login673@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183572, N'nome 674', N'login 674', N'login674@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183573, N'nome 675', N'login 675', N'login675@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183574, N'nome 676', N'login 676', N'login676@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183575, N'nome 677', N'login 677', N'login677@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183576, N'nome 678', N'login 678', N'login678@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183577, N'nome 679', N'login 679', N'login679@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183578, N'nome 680', N'login 680', N'login680@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183579, N'nome 681', N'login 681', N'login681@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183580, N'nome 682', N'login 682', N'login682@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183581, N'nome 683', N'login 683', N'login683@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183582, N'nome 684', N'login 684', N'login684@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183583, N'nome 685', N'login 685', N'login685@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183584, N'nome 686', N'login 686', N'login686@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183585, N'nome 687', N'login 687', N'login687@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183586, N'nome 688', N'login 688', N'login688@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183587, N'nome 689', N'login 689', N'login689@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183588, N'nome 690', N'login 690', N'login690@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183589, N'nome 691', N'login 691', N'login691@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183590, N'nome 692', N'login 692', N'login692@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183591, N'nome 693', N'login 693', N'login693@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183592, N'nome 694', N'login 694', N'login694@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183593, N'nome 695', N'login 695', N'login695@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183594, N'nome 696', N'login 696', N'login696@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183595, N'nome 697', N'login 697', N'login697@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183596, N'nome 698', N'login 698', N'login698@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183597, N'nome 699', N'login 699', N'login699@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
GO
print 'Processed 700 total records'
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183598, N'nome 700', N'login 700', N'login700@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183599, N'nome 701', N'login 701', N'login701@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183600, N'nome 702', N'login 702', N'login702@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183601, N'nome 703', N'login 703', N'login703@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183602, N'nome 704', N'login 704', N'login704@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183603, N'nome 705', N'login 705', N'login705@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183604, N'nome 706', N'login 706', N'login706@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183605, N'nome 707', N'login 707', N'login707@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183606, N'nome 708', N'login 708', N'login708@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183607, N'nome 709', N'login 709', N'login709@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183608, N'nome 710', N'login 710', N'login710@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183609, N'nome 711', N'login 711', N'login711@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183610, N'nome 712', N'login 712', N'login712@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183611, N'nome 713', N'login 713', N'login713@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183612, N'nome 714', N'login 714', N'login714@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183613, N'nome 715', N'login 715', N'login715@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183614, N'nome 716', N'login 716', N'login716@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183615, N'nome 717', N'login 717', N'login717@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183616, N'nome 718', N'login 718', N'login718@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183617, N'nome 719', N'login 719', N'login719@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183618, N'nome 720', N'login 720', N'login720@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183619, N'nome 721', N'login 721', N'login721@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183620, N'nome 722', N'login 722', N'login722@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183621, N'nome 723', N'login 723', N'login723@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183622, N'nome 724', N'login 724', N'login724@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183623, N'nome 725', N'login 725', N'login725@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183624, N'nome 726', N'login 726', N'login726@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183625, N'nome 727', N'login 727', N'login727@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183626, N'nome 728', N'login 728', N'login728@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183627, N'nome 729', N'login 729', N'login729@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183628, N'nome 730', N'login 730', N'login730@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183629, N'nome 731', N'login 731', N'login731@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183630, N'nome 732', N'login 732', N'login732@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183631, N'nome 733', N'login 733', N'login733@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183632, N'nome 734', N'login 734', N'login734@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183633, N'nome 735', N'login 735', N'login735@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183634, N'nome 736', N'login 736', N'login736@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183635, N'nome 737', N'login 737', N'login737@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183636, N'nome 738', N'login 738', N'login738@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183637, N'nome 739', N'login 739', N'login739@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183638, N'nome 740', N'login 740', N'login740@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183639, N'nome 741', N'login 741', N'login741@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183640, N'nome 742', N'login 742', N'login742@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183641, N'nome 743', N'login 743', N'login743@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183642, N'nome 744', N'login 744', N'login744@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183643, N'nome 745', N'login 745', N'login745@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183644, N'nome 746', N'login 746', N'login746@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183645, N'nome 747', N'login 747', N'login747@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183646, N'nome 748', N'login 748', N'login748@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183647, N'nome 749', N'login 749', N'login749@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183648, N'nome 750', N'login 750', N'login750@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183649, N'nome 751', N'login 751', N'login751@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183650, N'nome 752', N'login 752', N'login752@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183651, N'nome 753', N'login 753', N'login753@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183652, N'nome 754', N'login 754', N'login754@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183653, N'nome 755', N'login 755', N'login755@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183654, N'nome 756', N'login 756', N'login756@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183655, N'nome 757', N'login 757', N'login757@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183656, N'nome 758', N'login 758', N'login758@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183657, N'nome 759', N'login 759', N'login759@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183658, N'nome 760', N'login 760', N'login760@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183659, N'nome 761', N'login 761', N'login761@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183660, N'nome 762', N'login 762', N'login762@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183661, N'nome 763', N'login 763', N'login763@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183662, N'nome 764', N'login 764', N'login764@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183663, N'nome 765', N'login 765', N'login765@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183664, N'nome 766', N'login 766', N'login766@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183665, N'nome 767', N'login 767', N'login767@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183666, N'nome 768', N'login 768', N'login768@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183667, N'nome 769', N'login 769', N'login769@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183668, N'nome 770', N'login 770', N'login770@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183669, N'nome 771', N'login 771', N'login771@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183670, N'nome 772', N'login 772', N'login772@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183671, N'nome 773', N'login 773', N'login773@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183672, N'nome 774', N'login 774', N'login774@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183673, N'nome 775', N'login 775', N'login775@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183674, N'nome 776', N'login 776', N'login776@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183675, N'nome 777', N'login 777', N'login777@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183676, N'nome 778', N'login 778', N'login778@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183677, N'nome 779', N'login 779', N'login779@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183678, N'nome 780', N'login 780', N'login780@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183679, N'nome 781', N'login 781', N'login781@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183680, N'nome 782', N'login 782', N'login782@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183681, N'nome 783', N'login 783', N'login783@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183682, N'nome 784', N'login 784', N'login784@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183683, N'nome 785', N'login 785', N'login785@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183684, N'nome 786', N'login 786', N'login786@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183685, N'nome 787', N'login 787', N'login787@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183686, N'nome 788', N'login 788', N'login788@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183687, N'nome 789', N'login 789', N'login789@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183688, N'nome 790', N'login 790', N'login790@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183689, N'nome 791', N'login 791', N'login791@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183690, N'nome 792', N'login 792', N'login792@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183691, N'nome 793', N'login 793', N'login793@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183692, N'nome 794', N'login 794', N'login794@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183693, N'nome 795', N'login 795', N'login795@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183694, N'nome 796', N'login 796', N'login796@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183695, N'nome 797', N'login 797', N'login797@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183696, N'nome 798', N'login 798', N'login798@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183697, N'nome 799', N'login 799', N'login799@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183698, N'nome 800', N'login 800', N'login800@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
GO
print 'Processed 800 total records'
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183699, N'nome 801', N'login 801', N'login801@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183700, N'nome 802', N'login 802', N'login802@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183701, N'nome 803', N'login 803', N'login803@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183702, N'nome 804', N'login 804', N'login804@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183703, N'nome 805', N'login 805', N'login805@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183704, N'nome 806', N'login 806', N'login806@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183705, N'nome 807', N'login 807', N'login807@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183706, N'nome 808', N'login 808', N'login808@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183707, N'nome 809', N'login 809', N'login809@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183708, N'nome 810', N'login 810', N'login810@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183709, N'nome 811', N'login 811', N'login811@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183710, N'nome 812', N'login 812', N'login812@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183711, N'nome 813', N'login 813', N'login813@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183712, N'nome 814', N'login 814', N'login814@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183713, N'nome 815', N'login 815', N'login815@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183714, N'nome 816', N'login 816', N'login816@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183715, N'nome 817', N'login 817', N'login817@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183716, N'nome 818', N'login 818', N'login818@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183717, N'nome 819', N'login 819', N'login819@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183718, N'nome 820', N'login 820', N'login820@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183719, N'nome 821', N'login 821', N'login821@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183720, N'nome 822', N'login 822', N'login822@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183721, N'nome 823', N'login 823', N'login823@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183722, N'nome 824', N'login 824', N'login824@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183723, N'nome 825', N'login 825', N'login825@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183724, N'nome 826', N'login 826', N'login826@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183725, N'nome 827', N'login 827', N'login827@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183726, N'nome 828', N'login 828', N'login828@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183727, N'nome 829', N'login 829', N'login829@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183728, N'nome 830', N'login 830', N'login830@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183729, N'nome 831', N'login 831', N'login831@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183730, N'nome 832', N'login 832', N'login832@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183731, N'nome 833', N'login 833', N'login833@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183732, N'nome 834', N'login 834', N'login834@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183733, N'nome 835', N'login 835', N'login835@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183734, N'nome 836', N'login 836', N'login836@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183735, N'nome 837', N'login 837', N'login837@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183736, N'nome 838', N'login 838', N'login838@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183737, N'nome 839', N'login 839', N'login839@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183738, N'nome 840', N'login 840', N'login840@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183739, N'nome 841', N'login 841', N'login841@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183740, N'nome 842', N'login 842', N'login842@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183741, N'nome 843', N'login 843', N'login843@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183742, N'nome 844', N'login 844', N'login844@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183743, N'nome 845', N'login 845', N'login845@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183744, N'nome 846', N'login 846', N'login846@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183745, N'nome 847', N'login 847', N'login847@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183746, N'nome 848', N'login 848', N'login848@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183747, N'nome 849', N'login 849', N'login849@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183748, N'nome 850', N'login 850', N'login850@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183749, N'nome 851', N'login 851', N'login851@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183750, N'nome 852', N'login 852', N'login852@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183751, N'nome 853', N'login 853', N'login853@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183752, N'nome 854', N'login 854', N'login854@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183753, N'nome 855', N'login 855', N'login855@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183754, N'nome 856', N'login 856', N'login856@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183755, N'nome 857', N'login 857', N'login857@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183756, N'nome 858', N'login 858', N'login858@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183757, N'nome 859', N'login 859', N'login859@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183758, N'nome 860', N'login 860', N'login860@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183759, N'nome 861', N'login 861', N'login861@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183760, N'nome 862', N'login 862', N'login862@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183761, N'nome 863', N'login 863', N'login863@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183762, N'nome 864', N'login 864', N'login864@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183763, N'nome 865', N'login 865', N'login865@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183764, N'nome 866', N'login 866', N'login866@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183765, N'nome 867', N'login 867', N'login867@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183766, N'nome 868', N'login 868', N'login868@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183767, N'nome 869', N'login 869', N'login869@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183768, N'nome 870', N'login 870', N'login870@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183769, N'nome 871', N'login 871', N'login871@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183770, N'nome 872', N'login 872', N'login872@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183771, N'nome 873', N'login 873', N'login873@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183772, N'nome 874', N'login 874', N'login874@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183773, N'nome 875', N'login 875', N'login875@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183774, N'nome 876', N'login 876', N'login876@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183775, N'nome 877', N'login 877', N'login877@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183776, N'nome 878', N'login 878', N'login878@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183777, N'nome 879', N'login 879', N'login879@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183778, N'nome 880', N'login 880', N'login880@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183779, N'nome 881', N'login 881', N'login881@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183780, N'nome 882', N'login 882', N'login882@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183781, N'nome 883', N'login 883', N'login883@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183782, N'nome 884', N'login 884', N'login884@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183783, N'nome 885', N'login 885', N'login885@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183784, N'nome 886', N'login 886', N'login886@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183785, N'nome 887', N'login 887', N'login887@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183786, N'nome 888', N'login 888', N'login888@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183787, N'nome 889', N'login 889', N'login889@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183788, N'nome 890', N'login 890', N'login890@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183789, N'nome 891', N'login 891', N'login891@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183790, N'nome 892', N'login 892', N'login892@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183791, N'nome 893', N'login 893', N'login893@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183792, N'nome 894', N'login 894', N'login894@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183793, N'nome 895', N'login 895', N'login895@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183794, N'nome 896', N'login 896', N'login896@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183795, N'nome 897', N'login 897', N'login897@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183796, N'nome 898', N'login 898', N'login898@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183797, N'nome 899', N'login 899', N'login899@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183798, N'nome 900', N'login 900', N'login900@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183799, N'nome 901', N'login 901', N'login901@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
GO
print 'Processed 900 total records'
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183800, N'nome 902', N'login 902', N'login902@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183801, N'nome 903', N'login 903', N'login903@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183802, N'nome 904', N'login 904', N'login904@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183803, N'nome 905', N'login 905', N'login905@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183804, N'nome 906', N'login 906', N'login906@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183805, N'nome 907', N'login 907', N'login907@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183806, N'nome 908', N'login 908', N'login908@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183807, N'nome 909', N'login 909', N'login909@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183808, N'nome 910', N'login 910', N'login910@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183809, N'nome 911', N'login 911', N'login911@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183810, N'nome 912', N'login 912', N'login912@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183811, N'nome 913', N'login 913', N'login913@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183812, N'nome 914', N'login 914', N'login914@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183813, N'nome 915', N'login 915', N'login915@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183814, N'nome 916', N'login 916', N'login916@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183815, N'nome 917', N'login 917', N'login917@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183816, N'nome 918', N'login 918', N'login918@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183817, N'nome 919', N'login 919', N'login919@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183818, N'nome 920', N'login 920', N'login920@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183819, N'nome 921', N'login 921', N'login921@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183820, N'nome 922', N'login 922', N'login922@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183821, N'nome 923', N'login 923', N'login923@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183822, N'nome 924', N'login 924', N'login924@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183823, N'nome 925', N'login 925', N'login925@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183824, N'nome 926', N'login 926', N'login926@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183825, N'nome 927', N'login 927', N'login927@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183826, N'nome 928', N'login 928', N'login928@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183827, N'nome 929', N'login 929', N'login929@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183828, N'nome 930', N'login 930', N'login930@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183829, N'nome 931', N'login 931', N'login931@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183830, N'nome 932', N'login 932', N'login932@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183831, N'nome 933', N'login 933', N'login933@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183832, N'nome 934', N'login 934', N'login934@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183833, N'nome 935', N'login 935', N'login935@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183834, N'nome 936', N'login 936', N'login936@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183835, N'nome 937', N'login 937', N'login937@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183836, N'nome 938', N'login 938', N'login938@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183837, N'nome 939', N'login 939', N'login939@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183838, N'nome 940', N'login 940', N'login940@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183839, N'nome 941', N'login 941', N'login941@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183840, N'nome 942', N'login 942', N'login942@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183841, N'nome 943', N'login 943', N'login943@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183842, N'nome 944', N'login 944', N'login944@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183843, N'nome 945', N'login 945', N'login945@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183844, N'nome 946', N'login 946', N'login946@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183845, N'nome 947', N'login 947', N'login947@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183846, N'nome 948', N'login 948', N'login948@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183847, N'nome 949', N'login 949', N'login949@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183848, N'nome 950', N'login 950', N'login950@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183849, N'nome 951', N'login 951', N'login951@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183850, N'nome 952', N'login 952', N'login952@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183851, N'nome 953', N'login 953', N'login953@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183852, N'nome 954', N'login 954', N'login954@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183853, N'nome 955', N'login 955', N'login955@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183854, N'nome 956', N'login 956', N'login956@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183855, N'nome 957', N'login 957', N'login957@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183856, N'nome 958', N'login 958', N'login958@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183857, N'nome 959', N'login 959', N'login959@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183858, N'nome 960', N'login 960', N'login960@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183859, N'nome 961', N'login 961', N'login961@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183860, N'nome 962', N'login 962', N'login962@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183861, N'nome 963', N'login 963', N'login963@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183862, N'nome 964', N'login 964', N'login964@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183863, N'nome 965', N'login 965', N'login965@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183864, N'nome 966', N'login 966', N'login966@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183865, N'nome 967', N'login 967', N'login967@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183866, N'nome 968', N'login 968', N'login968@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183867, N'nome 969', N'login 969', N'login969@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183868, N'nome 970', N'login 970', N'login970@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183869, N'nome 971', N'login 971', N'login971@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183870, N'nome 972', N'login 972', N'login972@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183871, N'nome 973', N'login 973', N'login973@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183872, N'nome 974', N'login 974', N'login974@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183873, N'nome 975', N'login 975', N'login975@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183874, N'nome 976', N'login 976', N'login976@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183875, N'nome 977', N'login 977', N'login977@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183876, N'nome 978', N'login 978', N'login978@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183877, N'nome 979', N'login 979', N'login979@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183878, N'nome 980', N'login 980', N'login980@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183879, N'nome 981', N'login 981', N'login981@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183880, N'nome 982', N'login 982', N'login982@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183881, N'nome 983', N'login 983', N'login983@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183882, N'nome 984', N'login 984', N'login984@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183883, N'nome 985', N'login 985', N'login985@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183884, N'nome 986', N'login 986', N'login986@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183885, N'nome 987', N'login 987', N'login987@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183886, N'nome 988', N'login 988', N'login988@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183887, N'nome 989', N'login 989', N'login989@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183888, N'nome 990', N'login 990', N'login990@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183889, N'nome 991', N'login 991', N'login991@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183890, N'nome 992', N'login 992', N'login992@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183891, N'nome 993', N'login 993', N'login993@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183892, N'nome 994', N'login 994', N'login994@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183893, N'nome 995', N'login 995', N'login995@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183894, N'nome 996', N'login 996', N'login996@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183895, N'nome 997', N'login 997', N'login997@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183896, N'nome 998', N'login 998', N'login998@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183897, N'nome 999', N'login 999', N'login999@smarapd.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183898, N'Mauro', N'Mauro', N'Mauro', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183899, N'teste final', N'teste', N'teste@gmail.com', N'46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183900, N'Costelinha muito loco', N'costel', N'costelinha@gmail.com', N'eb2d92eac9a86d4e3ed16ee0e1223e3811eacf56705adb2233cc2a671ff32275', 0, 1, NULL)
GO
print 'Processed 1000 total records'
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183901, N'Costelaaaaaaaaaa', N'cooostela', N'costela@gmail.com', N'b6fbd675f98e2abd22d4ed29fdc83150fedc48597e92dd1a7a24381d44a27451', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183902, N'cacique', N'cacique', N'cacique@gmail.com', N'961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183903, N'COSTELA FINAL', N'costela', N'costela@gmail.com', N'961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183904, N'Costelinha ? Bacon', N'costela', N'costela@gmail.com', N'eb2d92eac9a86d4e3ed16ee0e1223e3811eacf56705adb2233cc2a671ff32275', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183905, N'Teste', N'teste', N'teste@gmail.com', N'46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183906, N'teste loader', N'teste', N'teste@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183907, N'123', N'm1', N'cadastro@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183908, N'a', N'a', N'a', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183909, N'a', N'a', N'a', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183910, N'a', N'a', N'a', N'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183911, N'a', N'a', N'a', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183912, N'aa', N'aa', N'aa', N'961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183913, N'teste', N'teste', N'teste@gmail.com', N'46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183914, N'Caique anjo do henrique', N'caique', N'caique@', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183915, N'danilo princesa do front', N'dani', N'danilo@gmai..com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183916, N'para de gora caique', N'caique', N'caique@gmai..com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183917, N'aaaaaaaaaaa', N'46546546', N'aaaa@email.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183918, N'a', N'a', N'a@a.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183919, N'dasdsa', N'dasdas', N'dasdsa', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183920, N'teste', N'teste', N'teste', N'46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183921, N'testge', N'wte', N'teste', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183922, N'aa', N'a', N'aa', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183923, N'a', N'a', N'a', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183924, N'tete', N'tete', N'tete', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183925, N'a', N'a', N'a', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183926, N's', N's', N's', N'043a718774c572bd8a25adbeb1bfcd5c0256ae11cecf9f9c3f925d0e52beaf89', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183927, N'a', N'a', N'a', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183928, N'fdsfsdf', N'fdsfsdf', N'fdsfsdf', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183929, N'Danilo', N'aa', N'a', N'61be55a8e2f6b4e172338bddf184d6dbee29c98853e0a0485ecee7f27b9af0b4', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183930, N'sadasd', N'aaa', N'aaa', N'9834876dcfb05cb167a5c24953eba58c4ac89b1adf57f28f2f9d09af107ee8f0', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183931, N'ddd', N'ddd', N'ddd', N'730f75dafd73e047b86acb2dbd74e75dcb93272fa084a9082848f2341aa1abb6', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183932, N'XXXXXXXXXXXXXXXXXXXX Masculino XXXXXXXXXXXXXXXXXXX', N'123', N'daniloguitarrari@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183933, N'222', N'333', N'333', N'4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183934, N'a', N'a', N'a', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183935, N'mauro', N'mauro', N'mauro@gmail.com', N'19e37c4dfe9a2e1570be1f4cbafca76f3ed757231c0865e02465c909d916b1d1', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183936, N'ss', N'ss', N'ss', N'a31fe9656fc8d3a459e623dc8204e6d0268f8df56d734dac3ca3262edb5db883', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183937, N'te', N'te', N'te', N'2d6c9a90dd38f6852515274cde41a8cd8e7e1a7a053835334ec7e29f61b918dd', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183938, N'teste', N'teste', N'teste', N'46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5', 0, 1, NULL)
INSERT [dbo].[Usuario] ([id], [nome], [login], [email], [senha], [superusuario], [autorizado], [imageurl]) VALUES (183939, N'vitor', N'vitor', N'email@gmail.com', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  Table [dbo].[Tipo]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo] ON
INSERT [dbo].[Tipo] ([id], [nome]) VALUES (1, N'string')
INSERT [dbo].[Tipo] ([id], [nome]) VALUES (2, N'int')
INSERT [dbo].[Tipo] ([id], [nome]) VALUES (3, N'bool')
INSERT [dbo].[Tipo] ([id], [nome]) VALUES (4, N'decimal')
INSERT [dbo].[Tipo] ([id], [nome]) VALUES (5, N'char')
INSERT [dbo].[Tipo] ([id], [nome]) VALUES (6, N'object')
SET IDENTITY_INSERT [dbo].[Tipo] OFF
/****** Object:  Table [dbo].[Tag]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON
INSERT [dbo].[Tag] ([id], [nome]) VALUES (1, N'tag 1')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (2, N'tag 2')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (3, N'henrique')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (4, N'pedro')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (5, N'Genesio')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (6, N'tag1')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (7, N'teste2')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (8, N'teste3')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (10, N'vitinho')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (11, N'nova tag')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (12, N'lalau 5')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (13, N'tag cacique pedro 1')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (14, N'tag cacique pedro 2')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (15, N'tag cacique pedro 3')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (16, N'nova tag cacique lanca fire')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (19, N'TESTE COSTELINHA 1')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (20, N'TESTE COSTELINHA 2')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (21, N'TESTE COSTELINHA 3')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (22, N'lalau on fire')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (23, N'lalau')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (24, N'teste-front-back')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (25, N'nova-tag-do-lalau')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (26, N'churrasqueira')
INSERT [dbo].[Tag] ([id], [nome]) VALUES (27, N'tags')
SET IDENTITY_INSERT [dbo].[Tag] OFF
/****** Object:  Table [dbo].[Framework]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Framework](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[icone] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Framework] ON
INSERT [dbo].[Framework] ([id], [nome], [icone]) VALUES (1, N'React', N'fab fa-react')
INSERT [dbo].[Framework] ([id], [nome], [icone]) VALUES (2, N'AngularJS', N'fab fa-angular')
SET IDENTITY_INSERT [dbo].[Framework] OFF
/****** Object:  Table [dbo].[Evento]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idcomponente] [int] NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[descricao] [varchar](350) NULL,
	[exemplo] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Evento] ON
INSERT [dbo].[Evento] ([id], [idcomponente], [nome], [descricao], [exemplo]) VALUES (5, 9, N'click', N'quando é clicado', N'click=teste()')
INSERT [dbo].[Evento] ([id], [idcomponente], [nome], [descricao], [exemplo]) VALUES (9, 100037, N'aaaaaaaaaaaaa', N'aaaaaaaaaaaaa', N'aaaaaaaaaaaaa')
INSERT [dbo].[Evento] ([id], [idcomponente], [nome], [descricao], [exemplo]) VALUES (10, 7, N'Testeddd', N'dd', N'dd')
INSERT [dbo].[Evento] ([id], [idcomponente], [nome], [descricao], [exemplo]) VALUES (11, 9, N'aaaaaaaa', NULL, NULL)
INSERT [dbo].[Evento] ([id], [idcomponente], [nome], [descricao], [exemplo]) VALUES (12, 7, N'XXX', N'xxx', N'xxx')
SET IDENTITY_INSERT [dbo].[Evento] OFF
/****** Object:  Table [dbo].[Dependencia]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dependencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[versao] [varchar](30) NOT NULL,
	[status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Dependencia] ON
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (25, N'Dependência teste 1', N'3.1', N'Ativo')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (27, N'asasa', N'asas', N'Depreciado')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (28, N'asasas', N'asasas', N'Depreciado')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (29, N'aaaaa', N'aaa', N'Ativo')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (30, N'aaaa', N'etstet', N'Depreciado')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (31, N'asdas', N'asd', N'Ativo')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (32, N'aa', N'a', N'Depreciado')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (33, N'aaa', N'aaa', N'Depreciado')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (41, N'TTTTTTT', N'2', N'Ativo')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (54, N'asdasd', N'asd', N'Ativo')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (55, N'asdasd', N'asdasd', N'Ativo')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (56, N'asdasd', N'asdsad', N'Depreciado')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (57, N'ghhgghghg', N'65', N'Ativo')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (58, N'fdgdfg', N'dfgdfg', N'Ativo')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (59, N'aaaa', N'aaa', N'Ativo')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (60, N'aaa', N'aa', N'Depreciado')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (61, N'hhhh', N'hhh', N'Depreciado')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (62, N'gfgfgf', N'5', N'Ativo')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (63, N'asdasd', N'asdasd', N'Depreciado')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (64, N'TST', N'4.1', N'Desativado')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (65, N'aaa', N'a', N'Depreciado')
INSERT [dbo].[Dependencia] ([id], [nome], [versao], [status]) VALUES (66, N'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', N'222222222222222222222222222222', N'Ativo')
SET IDENTITY_INSERT [dbo].[Dependencia] OFF
/****** Object:  Table [dbo].[Componente]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Componente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idusuario] [int] NOT NULL,
	[idcategoria] [int] NOT NULL,
	[idframework] [int] NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[descricao] [varchar](1000) NULL,
	[exemplo] [text] NULL,
	[observacao] [text] NULL,
	[arquivo] [varchar](150) NULL,
	[publicado] [bit] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[imageurl] [varchar](500) NULL,
	[datacriacao] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Componente] ON
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (3, 1, 1, 1, N'string', N'string', N'string', N'string', N'string', 0, N'string', N'string', CAST(0x07709BBABF88683F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (5, 1, 1, 1, N'Componente Teste', N'Componente criado para testes', N'<teste>Olá Mundo</teste>', N'Lalau', N'teste-teste.js', 0, N'Em Teste', N'www.gogris.com/lalau', CAST(0x07709BBABF88683F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (7, 1, 1, 1, N'Teste 3', N'Teste 3', N'<teste3></teste3>', N'Teste 3', N'teste3.js', 1, N'Em Teste', N'N/A', CAST(0x07709BBABF88683F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (9, 1, 1, 2, N'Componente Params', N'Componente', N'<componente></componente>', N'string', N'componente.js', 0, N'Teste', N'string', CAST(0x07709BBABF88683F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100012, 1, 1, 1, N'string', N'string', N'string', N'string', N'string', 1, N'string', N'string', CAST(0x07709BBABF88683F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100014, 1, 1, 1, N'dasdasd', N'asdas', N'dasdasd', N'dasdas', N'dasda', 1, N'asdasd', N'dasdasd', CAST(0x07709BBABF88683F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100033, 1, 1, 2, N'Churrasqueira', N'Churrasqueira de controle remoto', N'<churrasqueira ligar=''ligarChurrasqueira()'' cor=''preta''></churrasqueira>', N'Ter bombeiros nas redondezas', N'churras.js', 1, N'Depreciado', N'http:\\pd-07:9980\images\faustop.jpg', CAST(0x07B027E846856B3F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100034, 1, 1, 1, N'aaaaa', N'aaaaa', NULL, NULL, N'aaaa', 0, N'Depreciado', N'http:\\pd-07:9980\images\5f556556-5f78-4cbb-9035-45d7bd53a08c', CAST(0x0700EC686F546C3F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100035, 1, 47, 2, N'fasdasdasdasd', N'asdasdasdas', NULL, NULL, N'asdasdasdas', 1, N'Ativo', N'http:\\pd-07:9980\images\c09c4611-35dd-4a0b-89ca-3da6d9a136b0', CAST(0x070084F6C95B6C3F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100036, 1, 1, 1, N'Componente Teste', N'Descrição', NULL, NULL, N'Arquivo', 1, N'Ativo', NULL, CAST(0x0700B56A0E5E6C3F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100037, 1, 1, 1, N'Componente Teste 2', N'Descrição', N'Exemplo', N'Observação', N'Arquivo', 1, N'Ativo', NULL, CAST(0x0700FD5B4D5E6C3F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100038, 1, 1, 2, N'asdasd', N'aaaa', NULL, NULL, N'aaaa', 0, N'Ativo', N'http:\\pd-07:9980\images\3f01289f-9e5d-4fb8-ac4d-698e6db0b81a', CAST(0x0730D3EC02626C3F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100041, 1, 1, 1, N'FAUSTOPPER DEUS', N'CHURRASQUEIRA ELETRICA', NULL, NULL, N'faustopper.js', 0, N'Ativo', N'http:\\pd-07:9980\images\f0dbc5d1-9777-4bbf-9bbd-5df64c659225.jpg', CAST(0x07E0D51CD3866C3F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100042, 1, 1, 2, N'a', N'a', NULL, NULL, N'a', 0, N'Ativo', N'http:\\pd-07:9982\7dc2652e-0c6e-40e0-bf21-2d055e9a1549.jpg', CAST(0x0700E158EC886C3F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100043, 1, 1, 2, N'aaaaa', N'aaaaaaa', NULL, NULL, N'aaaa', 0, N'Ativo', N'http:\\pd-07:9982\e5a0af4a-cdaa-4c22-a37a-101d2c11518b.jpg', CAST(0x0750FEFE3F8B6C3F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100044, 1, 1, 1, N'dasdas', N'aaaa', NULL, NULL, N'a', 0, N'Ativo', N'http:\\pd-07:9982\73d318ab-b296-444d-a707-8ccc9b655f85.jpg', CAST(0x07100315658B6C3F0B AS DateTime2))
INSERT [dbo].[Componente] ([id], [idusuario], [idcategoria], [idframework], [nome], [descricao], [exemplo], [observacao], [arquivo], [publicado], [status], [imageurl], [datacriacao]) VALUES (100045, 1, 43, 2, N'aaaaaaadasdasd', N'dasdasdasdas', NULL, NULL, N'asdasdasda', 0, N'Ativo', N'http:\\pd-07:9982\f0d06793-0d0d-4e2b-9548-c84d1c5b1fbc.png', CAST(0x0710F9ACC28B6C3F0B AS DateTime2))
SET IDENTITY_INSERT [dbo].[Componente] OFF
/****** Object:  Table [dbo].[ParametroEvento]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParametroEvento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idevento] [int] NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[descricao] [varchar](350) NULL,
	[obrigatorio] [bit] NOT NULL,
	[idtipo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ParametroEvento] ON
INSERT [dbo].[ParametroEvento] ([id], [idevento], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (10, 5, N'color', N'cor do texto', 0, 1)
INSERT [dbo].[ParametroEvento] ([id], [idevento], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (11, 5, N'background-color', N'cor dos fundo', 0, 1)
INSERT [dbo].[ParametroEvento] ([id], [idevento], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (14, 9, N'aaaaaaaaaaaaa', N'aaaaaaaaaaaaa', 1, 1)
INSERT [dbo].[ParametroEvento] ([id], [idevento], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (15, 10, N'dd', N'dd', 1, 6)
INSERT [dbo].[ParametroEvento] ([id], [idevento], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (16, 12, N'xxx', N'xxxx', 1, 5)
INSERT [dbo].[ParametroEvento] ([id], [idevento], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (17, 11, N'bbbbb', NULL, 0, 3)
SET IDENTITY_INSERT [dbo].[ParametroEvento] OFF
/****** Object:  Table [dbo].[Parametro]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parametro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idcomponente] [int] NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[descricao] [varchar](350) NULL,
	[obrigatorio] [bit] NOT NULL,
	[idtipo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Parametro] ON
INSERT [dbo].[Parametro] ([id], [idcomponente], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (3, 3, N'string', N'string', 1, 1)
INSERT [dbo].[Parametro] ([id], [idcomponente], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (4, 9, N'icon', N'Ícone do negocio lá', 0, 1)
INSERT [dbo].[Parametro] ([id], [idcomponente], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (7, 5, N'text', N'string', 1, 1)
INSERT [dbo].[Parametro] ([id], [idcomponente], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (12, 9, N'type', N'tipo', 0, 1)
INSERT [dbo].[Parametro] ([id], [idcomponente], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (14, 100012, N'string', N'string', 1, 1)
INSERT [dbo].[Parametro] ([id], [idcomponente], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (17, 100014, N'string', N'string', 1, 1)
INSERT [dbo].[Parametro] ([id], [idcomponente], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (25, 100033, N'cor', N'Cor da churrasqueira', 1, 1)
INSERT [dbo].[Parametro] ([id], [idcomponente], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (27, 100037, N'aaaaaaaaaaaa', N'aaaaaaaaaaaaaaa', 1, 1)
INSERT [dbo].[Parametro] ([id], [idcomponente], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (28, 7, N'Testedd', N'd', 1, 4)
INSERT [dbo].[Parametro] ([id], [idcomponente], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (30, 9, N'teste 2', NULL, 0, 1)
INSERT [dbo].[Parametro] ([id], [idcomponente], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (31, 9, N'aaaa', NULL, 0, 3)
INSERT [dbo].[Parametro] ([id], [idcomponente], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (32, 9, N'aaaaaaaaaaa', N'aaaaaaaaaaaaaa', 1, 1)
SET IDENTITY_INSERT [dbo].[Parametro] OFF
/****** Object:  Table [dbo].[Metodo]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Metodo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idcomponente] [int] NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[descricao] [varchar](350) NULL,
	[retorno] [varchar](50) NULL,
	[exemplo] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Metodo] ON
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (48, 9, N'aaa', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (49, 9, N'aaaaaaa', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (50, 9, N'bbbbbbb', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (51, 9, N'cccccc', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (52, 9, N'aaa', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (53, 9, N'aaaaa', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (54, 9, N'dsadsadas', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (55, 9, N'fdsfds', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (56, 9, N'dsadsadasdas', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (57, 9, N'dsadsadasdas', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (58, 9, N'dsadsadasdas', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (59, 9, N'dsadsadasdas', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (60, 9, N'dsadsadasdas', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (61, 9, N'hjfgj', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (62, 9, N'aaa', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (63, 9, N'aaa', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (64, 9, N'aaa', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (65, 9, N'aaaa', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (66, 9, N'aaaaa', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (67, 100037, N'aaaaaaaaaaaaa', N'aaaaaaaaaaaaa', N'aaaaaaaaaaaaa', N'aaaaaaaaaaaaa')
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (68, 7, N'testeddd', N'dd', N'ddd', N'ddd')
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (69, 9, N'aaaa', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (70, 9, N'leandro quebra cano', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (71, 9, N'poxa vida', NULL, NULL, NULL)
INSERT [dbo].[Metodo] ([id], [idcomponente], [nome], [descricao], [retorno], [exemplo]) VALUES (72, 9, N'teste', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Metodo] OFF
/****** Object:  Table [dbo].[ComponenteTag]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponenteTag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idcomponente] [int] NOT NULL,
	[idtag] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ComponenteTag] ON
INSERT [dbo].[ComponenteTag] ([id], [idcomponente], [idtag]) VALUES (3, 7, 3)
INSERT [dbo].[ComponenteTag] ([id], [idcomponente], [idtag]) VALUES (4, 7, 5)
INSERT [dbo].[ComponenteTag] ([id], [idcomponente], [idtag]) VALUES (27, 100012, 20)
INSERT [dbo].[ComponenteTag] ([id], [idcomponente], [idtag]) VALUES (31, 100014, 19)
INSERT [dbo].[ComponenteTag] ([id], [idcomponente], [idtag]) VALUES (32, 100014, 22)
INSERT [dbo].[ComponenteTag] ([id], [idcomponente], [idtag]) VALUES (46, 100033, 26)
INSERT [dbo].[ComponenteTag] ([id], [idcomponente], [idtag]) VALUES (47, 100037, 27)
SET IDENTITY_INSERT [dbo].[ComponenteTag] OFF
/****** Object:  Table [dbo].[ComponenteDependencia]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponenteDependencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[iddependencia] [int] NOT NULL,
	[idcomponente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParametroMetodo]    Script Date: 03/15/2019 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParametroMetodo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idmetodo] [int] NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[descricao] [varchar](350) NULL,
	[obrigatorio] [bit] NOT NULL,
	[idtipo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ParametroMetodo] ON
INSERT [dbo].[ParametroMetodo] ([id], [idmetodo], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (51, 48, N'aaa', NULL, 0, 3)
INSERT [dbo].[ParametroMetodo] ([id], [idmetodo], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (52, 49, N'aaaaaaa', NULL, 0, 4)
INSERT [dbo].[ParametroMetodo] ([id], [idmetodo], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (53, 50, N'bbbbbb', NULL, 0, 3)
INSERT [dbo].[ParametroMetodo] ([id], [idmetodo], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (54, 51, N'dddddddd', N'dddddddd', 0, 3)
INSERT [dbo].[ParametroMetodo] ([id], [idmetodo], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (55, 52, N'aaaaaa', NULL, 0, 2)
INSERT [dbo].[ParametroMetodo] ([id], [idmetodo], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (56, 64, N'aa', NULL, 0, 3)
INSERT [dbo].[ParametroMetodo] ([id], [idmetodo], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (57, 65, N'aaa', NULL, 0, 3)
INSERT [dbo].[ParametroMetodo] ([id], [idmetodo], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (58, 65, N'aaa', NULL, 0, 1)
INSERT [dbo].[ParametroMetodo] ([id], [idmetodo], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (59, 66, N'aaa', NULL, 0, 2)
INSERT [dbo].[ParametroMetodo] ([id], [idmetodo], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (60, 67, N'aaaaaaaaaaaaa', N'aaaaaaaaaaaaa', 1, 1)
INSERT [dbo].[ParametroMetodo] ([id], [idmetodo], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (61, 68, N'dd', N'dddd', 1, 6)
INSERT [dbo].[ParametroMetodo] ([id], [idmetodo], [nome], [descricao], [obrigatorio], [idtipo]) VALUES (62, 71, N'aaa', NULL, 0, 3)
SET IDENTITY_INSERT [dbo].[ParametroMetodo] OFF
/****** Object:  Default [DF__Usuario__superus__465E457E]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [superusuario]
GO
/****** Object:  Default [DF__Usuario__autoriz__475269B7]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [autorizado]
GO
/****** Object:  Default [DF__Component__publi__39F86E99]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente] ADD  DEFAULT ((0)) FOR [publicado]
GO
/****** Object:  Default [DF__Component__datac__3C9FD11A]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente] ADD  DEFAULT (getdate()) FOR [datacriacao]
GO
/****** Object:  Default [DF__Parametro__obrig__25F175EC]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ParametroEvento] ADD  DEFAULT ((0)) FOR [obrigatorio]
GO
/****** Object:  Default [DF__Parametro__obrig__1C680BB2]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Parametro] ADD  DEFAULT ((0)) FOR [obrigatorio]
GO
/****** Object:  Default [DF__Parametro__obrig__212CC0CF]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ParametroMetodo] ADD  DEFAULT ((0)) FOR [obrigatorio]
GO
/****** Object:  ForeignKey [FK__Component__idcat__0643C069]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD FOREIGN KEY([idcategoria])
REFERENCES [dbo].[Categoria] ([id])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Component__idcat__493AB229]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD FOREIGN KEY([idcategoria])
REFERENCES [dbo].[Categoria] ([id])
GO
/****** Object:  ForeignKey [FK__Component__idfra__0737E4A2]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD FOREIGN KEY([idframework])
REFERENCES [dbo].[Framework] ([id])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Component__idfra__4A2ED662]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD FOREIGN KEY([idframework])
REFERENCES [dbo].[Framework] ([id])
GO
/****** Object:  ForeignKey [FK__Component__idusu__054F9C30]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuario] ([id])
GO
/****** Object:  ForeignKey [FK__Component__idusu__0DE4E231]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuario] ([id])
GO
/****** Object:  ForeignKey [FK__Component__idusu__167A2832]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuario] ([id])
GO
/****** Object:  ForeignKey [FK__Component__idusu__1F0F6E33]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuario] ([id])
GO
/****** Object:  ForeignKey [FK__Component__idusu__27A4B434]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuario] ([id])
GO
/****** Object:  ForeignKey [FK__Component__idusu__3039FA35]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuario] ([id])
GO
/****** Object:  ForeignKey [FK__Component__idusu__322242A7]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuario] ([id])
GO
/****** Object:  ForeignKey [FK__Component__idusu__48468DF0]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuario] ([id])
GO
/****** Object:  ForeignKey [FK__Parametro__ideve__045B77F7]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ParametroEvento]  WITH CHECK ADD FOREIGN KEY([idevento])
REFERENCES [dbo].[Evento] ([id])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Parametro__ideve__4FE7AFB8]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ParametroEvento]  WITH CHECK ADD FOREIGN KEY([idevento])
REFERENCES [dbo].[Evento] ([id])
GO
/****** Object:  ForeignKey [FK__Parametro__idtip__4258AA70]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ParametroEvento]  WITH CHECK ADD FOREIGN KEY([idtipo])
REFERENCES [dbo].[Tipo] ([id])
GO
/****** Object:  ForeignKey [FK__Parametro__idcom__0B087586]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Parametro]  WITH CHECK ADD FOREIGN KEY([idcomponente])
REFERENCES [dbo].[Componente] ([id])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Parametro__idcom__4DFF6746]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Parametro]  WITH CHECK ADD FOREIGN KEY([idcomponente])
REFERENCES [dbo].[Componente] ([id])
GO
/****** Object:  ForeignKey [FK__Parametro__idtip__434CCEA9]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Parametro]  WITH CHECK ADD FOREIGN KEY([idtipo])
REFERENCES [dbo].[Tipo] ([id])
GO
/****** Object:  ForeignKey [FK__Metodo__idcompon__008AE713]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Metodo]  WITH CHECK ADD FOREIGN KEY([idcomponente])
REFERENCES [dbo].[Componente] ([id])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Metodo__idcompon__4D0B430D]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[Metodo]  WITH CHECK ADD FOREIGN KEY([idcomponente])
REFERENCES [dbo].[Componente] ([id])
GO
/****** Object:  ForeignKey [FK__Component__idcom__082C08DB]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ComponenteTag]  WITH CHECK ADD FOREIGN KEY([idcomponente])
REFERENCES [dbo].[Componente] ([id])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Component__idcom__4B22FA9B]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ComponenteTag]  WITH CHECK ADD FOREIGN KEY([idcomponente])
REFERENCES [dbo].[Componente] ([id])
GO
/****** Object:  ForeignKey [FK__Component__idtag__09202D14]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ComponenteTag]  WITH CHECK ADD FOREIGN KEY([idtag])
REFERENCES [dbo].[Tag] ([id])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Component__idtag__4C171ED4]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ComponenteTag]  WITH CHECK ADD FOREIGN KEY([idtag])
REFERENCES [dbo].[Tag] ([id])
GO
/****** Object:  ForeignKey [FK__Component__idcom__4905A7FF]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ComponenteDependencia]  WITH CHECK ADD FOREIGN KEY([idcomponente])
REFERENCES [dbo].[Componente] ([id])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Component__iddep__481183C6]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ComponenteDependencia]  WITH CHECK ADD FOREIGN KEY([iddependencia])
REFERENCES [dbo].[Dependencia] ([id])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Parametro__idmet__017F0B4C]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ParametroMetodo]  WITH CHECK ADD FOREIGN KEY([idmetodo])
REFERENCES [dbo].[Metodo] ([id])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Parametro__idmet__4EF38B7F]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ParametroMetodo]  WITH CHECK ADD FOREIGN KEY([idmetodo])
REFERENCES [dbo].[Metodo] ([id])
GO
/****** Object:  ForeignKey [FK__Parametro__idtip__41648637]    Script Date: 03/15/2019 17:45:27 ******/
ALTER TABLE [dbo].[ParametroMetodo]  WITH CHECK ADD FOREIGN KEY([idtipo])
REFERENCES [dbo].[Tipo] ([id])
GO
