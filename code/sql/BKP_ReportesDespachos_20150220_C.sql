USE [master]
GO
/****** Object:  Database [ReportesDespachos]    Script Date: 02/20/2015 11:29:35 ******/
CREATE DATABASE [ReportesDespachos] ON  PRIMARY 
( NAME = N'ReportesDespachos', FILENAME = N'G:\MSSQL\DATA\ReportesDespachos.mdf' , SIZE = 31425536KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ReportesDespachos_log', FILENAME = N'H:\MSSQL\LOG\ReportesDespachos.ldf' , SIZE = 50195008KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ReportesDespachos] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReportesDespachos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReportesDespachos] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ReportesDespachos] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ReportesDespachos] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ReportesDespachos] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ReportesDespachos] SET ARITHABORT OFF
GO
ALTER DATABASE [ReportesDespachos] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ReportesDespachos] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ReportesDespachos] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ReportesDespachos] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ReportesDespachos] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ReportesDespachos] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ReportesDespachos] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ReportesDespachos] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ReportesDespachos] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ReportesDespachos] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ReportesDespachos] SET DISABLE_BROKER
GO
ALTER DATABASE [ReportesDespachos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ReportesDespachos] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ReportesDespachos] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ReportesDespachos] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ReportesDespachos] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ReportesDespachos] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ReportesDespachos] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ReportesDespachos] SET READ_WRITE
GO
ALTER DATABASE [ReportesDespachos] SET RECOVERY FULL
GO
ALTER DATABASE [ReportesDespachos] SET  MULTI_USER
GO
ALTER DATABASE [ReportesDespachos] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ReportesDespachos] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ReportesDespachos', N'ON'
GO
USE [ReportesDespachos]
GO
/****** Object:  StoredProcedure [dbo].[CARGARESUMENANUAL_FIJA_MOVIL_EX1]    Script Date: 02/20/2015 11:30:23 ******/
DROP PROCEDURE [dbo].[CARGARESUMENANUAL_FIJA_MOVIL_EX1]
GO
/****** Object:  StoredProcedure [dbo].[CARGARESUMENDIARIO_FIJA_MOVIL_EX1]    Script Date: 02/20/2015 11:30:23 ******/
DROP PROCEDURE [dbo].[CARGARESUMENDIARIO_FIJA_MOVIL_EX1]
GO
/****** Object:  StoredProcedure [dbo].[GeneraDataResumen]    Script Date: 02/20/2015 11:30:23 ******/
DROP PROCEDURE [dbo].[GeneraDataResumen]
GO
/****** Object:  StoredProcedure [dbo].[ObtenerResumen]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[ObtenerResumen]
GO
/****** Object:  StoredProcedure [dbo].[ObtenerResumen_ex1]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[ObtenerResumen_ex1]
GO
/****** Object:  StoredProcedure [dbo].[ObtenerResumenEmessaging]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[ObtenerResumenEmessaging]
GO
/****** Object:  StoredProcedure [dbo].[ObtenerResumenEmessaging_ex1]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[ObtenerResumenEmessaging_ex1]
GO
/****** Object:  StoredProcedure [dbo].[REPORTEESTADODESPACHO_EX1]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[REPORTEESTADODESPACHO_EX1]
GO
/****** Object:  StoredProcedure [dbo].[BuscaDataResumen_Anual]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[BuscaDataResumen_Anual]
GO
/****** Object:  StoredProcedure [dbo].[BuscaDataResumen_GraficoAnual]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[BuscaDataResumen_GraficoAnual]
GO
/****** Object:  StoredProcedure [dbo].[BuscaDataResumen_GraficoMensualFija]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[BuscaDataResumen_GraficoMensualFija]
GO
/****** Object:  StoredProcedure [dbo].[BuscaDataResumen_GraficoMensualMovil]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[BuscaDataResumen_GraficoMensualMovil]
GO
/****** Object:  StoredProcedure [dbo].[BuscaDataResumen_Mensual]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[BuscaDataResumen_Mensual]
GO
/****** Object:  StoredProcedure [dbo].[busquedaIndividual]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[busquedaIndividual]
GO
/****** Object:  StoredProcedure [dbo].[busquedaIndividual_ex1]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[busquedaIndividual_ex1]
GO
/****** Object:  StoredProcedure [dbo].[ActualizaLectura]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[ActualizaLectura]
GO
/****** Object:  StoredProcedure [dbo].[ActualizaRebote]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[ActualizaRebote]
GO
/****** Object:  StoredProcedure [dbo].[DetalleReenvios]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[DetalleReenvios]
GO
/****** Object:  StoredProcedure [dbo].[DetalleReenvios_ex1]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[DetalleReenvios_ex1]
GO
/****** Object:  StoredProcedure [dbo].[GeneraDataHistorico]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[GeneraDataHistorico]
GO
/****** Object:  StoredProcedure [dbo].[retornaDataNegocio]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[retornaDataNegocio]
GO
/****** Object:  StoredProcedure [dbo].[UpdateTiempoCiclo]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[UpdateTiempoCiclo]
GO
/****** Object:  StoredProcedure [dbo].[RecuperaDocID]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[RecuperaDocID]
GO
/****** Object:  StoredProcedure [dbo].[ObtenerResumenPorHora]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[ObtenerResumenPorHora]
GO
/****** Object:  StoredProcedure [dbo].[ObtenerResumenPorHora_ex1]    Script Date: 02/20/2015 11:30:22 ******/
DROP PROCEDURE [dbo].[ObtenerResumenPorHora_ex1]
GO
/****** Object:  UserDefinedFunction [dbo].[OBTIENELEIDOS]    Script Date: 02/20/2015 11:30:22 ******/
DROP FUNCTION [dbo].[OBTIENELEIDOS]
GO
/****** Object:  UserDefinedFunction [dbo].[OBTIENELEIDOS_ex1]    Script Date: 02/20/2015 11:30:22 ******/
DROP FUNCTION [dbo].[OBTIENELEIDOS_ex1]
GO
/****** Object:  UserDefinedFunction [dbo].[OBTIENEREBOTES]    Script Date: 02/20/2015 11:30:22 ******/
DROP FUNCTION [dbo].[OBTIENEREBOTES]
GO
/****** Object:  UserDefinedFunction [dbo].[OBTIENEREBOTES_ex1]    Script Date: 02/20/2015 11:30:21 ******/
DROP FUNCTION [dbo].[OBTIENEREBOTES_ex1]
GO
/****** Object:  UserDefinedFunction [dbo].[GetFinDespacho]    Script Date: 02/20/2015 11:30:21 ******/
DROP FUNCTION [dbo].[GetFinDespacho]
GO
/****** Object:  UserDefinedFunction [dbo].[GetIniDespacho]    Script Date: 02/20/2015 11:30:21 ******/
DROP FUNCTION [dbo].[GetIniDespacho]
GO
/****** Object:  StoredProcedure [dbo].[GetRegistros]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[GetRegistros]
GO
/****** Object:  StoredProcedure [dbo].[InsertaTiempoCiclo]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[InsertaTiempoCiclo]
GO
/****** Object:  StoredProcedure [dbo].[InsertUsuarios_ex1]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[InsertUsuarios_ex1]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalle]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalle]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalle_ex1]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalle_ex1]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleF]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleF]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleFija]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleFija]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleLF]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleLF]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleLF_ex1]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleLF_ex1]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleLM]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleLM]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleLM_ex1]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleLM_ex1]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleM]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleM]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleMovil]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleMovil]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleRedespacho]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleRedespacho]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleRedespacho_ex1]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleRedespacho_ex1]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleRF]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleRF]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleRF_ex1]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleRF_ex1]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleRM]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleRM]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleRM_ex1]    Script Date: 02/20/2015 11:30:21 ******/
DROP PROCEDURE [dbo].[obtenerDetalleRM_ex1]
GO
/****** Object:  Table [dbo].[Lecturas]    Script Date: 02/20/2015 11:30:21 ******/
DROP TABLE [dbo].[Lecturas]
GO
/****** Object:  Table [dbo].[DetalleFija]    Script Date: 02/20/2015 11:30:21 ******/
DROP TABLE [dbo].[DetalleFija]
GO
/****** Object:  Table [dbo].[DetalleFijaTMP]    Script Date: 02/20/2015 11:30:20 ******/
DROP TABLE [dbo].[DetalleFijaTMP]
GO
/****** Object:  Table [dbo].[DetalleFijaTMP_HIST]    Script Date: 02/20/2015 11:30:20 ******/
DROP TABLE [dbo].[DetalleFijaTMP_HIST]
GO
/****** Object:  Table [dbo].[DetalleMovil]    Script Date: 02/20/2015 11:30:19 ******/
DROP TABLE [dbo].[DetalleMovil]
GO
/****** Object:  Table [dbo].[DetalleMovilTMP]    Script Date: 02/20/2015 11:30:18 ******/
DROP TABLE [dbo].[DetalleMovilTMP]
GO
/****** Object:  Table [dbo].[DetalleMovilTMP_HIST]    Script Date: 02/20/2015 11:30:18 ******/
DROP TABLE [dbo].[DetalleMovilTMP_HIST]
GO
/****** Object:  Table [dbo].[DetalleRedespacho]    Script Date: 02/20/2015 11:30:17 ******/
DROP TABLE [dbo].[DetalleRedespacho]
GO
/****** Object:  Table [dbo].[Rebotes]    Script Date: 02/20/2015 11:30:17 ******/
DROP TABLE [dbo].[Rebotes]
GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZAREPORTE]    Script Date: 02/20/2015 11:30:17 ******/
DROP PROCEDURE [dbo].[ACTUALIZAREPORTE]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 02/20/2015 11:29:49 ******/
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 02/20/2015 11:29:49 ******/
DROP FUNCTION [dbo].[Split]
GO
/****** Object:  UserDefinedFunction [dbo].[Split_Subject]    Script Date: 02/20/2015 11:29:48 ******/
DROP FUNCTION [dbo].[Split_Subject]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitEM]    Script Date: 02/20/2015 11:29:48 ******/
DROP FUNCTION [dbo].[SplitEM]
GO
/****** Object:  UserDefinedFunction [dbo].[Splitter]    Script Date: 02/20/2015 11:29:48 ******/
DROP FUNCTION [dbo].[Splitter]
GO
/****** Object:  Table [dbo].[TiemposDespachos]    Script Date: 02/20/2015 11:29:46 ******/
DROP TABLE [dbo].[TiemposDespachos]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 02/20/2015 11:29:46 ******/
DROP TABLE [dbo].[TipoUsuario]
GO
/****** Object:  Table [dbo].[Resumenes]    Script Date: 02/20/2015 11:29:46 ******/
DROP TABLE [dbo].[Resumenes]
GO
USE [master]
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 02/20/2015 11:29:44 ******/
DROP LOGIN [##MS_PolicyEventProcessingLogin##]
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 02/20/2015 11:29:43 ******/
DROP LOGIN [##MS_PolicyTsqlExecutionLogin##]
GO
/****** Object:  Login [emessuser]    Script Date: 02/20/2015 11:29:43 ******/
DROP LOGIN [emessuser]
GO
/****** Object:  Login [fdonoso]    Script Date: 02/20/2015 11:29:43 ******/
DROP LOGIN [fdonoso]
GO
/****** Object:  Login [ges_rebotes]    Script Date: 02/20/2015 11:29:42 ******/
DROP LOGIN [ges_rebotes]
GO
/****** Object:  Login [NT AUTHORITY\NETWORK SERVICE]    Script Date: 02/20/2015 11:29:41 ******/
DROP LOGIN [NT AUTHORITY\NETWORK SERVICE]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 02/20/2015 11:29:41 ******/
DROP LOGIN [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Login [NT SERVICE\MSSQL$INST1]    Script Date: 02/20/2015 11:29:41 ******/
DROP LOGIN [NT SERVICE\MSSQL$INST1]
GO
/****** Object:  Login [NT SERVICE\SQLAgent$INST1]    Script Date: 02/20/2015 11:29:41 ******/
DROP LOGIN [NT SERVICE\SQLAgent$INST1]
GO
/****** Object:  Login [PUF2340\fdonoso]    Script Date: 02/20/2015 11:29:41 ******/
DROP LOGIN [PUF2340\fdonoso]
GO
/****** Object:  Login [TCHILE\ibm_emelendv]    Script Date: 02/20/2015 11:29:41 ******/
DROP LOGIN [TCHILE\ibm_emelendv]
GO
/****** Object:  Login [TCHILE\ibm_fdonoso]    Script Date: 02/20/2015 11:29:41 ******/
DROP LOGIN [TCHILE\ibm_fdonoso]
GO
/****** Object:  Login [TCHILE\om12sqlaction]    Script Date: 02/20/2015 11:29:41 ******/
DROP LOGIN [TCHILE\om12sqlaction]
GO
/****** Object:  Login [TCHILE\sql_soft_owner]    Script Date: 02/20/2015 11:29:41 ******/
DROP LOGIN [TCHILE\sql_soft_owner]
GO
/****** Object:  Login [TCHILE\sql_soft_owner]    Script Date: 02/20/2015 11:29:41 ******/
CREATE LOGIN [TCHILE\sql_soft_owner] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [TCHILE\om12sqlaction]    Script Date: 02/20/2015 11:29:41 ******/
CREATE LOGIN [TCHILE\om12sqlaction] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [TCHILE\ibm_fdonoso]    Script Date: 02/20/2015 11:29:41 ******/
CREATE LOGIN [TCHILE\ibm_fdonoso] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [TCHILE\ibm_emelendv]    Script Date: 02/20/2015 11:29:41 ******/
CREATE LOGIN [TCHILE\ibm_emelendv] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [PUF2340\fdonoso]    Script Date: 02/20/2015 11:29:41 ******/
CREATE LOGIN [PUF2340\fdonoso] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLAgent$INST1]    Script Date: 02/20/2015 11:29:41 ******/
CREATE LOGIN [NT SERVICE\SQLAgent$INST1] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\MSSQL$INST1]    Script Date: 02/20/2015 11:29:41 ******/
CREATE LOGIN [NT SERVICE\MSSQL$INST1] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 02/20/2015 11:29:41 ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\NETWORK SERVICE]    Script Date: 02/20/2015 11:29:41 ******/
CREATE LOGIN [NT AUTHORITY\NETWORK SERVICE] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [ges_rebotes]    Script Date: 02/20/2015 11:29:42 ******/
/* For security reasons the login is created disabled and with a random password. */
CREATE LOGIN [ges_rebotes] WITH PASSWORD=N'O7:(»É-åÅ9ÔK }ù[v¨|Ã¡oá¸', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
EXEC sys.sp_addsrvrolemember @loginame = N'ges_rebotes', @rolename = N'sysadmin'
GO
ALTER LOGIN [ges_rebotes] DISABLE
GO
/****** Object:  Login [fdonoso]    Script Date: 02/20/2015 11:29:43 ******/
/* For security reasons the login is created disabled and with a random password. */
CREATE LOGIN [fdonoso] WITH PASSWORD=N'9F cr/íäü	0iGâ¾ù®D	ùtcð¨òû-', DEFAULT_DATABASE=[tempdb], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
EXEC sys.sp_addsrvrolemember @loginame = N'fdonoso', @rolename = N'sysadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'fdonoso', @rolename = N'securityadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'fdonoso', @rolename = N'serveradmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'fdonoso', @rolename = N'setupadmin'
GO
ALTER LOGIN [fdonoso] DISABLE
GO
/****** Object:  Login [emessuser]    Script Date: 02/20/2015 11:29:43 ******/
/* For security reasons the login is created disabled and with a random password. */
CREATE LOGIN [emessuser] WITH PASSWORD=N'n{ô	3(_Fö2ËÈõÅèÀpbíS¿E4¶(ÒÊ', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
EXEC sys.sp_addsrvrolemember @loginame = N'emessuser', @rolename = N'sysadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'emessuser', @rolename = N'securityadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'emessuser', @rolename = N'serveradmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'emessuser', @rolename = N'setupadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'emessuser', @rolename = N'processadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'emessuser', @rolename = N'diskadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'emessuser', @rolename = N'dbcreator'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'emessuser', @rolename = N'bulkadmin'
GO
ALTER LOGIN [emessuser] DISABLE
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 02/20/2015 11:29:43 ******/
/* For security reasons the login is created disabled and with a random password. */
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'¹PÁÝhÙ3kÅÆòÞóí~D="ìÐ', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 02/20/2015 11:29:44 ******/
/* For security reasons the login is created disabled and with a random password. */
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'ýs]edæàÓ
·¢/í?Jv#nÆCl6p°', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
USE [ReportesDespachos]
GO
/****** Object:  Table [dbo].[Resumenes]    Script Date: 02/20/2015 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resumenes](
	[Negocio] [varchar](max) NULL,
	[Fecha] [varchar](max) NULL,
	[CICLO] [varchar](max) NULL,
	[QEnvios] [varchar](max) NULL,
	[Rebotes] [varchar](max) NULL,
	[Leidos] [varchar](max) NULL,
	[QDoc] [varchar](max) NULL,
	[TipoDoc] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 02/20/2015 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[idTipoUsuario] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[idTipoUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiemposDespachos]    Script Date: 02/20/2015 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiemposDespachos](
	[Ciclo] [varchar](50) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[Splitter]    Script Date: 02/20/2015 11:29:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Splitter]
(
	@Stringent varchar(500),
	@delim varchar(1),
	@index int
)
RETURNS varchar(500)
AS
BEGIN
declare @cont int=0
declare @String as varchar(500) =@Stringent
declare @tmp as varchar(500) =''
declare @cont_char as int=0
declare @cont_char2 as int=1
declare @return as varchar(500)
declare @ini as int=0
WHILE @cont_char<len(@String)
BEGIN
	select @tmp=substring(@String,@cont_char,1)
	if @tmp=@delim
	begin
		if(@cont=@index)
		begin
			select @return=substring(@String,@ini,@cont_char2)
			return replace(@return,' ','')
		end
		else
		begin
			select @cont=sum(@cont+1)
			select @cont_char=sum(@cont_char+1)
			select @ini=sum(@cont_char)
			select @cont_char2=1
		end
	end
	else
	begin
		select @cont_char=sum(@cont_char+1)
		select @cont_char2=sum(@cont_char2+1)
	end
	CONTINUE
END
return @return
END
GO
/****** Object:  UserDefinedFunction [dbo].[SplitEM]    Script Date: 02/20/2015 11:29:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitEM]
(
       @String varchar(500),
       @delim varchar(1),
       @index int
)
RETURNS varchar(500)
AS
BEGIN
declare @ini as int=1
declare @end as int=len(@String)
declare @cont_char as int=1
declare @cont_char2 as int=1
declare @cont_delim as int=0
declare @char as varchar(1)
declare @return as varchar(100)
WHILE @cont_char < sum(@end+1)
BEGIN
       select @char=substring(@String,@cont_char,1)
       if @char=@delim
       begin
             if @cont_delim=@index
             begin
                    select @return=substring(@String,@ini,@cont_char2-1)
                    return @return
             end
             select @cont_delim=sum(@cont_delim+1)
             select @cont_char=sum(@cont_char+1)
             select @ini=sum(@cont_char)
             select @cont_char2=1
       end
       else
       begin
             select @cont_char=sum(@cont_char+1)
             select @cont_char2=sum(@cont_char2+1)
       end
       CONTINUE
END
select @return='Error'
return @return
END
GO
/****** Object:  UserDefinedFunction [dbo].[Split_Subject]    Script Date: 02/20/2015 11:29:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[Split_Subject]
(
	@String varchar(500),
	@delim varchar(1),
	@indice int
)
RETURNS varchar(500)
AS
BEGIN
declare @ini as int=1
declare @end as int=len(@String)
declare @cont_char as int=1
declare @cont_char2 as int=1
declare @cont_delim as int=0
declare @char as varchar(1)
declare @return as varchar(100)
WHILE @cont_char < sum(@end+1)
BEGIN
	select @char=substring(@String,@cont_char,1)
	if @char=@delim
	begin
		select @cont_delim=sum(@cont_delim+1)
		select @cont_char=sum(@cont_char+1)
		if @cont_delim=@indice
		begin
			select @return=substring(@String,@ini,@cont_char)
			break
		end
		else
		begin
			select @ini=sum(@cont_char)
			select @cont_char2=1
		end
	end
	else
	begin
		select @cont_char=sum(@cont_char+1)
		select @cont_char2=sum(@cont_char2+1)
	end
	CONTINUE
END
return @return
END
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 02/20/2015 11:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Split]
(
	@String varchar(500),
	@delim varchar(1)
)
RETURNS varchar(500)
AS
BEGIN
declare @ini as int=1
declare @end as int=len(@String)
declare @cont_char as int=1
declare @cont_char2 as int=1
declare @cont_delim as int=0
declare @char as varchar(1)
declare @return as varchar(100)
WHILE @cont_char < sum(@end+1)
BEGIN
	select @char=substring(@String,@cont_char,1)
	if @char=@delim
	begin
		select @cont_delim=sum(@cont_delim+1)
		select @cont_char=sum(@cont_char+1)
		select @ini=sum(@cont_char)
		select @cont_char2=1
	end
	else
	begin
		select @cont_char=sum(@cont_char+1)
		select @cont_char2=sum(@cont_char2+1)
	end
	CONTINUE
END
select @return=substring(@String,@ini,sum(@end+1))
return @return
END
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 02/20/2015 11:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[idTipoUsuario] [int] NULL,
	[usuario] [varchar](50) NOT NULL,
	[pwdusuario] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[rut] [varchar](10) NULL,
	[mail] [varchar](50) NULL,
	[ultimaconexion] [timestamp] NULL,
	[remember_token] [nchar](100) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZAREPORTE]    Script Date: 02/20/2015 11:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec ACTUALIZAREPORTE 6,4,2013
CREATE PROCEDURE [dbo].[ACTUALIZAREPORTE] @CICLO int, @MES int , @AÑO int
AS
BEGIN
SET NOCOUNT ON;
declare @folio  as varchar(100)
declare @cuenta as varchar(100)
declare @DocID as varchar(100)

DECLARE despachos_cursor CURSOR
FOR SELECT Folio,Cuenta,doc_instanceid FROM	 dbo.reporteEmessaging where month(convert(datetime,fechaemi, 105))=  @MES and YEAR(convert(datetime,fechaemi, 105))=@AÑO and NumeroCiclo=@CICLO
OPEN despachos_cursor
FETCH NEXT FROM despachos_cursor
INTO @folio, @cuenta,@DocID
WHILE @@FETCH_STATUS = 0
BEGIN

select	 @folio, @cuenta,@DocID


FETCH NEXT FROM despachos_cursor 
INTO @folio, @cuenta,@DocID
END 

CLOSE despachos_cursor;
DEALLOCATE despachos_cursor;


END
GO
/****** Object:  Table [dbo].[Rebotes]    Script Date: 02/20/2015 11:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rebotes](
	[CodRebote] [varchar](50) NULL,
	[DescRebote] [varchar](350) NULL,
	[doc_instanceid] [varchar](32) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [1_INDEX_1] ON [dbo].[Rebotes] 
(
	[doc_instanceid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleRedespacho]    Script Date: 02/20/2015 11:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleRedespacho](
	[FechaEmi] [date] NULL,
	[FechaVen] [date] NULL,
	[Fono] [varchar](50) NULL,
	[Cliente] [varchar](50) NULL,
	[Cuenta] [varchar](50) NULL,
	[CodSegmento] [varchar](50) NULL,
	[Monto] [varchar](50) NULL,
	[TipoDoc] [varchar](50) NOT NULL,
	[Folio] [varchar](50) NOT NULL,
	[DV] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[TipoDespacho] [varchar](50) NULL,
	[Negocio] [varchar](50) NULL,
	[Rut] [varchar](50) NULL,
	[NombreCli] [varchar](150) NULL,
	[EstadoEnvio] [varchar](50) NULL,
	[NumeroCiclo] [varchar](50) NULL,
	[CodRebote] [varchar](50) NULL,
	[DescRebote] [varchar](350) NULL,
	[FechaUltimaAct] [varchar](50) NULL,
	[FechaLectura] [varchar](50) NULL,
	[doc_instanceid] [varchar](32) NULL,
	[nombreArchivo] [varchar](150) NULL,
	[FecEnvio] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleMovilTMP_HIST]    Script Date: 02/20/2015 11:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleMovilTMP_HIST](
	[FechaEmi] [date] NULL,
	[FechaVen] [date] NULL,
	[Fono] [varchar](50) NULL,
	[Cliente] [varchar](50) NULL,
	[Cuenta] [varchar](50) NULL,
	[CodSegmento] [varchar](50) NULL,
	[Monto] [varchar](50) NULL,
	[TipoDoc] [varchar](50) NOT NULL,
	[Folio] [varchar](50) NOT NULL,
	[DV] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[TipoDespacho] [varchar](50) NULL,
	[Negocio] [varchar](50) NULL,
	[Rut] [varchar](50) NULL,
	[NombreCli] [varchar](150) NULL,
	[EstadoEnvio] [varchar](50) NULL,
	[FecEnvio] [varchar](50) NULL,
	[NumeroCiclo] [varchar](50) NULL,
	[CodRebote] [varchar](50) NULL,
	[DescRebote] [varchar](350) NULL,
	[FechaUltimaAct] [varchar](50) NULL,
	[FechaLectura] [varchar](50) NULL,
	[doc_instanceid] [varchar](32) NULL,
	[nombreArchivo] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleMovilTMP]    Script Date: 02/20/2015 11:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleMovilTMP](
	[FechaEmi] [date] NULL,
	[FechaVen] [date] NULL,
	[Fono] [varchar](50) NULL,
	[Cliente] [varchar](50) NULL,
	[Cuenta] [varchar](50) NULL,
	[CodSegmento] [varchar](50) NULL,
	[Monto] [varchar](50) NULL,
	[TipoDoc] [varchar](50) NOT NULL,
	[Folio] [varchar](50) NOT NULL,
	[DV] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[TipoDespacho] [varchar](50) NULL,
	[Negocio] [varchar](50) NULL,
	[Rut] [varchar](50) NULL,
	[NombreCli] [varchar](150) NULL,
	[EstadoEnvio] [varchar](50) NULL,
	[FecEnvio] [varchar](50) NULL,
	[NumeroCiclo] [varchar](50) NULL,
	[CodRebote] [varchar](50) NULL,
	[DescRebote] [varchar](350) NULL,
	[FechaUltimaAct] [varchar](50) NULL,
	[FechaLectura] [varchar](50) NULL,
	[doc_instanceid] [varchar](32) NULL,
	[nombreArchivo] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [2_INDEX_2] ON [dbo].[DetalleMovilTMP] 
(
	[FechaEmi] ASC,
	[NumeroCiclo] ASC,
	[TipoDoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [3_INDEX_3] ON [dbo].[DetalleMovilTMP] 
(
	[Cuenta] ASC,
	[TipoDoc] ASC,
	[Folio] ASC,
	[Mail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [4_INDEX_4] ON [dbo].[DetalleMovilTMP] 
(
	[doc_instanceid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [I_INDEX_1] ON [dbo].[DetalleMovilTMP] 
(
	[FechaEmi] ASC,
	[NumeroCiclo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleMovil]    Script Date: 02/20/2015 11:30:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleMovil](
	[FechaEmi] [date] NULL,
	[FechaVen] [date] NULL,
	[Fono] [varchar](50) NULL,
	[Cliente] [varchar](50) NULL,
	[Cuenta] [varchar](50) NULL,
	[CodSegmento] [varchar](50) NULL,
	[Monto] [varchar](50) NULL,
	[TipoDoc] [varchar](50) NOT NULL,
	[Folio] [varchar](50) NOT NULL,
	[DV] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[TipoDespacho] [varchar](50) NULL,
	[Negocio] [varchar](50) NULL,
	[Rut] [varchar](50) NULL,
	[NombreCli] [varchar](150) NULL,
	[EstadoEnvio] [varchar](50) NULL,
	[FecEnvio] [varchar](50) NULL,
	[NumeroCiclo] [varchar](50) NULL,
	[CodRebote] [varchar](50) NULL,
	[DescRebote] [varchar](350) NULL,
	[FechaUltimaAct] [varchar](50) NULL,
	[FechaLectura] [varchar](50) NULL,
	[doc_instanceid] [varchar](32) NULL,
	[nombreArchivo] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IDX_Cuenta] ON [dbo].[DetalleMovil] 
(
	[Cuenta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_doc_instanceid] ON [dbo].[DetalleMovil] 
(
	[doc_instanceid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_FecEnvio] ON [dbo].[DetalleMovil] 
(
	[FecEnvio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_FechaEmi] ON [dbo].[DetalleMovil] 
(
	[FechaEmi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Folio] ON [dbo].[DetalleMovil] 
(
	[Folio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Mail] ON [dbo].[DetalleMovil] 
(
	[Mail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_nombreArchivo] ON [dbo].[DetalleMovil] 
(
	[nombreArchivo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_NumeroCiclo] ON [dbo].[DetalleMovil] 
(
	[NumeroCiclo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFijaTMP_HIST]    Script Date: 02/20/2015 11:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleFijaTMP_HIST](
	[FechaEmi] [date] NULL,
	[FechaVen] [date] NULL,
	[Fono] [varchar](50) NULL,
	[Cliente] [varchar](50) NULL,
	[Cuenta] [varchar](50) NULL,
	[CodSegmento] [varchar](50) NULL,
	[Monto] [varchar](50) NULL,
	[TipoDoc] [varchar](50) NOT NULL,
	[Folio] [varchar](50) NOT NULL,
	[DV] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[TipoDespacho] [varchar](50) NULL,
	[Negocio] [varchar](50) NULL,
	[Rut] [varchar](50) NULL,
	[NombreCli] [varchar](150) NULL,
	[EstadoEnvio] [varchar](50) NULL,
	[FecEnvio] [varchar](50) NULL,
	[NumeroCiclo] [varchar](50) NULL,
	[CodRebote] [varchar](50) NULL,
	[DescRebote] [varchar](350) NULL,
	[FechaUltimaAct] [varchar](50) NULL,
	[FechaLectura] [varchar](50) NULL,
	[doc_instanceid] [varchar](32) NULL,
	[nombreArchivo] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleFijaTMP]    Script Date: 02/20/2015 11:30:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleFijaTMP](
	[FechaEmi] [date] NULL,
	[FechaVen] [date] NULL,
	[Fono] [varchar](50) NULL,
	[Cliente] [varchar](50) NULL,
	[Cuenta] [varchar](50) NULL,
	[CodSegmento] [varchar](50) NULL,
	[Monto] [varchar](50) NULL,
	[TipoDoc] [varchar](50) NOT NULL,
	[Folio] [varchar](50) NOT NULL,
	[DV] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[TipoDespacho] [varchar](50) NULL,
	[Negocio] [varchar](50) NULL,
	[Rut] [varchar](50) NULL,
	[NombreCli] [varchar](150) NULL,
	[EstadoEnvio] [varchar](50) NULL,
	[FecEnvio] [varchar](50) NULL,
	[NumeroCiclo] [varchar](50) NULL,
	[CodRebote] [varchar](50) NULL,
	[DescRebote] [varchar](350) NULL,
	[FechaUltimaAct] [varchar](50) NULL,
	[FechaLectura] [varchar](50) NULL,
	[doc_instanceid] [varchar](32) NULL,
	[nombreArchivo] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [1_INDEX_1] ON [dbo].[DetalleFijaTMP] 
(
	[FechaEmi] ASC,
	[NumeroCiclo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [2_INDEX_2] ON [dbo].[DetalleFijaTMP] 
(
	[FechaEmi] ASC,
	[NumeroCiclo] ASC,
	[TipoDoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [2_INDEX_3] ON [dbo].[DetalleFijaTMP] 
(
	[Cuenta] ASC,
	[TipoDoc] ASC,
	[Folio] ASC,
	[Mail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [3_INDEX_3] ON [dbo].[DetalleFijaTMP] 
(
	[doc_instanceid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [4_index_4] ON [dbo].[DetalleFijaTMP] 
(
	[FechaEmi] ASC,
	[NumeroCiclo] ASC,
	[nombreArchivo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFija]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleFija](
	[FechaEmi] [date] NULL,
	[FechaVen] [date] NULL,
	[Fono] [varchar](50) NULL,
	[Cliente] [varchar](50) NULL,
	[Cuenta] [varchar](50) NULL,
	[CodSegmento] [varchar](50) NULL,
	[Monto] [varchar](50) NULL,
	[TipoDoc] [varchar](50) NOT NULL,
	[Folio] [varchar](50) NOT NULL,
	[DV] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[TipoDespacho] [varchar](50) NULL,
	[Negocio] [varchar](50) NULL,
	[Rut] [varchar](50) NULL,
	[NombreCli] [varchar](150) NULL,
	[EstadoEnvio] [varchar](50) NULL,
	[FecEnvio] [varchar](50) NULL,
	[NumeroCiclo] [varchar](50) NULL,
	[CodRebote] [varchar](50) NULL,
	[DescRebote] [varchar](350) NULL,
	[FechaUltimaAct] [varchar](50) NULL,
	[FechaLectura] [varchar](50) NULL,
	[doc_instanceid] [varchar](32) NULL,
	[nombreArchivo] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IDX_Cuenta] ON [dbo].[DetalleFija] 
(
	[Cuenta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_doc_instanceid] ON [dbo].[DetalleFija] 
(
	[doc_instanceid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_FecEnvio] ON [dbo].[DetalleFija] 
(
	[FecEnvio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_FechaEmi] ON [dbo].[DetalleFija] 
(
	[FechaEmi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Folio] ON [dbo].[DetalleFija] 
(
	[Folio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Mail] ON [dbo].[DetalleFija] 
(
	[Mail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_nombreArchivo] ON [dbo].[DetalleFija] 
(
	[nombreArchivo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_NumeroCiclo] ON [dbo].[DetalleFija] 
(
	[NumeroCiclo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturas]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lecturas](
	[FechaUltimaAct] [varchar](50) NULL,
	[FechaLectura] [varchar](50) NULL,
	[doc_instanceid] [varchar](32) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [1_INDEX_1] ON [dbo].[Lecturas] 
(
	[doc_instanceid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleRM_ex1]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		FGARAY
-- Create date: 09/12/2014
-- Description:	Obtiene Detalle de los Rebotes de la MOVIL
-- =============================================
CREATE PROCEDURE [dbo].[obtenerDetalleRM_ex1] 

@CICLO varchar(50), 
@DIAP varchar(10) , 
@DIAU varchar(10) 

AS
BEGIN
       SELECT	r.doc_instanceid,
				r.CodRebote,
				r.DescRebote--FechaUltimaAct,FechaLectura,
       FROM Rebotes r with(nolock)
       inner join DetalleMovilTMP  d with(nolock)
		on d.doc_instanceid = r.doc_instanceid
       where 
       d.fechaemi between @DIAP + ' 00:00:00'  and @DIAU + ' 23:59:59' 
       and d.NumeroCiclo=@CICLO


END
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleRM]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  obtenerDetalleFija '0001','01-01-2014','31-01-2014'
----------------------------------------------------------------
CREATE procedure [dbo].[obtenerDetalleRM] @CICLO varchar(50), @DIAP varchar(10) , @DIAU varchar(10) as 
begin
       SELECT 
       r.doc_instanceid,
       r.CodRebote,r.DescRebote--FechaUltimaAct,FechaLectura,
       FROM Rebotes as r
       inner join DetalleMovilTMP as d on r.doc_instanceid=d.doc_instanceid
       where 
       d.fechaemi between convert(datetime,@DIAP,121) and convert(datetime,@DIAU,121) 
       and d.NumeroCiclo=@CICLO
end
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleRF_ex1]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		FGARAY
-- Create date: 09/12/2014
-- Description:	Obtiene Detalle de los Rebotes de la Fija
-- =============================================
CREATE PROCEDURE [dbo].[obtenerDetalleRF_ex1] 

	@CICLO varchar(50), 
	@DIAP varchar(10) , 
	@DIAU varchar(10) 

AS
BEGIN
       SELECT	r.doc_instanceid,
				r.CodRebote,
				r.DescRebote--FechaUltimaAct,FechaLectura,
       FROM Rebotes r with(nolock)
       inner join DetalleFijaTMP d  with(nolock)
		on d.doc_instanceid = r.doc_instanceid
       where 
       d.fechaemi between @DIAP + ' 00:00:00'  and @DIAU + ' 23:59:59' 
       and d.NumeroCiclo=@CICLO

END
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleRF]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  obtenerDetalleFija '0001','01-01-2014','31-01-2014'
----------------------------------------------------------------
CREATE procedure [dbo].[obtenerDetalleRF] @CICLO varchar(50), @DIAP varchar(10) , @DIAU varchar(10) as 
begin
       SELECT 
       r.doc_instanceid,
       r.CodRebote,r.DescRebote--FechaUltimaAct,FechaLectura,
       FROM Rebotes as r
       inner join DetalleFijaTMP as d on r.doc_instanceid=d.doc_instanceid
       where 
       d.fechaemi between convert(datetime,@DIAP,121) and convert(datetime,@DIAU,121) 
       and d.NumeroCiclo=@CICLO
end
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleRedespacho_ex1]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  FGARAY  
-- Create date: 10/12/2014  
-- Description: Obtiene el resumen del redespacho  
-- =============================================  
CREATE PROCEDURE [dbo].[obtenerDetalleRedespacho_ex1]  
  
    @DIAP VARCHAR(10),  
    @DIAU VARCHAR(10)  
  
AS  
  BEGIN  
  
    SELECT  
      om.customer_id AS 'Id Customer',  
      convert(VARCHAR(50), om.date_send, 121) AS 'Fecha Envio', -- 'date_send'
      om.sentTo AS 'Enviado A',  
      om.subject AS 'Asunto',  
      CASE  
      WHEN FechaLectura IS NULL THEN ('NULL')  
      ELSE (l.FechaLectura)  
      END                                     AS 'Fecha Lectura', --fechalectura
      CASE  
      WHEN FechaUltimaAct IS NULL THEN ('NULL')  
      ELSE (l.FechaUltimaAct)  
      END                                     AS 'Fecha Ult. Actualizacion', -- fechaultimaact 
      CASE  
      WHEN CodRebote IS NULL THEN ('NULL')  
      ELSE (r.CodRebote)  
      END                                     AS 'Cod. Rebote', -- codrebote
      CASE  
      WHEN DescRebote IS NULL THEN ('NULL')  
      ELSE (r.DescRebote)  
      END                                     AS 'Desc. Rebote', -- descrebote
      om.doc_instance_id  
    FROM emessaging.dbo.outbound_message AS om WITH ( NOLOCK )  
      LEFT JOIN ReportesDespachos.dbo.Rebotes AS r WITH ( NOLOCK )  
        ON r.doc_instanceid = om.doc_instance_id  
      LEFT JOIN ReportesDespachos.dbo.Lecturas AS l WITH ( NOLOCK )  
        ON l.doc_instanceid = om.doc_instance_id  
    WHERE om.outbound_profile_id IN ('6150', '6151', '6152', '6153', '6154')  
          AND om.outbound_message_status IN ('DELIVERED_SUCCESSFULLY')  
          AND convert(VARCHAR(50), om.date_send, 121) BETWEEN @DIAP AND @DIAU  
    ORDER BY om.date_send  
  END;
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleRedespacho]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--;Contacto;Negocio
CREATE procedure [dbo].[obtenerDetalleRedespacho] @negocio varchar(10), @DIAP varchar(10) , @DIAU varchar(10) as 
begin
if(@negocio='1')
begin
	SELECT 
	Cliente,Cuenta,TipoDoc,FechaEmi,Folio,Mail,(select 'NULL') as email_seg_cont,
	CASE WHEN date_send IS NULL THEN (select 'NULL') ELSE (select convert(varchar(50),date_send,121)) END as date_send,
	Fono,Negocio
	FROM DetalleRedespacho 
	left join emessaging.dbo.outbound_message on doc_instance_id=doc_instanceid and outbound_profile_id in ('6150','6151','6152','6153','6154')
	where Negocio='F' and 
	fechaemi between cast(@DIAP as date) and cast(@DIAU  as date) 
end
if(@negocio='2')
begin
	SELECT 
	Cliente,Cuenta,TipoDoc,FechaEmi,Folio,Mail,(select 'NULL') as email_seg_cont,
	CASE WHEN date_send IS NULL THEN (select 'NULL') ELSE (select convert(varchar(50),date_send,121)) END as date_send,
	Fono,Negocio
	FROM DetalleRedespacho 
	left join emessaging.dbo.outbound_message on doc_instance_id=doc_instanceid and outbound_profile_id in ('6150','6151','6152','6153','6154')
	where Negocio='M' and 
	fechaemi between cast(@DIAP as date) and cast(@DIAU  as date) 
	and Negocio='M'
end
end
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleMovil]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  obtenerDetalleMovil '0001','01-01-2014','31-01-2014'
----------------------------------------------------------------
CREATE procedure [dbo].[obtenerDetalleMovil] @CICLO varchar(50), @DIAP varchar(10) , @DIAU varchar(10) as 
begin
       SELECT FechaEmi,FechaVen,Fono,Cliente,Cuenta,CodSegmento,Monto,TipoDoc,Folio,Mail,TipoDespacho,Negocio,Rut,NombreCli,
       CASE WHEN date_send IS NULL THEN (select 'NULL') ELSE (select (convert(varchar(50),b.date_send,121))) END as date_send,NumeroCiclo,
       CASE WHEN CodRebote='CODIGO DE REBOTE' THEN (
       CASE WHEN date_send is null THEN (select '50') ELSE (select 'NULL') END
       ) ELSE (select CodRebote) END as CodRebotes,
       CASE WHEN DescRebote='DESCRIPCION DE REBOTE' THEN (
       CASE WHEN date_send is null THEN (select 'Invalid email address') ELSE (select 'NULL') END
       ) ELSE (select DescRebote) END as DescRebote,
       CASE WHEN FechaUltimaAct='FECHA ULTIMA ACTUALIZACION' THEN (select 'NULL') ELSE (select FechaUltimaAct) END as FechaUltimaAct,
       CASE WHEN FechaLectura='FECHA LECTURA' THEN (select 'NULL') ELSE (select FechaLectura) END as FechaLectura,
       doc_instanceid,nombreArchivo
       FROM DetalleMovil
       left join (select doc_instance_id,MAX(date_send) as date_send from emessaging.dbo.outbound_message where doc_instance_id in (select doc_instanceid from DetalleMovil where fechaemi between convert(datetime,@DIAP,121) and convert(datetime,@DIAU,121) and NumeroCiclo=@CICLO) group by doc_instance_id )b
       on b.doc_instance_id=doc_instanceid
       where fechaemi between convert(datetime,@DIAP,121) and convert(datetime,@DIAU,121) 
       and NumeroCiclo=@CICLO
       group by FechaEmi,FecEnvio,FechaVen,Fono,Cliente,Cuenta,CodSegmento,CodRebote,Monto,TipoDoc,Folio,Mail,TipoDespacho,Negocio,Rut,NombreCli,date_send,NumeroCiclo,DescRebote,DescRebote,FechaUltimaAct,FechaLectura,doc_instanceid,nombreArchivo
end
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleM]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  obtenerDetalleFija '0001','01-01-2014','31-01-2014'
----------------------------------------------------------------
CREATE procedure [dbo].[obtenerDetalleM] @CICLO varchar(50), @DIAP varchar(10) , @DIAU varchar(10) as 
begin
       SELECT 
       cast(FechaEmi as varchar(15)) as FechaEmi,
       cast(FechaVen as varchar(15)) as FechaVen,
       Fono,Cliente,Cuenta,CodSegmento,Monto,TipoDoc,Folio,Mail,TipoDespacho,Negocio,Rut,NombreCli,FecEnvio,
       NumeroCiclo,CodRebote,DescRebote,FechaUltimaAct,FechaLectura,
       doc_instanceid,nombreArchivo
       FROM DetalleMovilTMP
       where fechaemi between convert(datetime,@DIAP,121) and convert(datetime,@DIAU,121) 
       and NumeroCiclo=@CICLO
end
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleLM_ex1]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		FGARAY
-- Create date: 09/12/2014
-- Description:	Obtiene el Detalle de Lecturas de la MOVIL

-- =============================================
--- exec  obtenerDetalleLM_ex1 '10114','20140101','20140131'
-- =============================================
CREATE PROCEDURE [dbo].[obtenerDetalleLM_ex1]

@CICLO varchar(50), 
@DIAP varchar(10),
@DIAU varchar(10) 

AS
BEGIN
       SELECT	r.doc_instanceid,
				r.FechaLectura,
				r.FechaUltimaAct
       FROM Lecturas  r wITH(NOLOCK)
       inner join DetalleMovilTMP  d wITH(NOLOCK)
		on d.doc_instanceid = r.doc_instanceid
       where d.fechaemi between @DIAP + ' 00:00:00' and @DIAU + ' 23:59:59'
       and d.NumeroCiclo=@CICLO

END
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleLM]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  obtenerDetalleFija '0001','01-01-2014','31-01-2014'
----------------------------------------------------------------
CREATE procedure [dbo].[obtenerDetalleLM] @CICLO varchar(50), @DIAP varchar(10) , @DIAU varchar(10) as 
begin
       SELECT 
       r.doc_instanceid,
       r.FechaLectura,r.FechaUltimaAct
       FROM Lecturas as r
       inner join DetalleMovilTMP as d on r.doc_instanceid=d.doc_instanceid
       where 
       d.fechaemi between convert(datetime,@DIAP,121) and convert(datetime,@DIAU,121) 
       and d.NumeroCiclo=@CICLO
end
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleLF_ex1]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		FGARAY
-- Create date: 09/12/2014
-- Description:	Obtiene el Detalle de Lecturas de la FIJA
-- =============================================
CREATE PROCEDURE [dbo].[obtenerDetalleLF_ex1]

@CICLO varchar(50), 
@DIAP varchar(10), 
@DIAU varchar(10) 

AS
BEGIN
       SELECT 
       r.doc_instanceid,
       r.FechaLectura,
       r.FechaUltimaAct
       FROM Lecturas r with(nolock)
       inner join DetalleFijaTMP d with(nolock)
			on d.doc_instanceid = r.doc_instanceid
       where d.fechaemi between @DIAP + ' 00:00:00' and @DIAU + ' 23:59:59'
       and d.NumeroCiclo=@CICLO

END
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleLF]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  obtenerDetalleFija '0001','01-01-2014','31-01-2014'
----------------------------------------------------------------
CREATE procedure [dbo].[obtenerDetalleLF] @CICLO varchar(50), @DIAP varchar(10) , @DIAU varchar(10) as 
begin
       SELECT 
       r.doc_instanceid,
       r.FechaLectura,r.FechaUltimaAct
       FROM Lecturas as r
       inner join DetalleFijaTMP as d on r.doc_instanceid=d.doc_instanceid
       where 
       d.fechaemi between convert(datetime,@DIAP,121) and convert(datetime,@DIAU,121) 
       and d.NumeroCiclo=@CICLO
end
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleFija]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  obtenerDetalleFija '0001','01-01-2014','31-01-2014'
----------------------------------------------------------------
CREATE procedure [dbo].[obtenerDetalleFija] @CICLO varchar(50), @DIAP varchar(10) , @DIAU varchar(10) as 
begin
		print 'Comienzo'
       SELECT FechaEmi,FechaVen,Fono,Cliente,Cuenta,CodSegmento,Monto,TipoDoc,Folio,Mail,TipoDespacho,Negocio,Rut,NombreCli,
       CASE WHEN date_send IS NULL THEN (select 'NULL') ELSE (select (convert(varchar(50),b.date_send,121))) END as date_send,NumeroCiclo,
       CASE WHEN CodRebote='CODIGO DE REBOTE' THEN (
       CASE WHEN date_send is null THEN (select '50') ELSE (select 'NULL') END
       ) ELSE (select CodRebote) END as CodRebotes,
       CASE WHEN DescRebote='DESCRIPCION DE REBOTE' THEN (
       CASE WHEN date_send is null THEN (select 'Invalid email address') ELSE (select 'NULL') END
       ) ELSE (select DescRebote) END as DescRebote,
       CASE WHEN FechaUltimaAct='FECHA ULTIMA ACTUALIZACION' THEN (select 'NULL') ELSE (select FechaUltimaAct) END as FechaUltimaAct,
       CASE WHEN FechaLectura='FECHA LECTURA' THEN (select 'NULL') ELSE (select FechaLectura) END as FechaLectura,
       doc_instanceid,nombreArchivo
       FROM DetalleFija
       left join (select doc_instance_id,MAX(date_send) as date_send from emessaging.dbo.outbound_message where doc_instance_id in (select doc_instanceid from DetalleFija where fechaemi between convert(datetime,@DIAP,121) and convert(datetime,@DIAU,121) and NumeroCiclo=@CICLO) group by doc_instance_id )b
       on b.doc_instance_id=doc_instanceid
       where fechaemi between convert(datetime,@DIAP,121) and convert(datetime,@DIAU,121) 
       and NumeroCiclo=@CICLO
       group by FechaEmi,FecEnvio,FechaVen,Fono,Cliente,Cuenta,CodSegmento,CodRebote,Monto,TipoDoc,Folio,Mail,TipoDespacho,Negocio,Rut,NombreCli,date_send,NumeroCiclo,DescRebote,DescRebote,FechaUltimaAct,FechaLectura,doc_instanceid,nombreArchivo
end
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleF]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  obtenerDetalleFija '0001','01-01-2014','31-01-2014'
----------------------------------------------------------------
CREATE procedure [dbo].[obtenerDetalleF] @CICLO varchar(50), @DIAP varchar(10) , @DIAU varchar(10) as 
begin
       SELECT 
       cast(FechaEmi as varchar(15)) as FechaEmi,
       cast(FechaVen as varchar(15)) as FechaVen,
       Fono,Cliente,Cuenta,CodSegmento,Monto,TipoDoc,Folio,Mail,TipoDespacho,Negocio,Rut,NombreCli,FecEnvio,
       NumeroCiclo,CodRebote,DescRebote,FechaUltimaAct,FechaLectura,
       doc_instanceid,nombreArchivo
       FROM DetalleFijaTMP
       where fechaemi between convert(datetime,@DIAP,121) and convert(datetime,@DIAU,121) 
       and NumeroCiclo=@CICLO
end
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalle_ex1]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
;  
-- =============================================  
-- Author:  FGARAY  
-- Create date: 10/12/2014  
-- Description: <Description,,>  
  
---exec obtenerDetalle_ex1 'FIJA', '0001', '11', '2014'  
---exec obtenerDetalle_ex1 'MOVIL', '130314', '03', '2014'  
-- =============================================  
CREATE PROCEDURE [dbo].[obtenerDetalle_ex1]  
  
    @Negocio VARCHAR(10),  
    @CICLO   INT,  
    @MES     INT,  
    @AÑO     INT  
  
AS  
  BEGIN  
  
  
    DECLARE @fecha  VARCHAR(8),  
            @desde  VARCHAR(8),  
            @hasta  VARCHAR(8)  
    DECLARE @mydate DATETIME  
  
    IF (@mes <> 10 AND @mes <> 11 AND @mes <> 12)  
      BEGIN  
        SET @fecha = Convert(VARCHAR(MAX), @AÑO) + '0' + Convert(VARCHAR(MAX), @mes) + '01'  
  
      END  
    ELSE  
      BEGIN  
        SET @fecha = Convert(VARCHAR(MAX), @AÑO) + Convert(VARCHAR(MAX), @mes) + '01'  
      END  
  
  
    SET @mydate = @fecha  
  
    SET @desde = CONVERT(VARCHAR(25), DATEADD(DD, -(DAY(@mydate) - 1), @mydate), 112)  
    SET @hasta = CONVERT(VARCHAR(25), DATEADD(DD, -(DAY(DATEADD(MM, 1, @mydate))), DATEADD(MM, 1, @mydate)), 112)  
  
    IF (@Negocio = 'FIJA')  
      BEGIN  
  
--SELECT * FROM  DetalleFijaTmp where FechaEmi between  '2014-06-01' and '2014-06-30'   

        SELECT  
          tmp.FechaEmi                     AS 'Fecha Emision',  
          tmp.FechaVen                     AS 'Fecha Vencimiento',  
          tmp.Fono                         AS 'Fono',  
          tmp.Cliente                      AS 'Cliente',  
          tmp.Cuenta                       AS 'Cuenta',  
          tmp.CodSegmento                  AS 'Cod. Segmento',  
          tmp.Monto                        AS 'Monto',  
          tmp.TipoDoc                      AS 'Tipo Documento',  
          tmp.Folio                        AS 'Folio',  
          -- tmp.DV                           AS 'dv',  
          tmp.Mail                         AS 'Mail',  
          tmp.TipoDespacho                 AS 'Tipo Despacho',
          tmp.Negocio                      AS 'Negocio',
          tmp.Rut                          AS 'Rut',
          tmp.NombreCli                    AS 'Nombre Cliente',
          -- tmp.EstadoEnvio                  AS 'estadoenvio',
          tmp.FecEnvio                     AS 'Fecha Envio',  
          tmp.NumeroCiclo                  AS 'Numero Ciclo',
          IsNull(Reb.CodRebote, null)      AS 'Cod. Rebote',
          IsNull(Reb.DescRebote, null)     AS 'Desc. Rebote',
          IsNull(Lec.FechaUltimaAct, null) AS 'Fecha Ult. Actualizacion',
          IsNull(Lec.FechaLectura, null)   AS 'Fecha Lectura',
          tmp.doc_instanceid			   AS 'Doc Instancia Id',
          tmp.nombreArchivo				   AS 'Nombre Archivo;'
        FROM DetalleFijaTmp tmp WITH ( NOLOCK )  
          LEFT JOIN Lecturas Lec WITH ( NOLOCK )  
            ON Lec.doc_instanceid = tmp.doc_instanceid  
          LEFT JOIN Rebotes Reb WITH ( NOLOCK )  
            ON Reb.doc_instanceid = tmp.doc_instanceid  
        WHERE tmp.FechaEmi BETWEEN (@desde) AND (@hasta)  
              AND NumeroCiclo = ISNULL(@CICLO, NumeroCiclo)  
  
      END  
  
    IF (@Negocio = 'MOVIL')  
      BEGIN  
  
        SELECT  
          tmp.FechaEmi                     AS 'Fecha Emision',  
          tmp.FechaVen                     AS 'Fecha Vencimiento',  
          tmp.Fono                         AS 'Fono',  
          tmp.Cliente                      AS 'Cliente',  
          tmp.Cuenta                       AS 'Cuenta',  
          tmp.CodSegmento                  AS 'Cod. Segmento',  
          tmp.Monto                        AS 'Monto',  
          tmp.TipoDoc                      AS 'Tipo Documento',  
          tmp.Folio                        AS 'Folio',  
          -- tmp.DV                           AS 'dv',  
          tmp.Mail                         AS 'Mail',  
          tmp.TipoDespacho                 AS 'Tipo Despacho',
          tmp.Negocio                      AS 'Negocio',
          tmp.Rut                          AS 'Rut',
          tmp.NombreCli                    AS 'Nombre Cliente',
          -- tmp.EstadoEnvio                  AS 'estadoenvio',
          tmp.FecEnvio                     AS 'Fecha Envio',  
          tmp.NumeroCiclo                  AS 'Numero Ciclo',
          IsNull(Reb.CodRebote, null)      AS 'Cod. Rebote',
          IsNull(Reb.DescRebote, null)     AS 'Desc. Rebote',
          IsNull(Lec.FechaUltimaAct, null) AS 'Fecha Ult. Actualizacion',
          IsNull(Lec.FechaLectura, null)   AS 'Fecha Lectura',
          tmp.doc_instanceid			   AS 'Doc Instancia Id',
          tmp.nombreArchivo				   AS 'Nombre Archivo;'
        FROM DetalleMovilTMP tmp WITH ( NOLOCK )  
          LEFT JOIN Lecturas Lec WITH ( NOLOCK )  
            ON Lec.doc_instanceid = tmp.doc_instanceid  
          LEFT JOIN Rebotes Reb WITH ( NOLOCK )  
            ON Reb.doc_instanceid = tmp.doc_instanceid  
        WHERE tmp.FechaEmi BETWEEN (@desde) AND (@hasta)  
              AND NumeroCiclo = ISNULL(@CICLO, NumeroCiclo)  
  
      END  
  END;
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalle]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  obtenerDetalle 'FIJA','0001',6,2013
----------------------------------------------------------------
CREATE procedure [dbo].[obtenerDetalle] @Negocio varchar(10), @CICLO int, @MES int , @AÑO int as 
begin

if(@Negocio='FIJA')
begin
	SELECT * FROM  DetalleFija 
	WHERE 
	month(convert(datetime,fechaemi, 105))=  @MES 
	and 
	YEAR(convert(datetime,fechaemi, 105))=@AÑO 
	and 
	NumeroCiclo=isnull(@CICLO,NumeroCiclo) 
END
if(@Negocio='MOVIL')
begin
	SELECT * FROM  DetalleMOVIL
	WHERE month(convert(datetime,fechaemi, 105))=  @MES 
	and YEAR(convert(datetime,fechaemi, 105))=@AÑO 
	and 
	NumeroCiclo=isnull(@CICLO,NumeroCiclo)
END

end
GO
/****** Object:  StoredProcedure [dbo].[InsertUsuarios_ex1]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		FGARAY
-- Create date: 11/12/2014
-- Description:	Valida si el usuario esta creado, si no lo inserta como nuevo registro

---exec InsertUsuarios_ex1 'FGARAY', 'zaq1', 'FELIPE', 'GARAY', '17.190.678-4', 'fgaray@intelidata.cl'

---select * from usuarios
-- =============================================
CREATE PROCEDURE [dbo].[InsertUsuarios_ex1] 
	
	@USUARIO VARCHAR(50),
	@PWDUSUARIO VARCHAR(50),
	@NOMBRE VARCHAR(50),
	@APELLIDO VARCHAR(50),
	@RUT VARCHAR(10),
	@MAIL VARCHAR(50)
	

AS
Begin

		
		if (
			SELECT count(*)
			FROM usuarios
			where usuario = @USUARIO
			) = 0
			
		BEGIN
				INSERT INTO Usuarios(
							idTipoUsuario,
							usuario,
							pwdusuario,
							nombre,
							apellido,
							rut,
							mail,
							ultimaconexion,
							remember_token
							)VALUES(1,@USUARIO,@PWDUSUARIO,@NOMBRE,@APELLIDO,@RUT,@MAIL,NULL,NULL)
							
				PRINT 'Usuario Creado'
				return 1
		END	
		else
		begin
		 return 0
		end					
	
END
GO
/****** Object:  StoredProcedure [dbo].[InsertaTiempoCiclo]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  InsertaTiempoCiclo '0001','01-01-2014','31-01-2014'
----------------------------------------------------------------
CREATE procedure [dbo].[InsertaTiempoCiclo] @CICLO varchar(50)  as 
begin
		DELETE FROM [ReportesDespachos].[dbo].[TiemposDespachos]
		WHERE [Ciclo]=@CICLO
		INSERT INTO [ReportesDespachos].[dbo].[TiemposDespachos]
           ([Ciclo]
           ,[FechaInicio]
           ,[FechaFin])
		VALUES
           (@CICLO
           ,SYSDATETIME ()
           ,SYSDATETIME ())

end
GO
/****** Object:  StoredProcedure [dbo].[GetRegistros]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------
--Autor:Erick Gormaz
--Fecha:12/03/2014
--Descripcion:Actualiza informacion de rebotes
-- EXEC ActualizaRebote 'user9@recipients.......0.7.cl.2013.0.7.2.9.0.6.4.8.5.6.A98F1535A80D5D45B95A2B28E695051D','511','ERROR LECTURA'
-- user9@recipients07.cl.20130729064856.A98F1535A80D5D45B95A2B28E695051D
-- ENVIO EXTOSO
-- ENVIO FALLIDO   
-----------------------------------------------
create procedure [dbo].[GetRegistros] @Negocio varchar(1),@Fechamin varchar(50) ,@Fechamax varchar(50) as
BEGIN
	if @Negocio='M'
	begin
	 select customer_id,subject,sentTo,doc_instance_id,date_send 
	 from emessaging.dbo.outbound_message 
	 where convert(varchar(50),date_send,121) between @Fechamin and @Fechamax 
	 and outbound_profile_id 
	 in (select id from emessaging.dbo.out_profile where name like('Envio_DespachoMovil%'))
	end
	if @Negocio='F'
	begin
	 select customer_id,subject,sentTo,doc_instance_id,date_send 
	 from emessaging.dbo.outbound_message 
	 where convert(varchar(50),date_send,121) between @Fechamin and @Fechamax 
	 and outbound_profile_id 
	 in (select id from emessaging.dbo.out_profile where name like('Envio_DespachoFija%'))
	end
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetIniDespacho]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetIniDespacho] 
(	
	@Ciclo varchar(50)
)
RETURNS varchar(50)
AS
BEGIN

	DECLARE @ResultVar varchar(50)
	
	SELECT @ResultVar=convert(varchar(50),[FechaInicio],121)
	FROM [ReportesDespachos].[dbo].[TiemposDespachos]
	where [Ciclo]=@Ciclo

	RETURN @ResultVar

END
GO
/****** Object:  UserDefinedFunction [dbo].[GetFinDespacho]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetFinDespacho] 
(	
	@Ciclo varchar(50)
)
RETURNS varchar(50)
AS
BEGIN

	DECLARE @ResultVar varchar(50)=''
	
	SELECT @ResultVar=convert(varchar(50),[FechaFin],121)
	FROM [ReportesDespachos].[dbo].[TiemposDespachos]
	where [Ciclo]=@Ciclo

	RETURN @ResultVar

END
GO
/****** Object:  UserDefinedFunction [dbo].[OBTIENEREBOTES_ex1]    Script Date: 02/20/2015 11:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		FGARAY
-- Create date: 09/12/2014
-- Description:	Obtiene los Rebotes
-- =============================================
CREATE FUNCTION [dbo].[OBTIENEREBOTES_ex1] 
(
	@Negocio varchar(10),
	@desde varchar(10),
	@hasta varchar(10),
	@CICLO varchar(15),
	@TipoDoc varchar(15)
)

RETURNS int
AS
BEGIN

DECLARE @ResultVar int

	if(@Negocio='FIJA')
	BEGIN
		SELECT @ResultVar=count(1) 
			from DetalleFijaTMP as d WITH(NOLOCK)
			inner join Rebotes as l WITH(NOLOCK)
			on l.doc_instanceid = d.doc_instanceid
		where d.FechaEmi between (@desde) and (@hasta)
		and d.numerociclo=isnull(@CICLO,d.numerociclo)
		and substring(d.nombreArchivo,17,2)= @TIPODOC
		--where 
		--month(d.FechaEmi)= @mes
		--and
		--year(d.FechaEmi)= @ANIO
		--and
		--d.numerociclo=isnull(@CICLO,d.numerociclo)
		--and
		--substring(d.nombreArchivo,17,2) =  @TIPODOC
	END
	
	if(@Negocio='MOVIL')
	BEGIN
		SELECT @ResultVar=count(1) 
			from DetalleMovilTMP as d WITH(NOLOCK)
			inner join Rebotes as l WITH(NOLOCK)
			on l.doc_instanceid = d.doc_instanceid
		--where 
		--month(d.FechaEmi)= @mes
		--and
		---year(d.FechaEmi)= @ANIO
		--and
		where d.FechaEmi between (@desde) and (@hasta)
		and d.numerociclo=isnull(@CICLO,d.numerociclo)
		and d.TipoDoc=  @TIPODOC
	END
	
	
RETURN @ResultVar

END
GO
/****** Object:  UserDefinedFunction [dbo].[OBTIENEREBOTES]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[OBTIENEREBOTES] 
(
	
	@Negocio varchar(10),@mes int,@ANIO int,@CICLO varchar(15)   ,@TipoDoc varchar(15)
)
RETURNS int
AS
BEGIN

	DECLARE @ResultVar int

	if(@Negocio='FIJA')
	begin
		SELECT @ResultVar=count(1) from DetalleFijaTMP as d
		inner join Rebotes as l on d.doc_instanceid=l.doc_instanceid
		where 
		month(d.FechaEmi)= @mes
		and
		year(d.FechaEmi)= @ANIO
		and
		d.numerociclo=isnull(@CICLO,d.numerociclo)
		and
		substring(d.nombreArchivo,17,2) =  @TIPODOC
	end
	
	if(@Negocio='MOVIL')
	begin
		SELECT @ResultVar=count(1) from DetalleMovilTMP as d
		inner join Rebotes as l on d.doc_instanceid=l.doc_instanceid
		where 
		month(d.FechaEmi)= @mes
		and
		year(d.FechaEmi)= @ANIO
		and
		d.numerociclo=isnull(@CICLO,d.numerociclo)
		and
		d.TipoDoc=  @TIPODOC
	end
	
	
	RETURN @ResultVar

END
GO
/****** Object:  UserDefinedFunction [dbo].[OBTIENELEIDOS_ex1]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		FGARAY
-- Create date: 09/12/2014
-- Description:	Obtiene el resumen de los documentos Leidos
-- =============================================
CREATE FUNCTION [dbo].[OBTIENELEIDOS_ex1]
(
	@Negocio varchar(10),
	@desde varchar(10),
	@hasta varchar(10),
	@CICLO varchar(15),
	@TIPODOC varchar(15)
)
RETURNS int
AS
BEGIN

	DECLARE @ResultVar int

	if(@Negocio='FIJA')
	begin
		SELECT @ResultVar=count(1) 
			from DetalleFijaTMP as d WITH(NOLOCK)
			inner join Lecturas as l WITH(NOLOCK)
			on d.doc_instanceid=l.doc_instanceid
			where d.FechaEmi between (@desde) and (@hasta)
			and d.numerociclo=isnull(@CICLO,d.numerociclo)
			and substring(d.nombreArchivo,17,2) =  @TIPODOC
		--where month(d.FechaEmi)= @mes
		--and year(d.FechaEmi)= @ANIO
		--and d.numerociclo=isnull(@CICLO,d.numerociclo)
		--and substring(d.nombreArchivo,17,2) =  @TIPODOC
	end
	if(@Negocio='MOVIL')
	begin
		SELECT @ResultVar=count(1) 
			from DetalleMovilTMP as d WITH(NOLOCK)
			inner join Lecturas as l WITH(NOLOCK)
			on l.doc_instanceid = d.doc_instanceid
			--where month(d.FechaEmi)= @mes
			--and year(d.FechaEmi)= @ANIO
			where d.FechaEmi between (@desde) and (@hasta)
			and d.numerociclo=isnull(@CICLO,d.numerociclo)
			and d.TipoDoc=  @TIPODOC
	end
	RETURN @ResultVar

END
GO
/****** Object:  UserDefinedFunction [dbo].[OBTIENELEIDOS]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[OBTIENELEIDOS] 
(
	
	@Negocio varchar(10),@mes int,@ANIO int,@CICLO varchar(15),@TIPODOC varchar(15)
)
RETURNS int
AS
BEGIN

	DECLARE @ResultVar int

	if(@Negocio='FIJA')
	begin
		SELECT @ResultVar=count(1) from DetalleFijaTMP as d
		inner join Lecturas as l on d.doc_instanceid=l.doc_instanceid
		where 
		month(d.FechaEmi)= @mes
		and
		year(d.FechaEmi)= @ANIO
		and
		d.numerociclo=isnull(@CICLO,d.numerociclo)
		and
		substring(d.nombreArchivo,17,2) =  @TIPODOC
	end
	if(@Negocio='MOVIL')
	begin
		SELECT @ResultVar=count(1) from DetalleMovilTMP as d
		inner join Lecturas as l on d.doc_instanceid=l.doc_instanceid
		where 
		month(d.FechaEmi)= @mes
		and
		year(d.FechaEmi)= @ANIO
		and
		d.numerociclo=isnull(@CICLO,d.numerociclo)
		and
		d.TipoDoc=  @TIPODOC
	end
	RETURN @ResultVar

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerResumenPorHora_ex1]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- =============================================
-- Author:		FGARAY
-- Create date: 11/12/2014
-- Description:	Obtiene el resumen por hora de los despachados

-- exec ObtenerResumenPorHora_ex1 '20130624 08:00:00.000' , '20130624 20:59:59.999'
-- =============================================
CREATE procedure [dbo].[ObtenerResumenPorHora_ex1] 

	 @fini varchar(50), 
	 @ffin as varchar(50) 
 
AS
BEGIN


	 select op.name,
			 CONVERT(CHAR(13), om.date_send, 120)  + ':00:00'--, COUNT(om.date_send)
		from emessaging.dbo.outbound_message  om with(nolock)
		 inner join emessaging.dbo.out_profile op with(nolock) 
			on op.id = om.outbound_profile_id
--	 where CONVERT(Varchar(50),date_send,121) between @fini and @ffin
		where date_send between @fini and @ffin
		and outbound_message_status in ('DELIVERED_SUCCESSFULLY','PERMANENT_DELIVERY_FAILURE')
		--GROUP BY op.name,CONVERT(char(13),date_send,120)
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerResumenPorHora]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ObtenerResumenPorHora]  @fini varchar(50), @ffin as varchar(50) as 
BEGIN
	 select op.name,om.date_send 
	 from emessaging.dbo.outbound_message as om
	 inner join emessaging.dbo.out_profile as op 
	 on op.id=om.outbound_profile_id
	 where CONVERT(Varchar(50),date_send,121) between 
	 @fini and @ffin
	 and outbound_message_status in ('DELIVERED_SUCCESSFULLY','PERMANENT_DELIVERY_FAILURE')
END
GO
/****** Object:  StoredProcedure [dbo].[RecuperaDocID]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperaDocID] @tipo varchar(1), @ciclo varchar(6)
AS
BEGIN
declare @folio  as varchar(100)
declare @cuenta as varchar(100)
declare @Mail as varchar(100)
declare @tipodoc as varchar(100)
declare @DocId as varchar(100)
declare @contsi as int=0;
declare @contno as int=0;
if @tipo='M'
begin
       print 'DetalleMovil' 
       print 'TipoDoc;Folio;Cuenta;Mail;NuevoDocID' 
       DECLARE despachos_cursor CURSOR
       FOR SELECT Folio,Cuenta,mail,TipoDoc FROM DetalleMovil where doc_instanceid='' and NumeroCiclo=@ciclo
       OPEN despachos_cursor
       FETCH NEXT FROM despachos_cursor
       INTO @folio,@cuenta,@Mail,@tipodoc
       WHILE @@FETCH_STATUS = 0
       BEGIN
       if @tipodoc='23' or @tipodoc='53' or @tipodoc='54' or @tipodoc='21' or @tipodoc='27'
       begin
			select top 1 @DocId=doc_instance_id from emessaging.dbo.outbound_message where sentTo=@Mail and customer_id=@cuenta and dbo.SplitEM(subject,' ',3)=@folio and doc_instance_id not in (select doc_instanceid from DetalleMovil where doc_instanceid<>'' and doc_instanceid is not null and NumeroCiclo=@ciclo)
       end
       if @tipodoc='72'
       begin
			select top 1 @DocId=doc_instance_id from emessaging.dbo.outbound_message where sentTo=@Mail and customer_id=@cuenta and dbo.SplitEM(subject,' ',5)=@folio and doc_instance_id not in (select doc_instanceid from DetalleMovil where doc_instanceid<>'' and doc_instanceid is not null and NumeroCiclo=@ciclo)
       end
       if @tipodoc='67'
       begin
			select top 1 @DocId=doc_instance_id from emessaging.dbo.outbound_message where sentTo=@Mail and customer_id=@cuenta and dbo.SplitEM(subject,' ',4)=@folio and doc_instance_id not in (select doc_instanceid from DetalleMovil where doc_instanceid<>'' and doc_instanceid is not null and NumeroCiclo=@ciclo)
       end
       if @DocId <> ''
       begin
             update DetalleMovil set doc_instanceid=@DocId where cuenta=@cuenta and mail=@Mail and @folio=Folio
             print @tipodoc+';'+@folio+';'+@cuenta+';'+@Mail+';'+@DocId
             select @contsi=SUM(@contsi+1)
       end
       else
       begin
			 print @tipodoc+';'+@folio+';'+@cuenta+';'+@Mail+';No encontrado' 
			 select @contno=SUM(@contno+1)
       end

       FETCH NEXT FROM despachos_cursor 
       INTO @folio,@cuenta,@Mail,@tipodoc
       END 

       CLOSE despachos_cursor;
       DEALLOCATE despachos_cursor;
end

if @tipo='F'
begin
       DECLARE despachos_cursor CURSOR
       FOR SELECT Folio,Cuenta,mail FROM DetalleFija where doc_instanceid=''
       OPEN despachos_cursor
       FETCH NEXT FROM despachos_cursor
       INTO @folio, @cuenta,@DocID
       WHILE @@FETCH_STATUS = 0
       BEGIN

       select @folio, @cuenta,@DocID


       FETCH NEXT FROM despachos_cursor 
       INTO @folio, @cuenta,@DocID
       END 

       CLOSE despachos_cursor;
       DEALLOCATE despachos_cursor;
end
select @contsi as 'Actualizados',@contno as 'No Actualizados'
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTiempoCiclo]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  UpdateTiempoCiclo '0001'
----------------------------------------------------------------
create procedure [dbo].[UpdateTiempoCiclo] @CICLO varchar(50)  as 
begin
		UPDATE [ReportesDespachos].[dbo].[TiemposDespachos]
		SET [FechaFin] = SYSDATETIME ()
		WHERE [Ciclo]=@CICLO
end
GO
/****** Object:  StoredProcedure [dbo].[retornaDataNegocio]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [retornaDataNegocio] 'F' 
CREATE PROCEDURE [dbo].[retornaDataNegocio] @negocio as varchar(10)
as
begin

--declare @mes as varchar(10)
--declare @anio as varchar(10)

--select  @mes=datepart(month,getdate())
--select  @anio=datepart(year,getdate())

declare @fechaini  varchar(10)
declare @fechafin  varchar(10)

declare @mes as varchar(10)
declare @anio as varchar(10)
declare @dia as varchar(10)

select  @mes=datepart(month,getdate())
select  @anio=datepart(year,getdate())
select  @dia=datepart(day,getdate())

if (@mes<>'10' and @mes<>'11' and @mes<>'12' ) 
begin
	set @mes='0'+@mes
end 

set @fechaini = @anio+'-'+@mes+'-01'
set @fechafin = @anio+'-'+@mes+'-'+@dia

IF(@negocio='F')
BEGIN   
SELECT
 isnull(convert(varchar,fechaemi,121),'')+';'+
isnull(convert(varchar,FechaVen,121),'')+';'+
isnull(Fono,'') +';'+
isnull(Cliente,'') +';'+
isnull(Cuenta,'') +';'+
isnull(CodSegmento,'') +';'+
isnull(Monto,'') +';'+
isnull(TipoDoc,'') +';'+
isnull(Folio,'') +';'+
isnull(DV,'') +';'+
isnull(Mail,'') +';'+
isnull(TipoDespacho,'') +';'+
isnull(Negocio,'') +';'+
isnull(Rut,'') +';'+
isnull(NombreCli,'') +';'+
isnull(EstadoEnvio,'') +';'+
isnull(FecEnvio,'') +';'+
isnull(NumeroCiclo,'') +';'+
isnull(CodRebote,'') +';'+
isnull(DescRebote,'') +';'+
isnull(FechaUltimaAct,'') +';'+
isnull(FechaLectura,'')
FROM dbo.DetalleFijaTMP with(nolock)
--where fecenvio > @anio+'-'+@mes+'-01'
where FecEnvio between @fechaini and @fechafin

END
ELSE
BEGIN

SELECT 
isnull(convert(varchar,fechaemi,121),'')+';'+
isnull(convert(varchar,FechaVen,121),'')+';'+
isnull(Fono,'') +';'+
isnull(Cliente,'') +';'+
isnull(Cuenta,'') +';'+
isnull(CodSegmento,'') +';'+
isnull(Monto,'') +';'+
isnull(TipoDoc,'') +';'+
isnull(Folio,'') +';'+
isnull(DV,'') +';'+
isnull(Mail,'') +';'+
isnull(TipoDespacho,'') +';'+
isnull(Negocio,'') +';'+
isnull(Rut,'') +';'+
isnull(NombreCli,'') +';'+
isnull(EstadoEnvio,'') +';'+
isnull(FecEnvio,'') +';'+
isnull(NumeroCiclo,'') +';'+
isnull(CodRebote,'') +';'+
isnull(DescRebote,'') +';'+
isnull(FechaUltimaAct,'') +';'+
isnull(FechaLectura,'')
FROM dbo.DetalleMovilTMP  with(nolock)
--where fecenvio > @anio+'-'+@mes+'-01'
where FecEnvio between @fechaini and @fechafin

END

END
GO
/****** Object:  StoredProcedure [dbo].[GeneraDataHistorico]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--exec dbo.GeneraDataResumen 1,'2014',2
-- =============================================
-- Author:		Alexis San Martin O.
-- Create date:	20150207
-- Description:	Genera Historico
-- =============================================
CREATE PROCEDURE [dbo].[GeneraDataHistorico]
	
AS
BEGIN
	
	SET NOCOUNT ON
	
	DECLARE @AGNO_STR AS varchar(4)
	DECLARE @MES_STR AS VARCHAR (2)


	SELECT @AGNO_STR = YEAR(Convert(char(10),(DATEADD(mm, -2, GETDATE())),126))
	SELECT @MES_STR = MONTH(Convert(char(10),(DATEADD(mm, -2, GETDATE())),126))

	
	
	Insert Into dbo.DetalleFijaTMP_HIST
	select * from  DetalleFijaTMP WHERE FechaEmi < @AGNO_STR+'-'+@MES_STR+'-'+'01'
	
	if @@ROWCOUNT > 0
	begin	
		delete from  DetalleFijaTMP WHERE FechaEmi < @AGNO_STR+'-'+@MES_STR+'-'+'01'
	end
	
	Insert Into dbo.DetalleMovilTMP_HIST
	select * from  DetalleMovilTMP WHERE FechaEmi < @AGNO_STR+'-'+@MES_STR+'-'+'01'
	
	
	if @@ROWCOUNT > 0
	begin	
		delete from  DetalleMovilTMP WHERE FechaEmi < @AGNO_STR+'-'+@MES_STR+'-'+'01'
	end
    
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleReenvios_ex1]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
---exec dbo.DetalleReenvios_ex1 '1', '20150201','20150228'   
--- MOD EQUIPO ROJO-- SE AGREGA UNION ALL POR CAMBIO SUBJECT  
-- =============================================  
CREATE PROCEDURE [dbo].[DetalleReenvios_ex1]   
  
 @negocio varchar(1),   
 @DIAP varchar(10) ,   
 @DIAU varchar(10)  
  
AS  
BEGIN  
 select 
	-- idCliente AS 'Id Cliente',  
    -- customer_id AS 'Id Customer',  
   --CASE WHEN cuenta='' THEN (select 'NULL') ELSE (select cuenta) END as cuenta,  
   CASE   
    WHEN negocio=1 THEN ('FIJA')   
    WHEN negocio=2 THEN ('MOVIL')   
   END as 'Negocio',
   CASE   
    WHEN tipoDocumentoUnificado=23 THEN ('BOLETA')   
    WHEN tipoDocumentoUnificado=24 THEN ('FACTURA')   
   END AS 'Tipo Doc. Unificado', -- tipoDocumentoUnificado    
   folio AS 'Folio',
   fechaEmision AS 'Fecha Emision',   
   email AS 'Mail',  
   -- 'NULL' as 'Mail Seg. Contacto', -- email_seg_cont    
   CASE   
    WHEN outbound_message_status='CONTENT_FAILURE'   
     THEN ('NULL') else (select convert(varchar(50),date_send,121))   
    END as 'Fecha Envio', -- date_send 
   fono AS 'Fono', 
   CASE  
      WHEN FechaLectura IS NULL THEN ('NULL')  
      ELSE (l.FechaLectura)  
      END                                     AS 'Fecha Lectura',  
      CASE  
      WHEN FechaUltimaAct IS NULL THEN ('NULL')  
      ELSE (l.FechaUltimaAct)  
      END									  AS 'Fecha Ult. Actualizacion'      
   from Procesos.dbo.request_not with(nolock)  
   left join emessaging.dbo.outbound_message  with(nolock)  
    --on dbo.Splitter(subject,' ',4)=folio   
    on dbo.Splitter(subject,' ',4)=folio -- MOD EQUIPO ROJO 20150218   
    LEFT JOIN ReportesDespachos.dbo.Lecturas AS l WITH ( NOLOCK )  
        ON l.doc_instanceid = outbound_message.doc_instance_id  
   where outbound_profile_id in('6001')   
   and negocio=@negocio   
   and date_send between @DIAP + ' 00:00:00'  and @DIAU + ' 23:59:59'   
   
   union all  
   
   select 
	-- idCliente AS 'Id Cliente',  
    -- customer_id AS 'Id Customer',  
   --CASE WHEN cuenta='' THEN (select 'NULL') ELSE (select cuenta) END as cuenta,  
   CASE   
    WHEN negocio=1 THEN ('FIJA')   
    WHEN negocio=2 THEN ('MOVIL')   
   END AS 'Negocio', -- negocio
   CASE   
    WHEN tipoDocumentoUnificado=23 THEN ('BOLETA')   
    WHEN tipoDocumentoUnificado=24 THEN ('FACTURA')   
   END AS 'Tipo Doc. Unificado', -- tipoDocumentoUnificado  
   folio AS 'Folio',  
   fechaEmision AS 'Fecha Emision',  
   email AS 'Mail',  
   -- 'NULL' AS 'Mail Seg. Contacto', -- email_seg_cont  
   CASE   
    WHEN outbound_message_status='CONTENT_FAILURE'   
     THEN ('NULL') else (select convert(varchar(50),date_send,121))   
    END AS 'Fecha Envio', -- date_send
   fono AS 'Fono',     
   CASE  
      WHEN FechaLectura IS NULL THEN ('NULL')  
      ELSE (l.FechaLectura)  
      END                                     AS 'Fecha Lectura',  -- fechalectura,  
      CASE  
      WHEN FechaUltimaAct IS NULL THEN ('NULL')  
      ELSE (l.FechaUltimaAct)  
      END                                     AS 'Fecha Ult. Actualizacion'  -- fechaultimaact
   from Procesos.dbo.request_not with(nolock)  
   left join emessaging.dbo.outbound_message  with(nolock)  
    --on dbo.Splitter(subject,' ',4)=folio   
    on dbo.Splitter(subject,' ',5)=folio -- MOD EQUIPO ROJO 20150218   
    LEFT JOIN ReportesDespachos.dbo.Lecturas AS l WITH ( NOLOCK )  
        ON l.doc_instanceid = outbound_message.doc_instance_id  
   where outbound_profile_id in('6001')   
   and negocio=@negocio   
   and date_send between @DIAP + ' 00:00:00'  and @DIAU + ' 23:59:59'   
   group by idCliente,date_send,cuenta,tipoDocumentoUnificado,fechaEmision,folio,email,fono,negocio,outbound_message_status,customer_id, l.FechaLectura ,l.FechaUltimaAct
  
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleReenvios]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DetalleReenvios] @negocio varchar(1), @DIAP varchar(10) , @DIAU varchar(10)
AS
BEGIN
	select idCliente,customer_id,
	--CASE WHEN cuenta='' THEN (select 'NULL') ELSE (select cuenta) END as cuenta,
	CASE WHEN tipoDocumentoUnificado=23 THEN (select 'BOLETA') WHEN tipoDocumentoUnificado=24 THEN (select 'FACTURA') END as tipoDocumentoUnificado,
	fechaEmision,folio,email,'NULL' as email_seg_cont,
	CASE WHEN outbound_message_status='CONTENT_FAILURE' THEN (select 'NULL') else (select convert(varchar(50),date_send,121)) END as date_send ,
	fono,
	CASE WHEN negocio=1 THEN (select 'FIJA') WHEN negocio=2 THEN (select 'MOVIL') END as negocio 
	from Procesos.dbo.request_not left join emessaging.dbo.outbound_message on dbo.Splitter(subject,' ',4)=folio 
	where outbound_profile_id in('6001') and negocio=@negocio and 
	date_send between cast(@DIAP as date) and cast(@DIAU  as date) 
	group by idCliente,date_send,cuenta,tipoDocumentoUnificado,fechaEmision,folio,email,fono,negocio,outbound_message_status,customer_id
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaRebote]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------
--Autor:Erick Gormaz
--Fecha:12/03/2014
--Descripcion:Actualiza informacion de rebotes
-- EXEC ActualizaRebote 'user9@recipients.......0.7.cl.2013.0.7.2.9.0.6.4.8.5.6.A98F1535A80D5D45B95A2B28E695051D','511','ERROR LECTURA'
-- user9@recipients07.cl.20130729064856.A98F1535A80D5D45B95A2B28E695051D
-- ENVIO EXTOSO
-- ENVIO FALLIDO   
-----------------------------------------------
CREATE procedure [dbo].[ActualizaRebote] @id varchar(500) ,@CODIGO varchar(500), @DESCRIPCION varchar(350)as
BEGIN
	 declare @docid as varchar(32)
	 declare @existe as int
	 select @docid=dbo.Split(@id,'.')
	 select @existe=COUNT(1) from Rebotes where doc_instanceid=@docid
     if (@existe > 0)
	 begin
		print 'Existe'
		--update DetalleFija  set EstadoEnvio='ENVIO FALLIDO',CodRebote=@CODIGO ,DescRebote=@DESCRIPCION where doc_instanceid=@docId
	 end 
	 else 
	 begin
		print 'No Existe'
		insert into Rebotes (CodRebote,DescRebote,doc_instanceid) values (@CODIGO,@DESCRIPCION,@docid)
	 end 
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaLectura]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ActualizaLectura]  @id varchar(100), @fechalectura as varchar(100) as 
BEGIN
	 declare @existe as int
	 select @existe=COUNT(1) from Lecturas where doc_instanceid=@id
     if (@existe > 0)
	 begin
		print 'Existe'
		update Lecturas set FechaUltimaAct=@fechalectura where doc_instanceid=@id
	 end 
	 else 
	 begin
		print 'No Existe'
		insert into Lecturas (FechaUltimaAct,FechaLectura,doc_instanceid) values (@fechalectura,@fechalectura,@id)
	 end 
END
GO
/****** Object:  StoredProcedure [dbo].[busquedaIndividual_ex1]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
;
;
-- =============================================
-- Author:		FGARAY
-- Create date: 09/12/2014
-- Description:	Realiza la busqueda de los documentos en forma detallada segun parametros de entrada

-- =============================================
--- exec busquedaIndividual_ex1 'FIJA', 999995900, NULL, NULL, 'user42@recipients07.cl'
--- exec busquedaIndividual_ex1 @negocio, @cuenta, @tipodoc, @folio, @correo
-- =============================================
CREATE PROCEDURE [dbo].[busquedaIndividual_ex1]

    @Negocio VARCHAR(10),
    @Cuenta  VARCHAR(10),
    @TipoDoc VARCHAR(3),
    @Folio   VARCHAR(15),
    @Correo  VARCHAR(30)

AS
  BEGIN

    IF (@Negocio = 'FIJA')
      BEGIN
        SELECT
          @Negocio               AS negocio,
          cuenta,
          cliente,
          folio,
          codsegmento,
          numerociclo,
          tipodoc,
          fechaemi,
          fechaven,
          mail,
          fecenvio,
          fechalectura,
          estadoenvio,
          codrebote + descrebote AS observaciones
        FROM DetalleFijaTMP WITH ( NOLOCK )
        WHERE cuenta = isnull(@Cuenta, cuenta)
              AND tipodoc = isnull(@TipoDoc, tipodoc)
              AND folio = isnull(@Folio, folio)
              AND mail = isnull(@Correo, mail)

        UNION ALL

        SELECT
          @Negocio               AS negocio,
          cuenta,
          cliente,
          folio,
          codsegmento,
          numerociclo,
          tipodoc,
          fechaemi,
          fechaven,
          mail,
          fecenvio,
          fechalectura,
          estadoenvio,
          codrebote + descrebote AS observaciones
        FROM DetalleFija
        WHERE cuenta = isnull(@Cuenta, cuenta)
              AND tipodoc = isnull(@TipoDoc, tipodoc)
              AND folio = isnull(@Folio, folio)
              AND mail = isnull(@Correo, mail)
      END

    IF (@Negocio = 'MOVIL')
      BEGIN
        SELECT
          @Negocio               AS negocio,
          cuenta,
          cliente,
          folio,
          codsegmento,
          numerociclo,
          tipodoc,
          fechaemi,
          fechaven,
          mail,
          fecenvio,
          fechalectura,
          estadoenvio,
          codrebote + descrebote AS observaciones
        FROM DetalleMovilTMP WITH ( NOLOCK )
        WHERE cuenta = isnull(@Cuenta, cuenta)
              AND tipodoc = isnull(@TipoDoc, tipodoc)
              AND folio = isnull(@Folio, folio)
              AND mail = isnull(@Correo, mail)

        UNION ALL

        SELECT
          @Negocio               AS negocio,
          cuenta,
          cliente,
          folio,
          codsegmento,
          numerociclo,
          tipodoc,
          fechaemi,
          fechaven,
          mail,
          fecenvio,
          fechalectura,
          estadoenvio,
          codrebote + descrebote AS observaciones
        FROM DetalleMovil
        WHERE cuenta = isnull(@Cuenta, cuenta)
              AND tipodoc = isnull(@TipoDoc, tipodoc)
              AND folio = isnull(@Folio, folio)
              AND mail = isnull(@Correo, mail)
      END

  END;
GO
/****** Object:  StoredProcedure [dbo].[busquedaIndividual]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  busquedaIndividual 'FIJA',999995900,NULL,NULL ,NULL'user42@recipients07.cl'
----------------------------------------------------------------
CREATE procedure [dbo].[busquedaIndividual] @Negocio varchar(10),@Cuenta varchar(10),@TipoDoc varchar(3),@Folio varchar(15) ,@Correo varchar(30)as 
begin
 if(@Negocio='FIJA')
 Begin
	select
	@Negocio, 
	cuenta,
	cliente,
	folio,
	codsegmento,
	numerociclo,
	tipodoc,
	fechaemi ,
	fechaven ,
	mail,								   
    fecenvio,
    fechalectura,
	estadoenvio,
	codrebote+descrebote as Observaionees
	from   DetalleFija
	where 
	cuenta=isnull(@Cuenta,cuenta)
	and
	tipodoc=isnull(@TipoDoc,tipodoc)
	and
	folio= isnull(@Folio,folio)
	and
	mail= isnull(@Correo,mail)
  END
if(@Negocio='MOVIL')
 Begin
	select
	@Negocio, 
	cuenta,
	cliente,
	folio,
	codsegmento,
	numerociclo,
	tipodoc,
	fechaemi,
	fechaven ,
	mail,
    fecenvio,
    fechalectura,
	estadoenvio,
	codrebote+descrebote as Observaionees
	
	from   DetalleMovil
	where 
	cuenta=isnull(@Cuenta,cuenta)
	and
	tipodoc=isnull(@TipoDoc,tipodoc)
	and
	folio= isnull(@Folio,folio)
	and
	mail= isnull(@Correo,mail)
  END
end
GO
/****** Object:  StoredProcedure [dbo].[BuscaDataResumen_Mensual]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
;
;
--USE [ReportesDespachos]
--exec dbo.BuscaDataResumen 2,'2014'
-- =============================================
-- Author:		Alexis San Martin O.
-- Create date:	20141211
-- Description:	Genera Data Resumento
-- =============================================
CREATE PROCEDURE [dbo].[BuscaDataResumen_Mensual]
  (
    @MES VARCHAR(2),
    @AÑO VARCHAR(4) --,
		--@Negocio int ---1 fija 2 movil
  )

AS
  BEGIN

    SET NOCOUNT ON

    SELECT
      Negocio                 AS 'negocio',
      Sum(Convert(INT, QDOC)) AS 'total' ---Mensual
    FROM dbo.Resumenes WITH ( NOLOCK )
    WHERE Fecha = @MES + '/' + @AÑO + '' + ''
    GROUP BY Negocio

  END;
GO
/****** Object:  StoredProcedure [dbo].[BuscaDataResumen_GraficoMensualMovil]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
;
;
--USE [ReportesDespachos]
--exec dbo.BuscaDataResumen 2,'2014'
-- =============================================
-- Author:		Alexis San Martin O.
-- Create date:	20141211
-- Description:	Genera Data Resumento
-- =============================================
CREATE PROCEDURE [dbo].[BuscaDataResumen_GraficoMensualMovil]
  (
    @MES VARCHAR(2),
    @AÑO VARCHAR(4) --,
		--@Negocio int ---1 fija 2 movil
  )

AS
  BEGIN

    SET NOCOUNT ON

    SELECT
      TipoDoc                 AS 'tipodoc',
      Sum(Convert(INT, QDOC)) AS 'total' ---Mensual
    FROM dbo.Resumenes WITH ( NOLOCK )
    WHERE Negocio = 'MOVIL'
          AND Fecha = @MES + '/' + @AÑO + '' + ''
    GROUP BY TipoDoc

  END;
GO
/****** Object:  StoredProcedure [dbo].[BuscaDataResumen_GraficoMensualFija]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
;
;
--USE [ReportesDespachos]
--exec dbo.BuscaDataResumen 2,'2014'
-- =============================================
-- Author:		Alexis San Martin O.
-- Create date:	20141211
-- Description:	Genera Data Resumento
-- =============================================
CREATE PROCEDURE [dbo].[BuscaDataResumen_GraficoMensualFija]
  (
    @MES VARCHAR(2),
    @AÑO VARCHAR(4) --,
		--@Negocio int ---1 fija 2 movil
  )

AS
  BEGIN

    SET NOCOUNT ON

    SELECT
      TipoDoc                 AS 'tipodoc',
      Sum(Convert(INT, QDOC)) AS 'total' ---Mensual
    FROM dbo.Resumenes WITH ( NOLOCK )
    WHERE Negocio = 'FIJA'
          AND Fecha = @MES + '/' + @AÑO + '' + ''
    GROUP BY TipoDoc
  END;
GO
/****** Object:  StoredProcedure [dbo].[BuscaDataResumen_GraficoAnual]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
;
;
;
--USE [ReportesDespachos]
--exec dbo.BuscaDataResumen 2,'2014'
-- =============================================
-- Author:		Alexis San Martin O.
-- Create date:	20141211
-- Description:	Genera Data Resumento
-- =============================================
CREATE PROCEDURE [dbo].[BuscaDataResumen_GraficoAnual]
  (
    @MES VARCHAR(2),
    @AÑO VARCHAR(4) --,
		--@Negocio int ---1 fija 2 movil
  )

AS
  BEGIN

    SET NOCOUNT ON

    SELECT
      Negocio                 AS 'negocio',
      Fecha                   AS 'fecha',
      Sum(Convert(INT, QDOC)) AS 'total' ---GraficoAnual
    FROM dbo.Resumenes WITH ( NOLOCK )
--Where Fecha = @MES+'/'+@AÑO+''+''
--	Where Fecha like '%1/2014%'
    GROUP BY Negocio, Fecha
    ORDER BY Fecha

  END;
GO
/****** Object:  StoredProcedure [dbo].[BuscaDataResumen_Anual]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
;
;
--USE [ReportesDespachos]
--exec dbo.BuscaDataResumen 2,'2014'
-- =============================================
-- Author:		Alexis San Martin O.
-- Create date:	20141211
-- Description:	Genera Data Resumento
-- =============================================
CREATE PROCEDURE [dbo].[BuscaDataResumen_Anual]
  (
    @MES VARCHAR(2),
    @AÑO VARCHAR(4) --,
		--@Negocio int ---1 fija 2 movil
  )

AS
  BEGIN

    SET NOCOUNT ON

    SELECT
      Negocio                 AS 'negocio',
      Sum(Convert(INT, QDOC)) AS 'total' -- Anual
    FROM dbo.Resumenes WITH ( NOLOCK )
    WHERE Fecha LIKE +'' + '%/' + @AÑO + '' + ''
    GROUP BY Negocio
  END;
GO
/****** Object:  StoredProcedure [dbo].[REPORTEESTADODESPACHO_EX1]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
;
-- =============================================
-- AUTHOR:		ALEJANDRO ORTIZ ARO
-- CREATE DATE: 20141212
-- DESCRIPTION:	EMITE REPORTE ESTADO DESPACHO 

---exec REPORTEESTADODESPACHO_EX1 '20130101' , '20141201'
-- =============================================
CREATE PROCEDURE [dbo].[REPORTEESTADODESPACHO_EX1]

--PARAMETROS DE ENTRADA
@DESDE VARCHAR(MAX),
@HASTA VARCHAR(MAX) 

AS
BEGIN
  SET NOCOUNT ON;
--CREAMOS TABLA TEMPORAL PARA INSERTAR DATOS DESDE PROCEDIMIENTO OBTENERRESUMENPORHORA_EX1
CREATE TABLE #TMP (NAME VARCHAR(MAX),HORAS VARCHAR(MAX))

--INSERTAMOS DATOS FECHA, HORA Y TIPO DE NEGOCIO 
INSERT INTO #TMP EXEC OBTENERRESUMENPORHORA_EX1 @DESDE, @HASTA

--DECLARAMOS VARIABLES DONDE SE 
DECLARE 
	@ATTR NVARCHAR(MAX),
	@SQL NVARCHAR(MAX)
	SET @ATTR=''
	SET @SQL='	SELECT NAME, #ATTR# 
				FROM (SELECT NAME,HORAS
						FROM  #TMP) 
				AS SOURCE PIVOT(COUNT(HORAS)
				FOR HORAS IN (#ATTR#)) AS PVT
				ORDER BY NAME'

--EJECUTAMOS SELECT DONDE SE ORDENA FECHA Y HORAS EL CUAL SE GUARDARA SENTENCIA SQL EN VARIABLE @SQL
SELECT @ATTR=@ATTR + '['+ V.HORAS+'],' 
	FROM (SELECT DISTINCT HORAS FROM #TMP) AS V
SET @ATTR=SUBSTRING(@ATTR,0,LEN(@ATTR))
SET @SQL=REPLACE(@SQL,'#ATTR#',@ATTR)

--VALIDAMOS QUE EXISTA DATA

	IF (SELECT COUNT(*) FROM #TMP) > 0
		BEGIN
			--EJECUTAMOS SELECT DE VARIABLE @SQL
			EXEC SP_EXECUTESQL @SQL
			DROP TABLE #TMP
			RETURN @SQL
		END
	ELSE
		BEGIN
			DROP TABLE #TMP
			RETURN 0
		END


			
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerResumenEmessaging_ex1]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
;
-- =============================================
-- Author:		FGARAY
-- Create date: 09/12/2014
-- Description:	Obtiene el resumen de la base Emessaging
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerResumenEmessaging_ex1]
  
	@profile varchar(50), 
	@fechadesde varchar(50), 
	@fechahasta varchar(50) 
	
AS
BEGIN
		select	op.name,
				sum(case when outbound_Message_Status = 'TEMPORARY_FAILURE' then 1 else 0 end) as tempFailure,
				sum(case when outbound_Message_Status = 'CONTENT_FAILURE' then 1 else 0 end) as contentFailure, 
				sum(case when outbound_Message_Status = 'PERMANENT_DELIVERY_FAILURE' then 1 else 0 end) as permFailure, 
				sum(case when outbound_Message_Status = 'UNKNOWN_DELIVERY_FAILURE' then 1 else 0 end) as unkFailure,
				count(distinct(case when outbound_message_status = 'DELIVERED_SUCCESSFULLY' and date_response is not null  then inbound_profile_id else null end)) as multreplied, 
				sum(case when (outbound_Message_Status = 'DELIVERED_SUCCESSFULLY' or outbound_Message_Status = 'OUT_OF_OFFICE') and date_opened is not null then 1 else 0 end) as opened,
				sum(case when outbound_Message_Status = 'OUT_OF_OFFICE' then 1 else 0 end) as outOfOffice, 
				sum(1) as total 
			from emessaging.dbo.outbound_message with(nolock)
			left outer join emessaging.dbo.workflow_item workflowit1_ with(nolock)
				on workflowit1_.id = workflowitem_id 
			left outer join emessaging.dbo.msg_index msgindex2_ with(nolock)
				on msgindex2_.id  = workflowit1_.msgIndex_id
			inner join emessaging.dbo.out_profile as op with(nolock)
				on op.id=outbound_profile_id
			where outbound_profile_id in	(	select id 
												from emessaging.dbo.out_profile with(nolock)
												where name like (@profile+'%')
											) 
			and date_send between cast(@fechadesde as datetime) and  cast(@fechahasta as datetime)
				group by op.name
				order by op.name

END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerResumenEmessaging]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ObtenerResumenEmessaging]  @profile varchar(50), @fechadesde as varchar(50), @fechahasta as varchar(50) as 
BEGIN
select
op.name,
sum(case when outbound_Message_Status = 'TEMPORARY_FAILURE' then 1 else 0 end) as tempFailure,
sum(case when outbound_Message_Status = 'CONTENT_FAILURE' then 1 else 0 end) as contentFailure, 
sum(case when outbound_Message_Status = 'PERMANENT_DELIVERY_FAILURE' then 1 else 0 end) as permFailure, 
sum(case when outbound_Message_Status = 'UNKNOWN_DELIVERY_FAILURE' then 1 else 0 end) as unkFailure,
count(distinct(case when outbound_message_status = 'DELIVERED_SUCCESSFULLY' and date_response is not null  then inbound_profile_id else null end)) as multreplied, 
sum(case when (outbound_Message_Status = 'DELIVERED_SUCCESSFULLY' or outbound_Message_Status = 'OUT_OF_OFFICE') and date_opened is not null then 1 else 0 end) as opened,
sum(case when outbound_Message_Status = 'OUT_OF_OFFICE' then 1 else 0 end) as outOfOffice, 
sum(1) as total 
from emessaging.dbo.outbound_message 
left outer join emessaging.dbo.workflow_item workflowit1_ on workflowitem_id=workflowit1_.id 
left outer join emessaging.dbo.msg_index msgindex2_ on workflowit1_.msgIndex_id=msgindex2_.id 
inner join emessaging.dbo.out_profile as op on op.id=outbound_profile_id
where outbound_profile_id in (select id from emessaging.dbo.out_profile where name like (@profile+'%')) and
date_send between cast(@fechadesde as datetime) and  cast(@fechahasta as datetime)
group by name
order by name
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerResumen_ex1]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- =============================================
-- Author:		FGARAY
-- Create date: 09/12/2014
-- Description:	Obtiene el resumen de los Rebotes y los Leidos (FIJA y MOVIL)
-- =============================================

--- exec  ObtenerResumen 'MOVIL',9,'2013',NULL
--- exec  ObtenerResumen_ex1 'FIJA',12,'2014','0001'
-- =============================================

CREATE PROCEDURE [dbo].[ObtenerResumen_ex1]

	@Negocio varchar(10),
	@mes int,
	@ANIO int,
	@CICLO varchar(15) 

AS
BEGIN

declare @fecha varchar(8),
		@desde varchar(8),
		@hasta varchar(8)
DECLARE @mydate DATETIME

if (@mes <>10 And @mes <> 11 and @mes <> 12)
begin
	set @fecha = Convert(Varchar(Max),@ANIO) + '0'+Convert(Varchar(max),@mes)+'01'
	
end
else 
begin
	set @fecha = Convert(Varchar(Max),@ANIO)+Convert(Varchar(max),@mes)+'01'	
end


set @mydate = @fecha

set @desde = CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(@mydate)-1),@mydate),112) 
set @hasta = CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,@mydate))),DATEADD(mm,1,@mydate)),112)



if(@Negocio='FIJA')
begin
	select 
	@Negocio as negocio,
	cast(@mes as varchar(9))+'/'+cast(@ANIO  as varchar(9)) as fecha,
	numerociclo as ciclo,
	cast(count(codsegmento)as varchar(10)) as qenvios,
	cast(DBO.OBTIENEREBOTES_ex1 (@Negocio,@desde,@hasta,numerociclo,substring(nombreArchivo,17,2)) as varchar(10)) as rebotes,
	cast(DBO.OBTIENELEIDOS_ex1   (@Negocio,@desde,@hasta,numerociclo,substring(nombreArchivo,17,2))as varchar(10))as leidos,
	cast(count(distinct(Folio)) as varchar(10)) as qdoc,
	--INFORME_GESTION_FACTURA_C0004_07082013.TXT
	substring(nombreArchivo,17,2) as tipodoc
	from   DetalleFijaTMP With(NOLOCK)
	--where 
	--month(FechaEmi)= @mes
	--and
	--year(FechaEmi)= @ANIO
	--and
	--numerociclo=isnull(@CICLO,numerociclo)
	where FechaEmi between (@desde) and (@hasta) 
	and	numerociclo=isnull(@CICLO,numerociclo)
	group by    numerociclo,nombreArchivo
	order by	numerociclo
END
if(@Negocio='MOVIL')
begin
  select 
	@Negocio as negocio,
	cast(@mes as varchar(9))+'/'+cast(@ANIO  as varchar(9)) as fecha,
	numerociclo as ciclo,
	cast(count(folio)as varchar(10)) as qenvios,
--	cast(DBO.OBTIENEREBOTES(@Negocio,@mes,@ANIO,numerociclo,TipoDoc) as varchar(10)) as rebotes,
--	cast(DBO.OBTIENELEIDOS   (@Negocio,@mes,@ANIO,numerociclo,TipoDoc)as varchar(10))as leidos,
	cast(DBO.OBTIENEREBOTES_ex1 (@Negocio,@desde,@hasta,numerociclo,TipoDoc) as varchar(10)) as rebotes,
	cast(DBO.OBTIENELEIDOS_ex1   (@Negocio,@desde,@hasta,numerociclo,TipoDoc)as varchar(10))as leidos,

	cast(count(distinct(Folio)) as varchar(10)) as qdoc,
	tipodoc
	from   DetalleMovilTMP With(Nolock)
--where 
	--month(FechaEmi)= @mes
	--and
	--year(FechaEmi)= @ANIO
	where FechaEmi between (@desde) and (@hasta) 
	and	numerociclo=isnull(@CICLO,numerociclo)
	group by    numerociclo,tipodoc
	order by	numerociclo
END	  

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerResumen]    Script Date: 02/20/2015 11:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
---
--- exec  ObtenerResumen 'MOVIL',9,'2013',NULL
--- Agrupado por TipoDOC
--- para movil se tomo folio en vez de segmento
----------------------------------------------------------------
CREATE procedure [dbo].[ObtenerResumen] @Negocio varchar(10),@mes int,@ANIO int,@CICLO varchar(15) as 
begin

if(@Negocio='FIJA')
begin
	select 
	@Negocio as negocio,
	cast(@mes as varchar(9))+'/'+cast(@ANIO  as varchar(9)) as Fecha,
	numerociclo as ciclo,
	cast(count(codsegmento)as varchar(10)) as qEnvios,
	cast(DBO.OBTIENEREBOTES(@Negocio,@mes,@ANIO,numerociclo,substring(nombreArchivo,17,2)) as varchar(10)) as rebotes,
	cast(DBO.OBTIENELEIDOS   (@Negocio,@mes,@ANIO,numerociclo,substring(nombreArchivo,17,2))as varchar(10))as leidos,
	cast(count(distinct(Folio)) as varchar(10)) as qdoc,
	--INFORME_GESTION_FACTURA_C0004_07082013.TXT
	substring(nombreArchivo,17,2) as tipodoc
	from   DetalleFijaTMP
	where 
	month(FechaEmi)= @mes
	and
	year(FechaEmi)= @ANIO
	and
	numerociclo=isnull(@CICLO,numerociclo)
	group by    numerociclo,nombreArchivo
	order by	numerociclo
END
if(@Negocio='MOVIL')
begin
  select 
	@Negocio as negocio,
	cast(@mes as varchar(9))+'/'+cast(@ANIO  as varchar(9)) as Fecha,
	numerociclo as ciclo,
	cast(count(folio)as varchar(10)) as qEnvios,
	cast(DBO.OBTIENEREBOTES(@Negocio,@mes,@ANIO,numerociclo,TipoDoc) as varchar(10)) as rebotes,
	cast(DBO.OBTIENELEIDOS   (@Negocio,@mes,@ANIO,numerociclo,TipoDoc)as varchar(10))as leidos,
	cast(count(distinct(Folio)) as varchar(10)) as qdoc,
	TipoDoc
	from   DetalleMovilTMP
	where 
	month(FechaEmi)= @mes
	and
	year(FechaEmi)= @ANIO
	and
	numerociclo=isnull(@CICLO,numerociclo)
	group by    numerociclo,TipoDoc
	order by	numerociclo
END	  
END
GO
/****** Object:  StoredProcedure [dbo].[GeneraDataResumen]    Script Date: 02/20/2015 11:30:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.GeneraDataResumen 1,'2014',2
-- =============================================
-- Author:		Alexis San Martin O.
-- Create date:	20141210
-- Description:	Genera Data Resumento
-- =============================================
CREATE PROCEDURE [dbo].[GeneraDataResumen]
	(
		@MES int , 
		@AÑO varchar(4) ,
		@Negocio int ---1 fija 2 movil
	)
	
AS
BEGIN
	
	SET NOCOUNT ON
	
	DECLARE @AGNO_STR AS varchar(4)
	DECLARE @MES_STR AS VARCHAR (2)
	DECLARE @CICLO AS VARCHAR (MAX)


	if @Negocio = 1 
	begin
		DELETE FROM dbo.Resumenes WHERE Negocio = 'FIJA' AND Fecha = Convert(Varchar(2),@MES) +'/'+@AÑO 
	
		INSERT INTO dbo.Resumenes (NEGOCIO,FECHA, CICLO,QENVIOS,REBOTES,LEIDOS,QDOC,TIPODOC) exec  ObtenerResumen_ex1 'FIJA',@MES,@AÑO,'0001'
		INSERT INTO dbo.Resumenes (NEGOCIO,FECHA, CICLO,QENVIOS,REBOTES,LEIDOS,QDOC,TIPODOC) exec  ObtenerResumen_ex1 'FIJA',@MES,@AÑO,'0004'
		INSERT INTO dbo.Resumenes (NEGOCIO,FECHA, CICLO,QENVIOS,REBOTES,LEIDOS,QDOC,TIPODOC) exec  ObtenerResumen_ex1 'FIJA',@MES,@AÑO,'0008'
	
	end
	if @Negocio = 2
	begin
	
		DELETE FROM dbo.Resumenes WHERE Negocio = 'MOVIL' AND Fecha = Convert(Varchar(2),@MES) +'/'+@AÑO 
	
		
		IF @MES <> 10 And @MES <> 11 And @MES <> 12
		begin
			SET @MES_STR = '0'+CONVERT(Varchar(2),@MES)
		END
		ELSE
		BEGIN
			SET @MES_STR = @MES
		END 
		SET @AGNO_STR = SUBSTRING(@AÑO,3,2)
		
		SET @CICLO = '1'+@MES_STR+@AGNO_STR
		INSERT INTO dbo.Resumenes (NEGOCIO,FECHA, CICLO,QENVIOS,REBOTES,LEIDOS,QDOC,TIPODOC) exec  ObtenerResumen_ex1 'MOVIL',@MES,@AÑO,@CICLO
		SET @CICLO = '13'+@MES_STR+@AGNO_STR
		INSERT INTO dbo.Resumenes (NEGOCIO,FECHA, CICLO,QENVIOS,REBOTES,LEIDOS,QDOC,TIPODOC) exec  ObtenerResumen_ex1 'MOVIL',@MES,@AÑO,@CICLO
		SET @CICLO = '20'+@MES_STR+@AGNO_STR
		INSERT INTO dbo.Resumenes (NEGOCIO,FECHA, CICLO,QENVIOS,REBOTES,LEIDOS,QDOC,TIPODOC) exec  ObtenerResumen_ex1 'MOVIL',@MES,@AÑO,@CICLO
	
	end

    
END
GO
/****** Object:  StoredProcedure [dbo].[CARGARESUMENDIARIO_FIJA_MOVIL_EX1]    Script Date: 02/20/2015 11:30:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		Alejandro Ortiz Aro
-- CREATE DATE: 20141210
-- DESCRIPTION:	Carga Resumen Diario Fija - Movil
-- =============================================
CREATE PROCEDURE [dbo].[CARGARESUMENDIARIO_FIJA_MOVIL_EX1]
AS
BEGIN
	
	
	--ASIGNAMOS AÑO Y MES
	 DECLARE @VarAno VARCHAR(4);
	 DECLARE @VarMes VARCHAR(2);
	 
	--SETIAMOS VARIABLES
	 SET @VarAno = NULL;
	 SET @VarMes = NULL;
	 
	--ASIGNAMOS VALORES MES Y AÑO	 
	 SET @VarAno = DATEPART(YEAR,GETDATE());
	 SET @VarMes = DATEPART(MONTH,GETDATE());
	
	
	--EJECUTAMOS CARGA DE DATOS MES ACTUL FIJA

			EXEC DBO.GENERADATARESUMEN @VarMes,@VarAno,1
	
	--EJECUTAMOS CARGA DE DATOS MES ACTUL MOVIL
			
			EXEC DBO.GENERADATARESUMEN @VarMes,@VarAno,2
										
END
GO
/****** Object:  StoredProcedure [dbo].[CARGARESUMENANUAL_FIJA_MOVIL_EX1]    Script Date: 02/20/2015 11:30:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		Alejandro Ortiz Aro
-- CREATE DATE: 20141210
-- DESCRIPTION:	Carga Resumen Anual Fija - Movil
-- =============================================
CREATE PROCEDURE [dbo].[CARGARESUMENANUAL_FIJA_MOVIL_EX1]
AS
BEGIN
	
	
	--ASIGNAMOS AÑO Y MES
	 DECLARE @VarAno VARCHAR(4);
	 DECLARE @VarMes VARCHAR(2);
	 DECLARE @IntMes INT;
	 DECLARE @IntMesActual INT;
	 
	--SETIAMOS VARIABLES
	 SET @VarAno = NULL;
	 SET @VarMes = NULL;
	 SET @IntMes = 1;
	 SET @IntMesActual = 0;
	 
	--ASIGNAMOS VALORES MES Y AÑO	 
	 SET @VarAno = DATEPART(YEAR,GETDATE());
	 SET @VarMes = DATEPART(MONTH,GETDATE());
	 SET @IntMesActual = CONVERT(Varchar(2),@VarMes);
	
	
	--RECORREMOS CARGA DE DATOS DESDE EL PRIMER MES HASTA EL MES ACTUL FIJA
	WHILE (@IntMes <= @IntMesActual) 
		BEGIN
			
			EXEC DBO.GENERADATARESUMEN @VarMes,@VarAno,1
									
			SET @IntMes = @IntMes + 1;
		    
		END 

	--SETIAMOS VARIABLES
	 SET @IntMes = 1;
	
	--RECORREMOS CARGA DE DATOS DESDE EL PRIMER MES HASTA EL MES ACTUL MOVIL
	WHILE (@IntMes <= @IntMesActual) 
		BEGIN
			
			EXEC DBO.GENERADATARESUMEN @VarMes,@VarAno,2
									
			SET @IntMes = @IntMes + 1;
		    
		END 
			
END
GO
