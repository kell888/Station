USE [master]
GO
/****** Object:  Database [station]    Script Date: 04/07/2016 20:43:14 ******/
CREATE DATABASE [station] ON  PRIMARY 
( NAME = N'station', FILENAME = N'D:\sql\Data\station.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'station_log', FILENAME = N'D:\sql\Data\station_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [station] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [station].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [station] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [station] SET ANSI_NULLS OFF
GO
ALTER DATABASE [station] SET ANSI_PADDING OFF
GO
ALTER DATABASE [station] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [station] SET ARITHABORT OFF
GO
ALTER DATABASE [station] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [station] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [station] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [station] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [station] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [station] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [station] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [station] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [station] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [station] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [station] SET  DISABLE_BROKER
GO
ALTER DATABASE [station] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [station] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [station] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [station] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [station] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [station] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [station] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [station] SET  READ_WRITE
GO
ALTER DATABASE [station] SET RECOVERY FULL
GO
ALTER DATABASE [station] SET  MULTI_USER
GO
ALTER DATABASE [station] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [station] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'station', N'ON'
GO
USE [station]
GO
/****** Object:  Table [dbo].[s_argument]    Script Date: 04/07/2016 20:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[s_argument](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[device_type_id] [smallint] NULL,
	[point_type_id] [smallint] NULL,
	[argument_name] [varchar](50) NOT NULL,
	[standard_value] [varchar](50) NULL,
	[min_value] [varchar](50) NULL,
	[max_value] [varchar](50) NULL,
	[valueIsNumeric] [bit] NOT NULL,
	[isRange] [bit] NOT NULL,
	[isEnable] [bit] NOT NULL,
 CONSTRAINT [PK_s_argument] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[d_train_log]    Script Date: 04/07/2016 20:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_train_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[train_id] [int] NOT NULL,
	[direction] [bit] NULL,
	[station_id] [int] NULL,
	[come_time] [datetime] NULL,
	[go_time] [datetime] NULL,
	[alarm_count] [int] NULL,
	[alarm_status] [smallint] NULL,
	[tag] [tinyint] NOT NULL,
	[tagTime] [datetime] NULL,
 CONSTRAINT [PK_d_train_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0为未同步，1为同步中，2为已同步' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'd_train_log', @level2type=N'COLUMN',@level2name=N'tag'
GO
/****** Object:  Table [dbo].[d_picVid_log]    Script Date: 04/07/2016 20:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[d_picVid_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[filepath] [varchar](250) NULL,
	[train_log_id] [int] NULL,
	[isVideo] [bit] NOT NULL,
	[saveTime] [datetime] NOT NULL,
	[tag] [tinyint] NOT NULL,
	[tagTime] [datetime] NULL,
 CONSTRAINT [PK_d_picVid] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0为未同步，1为同步中，2为已同步' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'd_picVid_log', @level2type=N'COLUMN',@level2name=N'tag'
GO
/****** Object:  Table [dbo].[d_error_log]    Script Date: 04/07/2016 20:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[d_error_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[err_level] [tinyint] NOT NULL,
	[err_source] [varchar](500) NULL,
	[err_msg] [varchar](500) NULL,
	[err_client] [varchar](50) NULL,
	[err_time] [datetime] NOT NULL,
 CONSTRAINT [PK_d_err_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'错误的级别：默认0为一般错误，1为数据库操作错误，2为应用程序内部错误' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'd_error_log', @level2type=N'COLUMN',@level2name=N'err_level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'错误信息来源，包括程序集+命名空间+类+方法' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'd_error_log', @level2type=N'COLUMN',@level2name=N'err_source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'错误信息内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'd_error_log', @level2type=N'COLUMN',@level2name=N'err_msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'错误信息产生的客户端，格式：IP(MAC)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'd_error_log', @level2type=N'COLUMN',@level2name=N'err_client'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'错误发生的时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'd_error_log', @level2type=N'COLUMN',@level2name=N'err_time'
GO
/****** Object:  Table [dbo].[d_data_log]    Script Date: 04/07/2016 20:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_data_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[point_type_id] [smallint] NULL,
	[train_log_id] [int] NULL,
	[device_id] [int] NULL,
	[data_value] [numeric](10, 2) NULL,
	[flash_time] [datetime] NOT NULL,
	[alarm_status] [smallint] NULL,
	[tag] [tinyint] NOT NULL,
	[tagTime] [datetime] NULL,
 CONSTRAINT [PK_d_data_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0为未同步，1为同步中，2为已同步' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'd_data_log', @level2type=N'COLUMN',@level2name=N'tag'
GO
/****** Object:  Table [dbo].[d_alarm_log]    Script Date: 04/07/2016 20:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[d_alarm_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[train_log_id] [int] NOT NULL,
	[device_id] [int] NULL,
	[point_type_id] [smallint] NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[alarm_value] [numeric](10, 2) NULL,
	[alarm_status] [smallint] NULL,
	[affirmance] [int] NULL,
	[remark] [varchar](500) NULL,
	[tag] [tinyint] NOT NULL,
	[tagTime] [datetime] NULL,
 CONSTRAINT [PK_d_alarm_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0为未同步，1为同步中，2为已同步' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'd_alarm_log', @level2type=N'COLUMN',@level2name=N'tag'
GO
/****** Object:  View [dbo].[v_error_log]    Script Date: 04/07/2016 20:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_error_log]
AS
SELECT     id, (CASE WHEN err_level = 0 THEN '登录' WHEN err_level = 1 THEN '信号' WHEN err_level = 2 THEN '错误' ELSE '未知' END) AS 日志级别, err_source AS 日志来源, 
                      err_msg AS 日志信息, err_client AS 客户端, err_time AS 发生时间
FROM         dbo.d_error_log
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "d_error_log"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 193
               Right = 188
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1560
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_error_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_error_log'
GO
/****** Object:  Default [DF_s_argument_valueIsNumeric]    Script Date: 04/07/2016 20:43:14 ******/
ALTER TABLE [dbo].[s_argument] ADD  CONSTRAINT [DF_s_argument_valueIsNumeric]  DEFAULT ((1)) FOR [valueIsNumeric]
GO
/****** Object:  Default [DF_s_argument_isRange]    Script Date: 04/07/2016 20:43:14 ******/
ALTER TABLE [dbo].[s_argument] ADD  CONSTRAINT [DF_s_argument_isRange]  DEFAULT ((0)) FOR [isRange]
GO
/****** Object:  Default [DF_s_argument_isEnable]    Script Date: 04/07/2016 20:43:14 ******/
ALTER TABLE [dbo].[s_argument] ADD  CONSTRAINT [DF_s_argument_isEnable]  DEFAULT ((1)) FOR [isEnable]
GO
/****** Object:  Default [DF_d_train_log_tag]    Script Date: 04/07/2016 20:43:14 ******/
ALTER TABLE [dbo].[d_train_log] ADD  CONSTRAINT [DF_d_train_log_tag]  DEFAULT ((0)) FOR [tag]
GO
/****** Object:  Default [DF_d_picVid_isVideo]    Script Date: 04/07/2016 20:43:14 ******/
ALTER TABLE [dbo].[d_picVid_log] ADD  CONSTRAINT [DF_d_picVid_isVideo]  DEFAULT ((0)) FOR [isVideo]
GO
/****** Object:  Default [DF_d_picVid_log_saveTime]    Script Date: 04/07/2016 20:43:14 ******/
ALTER TABLE [dbo].[d_picVid_log] ADD  CONSTRAINT [DF_d_picVid_log_saveTime]  DEFAULT (getdate()) FOR [saveTime]
GO
/****** Object:  Default [DF_d_picVid_log_tag]    Script Date: 04/07/2016 20:43:14 ******/
ALTER TABLE [dbo].[d_picVid_log] ADD  CONSTRAINT [DF_d_picVid_log_tag]  DEFAULT ((0)) FOR [tag]
GO
/****** Object:  Default [DF_d_err_log_err_level]    Script Date: 04/07/2016 20:43:14 ******/
ALTER TABLE [dbo].[d_error_log] ADD  CONSTRAINT [DF_d_err_log_err_level]  DEFAULT ((0)) FOR [err_level]
GO
/****** Object:  Default [DF_d_err_log_err_time]    Script Date: 04/07/2016 20:43:14 ******/
ALTER TABLE [dbo].[d_error_log] ADD  CONSTRAINT [DF_d_err_log_err_time]  DEFAULT (getdate()) FOR [err_time]
GO
/****** Object:  Default [DF_d_data_log_flash_time]    Script Date: 04/07/2016 20:43:14 ******/
ALTER TABLE [dbo].[d_data_log] ADD  CONSTRAINT [DF_d_data_log_flash_time]  DEFAULT (getdate()) FOR [flash_time]
GO
/****** Object:  Default [DF_d_data_log_tag]    Script Date: 04/07/2016 20:43:14 ******/
ALTER TABLE [dbo].[d_data_log] ADD  CONSTRAINT [DF_d_data_log_tag]  DEFAULT ((0)) FOR [tag]
GO
/****** Object:  Default [DF_d_alarm_log_tag]    Script Date: 04/07/2016 20:43:14 ******/
ALTER TABLE [dbo].[d_alarm_log] ADD  CONSTRAINT [DF_d_alarm_log_tag]  DEFAULT ((0)) FOR [tag]
GO
