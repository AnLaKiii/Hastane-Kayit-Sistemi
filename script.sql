USE [master]
GO
/****** Object:  Database [HASTANE]    Script Date: 11.12.2023 20:28:06 ******/
CREATE DATABASE [HASTANE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HASTANE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS11\MSSQL\DATA\HASTANE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HASTANE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS11\MSSQL\DATA\HASTANE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HASTANE] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HASTANE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HASTANE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HASTANE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HASTANE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HASTANE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HASTANE] SET ARITHABORT OFF 
GO
ALTER DATABASE [HASTANE] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HASTANE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HASTANE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HASTANE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HASTANE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HASTANE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HASTANE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HASTANE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HASTANE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HASTANE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HASTANE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HASTANE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HASTANE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HASTANE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HASTANE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HASTANE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HASTANE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HASTANE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HASTANE] SET  MULTI_USER 
GO
ALTER DATABASE [HASTANE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HASTANE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HASTANE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HASTANE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HASTANE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HASTANE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HASTANE] SET QUERY_STORE = ON
GO
ALTER DATABASE [HASTANE] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HASTANE]
GO
/****** Object:  Table [dbo].[Adres]    Script Date: 11.12.2023 20:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adres](
	[HastaID] [int] NOT NULL,
	[Sehir] [varchar](30) NOT NULL,
	[Ilce] [varchar](40) NOT NULL,
	[AcikAdres] [varchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BolumAdi]    Script Date: 11.12.2023 20:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BolumAdi](
	[BolumID] [int] IDENTITY(100,1) NOT NULL,
	[BolumAdi] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BolumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doktor]    Script Date: 11.12.2023 20:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktor](
	[DoktorID] [int] IDENTITY(75,1) NOT NULL,
	[DTCKimlikNo] [bigint] NOT NULL,
	[DoktorAdi] [varchar](50) NOT NULL,
	[DoktorSoyadi] [varchar](50) NOT NULL,
	[DoktorBolumID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DoktorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DSifre]    Script Date: 11.12.2023 20:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSifre](
	[DTCKimlikNo] [bigint] NOT NULL,
	[Sifre] [char](8) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hasta]    Script Date: 11.12.2023 20:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hasta](
	[HastaID] [int] IDENTITY(1,1) NOT NULL,
	[TCKimlikNo] [bigint] NOT NULL,
	[HastaAdi] [varchar](50) NOT NULL,
	[Soyadi] [varchar](50) NOT NULL,
	[DogumTarihi] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HastaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Randevu]    Script Date: 11.12.2023 20:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Randevu](
	[RandevuID] [int] IDENTITY(1000,1) NOT NULL,
	[RandevuTarihi] [datetime] NULL,
	[HastaID] [int] NOT NULL,
	[DoktorID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RandevuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sifre]    Script Date: 11.12.2023 20:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sifre](
	[TCKimlikNo] [bigint] NOT NULL,
	[Sifre] [char](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Doktor__6632030DE3F185AC]    Script Date: 11.12.2023 20:28:07 ******/
ALTER TABLE [dbo].[Doktor] ADD UNIQUE NONCLUSTERED 
(
	[DTCKimlikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Hasta__7E1935ED3A225AAC]    Script Date: 11.12.2023 20:28:07 ******/
ALTER TABLE [dbo].[Hasta] ADD UNIQUE NONCLUSTERED 
(
	[TCKimlikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adres]  WITH CHECK ADD FOREIGN KEY([HastaID])
REFERENCES [dbo].[Hasta] ([HastaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doktor]  WITH CHECK ADD FOREIGN KEY([DoktorBolumID])
REFERENCES [dbo].[BolumAdi] ([BolumID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DSifre]  WITH CHECK ADD  CONSTRAINT [DTCKimlikNo] FOREIGN KEY([DTCKimlikNo])
REFERENCES [dbo].[Doktor] ([DTCKimlikNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DSifre] CHECK CONSTRAINT [DTCKimlikNo]
GO
ALTER TABLE [dbo].[Randevu]  WITH CHECK ADD  CONSTRAINT [DoktorID] FOREIGN KEY([DoktorID])
REFERENCES [dbo].[Doktor] ([DoktorID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Randevu] CHECK CONSTRAINT [DoktorID]
GO
ALTER TABLE [dbo].[Randevu]  WITH CHECK ADD  CONSTRAINT [HastaID] FOREIGN KEY([HastaID])
REFERENCES [dbo].[Hasta] ([HastaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Randevu] CHECK CONSTRAINT [HastaID]
GO
ALTER TABLE [dbo].[Sifre]  WITH CHECK ADD  CONSTRAINT [TCKimlikNo] FOREIGN KEY([TCKimlikNo])
REFERENCES [dbo].[Hasta] ([TCKimlikNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sifre] CHECK CONSTRAINT [TCKimlikNo]
GO
ALTER TABLE [dbo].[Doktor]  WITH CHECK ADD CHECK  (([DTCKimlikNo]>=(10000000000.) AND [DTCKimlikNo]<=(99999999999.)))
GO
ALTER TABLE [dbo].[DSifre]  WITH CHECK ADD CHECK  ((len([Sifre])>=(8)))
GO
ALTER TABLE [dbo].[Hasta]  WITH CHECK ADD CHECK  (([TCKimlikNo]>=(10000000000.) AND [TCKimlikNo]<=(99999999999.)))
GO
ALTER TABLE [dbo].[Sifre]  WITH CHECK ADD CHECK  ((len([Sifre])>=(8)))
GO
USE [master]
GO
ALTER DATABASE [HASTANE] SET  READ_WRITE 
GO
