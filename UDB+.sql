USE [master]
GO
/****** Object:  Database [UDB]    Script Date: 12/6/2023 16:31:38 ******/
CREATE DATABASE [UDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [UDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UDB] SET RECOVERY FULL 
GO
ALTER DATABASE [UDB] SET  MULTI_USER 
GO
ALTER DATABASE [UDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UDB', N'ON'
GO
ALTER DATABASE [UDB] SET QUERY_STORE = OFF
GO
USE [UDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Career]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Career](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Profession] [nvarchar](max) NOT NULL,
	[CareerImage] [nvarchar](max) NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Career] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CareerCategory]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareerCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CareerId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_CareerCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatalogName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Form]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Form](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Form] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormHelp]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormHelp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FormId] [int] NOT NULL,
	[HelpId] [int] NOT NULL,
 CONSTRAINT [PK_FormHelp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Help]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Help](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HelpName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Help] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notice]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Occurrence] [nvarchar](max) NOT NULL,
	[OccurrenceImage] [nvarchar](max) NULL,
	[Descripcion1] [nvarchar](max) NOT NULL,
	[Publicationdate] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Notice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoticeCatalog]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoticeCatalog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NoticeId] [int] NOT NULL,
	[CatalogId] [int] NOT NULL,
 CONSTRAINT [PK_NoticeCatalog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presenation]    Script Date: 12/6/2023 16:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presenation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Vision] [nvarchar](max) NOT NULL,
	[Mision] [nvarchar](max) NULL,
 CONSTRAINT [PK_Presenation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230610021025_init', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230611185054_mig2', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230611231154_mig3', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230611232241_mig3', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230611234137_mig3', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230611235107_mig3', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230612052222_mig5', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230612054736_mig3', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230612195511_mig7', N'6.0.10')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5ee3101f-5a94-4c9d-b46d-0aec09b27541', N'Admin', N'ADMIN', N'adbf321b-e454-493e-94f2-172a64d48bd2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a47b5cce-d806-44dd-80c4-6d199c476dbf', N'5ee3101f-5a94-4c9d-b46d-0aec09b27541')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Name], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a47b5cce-d806-44dd-80c4-6d199c476dbf', N'UDB', N'UDB', N'UDB', N'udb@gmail.com', N'UDB@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEODgog0ja8oTIxcvyxy/TBqAXg98c8Yy8Rrn/tIq01z9o3gtRgvjd+GsCdwtdtngQw==', N'TL3QQ6EBFF5P7NU52NGJIPTNDA7GJHWG', N'3f733d15-aa6b-4cba-883a-1d701c5a3c1e', NULL, 1, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Career] ON 

INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1, N'INGENIERIA ELECTRONICA ', N'babab647-473b-4159-881a-c37f734e11c9.jpg', N'Formar profesionales en el campo de la electrónica y el control industrial que impacten de manera positiva en el desarrollo industrial, tecnológico, académico y científico del país, con competencias para la automatización y optimización de procesos, la autogestión y la dirección de equipos de trabajo multidisciplinarios y con una elevada sensibilidad a los problemas sociales, humanos y ambientales para la toma de conciencia y una actuación ética basada en principios y valores universales.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (3, N'INGENIERIA INDUSTRIAL', N'1a4f3d7e-98e3-4c9e-bd71-745bf3479c8b.jpg', N'El/la Ingeniero/a Industrial de la Universidad Don Bosco, es el profesional que diseña, implementa, administra, mejora y optimiza los sistemas productivos de bienes y/o servicios gestionando los recursos humanos, tecnológicos y financieros. Se integra al trabajo de equipos multidisciplinarios, actualizándose permanentemente y desenvolviéndose con actitud emprendedora, mostrando valores éticos en su relación con las personas y con el medio ambiente, con vocación de servicio a la sociedad a partir del carisma salesiano, contribuyendo al progreso social y económico del país.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1002, N'INGENIERÍA BIOMÉDICA', N'2d2645b5-1541-453a-ae3a-bfc4a7b1e3ca.jpg', N'El/la Ingeniero/a Biomédico/a graduado de la Universidad Don Bosco es el profesional que gestiona tecnologías médicas de instrumentación e ingeniería clínica a través de proyectos clínicos hospitalarios, considerando la innovación y el cumplimiento de los estándares, normativas y regulaciones vigentes. Además, desarrolla soluciones biomédicas con aplicación informática, determinando su factibilidad técnica y económica, a partir de las necesidades en el ámbito del cuidado de la salud.  Se espera que el ingenierio biomédico sea un profesional ético, crítico y proactivo, líder y emprendedor, fundamentado en el carisma Salesiano para la búsqueda de la verdad, mediante el diálogo con la realidad, con la conciencia social y medioambiental.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1003, N'INGENIERÍA ELÉCTRICA', N'd82ec5bb-d2a0-441e-ac9a-697704a041e4.jpg', N'El/la Ingeniero/a Electricista de la Universidad Don Bosco es el profesional que gestiona, formula y evalúa proyectos de energía, para proponer soluciones a la problemática energética nacional y regional; desarrollando técnicas y metodologías en el análisis, operación, optimización y control de los sistemas de potencia. Además de diseñar y administrar obras eléctricas y sistemas de automatización para el control de procesos industriales. Se espera que participe de forma activa en el desarrollo local y regional, caracterizándose por su papel como agente de desarrollo social con criterio ético e innovador, basado en los principios salesianos.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1004, N'INGENIERÍA EN AERONÁUTICA', N'04ff1cfa-a6c5-4684-92e7-ea101265235a.jpg', N'Ofrecer a la región profesionales especializados en ingeniería aeronáutica, proporcionando una fuerte formación en las áreas de diseño y manufactura, ingeniería de operaciones del transporte aéreo, mantenimiento de aeronaves, desarrollo de proyectos y negocios aeronáuticos con una preparación académica tal que satisfagan los requisitos de eficiencia en las actividades inherentes a su campo, tanto en aspectos eminentemente tecnoloógicos, como administrativos.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1005, N'LICENCIATURA EN DISEÑO GRÁFICO', N'eec14035-2b17-48ae-aa72-6a5d228f1eb2.jpg', N'El estudiante que ingresa al programa de la Licenciatura en Diseño Gráfico de la Universidad Don Bosco es una persona interesada en los procesos de comunicación humana realizados a través de signos visuales; tiene vocación hacia el orden, estética y la búsqueda de soluciones alternativas a los problemas. Es capaz de comprender e interpretar los hechos o información, realizar razonamientos verbales y aportar ideas en las soluciones lógicas de problemas de comunicación que incidan a la sociedad.  Además se espera que muestre sensibilidad social y medioambiental; se integre al trabajo en equipo, evidenciando apertura al conocimiento y a las nuevas ideas.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1006, N'LICENCIATURA EN IDIOMAS CON ESPECIALIDAD EN TURISMO', N'0aac51a8-c313-48d9-9a39-d152a9b262b8.jpg', N'El Licenciado en Idiomas con especialidad en Turismo es un gestor y asesor de turismo que domina la lengua inglesa y francesa, además del español, y está capacitado para facilitar intercambios culturales entre personas y organismos en áreas relacionadas al turismo local e internacional. Domina los ámbitos de la comunicación efectiva en diversas situaciones culturales, académicas y profesionales; así como los ámbitos de asesoría y gestión en el turismo. Su formación en el área de los idiomas garantiza el manejo eficiente de las lenguas desde consideraciones estratégicas, gramaticales y socioculturales. Su formación en el área de turismo le permite diseñar y emprender proyectos y servicios turísticos innovadores con criterios de rentabilidad y sostenibilidad, posicionando el turismo de su país de forma competitiva en el mercado local e internacional.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1007, N'LICENCIATURA EN MARKETING', N'b5d411cd-6f21-41d4-97b4-950598c41df9.jpg', N'El/la profesional en Licenciatura en Mercadotecnia puede desempeñarse tanto en empresas públicas como privadas, ya sean estas: comerciales, industriales o de servicios y también tendrá la capacidad de crear y desarrollar sus propias empresas; dentro de estas podrá desarrollarse como gerente de marketing, gerente de ventas, gerente de marca, ejecutivo sde agencias de publicidad, asesor en proyectos en empresas públicas y privadas, consultor e investigador y otras tareas afines al área de la mercadotecnia.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1008, N'LICENCIATURA EN ADMINISTRACIÓN DE EMPRESAS', N'f0aff123-5217-47d5-9a1f-b76a31bb46f0.jpg', N'El/la Licenciado/a en Administración de Empresas de la Universidad Don Bosco, es un profesional que aplica eficientemente el proceso administrativo en todo tipo de empresas, utilizando herramientas técnicas y tecnológicas del ámbito administrativo, en las funciones financieras, mercadológicas, de investigación, de recursos humanos y de logística, para lograr eficazmente el desarrollo gerencial y optimizar la productividad organizacional, gestionando efectivamente los riesgos de negocios.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1009, N'LICENCIATURA EN TEOLOGÍA PASTORAL', N'c7a39524-7c68-4fdf-a004-2a641909d387.jpg', N'as personas graduadas de este programa de estudio podrán desempeñarse en las siguientes áreas: docencia e investigación a nivel medio y superior, coordinación de procesos pastorales en centros educativos de inspiración cristiana y en parroquias. Además, tiene las competencias necesarias para diseñar, elaborar y ejecutar planes de formación humana y religiosa (moral, cívica, en valores) en los centros educativos, así como también, la capacidad de dar seguimiento y evaluarlos. Es competente para formar, acompañar y asesorar a los responsables de la educación moral y formación en valores en esos mismos centros educativos.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1010, N'TÉCNICO EN INGENIERÍA MECÁNICA', N'56b5ee50-577c-4986-83a4-6d8783ec0c44.jpg', N'El/la Técnico/a en Ingeniería Mecánica graduado de la Universidad Don Bosco, es el profesional que aplica las técnicas de diseño, manufactura, simula y automatiza elementos mecánicos empleando máquinas herramientas para la solución de problemas de ingeniería. Además, desarrolla actividades de planificación y aplicación del mantenimiento, dirigido al soporte técnico de sistemas mecánicos mediante el diagnóstico y reparación de maquinaria o equipo industrial.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1011, N'TÉCNICO EN MULTIMEDIA', N'6ae8b686-4194-4772-88e1-f4fb43266636.jpg', N'Formar profesionales que manejen con efectividad y eficacia los distintos recursos tecnológicos que se le presentan, esto para que produzcan mensajes éticos que no atenten contra la dignidad del ser humano, no inciten a la destrucción del medio ambiente y todos los recursos naturales. Al contrario, que con un toque creativo y con criterio crítico, pueda hacer uso efectivo de todos los medios, recursos y estrategias de comunicación existentes. Así mismo, tenga una base de formación que incite al emprendedurismo para atender necesidades que se presente de parte de cualquier organización tanto a nivel nacional como internacional.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1012, N'TÉCNICO EN ORTESIS Y PRÓTESIS (SEMI-PRESENCIAL)', N'506aac97-131c-4101-bbf1-80b5d6ec94b5.jpg', N'El/La Técnico/a en Ortesis y Prótesis debe ser un profesional abierto ante las nuevas aplicaciones y desarrollos en la ortopedia técnica; capaz de entender el alcance de las innovaciones en dicho campo; conoce y comprende el comportamiento de los materiales para utilizarlos de manera óptima. El profesional de Ortesis y Prótesis podrá ser contratado como técnico en Ortesis y Prótesis para la elaboración, adaptación y ajustes de los diferentes aparatos ortoprotésicos. También, en el área de logística en la venta y distribución de materiales y componentes para la fabricación de los mismos.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1013, N'TÉCNICO EN INGENIERÍA EN COMPUTACIÓN', N'fc308ca9-cbcf-4b2f-ba93-3ee0b0a39d44.jpg', N'El Técnico en Ingeniería en Computación, graduado de la Universidad Don Bosco, es el profesional que desarrolla y documenta aplicaciones nativas, web, de escritorio y en entorno para dispositivos móviles, basadas en tecnologías emergentes. Además; apoya en la administración de la estructura física, seguridad, configuración y virtualización de servicios en redes de área local, redes de área amplia y computación en la nube.  Asimismo, se espera que el Técnico en Ingeniería en Computación tome decisiones, trabaje de forma colaborativa y comprometida como parte de un equipo multidisciplinario en el desarrollo de proyectos tecnológicos globales, que sea emprendedor y con deseos de superación personal y profesional, que se adapta a los cambios de la globalización, teniendo siempre en cuenta los principios salesianos.')
INSERT [dbo].[Career] ([Id], [Profession], [CareerImage], [Descripcion]) VALUES (1014, N'TÉCNICO EN CONTROL DE LA CALIDAD', N'1f1b74f2-38ca-4b27-aa69-55eef8c58420.jpg', N'El Técnico/a en Control de la Calidad graduado/a de la Universidad Don Bosco implementa y mantiene un sistema de gestión aplicando gestión de procesos, herramientas de calidad, control estadístico, metrología y auditorías impulsando el desarrollo empresarial. Además aplica la mejora continua de procesos y reducción de riegos, apoyados en la gestión de costos y proyectos que integren la seguridad y salud ocupacional y la gestión medioambiental. Se espera que tome decisiones con criterio profesional, ejerza el liderazgo y busque enfocar las actividades de la empresa hacia la responsabilidad social y el desarrollo sustentable, actuando frente a las necesidades del contexto social según los principios salesianos.')
SET IDENTITY_INSERT [dbo].[Career] OFF
GO
SET IDENTITY_INSERT [dbo].[CareerCategory] ON 

INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1, 1, 1)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (3, 3, 1)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1002, 1002, 1)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1003, 1003, 1)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1004, 1004, 1)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1005, 1005, 2)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1006, 1006, 2)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1007, 1007, 2)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1008, 1008, 2)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1009, 1009, 2)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1010, 1010, 3)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1011, 1011, 3)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1012, 1012, 3)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1013, 1013, 3)
INSERT [dbo].[CareerCategory] ([Id], [CareerId], [CategoryId]) VALUES (1014, 1014, 3)
SET IDENTITY_INSERT [dbo].[CareerCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalog] ON 

INSERT [dbo].[Catalog] ([Id], [CatalogName]) VALUES (1, N'Deportes')
INSERT [dbo].[Catalog] ([Id], [CatalogName]) VALUES (2, N'Informativa')
INSERT [dbo].[Catalog] ([Id], [CatalogName]) VALUES (3, N'Estudiantil')
SET IDENTITY_INSERT [dbo].[Catalog] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (1, N'Ingenieria')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (2, N'Licenciatura')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (3, N'Técnico')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Form] ON 

INSERT [dbo].[Form] ([Id], [Email], [Question]) VALUES (1, N'moran.gerardo18082000@hotmail.com', N'SADASDSAD')
SET IDENTITY_INSERT [dbo].[Form] OFF
GO
SET IDENTITY_INSERT [dbo].[FormHelp] ON 

INSERT [dbo].[FormHelp] ([Id], [FormId], [HelpId]) VALUES (1, 1, 2)
SET IDENTITY_INSERT [dbo].[FormHelp] OFF
GO
SET IDENTITY_INSERT [dbo].[Help] ON 

INSERT [dbo].[Help] ([Id], [HelpName]) VALUES (2, N'Felicitación')
INSERT [dbo].[Help] ([Id], [HelpName]) VALUES (3, N'Inscripción')
INSERT [dbo].[Help] ([Id], [HelpName]) VALUES (4, N'Queja')
SET IDENTITY_INSERT [dbo].[Help] OFF
GO
SET IDENTITY_INSERT [dbo].[Notice] ON 

INSERT [dbo].[Notice] ([Id], [Occurrence], [OccurrenceImage], [Descripcion1], [Publicationdate]) VALUES (1, N'ESTUDIANTES DE LA ESCUELA DE DISEÑO GRÁFICO E INDUSTRIAL DESARROLLAN PROYECTOS MEDIANTE EL DISEÑO CENTRADO EN LAS PERSONAS', N'f143479d-bd26-41bb-9c96-b2cab3e9e24f.jpg', N'Los alumnos de la Escuela de Diseño Gráfico e Industrial de la Universidad Don Bosco, desarrollaron una serie de proyectos utilizando el concepto Diseño Centrado en las Personas DCP, con el objetivo de dar respuesta a problemáticas sociales.  El DCP, es un proceso y conjunto de técnicas empleadas para proponer soluciones innovadoras al mundo, por medio del uso de productos, servicios, espacios, organizaciones y modos de interacción. Su realización, tiene en cuenta tres importantes aspectos que son: deseabilidad, factibilidad y viabilidad. El primero de ellos, orientado a qué desea la sociedad; el segundo, a qué es técnica y la factibilidad organizacional; y el último, relacionado a la viabilidad económica de los proyectos.', N'09 de Jun, 2023')
INSERT [dbo].[Notice] ([Id], [Occurrence], [OccurrenceImage], [Descripcion1], [Publicationdate]) VALUES (2, N'JÓVENES SON BENEFICIADOS CON BECAS UNIVERSITARIAS PARA ESTUDIOS DE INGENIERÍA GRACIAS AL PROYECTO ALTO IMPACTO SOYAPANGO', N'04440d6f-06c8-41d1-9962-dd29b9cf71fc.jpg', N'Como parte de las acciones del Proyecto Alto Impacto Soyapango, implementado por la Fundación Rafael Meza Ayau (FRMA), con el financiamiento de la Agencia de los Estados Unidos para el Desarrollo Internacional (USAID), se realizó la entrega de 34 becas a jóvenes residentes del municipio de Soyapango que estudian carreras técnicas y de ingeniería en la Universidad Don Bosco (UDB), incrementando con esto a 41 el número total de estudiantes beneficiados a la fecha.  Este programa de becas tiene como principal objetivo contribuir a mejorar la calidad de vida de las familias de Soyapango, por medio de la creación de oportunidades de formación universitaria para los jóvenes del municipio. Se espera que estas oportunidades educativas les permitan mejorar sus competencias y habilidades para obtener un trabajo en su área de conocimiento.', N'09 de Jun, 2023')
INSERT [dbo].[Notice] ([Id], [Occurrence], [OccurrenceImage], [Descripcion1], [Publicationdate]) VALUES (3, N'ESCUELA DE IDIOMAS Y EDUCACIÓN DESARROLLA TALLERES FORMATIVOS DEL RUBRO TURÍSTICO', N'1fc170ec-36bd-422a-a1a8-474a13aecf1a.jpg', N'La Escuela de Idiomas y Educación, a través de la cátedra Asesoría Turística de la Licenciatura en Idiomas con especialidad en Turismo, desarrolló una serie de talleres formativos que tuvieron como objetivo abordar temáticas y tendencias de actualidad dentro del sector turístico del país para fortalecer las competencias profesionales de los participantes.  Fueron tres los talleres impartidos con los temas: Nuevas tendencias en la gestión de los destinos turísticos, nuevas tecnologías para la interpretación y promoción de los destinos turísticos, y el turismo verde como estrategia de desarrollo para los destinos turísticos.', N'11 de May, 2023')
INSERT [dbo].[Notice] ([Id], [Occurrence], [OccurrenceImage], [Descripcion1], [Publicationdate]) VALUES (4, N'UNIVERSIDAD DON BOSCO ABRE CONVOCATORIA DE NUEVO INGRESO PARA CICLO 02-2023', N'99700b9a-a674-4167-9137-430673b30a73.jpg', N'La Universidad Don Bosco (UDB) abre convocatoria de nuevo ingreso para ciclo 02-2023 para carreras de grado y posgrado en modalidad presencial y a distancia en sus campus de Soyapango, Antiguo Cuscatlán y UDB Virtual.  Con una imagen innovadora y estratégica, la UDB presenta una oferta académica diseñada con un modelo pedagógico basado en un enfoque por competencias centrado en la persona con el que refuerza su compromiso de acercar oportunidades de educación superior de alto nivel a la población salvadoreña.', N'27 de Abr, 2023')
INSERT [dbo].[Notice] ([Id], [Occurrence], [OccurrenceImage], [Descripcion1], [Publicationdate]) VALUES (5, N'ALUMNOS DE INSTITUCIONES DE EDUCACIÓN MEDIA PARTICIPAN EN EL UDB CHALLENGE', N'309cf8cb-ad8d-41d9-91a5-e09324fa42fe.jpg', N'Aproximadamente 100 estudiantes procedentes de diferentes instituciones de educación media del país participaron en el UDB Challenge, un espacio impulsado por la Universidad Don Bosco con el propósito de que jóvenes puedan formarse y poner en práctica sus conocimientos en una serie de desafíos prácticos desarrollados en áreas de Ingeniería, Humanidades y disciplinas múltiples.  La actividad, que se desarrolló en las instalaciones del campus de Antiguo Cuscatlán de la UDB, permitió que los jóvenes participantes conocieran sobre las diferentes carreras universitarias y sobre los elementos que componen la vida de un universitario.', N'10 de Abr, 2023')
SET IDENTITY_INSERT [dbo].[Notice] OFF
GO
SET IDENTITY_INSERT [dbo].[NoticeCatalog] ON 

INSERT [dbo].[NoticeCatalog] ([Id], [NoticeId], [CatalogId]) VALUES (1, 1, 3)
INSERT [dbo].[NoticeCatalog] ([Id], [NoticeId], [CatalogId]) VALUES (2, 2, 3)
INSERT [dbo].[NoticeCatalog] ([Id], [NoticeId], [CatalogId]) VALUES (3, 3, 3)
INSERT [dbo].[NoticeCatalog] ([Id], [NoticeId], [CatalogId]) VALUES (4, 4, 2)
INSERT [dbo].[NoticeCatalog] ([Id], [NoticeId], [CatalogId]) VALUES (5, 5, 1)
INSERT [dbo].[NoticeCatalog] ([Id], [NoticeId], [CatalogId]) VALUES (6, 5, 3)
SET IDENTITY_INSERT [dbo].[NoticeCatalog] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 12/6/2023 16:31:38 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/6/2023 16:31:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 12/6/2023 16:31:38 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 12/6/2023 16:31:38 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 12/6/2023 16:31:38 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 12/6/2023 16:31:38 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/6/2023 16:31:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [UDB] SET  READ_WRITE 
GO
